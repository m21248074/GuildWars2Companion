import 'package:flutter/material.dart';
import 'package:guildwars2_companion/core/widgets/info_card.dart';
import 'package:guildwars2_companion/core/widgets/info_row.dart';
import 'package:guildwars2_companion/features/world_boss/models/world_boss.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

class WorldBossStatsCard extends StatelessWidget {
  final WorldBoss worldBoss;

  const WorldBossStatsCard({
    Key key,
    @required this.worldBoss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CompanionInfoCard(
      title: AppStrings.stats,
      child: Column(
        children: [
          CompanionInfoRow(
            header: AppStrings.level,
            text: worldBoss.level.toString()
          ),
          CompanionInfoRow(
            header: AppStrings.map,
            text: worldBoss.location
          ),
          CompanionInfoRow(
            header: AppStrings.waypoint,
            text: worldBoss.waypoint
          ),
        ],
      ),
    );
  }
}