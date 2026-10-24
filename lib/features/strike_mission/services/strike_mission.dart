import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:guildwars2_companion/core/utils/assets.dart';
import 'package:guildwars2_companion/core/utils/urls.dart';
import 'package:guildwars2_companion/features/strike_mission/models/strike_mission.dart';

class StrikeMissionService {
  /// The weekly achievement of the game with the strike missions that have been
  /// completed this week as its bits.
  static const int weeklyAchievementId = 9125;

  List<StrikeMission> _strikeMissions;
  Dio dio;

  StrikeMissionService({
    @required this.dio,
  });

  Future<List<StrikeMission>> getStrikeMissions() async {
    if (_strikeMissions == null) {
      List data = await Assets.loadDataAsset(Assets.strikeMissions, translateNames: true);
      _strikeMissions = data
        .map((s) => StrikeMission.fromJson(s))
        .toList();
    }

    return _strikeMissions
      .map((s) => StrikeMission(
        id: s.id,
        name: s.name,
        region: s.region,
        weeklyBit: s.weeklyBit,
        achievementId: s.achievementId,
        challengeAchievementId: s.challengeAchievementId,
      ))
      .toList();
  }

  /// The progress of the account for some achievements, by achievement id. The
  /// achievements without progress are not in the answer.
  Future<Map<int, Map<String, dynamic>>> getAchievementProgress(List<int> ids) async {
    try {
      final response = await dio.get('${Urls.achievementProgressByIdsUrl}${ids.join(',')}');

      if (response.statusCode == 200) {
        List progress = response.data;
        return Map<int, Map<String, dynamic>>.fromEntries(progress.map((p) =>
          MapEntry<int, Map<String, dynamic>>(p['id'] as int, Map<String, dynamic>.from(p))
        ));
      }
    } on DioError catch (e) {
      // Nothing of these achievements has been started
      if (e.response != null && e.response.statusCode == 404) {
        return {};
      }

      rethrow;
    }

    throw Exception();
  }
}
