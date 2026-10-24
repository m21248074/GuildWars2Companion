import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guildwars2_companion/core/utils/guild_wars.dart';
import 'package:guildwars2_companion/core/utils/stats_cache.dart';
import 'package:guildwars2_companion/core/widgets/info_box.dart';
import 'package:guildwars2_companion/features/achievement/bloc/achievement_bloc.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

class MasteryInfoBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AchievementBloc, AchievementState>(
      builder: (context, state) {
        if (state is LoadedAchievementsState) {
          if (state.masteryLevel == null) {
            return CompanionInfoBox(
              header: AppStrings.masteryLevel,
              text: '-',
              loading: false,
            );
          }

          StatsCache.saveMasteryLevel(state.masteryLevel);

          return CompanionInfoBox(
            header: AppStrings.masteryLevel,
            text: GuildWarsUtil.intToString(state.masteryLevel),
            loading: false,
          );
        }

        // Show the last known value while loading, or if it could not be refreshed
        if (StatsCache.masteryLevel != null) {
          return CompanionInfoBox(
            header: AppStrings.masteryLevel,
            text: GuildWarsUtil.intToString(StatsCache.masteryLevel),
            loading: false,
          );
        }

        if (state is ErrorAchievementsState) {
          return CompanionInfoBox(
            header: AppStrings.masteryLevel,
            loading: false,
          );
        }

        return CompanionInfoBox(
          header: AppStrings.masteryLevel,
        );
      },
    );
  }
}