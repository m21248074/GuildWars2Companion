class StrikeMission {
  String id;
  String name;
  String region;

  /// The position in the weekly list of the game (the bits of the achievement
  /// 'Weekly Raid Encounters').
  int weeklyBit;

  /// The achievements of the game for completing the strike mission and for
  /// completing it with challenge mode, null when the game has none.
  int achievementId;
  int challengeAchievementId;

  bool completedThisWeek = false;
  bool completed = false;
  bool challengeCompleted = false;

  StrikeMission({
    this.id,
    this.name,
    this.region,
    this.weeklyBit,
    this.achievementId,
    this.challengeAchievementId,
  });

  StrikeMission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    region = json['region'];
    weeklyBit = json['weeklyBit'];
    achievementId = json['achievementId'];
    challengeAchievementId = json['challengeAchievementId'];
  }
}

class StrikeMissionData {
  final List<StrikeMission> missions;

  /// The progress of the weekly achievement of the game, for example 5 / 13.
  final int weeklyCurrent;
  final int weeklyMax;

  StrikeMissionData({
    this.missions,
    this.weeklyCurrent,
    this.weeklyMax,
  });
}
