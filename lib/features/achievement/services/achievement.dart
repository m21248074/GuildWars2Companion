import 'package:dio/dio.dart';
import 'package:guildwars2_companion/core/utils/assets.dart';
import 'package:guildwars2_companion/core/utils/urls.dart';
import 'package:guildwars2_companion/features/achievement/database_configurations/achievement.dart';
import 'package:guildwars2_companion/core/services/cache.dart';
import 'package:guildwars2_companion/features/achievement/models/achievement.dart';
import 'package:guildwars2_companion/features/achievement/models/achievement_category.dart';
import 'package:guildwars2_companion/features/achievement/models/achievement_group.dart';
import 'package:guildwars2_companion/features/achievement/models/achievement_progress.dart';
import 'package:guildwars2_companion/features/achievement/models/daily.dart';
import 'package:guildwars2_companion/features/mastery/models/mastery.dart';
import 'package:guildwars2_companion/features/mastery/models/mastery_progress.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AchievementService {
  final Dio dio;
  CacheService<Achievement> _cacheService;

  AchievementService({
    @required this.dio
  }) {
    this._cacheService = CacheService<Achievement>(
      databaseConfiguration: AchievementConfiguration(),
      fromJson: (json) => Achievement.fromJson(json),
      fromMap: (map) => Achievement.fromDb(map),
      toMap: (achievement) => achievement.toDb(),
      findById: (achievements, id) => achievements.firstWhere((a) => a.id == id, orElse: () => null),
      url: Urls.achievementsUrl,
      dio: dio,
    );
  }

  Future<void> loadCachedData() => _cacheService.load();

  Future<void> clearCache() => _cacheService.clear();

  Future<int> getCachedAchievementsCount() => _cacheService.count();

  Future<List<Achievement>> getAchievements(List<int> achievementIds) => _cacheService.getData(achievementIds);

  Future<List<AchievementProgress>> getAchievementProgress() async {
    final response = await dio.get(Urls.achievementProgressUrl);

    if (response.statusCode == 200) {
      List progress = response.data;
      return progress.where((a) => a != null).map((a) => AchievementProgress.fromJson(a)).toList();
    }

    throw Exception();
  }

  Future<List<AchievementCategory>> getAchievementCategories() async {
    final response = await dio.get(Urls.achievementCategoriesUrl);

    if (response.statusCode == 200) {
      List categories = response.data;
      return categories.where((a) => a != null).map((a) => AchievementCategory.fromJson(a)).toList();
    }

    throw Exception();
  }

  Future<List<AchievementGroup>> getAchievementGroups() async {
    final response = await dio.get(Urls.achievementGroupsUrl);

    if (response.statusCode == 200) {
      List groups = response.data;
      return groups.where((a) => a != null).map((a) => AchievementGroup.fromJson(a)).toList();
    }

    throw Exception();
  }

  Future<DailyGroup> getDailies({bool tomorrow = false}) async {
    try {
      final response = await dio.get(tomorrow ? Urls.dailiesTomorrowUrl : Urls.dailiesUrl);

      if (response.statusCode == 200) {
        return DailyGroup.fromJson(response.data);
      }
    } catch (_) {
      // The daily endpoint has been switched off, see below.
    }

    return DailyGroup(
      pve: [],
      pvp: [],
      wvw: [],
      special: [],
      fractals: await _getDailyFractals(tomorrow: tomorrow),
    );
  }

  /// The achievements/daily endpoint no longer answers, so the daily fractals
  /// come from the 15-day rotation of the wiki (assets/data/daily_fractals.json).
  /// The set is the day of the year (the same index for every year, so Feb 29
  /// is skipped in a common year) modulo 15; the day changes at 00:00 UTC.
  Future<List<Daily>> _getDailyFractals({bool tomorrow = false}) async {
    final data = await Assets.loadDataAsset(Assets.dailyFractals);

    DateTime day = DateTime.now().toUtc();
    if (tomorrow) {
      day = day.add(Duration(days: 1));
    }

    final isLeapYear = day.year % 4 == 0 && (day.year % 100 != 0 || day.year % 400 == 0);
    int dayOfYear = DateTime.utc(day.year, day.month, day.day).difference(DateTime.utc(day.year, 1, 1)).inDays;
    if (!isLeapYear && dayOfYear >= 59) {
      dayOfYear++;
    }

    final rotation = (data['rotation'] as List)[dayOfYear % 15];
    final List<int> ids = [];

    (rotation['fractals'] as List).forEach((fractal) {
      ids.addAll((data['tiers'][fractal] as List).cast<int>());
    });

    (rotation['recommended'] as List).forEach((scale) {
      ids.add(data['recommended']['$scale'] as int);
    });

    return ids
      .map((id) => Daily(
        id: id,
        level: Level(min: 80, max: 80),
        requiredAccess: ['GuildWars2'],
      ))
      .toList();
  }

  Future<List<Mastery>> getMasteries() async {
    final response = await dio.get(Urls.masteriesUrl);

    if (response.statusCode == 200) {
      List masteries = response.data;
      return masteries.map((a) => Mastery.fromJson(a)).toList();
    }

    throw Exception();
  }

  Future<List<MasteryProgress>> getMasteryProgress() async {
    final response = await dio.get(Urls.masteryProgressUrl);

    if (response.statusCode == 200) {
      List masteries = response.data;
      return masteries.map((a) => MasteryProgress.fromJson(a)).toList();
    }

    if (response.statusCode == 400
      && response.data != null
      && response.data['text'] == 'endpoint broken') {
        return null;
      }

    throw Exception();
  }

  Future<void> _setFavoriteAchievements(List<int> ids) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorite_achievements', ids.map((i) => i.toString()).toList());
  }

  Future<List<int>> getFavoriteAchievements() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList('favorite_achievements') ?? [])
      .map((i) => int.parse(i))
      .toList();
  }

  Future<void> setFavoriteAchievement(int id) async {
    List<int> favoriteAchievementIds = await getFavoriteAchievements();
    favoriteAchievementIds.add(id);
    await _setFavoriteAchievements(favoriteAchievementIds);
  }

  Future<void> removeFavoriteAchievement(int id) async {
    List<int> favoriteAchievementIds = await getFavoriteAchievements();
    favoriteAchievementIds.remove(id);
    await _setFavoriteAchievements(favoriteAchievementIds);
  }
}
