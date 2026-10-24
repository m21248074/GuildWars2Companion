import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';
import 'package:guildwars2_companion/core/utils/assets.dart';
import 'package:guildwars2_companion/core/widgets/accent.dart';
import 'package:guildwars2_companion/core/widgets/appbar.dart';
import 'package:guildwars2_companion/features/error/widgets/error.dart';
import 'package:guildwars2_companion/core/widgets/list_view.dart';
import 'package:guildwars2_companion/features/achievement/bloc/achievement_bloc.dart';
import 'package:guildwars2_companion/features/achievement/models/daily.dart';
import 'package:guildwars2_companion/features/achievement/widgets/achievement_button.dart';

/// The daily fractals of today and tomorrow. The game has no daily PvE, PvP
/// and WvW achievements anymore, the Wizard's Vault took their place.
class DailyFractalsPage extends StatelessWidget {
  static const Color _color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return CompanionAccent(
      lightColor: _color,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CompanionAppBar(
            title: AppStrings.dailyFractals,
            color: _color,
            elevation: 0.0,
          ),
          body: Column(
            children: <Widget>[
              Material(
                color: Theme.of(context).brightness == Brightness.light ? _color : Theme.of(context).cardColor,
                elevation: Theme.of(context).brightness == Brightness.light ? 4.0 : 0.0,
                child: TabBar(
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      child: Text(
                        AppStrings.today,
                        style: TextStyle(
                          fontSize: 16.0
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        AppStrings.tomorrow,
                        style: TextStyle(
                          fontSize: 16.0
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<AchievementBloc, AchievementState>(
                  builder: (context, state) {
                    if (state is ErrorAchievementsState) {
                      return Center(
                        child: CompanionError(
                          title: AppStrings.theAchievements,
                          onTryAgain: () =>
                            BlocProvider.of<AchievementBloc>(context).add(LoadAchievementsEvent(
                              includeProgress: state.includesProgress
                            )),
                        ),
                      );
                    }

                    if (state is LoadedAchievementsState) {
                      return TabBarView(
                        children: <Widget>[
                          _DailyTab(
                            dailies: state.dailies.fractals,
                            prefix: 'today',
                            includeProgression: state.includesProgress
                          ),
                          _DailyTab(
                            dailies: state.dailiesTomorrow.fractals,
                            prefix: 'tomorrow',
                            includeProgression: state.includesProgress
                          ),
                        ],
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DailyTab extends StatelessWidget {
  final List<Daily> dailies;
  final String prefix;
  final bool includeProgression;

  _DailyTab({
    @required this.dailies,
    @required this.prefix,
    @required this.includeProgression
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Theme.of(context).accentColor,
      color: Theme.of(context).cardColor,
      onRefresh: () async {
        BlocProvider.of<AchievementBloc>(context).add(LoadAchievementsEvent(
          includeProgress: includeProgression
        ));
        await Future.delayed(Duration(milliseconds: 200), () {});
      },
      child: CompanionListView(
        children: dailies == null || dailies.isEmpty
          ? [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    AppStrings.noDailyFractals,
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]
          : dailies
            .map((d) => AchievementButton(
              achievement: d.achievementInfo,
              hero: '$prefix ${d.id} ${dailies.indexOf(d)}',
              includeProgression: includeProgression,
              levels: AppStrings.dailyLevels(d.level.min, d.level.max),
              categoryIcon: Assets.buttonHeaderFractalAchievements,
            ))
            .toList(),
      )
    );
  }
}
