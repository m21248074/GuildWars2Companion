import 'package:shared_preferences/shared_preferences.dart';

/// Remembers the last known home screen statistics so they can be shown right
/// away on the next start, while the fresh numbers are still being fetched.
class StatsCache {
  static const String _masteryLevelKey = 'cached_mastery_level';
  static const String _achievementPointsKey = 'cached_achievement_points';

  static int masteryLevel;
  static int achievementPoints;

  static Future<void> load() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      masteryLevel = prefs.getInt(_masteryLevelKey);
      achievementPoints = prefs.getInt(_achievementPointsKey);
    } catch (_) {
      // The cache is only a nicety, never fail because of it
    }
  }

  static void saveMasteryLevel(int value) {
    if (value == null || value == masteryLevel) {
      return;
    }

    masteryLevel = value;
    _write(_masteryLevelKey, value);
  }

  static void saveAchievementPoints(int value) {
    if (value == null || value == achievementPoints) {
      return;
    }

    achievementPoints = value;
    _write(_achievementPointsKey, value);
  }

  /// The numbers belong to one account, so forget them when it changes.
  static Future<void> clear() async {
    masteryLevel = null;
    achievementPoints = null;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(_masteryLevelKey);
      await prefs.remove(_achievementPointsKey);
    } catch (_) {}
  }

  static Future<void> _write(String key, int value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt(key, value);
    } catch (_) {}
  }
}
