import 'package:flutter/widgets.dart';
import 'package:guildwars2_companion/features/strike_mission/models/strike_mission.dart';
import 'package:guildwars2_companion/features/strike_mission/services/strike_mission.dart';

class StrikeMissionRepository {
  final StrikeMissionService strikeMissionService;

  StrikeMissionRepository({
    @required this.strikeMissionService,
  });

  Future<StrikeMissionData> getStrikeMissions() async {
    List<StrikeMission> missions = await strikeMissionService.getStrikeMissions();

    List<int> achievementIds = [
      StrikeMissionService.weeklyAchievementId,
      ...missions.where((m) => m.achievementId != null).map((m) => m.achievementId),
      ...missions.where((m) => m.challengeAchievementId != null).map((m) => m.challengeAchievementId),
      ...missions.where((m) => m.legendaryAchievementId != null).map((m) => m.legendaryAchievementId),
    ];

    Map<int, Map<String, dynamic>> progress = await strikeMissionService.getAchievementProgress(achievementIds);

    final Map<String, dynamic> weekly = progress[StrikeMissionService.weeklyAchievementId];
    final List<int> weeklyBits = weekly != null && weekly['bits'] != null
      ? (weekly['bits'] as List).cast<int>()
      : <int>[];

    missions.forEach((m) {
      m.completedThisWeek = weeklyBits.contains(m.weeklyBit);
      m.completed = _isDone(progress[m.achievementId]);
      m.challengeCompleted = _isDone(progress[m.challengeAchievementId]);
      m.legendaryCompleted = _isDone(progress[m.legendaryAchievementId]);
    });

    return StrikeMissionData(
      missions: missions,
      weeklyCurrent: weekly != null ? (weekly['current'] ?? weeklyBits.length) : 0,
      weeklyMax: weekly != null ? (weekly['max'] ?? 0) : 0,
    );
  }

  bool _isDone(Map<String, dynamic> progress) => progress != null && progress['done'] == true;
}
