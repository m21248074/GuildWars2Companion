import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guildwars2_companion/core/utils/guild_wars.dart';
import 'package:guildwars2_companion/core/widgets/accent.dart';
import 'package:guildwars2_companion/core/widgets/appbar.dart';
import 'package:guildwars2_companion/core/widgets/info_row.dart';
import 'package:guildwars2_companion/core/widgets/simple_button.dart';
import 'package:guildwars2_companion/features/achievement/repositories/achievement.dart';
import 'package:guildwars2_companion/features/build/repositories/build.dart';
import 'package:guildwars2_companion/features/item/repositories/item.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

class CachingConfigurationPage extends StatefulWidget {
  @override
  _CachingConfigurationPageState createState() => _CachingConfigurationPageState();
}

class _CachingConfigurationPageState extends State<CachingConfigurationPage> {
  bool allowClearCache = true;

  AchievementRepository _achievementRepository;
  ItemRepository _itemRepository;
  BuildRepository _buildRepository;

  Future<int> _cachedAchievementsFuture;
  Future<int> _cachedItemsFuture;
  Future<int> _cachedSkinsFuture;
  Future<int> _cachedMinisFuture;
  Future<int> _cachedSkillsFuture;
  Future<int> _cachedTraitsFuture;

  @override
  void initState() {
    super.initState();

    _achievementRepository = RepositoryProvider.of<AchievementRepository>(context);
    _itemRepository = RepositoryProvider.of<ItemRepository>(context);
    _buildRepository = RepositoryProvider.of<BuildRepository>(context);

    _cachedAchievementsFuture = _achievementRepository.getCachedAchievementsCount();
    _cachedItemsFuture = _itemRepository.getCachedItemsCount();
    _cachedSkinsFuture = _itemRepository.getCachedSkinsCount();
    _cachedMinisFuture = _itemRepository.getCachedMinisCount();
    _cachedSkillsFuture = _buildRepository.getCachedSkillsCount();
    _cachedTraitsFuture = _buildRepository.getCachedTraitsCount();
  }

  @override
  Widget build(BuildContext context) {
    return CompanionAccent(
      lightColor: Colors.blue,
      child: Scaffold(
        appBar: CompanionAppBar(
          title: AppStrings.caching,
          color: Colors.blue,
        ),
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            _CachedDisplay(
              future: _cachedAchievementsFuture,
              header: AppStrings.cacheAchievements
            ),
            _CachedDisplay(
              future: _cachedItemsFuture,
              header: AppStrings.cacheItems
            ),
            _CachedDisplay(
              future: _cachedSkinsFuture,
              header: AppStrings.cacheSkins
            ),
            _CachedDisplay(
              future: _cachedMinisFuture,
              header: AppStrings.cacheMinis
            ),
            _CachedDisplay(
              future: _cachedSkillsFuture,
              header: AppStrings.cacheSkills
            ),
            _CachedDisplay(
              future: _cachedTraitsFuture,
              header: AppStrings.cacheTraits
            ),
            CompanionSimpleButton(
              text: allowClearCache ? AppStrings.clearCache : AppStrings.clearingCache,
              onPressed: allowClearCache ? () => _clearCacheDialog(
                context: context,
                achievementRepository: _achievementRepository,
                itemRepository: _itemRepository,
                buildRepository: _buildRepository
              ) : null,
            ),
            Text(
              AppStrings.cachingExplanation,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.left,
            )
          ],
        )
      ),
    );
  }

  _clearCacheDialog({
    BuildContext context,
    AchievementRepository achievementRepository,
    ItemRepository itemRepository,
    BuildRepository buildRepository
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppStrings.clearCache),
          content: Text(
            AppStrings.confirmClearCache
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                AppStrings.cancel,
                style: TextStyle(
                  fontSize: 18.0
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                AppStrings.clearCache,
                style: TextStyle(
                  fontSize: 18.0
                ),
              ),
              onPressed: () async {
                Navigator.of(context).pop();

                setState(() {
                  allowClearCache = false;
                });

                await achievementRepository.clearCache();
                await itemRepository.clearCache();
                await buildRepository.clearCache();

                setState(() {
                  allowClearCache = true;

                  _cachedAchievementsFuture = _achievementRepository.getCachedAchievementsCount();
                  _cachedItemsFuture = _itemRepository.getCachedItemsCount();
                  _cachedSkinsFuture = _itemRepository.getCachedSkinsCount();
                  _cachedMinisFuture = _itemRepository.getCachedMinisCount();
                  _cachedSkillsFuture = _buildRepository.getCachedSkillsCount();
                  _cachedTraitsFuture = _buildRepository.getCachedTraitsCount();
                });
              },
            )
          ],
        );
      },
    );
  }
}

class _CachedDisplay extends StatelessWidget {
  final Future<int> future;
  final String header;

  _CachedDisplay({
    @required this.future,
    @required this.header
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return CompanionInfoRow(
            header: AppStrings.cached(header),
            text: AppStrings.error,
          );
        }

        if (snapshot.hasData) {
          return CompanionInfoRow(
            header: AppStrings.cached(header),
            text: GuildWarsUtil.intToString(snapshot.data),
          );
        }

        return CompanionInfoRow(
          header: AppStrings.cached(header),
          text: AppStrings.loading,
        );
      },
    );
  }
}