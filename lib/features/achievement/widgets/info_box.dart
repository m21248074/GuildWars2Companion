import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guildwars2_companion/core/utils/guild_wars.dart';
import 'package:guildwars2_companion/core/utils/stats_cache.dart';
import 'package:guildwars2_companion/core/widgets/info_box.dart';
import 'package:guildwars2_companion/features/account/models/account.dart';
import 'package:guildwars2_companion/features/achievement/bloc/achievement_bloc.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

class AchievementInfoBox extends StatelessWidget {
  // To get the daily and monthy achievement points
  final Account account;

  AchievementInfoBox({@required this.account});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AchievementBloc, AchievementState>(
      builder: (context, state) {
        if (state is LoadedAchievementsState) {
          int points = state.achievementPoints + account.dailyAp + account.monthlyAp;
          StatsCache.saveAchievementPoints(points);

          return CompanionInfoBox(
            header: AppStrings.achievements,
            text: GuildWarsUtil.intToString(points),
            loading: false,
          );
        }

        // Show the last known value while loading, or if it could not be refreshed
        if (StatsCache.achievementPoints != null) {
          return CompanionInfoBox(
            header: AppStrings.achievements,
            text: GuildWarsUtil.intToString(StatsCache.achievementPoints),
            loading: false,
          );
        }

        if (state is ErrorAchievementsState) {
          return CompanionInfoBox(
            header: AppStrings.achievements,
            loading: false,
          );
        }

        return CompanionInfoBox(
          header: AppStrings.achievements,
        );
      },
    );
  }
}