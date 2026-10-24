import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guildwars2_companion/core/utils/assets.dart';
import 'package:guildwars2_companion/core/utils/guild_wars.dart';
import 'package:guildwars2_companion/core/utils/guild_wars_icons.dart';
import 'package:guildwars2_companion/core/widgets/appbar.dart';
import 'package:guildwars2_companion/features/error/widgets/error.dart';
import 'package:guildwars2_companion/core/widgets/button.dart';
import 'package:guildwars2_companion/core/widgets/list_view.dart';
import 'package:guildwars2_companion/features/achievement/bloc/achievement_bloc.dart';
import 'package:guildwars2_companion/features/mastery/models/mastery.dart';

import 'mastery_levels.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

class MasteriesPage extends StatelessWidget {
  /// The masteries are sorted per region, every region gets a header with the
  /// name of its expansion.
  List<Widget> _getChildren(List<Mastery> masteries) {
    final List<Widget> children = [];
    String previousExpansion;

    for (final mastery in masteries) {
      final String expansion = GuildWarsUtil.masteryName(mastery.region);

      if (expansion != previousExpansion) {
        children.add(_RegionHeader(region: mastery.region));
        previousExpansion = expansion;
      }

      children.add(_MasteryButton(mastery: mastery));
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CompanionAppBar(
        title: AppStrings.masteries,
        color: Colors.red,
      ),
      body: BlocBuilder<AchievementBloc, AchievementState>(
        builder: (context, state) {
          if (state is ErrorAchievementsState) {
            return Center(
              child: CompanionError(
                title: AppStrings.theMasteries,
                onTryAgain: () =>
                  BlocProvider.of<AchievementBloc>(context).add(LoadAchievementsEvent(
                    includeProgress: state.includesProgress
                  )),
              ),
            );
          }

          if (state is LoadedAchievementsState) {
            return RefreshIndicator(
              backgroundColor: Theme.of(context).accentColor,
              color: Theme.of(context).cardColor,
              onRefresh: () async {
                BlocProvider.of<AchievementBloc>(context).add(LoadAchievementsEvent(
                  includeProgress: state.includesProgress
                ));
                await Future.delayed(Duration(milliseconds: 200), () {});
              },
              child: CompanionListView(
                children: _getChildren(state.masteries),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class _MasteryButton extends StatelessWidget {
  final Mastery mastery;

  _MasteryButton({@required  this.mastery});

  @override
  Widget build(BuildContext context) {
    return CompanionButton(
      title: mastery.name,
      color: GuildWarsUtil.regionColor(mastery.region),
      height: 64.0,
      leading: mastery.level != null && mastery.levels != null && mastery.levels.isNotEmpty ? Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Theme.of(context).brightness == Brightness.light ? Icon(
              GuildWarsIcons.mastery,
              size: 32.0,
              color: Colors.white,
            ) : Image.asset(
              Assets.getMasteryAsset(mastery.region),
              height: 32.0,
            )
          ),
          Column(
            children: <Widget>[
              Text(
                '${mastery.level} / ${mastery.levels.length}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              LinearProgressIndicator(
                value: (mastery.level) / mastery.levels.length,
                color: Colors.white,
                backgroundColor: Colors.transparent,
              )
            ],
          )
        ],
      ) : (Theme.of(context).brightness == Brightness.light ? Icon(
          GuildWarsIcons.mastery,
          size: 32.0,
          color: Colors.white,
        ) : Image.asset(
          Assets.getMasteryAsset(mastery.region),
          height: 32.0,
        )
      ),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MasteryLevelsPage(mastery),
      )),
    );
  }
}

class _RegionHeader extends StatelessWidget {
  final String region;

  _RegionHeader({@required this.region});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 4.0),
      child: Row(
        children: <Widget>[
          Image.asset(
            Assets.getMasteryAsset(region),
            height: 24.0,
            width: 24.0,
          ),
          Container(width: 8.0),
          Expanded(
            child: Text(
              GuildWarsUtil.masteryName(region),
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ],
      ),
    );
  }
}
