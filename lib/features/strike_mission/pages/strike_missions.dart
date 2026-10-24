import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';
import 'package:guildwars2_companion/core/utils/assets.dart';
import 'package:guildwars2_companion/core/utils/guild_wars.dart';
import 'package:guildwars2_companion/core/widgets/accent.dart';
import 'package:guildwars2_companion/core/widgets/appbar.dart';
import 'package:guildwars2_companion/core/widgets/card.dart';
import 'package:guildwars2_companion/core/widgets/list_view.dart';
import 'package:guildwars2_companion/features/error/widgets/error.dart';
import 'package:guildwars2_companion/features/strike_mission/bloc/bloc.dart';
import 'package:guildwars2_companion/features/strike_mission/models/strike_mission.dart';

class StrikeMissionsPage extends StatelessWidget {
  static const Color _color = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return CompanionAccent(
      lightColor: _color,
      child: Scaffold(
        appBar: CompanionAppBar(
          title: AppStrings.strikeMissions,
          color: _color,
        ),
        body: BlocBuilder<StrikeMissionBloc, StrikeMissionState>(
          builder: (context, state) {
            if (state is ErrorStrikeMissionsState) {
              return Center(
                child: CompanionError(
                  title: AppStrings.theStrikeMissions,
                  onTryAgain: () =>
                    BlocProvider.of<StrikeMissionBloc>(context).add(LoadStrikeMissionsEvent()),
                ),
              );
            }

            if (state is LoadedStrikeMissionsState) {
              return RefreshIndicator(
                backgroundColor: Theme.of(context).accentColor,
                color: Theme.of(context).cardColor,
                onRefresh: () async {
                  BlocProvider.of<StrikeMissionBloc>(context).add(LoadStrikeMissionsEvent());
                  await Future.delayed(Duration(milliseconds: 200), () {});
                },
                child: CompanionListView(
                  children: _getChildren(state.data),
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  /// The strike missions are grouped by expansion, in the order of the data.
  List<Widget> _getChildren(StrikeMissionData data) {
    final List<Widget> children = [];
    String previousRegion;

    if (data.weeklyMax > 0) {
      children.add(_WeeklyCard(current: data.weeklyCurrent, max: data.weeklyMax));
    }

    for (final mission in data.missions) {
      if (mission.region != previousRegion) {
        children.add(_RegionHeader(region: mission.region));
        previousRegion = mission.region;
      }

      children.add(_StrikeMissionCard(mission: mission));
    }

    return children;
  }
}

class _WeeklyCard extends StatelessWidget {
  final int current;
  final int max;

  _WeeklyCard({@required this.current, @required this.max});

  @override
  Widget build(BuildContext context) {
    return CompanionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  AppStrings.strikeWeeklyProgress,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Text(
                '$current / $max',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: LinearProgressIndicator(
                value: max > 0 ? (current / max).clamp(0.0, 1.0).toDouble() : 0.0,
                minHeight: 8.0,
                backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.black12 : Colors.white24,
              ),
            ),
          ),
        ],
      ),
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

class _StrikeMissionCard extends StatelessWidget {
  final StrikeMission mission;

  _StrikeMissionCard({@required this.mission});

  @override
  Widget build(BuildContext context) {
    return CompanionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            mission.name,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontWeight: FontWeight.w500
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: <Widget>[
                _StatusChip(
                  label: AppStrings.strikeThisWeek,
                  done: mission.completedThisWeek,
                  color: GuildWarsUtil.regionColor(mission.region),
                ),
                // Not every strike mission has an achievement of the game
                if (mission.achievementId != null)
                  _StatusChip(
                    label: AppStrings.strikeCompleted,
                    done: mission.completed,
                    color: GuildWarsUtil.regionColor(mission.region),
                  ),
                if (mission.challengeAchievementId != null)
                  _StatusChip(
                    label: AppStrings.strikeChallengeMode,
                    done: mission.challengeCompleted,
                    color: GuildWarsUtil.regionColor(mission.region),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final bool done;
  final Color color;

  _StatusChip({
    @required this.label,
    @required this.done,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final Color grey = Theme.of(context).brightness == Brightness.light ? Colors.black26 : Colors.white24;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
      decoration: BoxDecoration(
        color: done ? color : Colors.transparent,
        border: Border.all(color: done ? color : grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            done ? Icons.check : Icons.remove,
            size: 14.0,
            color: done ? Colors.white : Theme.of(context).textTheme.bodyText1.color,
          ),
          Container(width: 4.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 13.0,
              color: done ? Colors.white : Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
        ],
      ),
    );
  }
}
