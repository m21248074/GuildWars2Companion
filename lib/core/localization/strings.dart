import 'package:guildwars2_companion/core/localization/game_names.dart';

/// Texts of the interface. English is the source language.
///
/// Changing the language restarts the app, so the language is set once at
/// startup (see ConfigurationService) and the getters can be used anywhere,
/// also where there is no BuildContext. The translations follow
/// docs/zh-TW-glossary.md.
class AppStrings {
  static bool _traditionalChinese = false;

  static void setTraditionalChinese(bool value) {
    _traditionalChinese = value;
  }

  static String _t(String english, String traditionalChinese) =>
    _traditionalChinese ? traditionalChinese : english;

  // Common
  static String get cancel => _t('Cancel', '取消');
  static String get remove => _t('Remove', '移除');
  static String get loading => _t('Loading...', '載入中…');
  static String get error => _t('Error', '錯誤');
  static String get changeLanguage => _t('Change language', '變更語言');

  // Tabs
  static String get tabHome => _t('Home', '首頁');
  static String get tabCharacters => _t('Characters', '角色');
  static String get tabBank => _t('Bank', '銀行');
  static String get tabTrading => _t('Trading', '交易所');
  static String get tabProgression => _t('Progression', '進度');
  static String get loadingAccountInformation => _t('Loading account information', '正在載入帳號資訊');

  // Home
  static String get welcome => _t('Welcome ', '歡迎 ');
  static String get playtime => _t('Playtime', '遊玩時間');
  static String get masteryLevel => _t('Mastery level', '專精等級');
  static String get achievements => _t('Achievements', '成就');
  static String get wallet => _t('Wallet', '錢包');
  static String get worldBosses => _t('World bosses', '世界王');
  static String get metaEvents => _t('Meta Events', '大型事件');
  static String get pvp => _t('PvP', 'PvP');
  static String get raids => _t('Raids', '大型地下城');
  static String get dungeons => _t('Dungeons', '地下城');

  // Error screen. The subject is a noun phrase that has to be translated by
  // the caller, English puts it in the middle of the sentence.
  static String somethingWentWrongWhileLoading(String subject) =>
    _t('Something went wrong while loading $subject', '載入$subject時發生問題');
  static String get theAccount => _t('the account', '帳號');
  static String get checkInternetConnection => _t('Please check your internet connection', '請檢查網路連線');
  static String get tryAgain => _t('Click here to try again', '點此重試');

  // Settings
  static String get aboutAuthor => _t('By Daniël Scholte / Revolt.2860', '作者：Daniël Scholte / Revolt.2860');
  static String version(String version, String build) =>
    _t('Version $version - Build $build', '版本 $version - 組建 $build');
  static String get thanksForEventTimers => _t(
    'Thanks to the Guild Wars 2 Wiki and GW2.Ninja for the event timers.',
    '感謝 Guild Wars 2 Wiki 與 GW2.Ninja 提供事件計時資料。'
  );
  static String get theme => _t('Theme', '主題');
  static String get scheduledNotifications => _t('Scheduled notifications', '排程通知');
  static String get apiAndWikiLanguage => _t('Api and Wiki Language', 'API 與 Wiki 語言');
  static String get timeNotation => _t('Time notation', '時間格式');
  static String get caching => _t('Caching', '快取');
  static String get faq => _t('Frequently asked questions', '常見問題');
  static String get changelog => _t('Changelog', '更新日誌');
  static String changelogVersion(String version) => _t('Version $version', '版本 $version');
  static String get viewProjectOnGithub => _t('View the project on Github', '在 GitHub 上查看專案');
  static String get enjoyingTheApp => _t('Enjoying the app?', '喜歡這個 App 嗎？');
  static String reviewTheAppOn(String store) => _t('Review the app on the $store!', '到 $store 評價這個 App！');
  static String get reviewTheApp => _t('Review the app', '評價 App');

  // Settings: theme and time notation
  static String get light => _t('Light', '淺色');
  static String get dark => _t('Dark', '深色');
  static String get useSystemTheme => _t('Use system theme', '使用系統主題');
  static String get hours24 => _t('24 hours', '24 小時制');
  static String get hours12 => _t('12 hours', '12 小時制');

  // Settings: language
  static String get changeLanguageConfirmation => _t(
    'Are you sure that you want to change the language?\nThis will also clear your cache and require you to restart the app.',
    '確定要變更語言嗎？\n這也會清除快取，並需要重新啟動 App。'
  );

  // Settings: caching
  static String get cacheAchievements => _t('achievements', '成就');
  static String get cacheItems => _t('items', '物品');
  static String get cacheSkins => _t('skins', '外觀');
  static String get cacheMinis => _t('minis', '迷你寵物');
  static String get cacheSkills => _t('skills', '技能');
  static String get cacheTraits => _t('traits', '特性');
  static String cached(String what) => _t('Cached $what', '已快取的$what');
  static String get clearCache => _t('Clear cache', '清除快取');
  static String get clearingCache => _t('Clearing cache...', '正在清除快取…');
  static String get confirmClearCache => _t(
    'Are you sure that you want to clear the cache?',
    '確定要清除快取嗎？'
  );
  static String get cachingExplanation => _t(
    "Caching allows GW2 Companion to load quicker while saving bandwidth and reducing the possibility for connection failures.\nOnly mostly static data such as Achievements and Items are cached. Progression isn't cached.\nExperiencing issues with cached data, such as outdated information? Try clearing the cache.",
    '快取可以讓 GW2 Companion 載入得更快，同時節省流量，並降低連線失敗的機率。\n只有成就、物品這類大多不會變動的資料會被快取，進度不會被快取。\n快取的資料有問題，例如資訊過時嗎？請試著清除快取。'
  );

  // Settings: frequently asked questions
  static String get faqQuestion => _t(
    'Why are my achievement points or mastery level incorrect?',
    '為什麼成就點數或專精等級不正確？'
  );
  static String get faqAnswer => _t(
    'All data in the GW2 Companion app is retrieved from the official Guild Wars 2 Api.\nSome Achievements and Masteries are currently missing from the Api, causing the total points to be off from the in-game number.\nOnce ArenaNet updates the Api to include the missing Achievements and Masteries, these should automatically appear in the app.',
    'GW2 Companion 的所有資料都來自官方的 Guild Wars 2 API。\n部分成就和專精目前沒有收錄在 API 中，導致總點數與遊戲內的數字不符。\n等 ArenaNet 更新 API 補上這些成就和專精之後，它們就會自動出現在 App 中。'
  );

  // Settings: scheduled notifications
  static String get noNotificationsScheduled => _t('No notifications scheduled', '尚未排定任何通知');
  static String get noNotificationsForEvent => _t('No notifications scheduled for this event', '這個事件尚未排定通知');
  static String minutesBefore(int minutes) => _t('$minutes minutes before', '提前 $minutes 分鐘');
  static String get whenSpawningAt => _t('When spawning at', '出現時');
  static String get removeScheduledNotification => _t('Remove scheduled notification', '移除排程通知');
  static String get confirmRemoveNotification => _t(
    'Are you sure that you want to remove this scheduled notification?',
    '確定要移除這個排程通知嗎？'
  );

  // Account: Api keys
  static String get apiKeys => _t('Api Keys', 'API 金鑰');
  static String get apiKey => _t('Api Key', 'API 金鑰');
  static String get noApiKeysFound => _t('No Api Keys found', '找不到任何 API 金鑰');
  static String get addOneUsingButton => _t('Add one using the button in the bottom right corner.', '請使用右下角的按鈕新增。');
  static String addedOn(String date) => _t('Added: $date', '新增日期：$date');
  static String get deleteApiKey => _t('Delete Api Key', '刪除 API 金鑰');
  static String get enterApiKeyByQrCode => _t('Enter Api Key by Qr Code', '以 QR Code 輸入 API 金鑰');
  static String get enterApiKeyByText => _t('Enter Api Key by text', '以文字輸入 API 金鑰');
  static String get howToGetApiKey => _t('How do I get an Api Key?', '如何取得 API 金鑰？');
  static String get settings => _t('Settings', '設定');
  static String get addYourApiKey => _t('Add your Guild Wars 2 Api Key', '新增 Guild Wars 2 的 API 金鑰');
  static String get add => _t('Add', '新增');
  static String get scanQrCode => _t('Scan your Qr Code', '掃描 QR Code');
  static String get qrTakingTooLong => _t(
    'Taking too long? The app might not have permission to use the camera.',
    '等太久了嗎？ App 可能沒有使用相機的權限。'
  );
  static String get checkingApiKey => _t('Checking Api Key...', '正在檢查 API 金鑰…');

  // Account: how to get an Api key
  static String get howToIntro => _t(
    'To use the Guild Wars 2 Companion app, you need to generate a personal Api Key on the Arenanet website:',
    '使用 Guild Wars 2 Companion 需要先在 ArenaNet 網站產生個人的 API 金鑰：'
  );
  static String get howToInstructions => _t('Instructions', '步驟');
  static String get howToStep1 => _t(
    "After navigating to the above mentioned website, click on the 'New Key' button to generate a new key.",
    '前往上述網站後，點選「New Key」按鈕以產生新的金鑰。'
  );
  static String get howToStep2 => _t(
    'On the next page, enter a name for the key and select which elements you want to app to have access to.',
    '在下一頁輸入金鑰的名稱，並選擇要讓 App 存取哪些項目。'
  );
  static String get howToStep3 => _t(
    'We recommend to select all the options to get the optimal experience.',
    '建議勾選所有選項，以獲得最完整的體驗。'
  );
  static String get howToStep4 => _t(
    "Keep in mind, the app can only retrieve the selected information. The app cannot make any changes to your account, and the retrieved information will stay on your phone and won't be shared.",
    '請注意，App 只能讀取已選取的資訊，無法對帳號做任何變更，取得的資訊只會留在手機上，不會被分享。'
  );
  static String get howToStep5 => _t(
    'After creating a new api key, copy and paste the key in the app, or scan the qr code.',
    '建立新的 API 金鑰後，將金鑰複製貼上到 App，或掃描 QR Code。'
  );

  // Account: messages
  static String apiError(String message) => _t('Api error: $message', 'API 錯誤：$message');
  static String get networkError => _t('Network error', '網路錯誤');
  static String get apiKeyAdded => _t('Api Key added', '已新增 API 金鑰');
  static String get apiKeyRemoved => _t('Api Key removed', '已移除 API 金鑰');

  // Error screen subjects
  static String get theAchievements => _t('the achievements', '成就');
  static String get theAchievement => _t('the achievement', '這個成就');
  static String get theProgression => _t('the progression', '進度');
  static String get theMasteries => _t('the masteries', '專精');

  // Progression and achievements
  static String get progression => _t('Progression', '進度');
  static String get favoriteAchievements => _t('Favorite achievements', '收藏成就');
  static String get masteries => _t('Masteries', '專精');
  static String get description => _t('Description', '描述');
  static String get lockedDescription => _t('Locked description', '未解鎖的描述');
  static String get requirement => _t('Requirement', '條件');
  static String get rewards => _t('Rewards', '獎勵');
  static String masteryPoint(String region) => _t('$region Mastery point', '$region專精點數');
  static String get prerequisites => _t('Prerequisites', '前置成就');
  static String get objectives => _t('Objectives', '目標');
  static String get collection => _t('Collection', '收藏');
  static String get unknownItem => _t('Unknown item', '未知物品');

  // Masteries
  static String get completed => _t('Completed', '已完成');
  static String get masteryInstructions => _t('Instructions', '操作說明');
  // The card with region, points and experience is titled 'Instructions' in English too
  static String get masteryDetails => _t('Instructions', '詳細資料');
  static String get region => _t('Region', '地區');
  static String get masteryPoints => _t('Mastery points', '專精點數');
  static String get experience => _t('Experience', '經驗值');
  static String get tyria => _t('Tyria', '泰瑞亞');
  static String get heartOfThorns => _t('Heart of Thorns', '決戰邁古瑪');
  static String get pathOfFire => _t('Path of Fire', '火焰之路');
  static String get icebroodSaga => _t('Icebrood Saga', '冰巢傳說');
  static String get endOfDragons => _t('End of Dragons', '巨龍絕境');

  // Characters
  static String get characters => _t('Characters', '角色');
  static String characterSummary(int level, String race, String profession) =>
    _t('Level $level $race $profession', '$level 級$race$profession');
  static String hoursOfPlaytime(int hours) => _t('$hours hours of playtime', '遊玩 $hours 小時');
  static String playtimeShort(int hours) => _t('${hours}h', '$hours 小時');
  // Race names follow the game data (Human, Asura, Sylvari, Charr, Norn)
  static String raceName(String race) {
    switch (race) {
      case 'Human': return _t(race, '人類');
      case 'Asura': return _t(race, '阿蘇拉');
      case 'Sylvari': return _t(race, '希爾瓦里');
      case 'Charr': return _t(race, '夏爾');
      case 'Norn': return _t(race, '諾恩');
      default: return race;
    }
  }
  static String get level => _t('Level', '等級');
  static String get deaths => _t('Deaths', '死亡次數');
  static String get equipment => _t('Equipment', '裝備');
  static String get builds => _t('Builds', '配置');
  static String get inventory => _t('Inventory', '物品欄');
  static String get namelessBuild => _t('Nameless build', '未命名的配置');
  static String get namelessEquipmentBuild => _t('Nameless equipment build', '未命名的裝備配置');
  static String get active => _t('Active', '使用中');
  static String get craftingDisciplines => _t('Crafting disciplines', '製作專業');
  static String get theCharacters => _t('the characters', '角色');
  static String get theCharacter => _t('the character', '這個角色');
  static String get theCharacterBuilds => _t('the character builds', '這個角色的配置');
  static String get theCharacterItems => _t('the character items', '這個角色的物品');

  // Bank
  static String get bank => _t('Bank', '銀行');
  static String get materials => _t('Materials', '材料');
  static String get sharedInventory => _t('Shared inventory', '共用物品欄');
  static String get buildStorage => _t('Build storage', '配置儲存');
  static String slotsUsed(int used, int total) => _t('$used / $total slots', '$used / $total 格');
  static String get theBank => _t('the bank', '銀行');
  static String get theSharedInventory => _t('the shared inventory', '共用物品欄');
  static String get theBuildStorage => _t('the build storage', '配置儲存');
  static String get theMaterialStorage => _t('the material storage', '材料');

  // Trading post
  static String get tradingPost => _t('Trading Post', '交易所');
  static String get buying => _t('Buying', '購買中');
  static String get selling => _t('Selling', '出售中');
  static String get bought => _t('Bought', '已購買');
  static String get sold => _t('Sold', '已售出');
  static String get noItemsFound => _t('No items found', '找不到任何物品');
  static String get noOrdersFound => _t('No orders found', '找不到任何訂單');
  static String get buyers => _t('Buyers', '買家');
  static String get sellers => _t('Sellers', '賣家');
  static String quantityOrdered(String quantity) => _t('$quantity Ordered', '$quantity 個訂購中');
  static String quantityAvailable(String quantity) => _t('$quantity Available', '$quantity 個可購買');
  static String get deliveryItems => _t('Items: ', '物品：');
  static String get deliveryFunds => _t('Funds: ', '款項：');
  static String get theTradingPost => _t('the trading post', '交易所');
  static String get theListings => _t('the listings', '掛單');

  // Item page
  static String get transmuted => _t('Transmuted', '已變換');
  static String get effectDescription => _t('Effect description', '效果描述');
  static String get upgrades => _t('Upgrades', '升級');
  static String get infusions => _t('Infusions', '灌注');
  static String get stats => _t('Stats', '屬性');
  static String get value => _t('Value', '價值');
  static String get vendor => _t('Vendor', '商人賣價');
  static String get tradingPostBuy => _t('Trading Post Buy', '交易所買價');
  static String get tradingPostSell => _t('Trading Post Sell', '交易所賣價');

  // Labels, rarities, types and flags that come from the game data as English
  // codes. Anything that is not listed is shown as it is.
  static String itemText(String english) {
    if (!_traditionalChinese) return english;
    return _itemTexts[english] ?? english;
  }

  static const Map<String, String> _itemTexts = {
    'Rarity': '稀有度',
    'Type': '類型',
    'Weight Class': '護甲類別',
    'Defense': '防禦',
    'Weapon Strength': '武器強度',
    'Size': '大小',
    'Effect Type': '效果類型',
    'Duration': '持續時間',
    'Charges': '使用次數',
    'Junk': '垃圾',
    'Basic': '基本',
    'Fine': '優質',
    'Masterwork': '精製',
    'Rare': '稀有',
    'Exotic': '異域',
    'Ascended': '昇華',
    'Legendary': '傳奇',
    'Armor': '護甲',
    'Weapon': '武器',
    'Back': '背部',
    'Bag': '背包',
    'Consumable': '消耗品',
    'Container': '容器',
    'Gathering': '採集工具',
    'Gizmo': '小玩意',
    'Key': '鑰匙',
    'MiniPet': '迷你寵物',
    'Tool': '工具',
    'Trinket': '飾品',
    'Trophy': '戰利品',
    'Heavy': '重型',
    'Medium': '中型',
    'Light': '輕型',
    'Clothing': '衣物',
    'Helm Aquatic': '水下頭盔',
    'Appearance Change': '外觀變更',
    'Npc Contract': 'NPC 契約',
    'Random Mount Unlock': '隨機坐騎解鎖',
    'Random Unlock': '隨機解鎖',
    'Upgrade Removal': '升級拆除',
    'Teleport To Friend': '傳送至好友',
    'Crafting Material': '製作材料',
    'Upgrade Component': '升級組件',
    'Account bound on use': '使用後帳號綁定',
    'Account bound': '帳號綁定',
    'Attuned': '已調和',
    'Bulk consumable': '可批次使用',
    'Warning on delete': '刪除時警告',
    'Suffix hidden': '隱藏後綴',
    'Infused': '已灌注',
    'Monster only item': '怪物專用物品',
    'Cannot be used in the Mystic Forge': '無法用於神秘熔爐',
    'Cannot be salvaged': '無法拆解',
    'Cannot be sold': '無法出售',
    'Not upgradeable': '無法升級',
    'Cannot be used underwater': '無法在水中使用',
    'Soul bound on acquire': '獲得後靈魂綁定',
    'Soul bound on use': '使用後靈魂綁定',
  };

  // Events and world bosses
  static String get theMetaEvents => _t('the meta events', '大型事件');
  static String get theMetaEvent => _t('the meta event', '這個大型事件');
  static String get theWorldBosses => _t('the world bosses', '世界王');
  static String get eventActive => _t('Active', '進行中');
  static String get spawnTimes => _t('Spawn Times', '出現時間');
  static String get map => _t('Map', '地圖');
  static String get waypoint => _t('Waypoint', '傳送點');

  // Scheduled notifications
  static String get next => _t('Next', '下一步');
  static String get chooseNotificationType => _t('Choose a notification type', '選擇通知類型');
  static String get dailyNotification => _t('Daily notification', '每日通知');
  static String get oneTimeNotification => _t('One-time notification', '單次通知');
  static String get dailyNotificationExplanation => _t(
    'Receive a daily notification at the selected time',
    '每天在選定的時間通知'
  );
  static String get oneTimeNotificationExplanation => _t(
    'Receive a single notification at the selected date and time',
    '在選定的日期與時間通知一次'
  );
  static String get multipleNotificationsTip => _t(
    'You can plan multiple notifications for a single event or world boss.',
    '同一個事件或世界王可以排定多個通知。'
  );
  static String get oneTimeNotificationWarning => _t(
    "If you're experiencing issues with not receiving the one-time notifications, please disable battery management for this app.",
    '如果收不到單次通知，請關閉這個 App 的電池管理。'
  );
  static String get dailyNotificationWarning => _t(
    "If you're experiencing significantly delayed daily notifications, please use the one-time option.",
    '如果每日通知延遲嚴重，請改用單次通知。'
  );
  static String get chooseDateAndSpawnTime => _t('Choose a date and spawn time', '選擇日期與出現時間');
  static String get chooseSpawnTime => _t('Choose a spawn time', '選擇出現時間');
  static String get selectDateOrTime => _t('Please select a date or time.', '請選擇日期或時間。');
  static String get dateLabel => _t('Date: ', '日期：');
  static String get timeLabel => _t('Time:', '時間：');
  static String get chooseNotificationTime => _t('Choose a notification time', '選擇通知時間');
  static String get atSpawnTime => _t('At spawn time', '出現時');
  static String minutesBeforeSpawning(int minutes) =>
    _t('$minutes minutes before spawning', '出現前 $minutes 分鐘');
  static String get addNotification => _t('Add notification', '新增通知');

  // PvP
  static String get pvpStatistics => _t('PvP Statistics', 'PvP 統計');
  static String pvpRank(int rank) => _t('Rank $rank', '$rank 級');
  static String get unrankedWinrate => _t('Unranked\nwinrate', '非排名賽\n勝率');
  static String get rankedWinrate => _t('Ranked\nwinrate', '排名賽\n勝率');
  static String get rankedSeasons => _t('Ranked seasons', '排名賽季');
  static String get gameHistory => _t('Game history', '對戰紀錄');
  static String get theGameHistory => _t('game history', '對戰紀錄');
  static String get thePvpSeasons => _t('PvP Seasons', 'PvP 賽季');
  static String get noPvpGamesFound => _t('No pvp games found', '找不到任何 PvP 對戰');
  static String get noRankedSeasonsFound => _t(
    'No ranked seasons with participation found',
    '找不到有參與的排名賽季'
  );
  static String pvpResult(String result) {
    switch (result) {
      case 'Victory': return _t(result, '勝利');
      case 'Defeat': return _t(result, '敗北');
      default: return result;
    }
  }
  static String pvpRatingType(String ratingType) {
    switch (ratingType) {
      case 'Ranked': return _t(ratingType, '排名賽');
      case 'Unranked': return _t(ratingType, '非排名賽');
      case 'None': return _t(ratingType, '無評級');
      default: return ratingType;
    }
  }

  // Raids, dungeons, wallet
  static String get theRaids => _t('the raids', '大型地下城');
  static String get theRaid => _t('the raid', '這個大型地下城');
  static String get weeklyProgress => _t('Weekly Progress', '本週進度');
  static String get bosses => _t('Bosses', '首領');
  static String get theDungeons => _t('the dungeons', '地下城');
  static String get theDungeon => _t('the dungeon', '這個地下城');
  static String get dailyProgress => _t('Daily Progress', '今日進度');
  static String get paths => _t('Paths', '路線');
  static String get theWallet => _t('the wallet', '錢包');

  // Changelog dialog
  static String get welcomeBack => _t('Welcome back!', '歡迎回來！');
  static String get sinceLastVisit => _t(
    'Since your last visit, the following new features have been added to the app:',
    '自上次使用以來，App 新增了以下功能：'
  );
  static String get continueText => _t('Continue', '繼續');

  // Names in the data files (see game_names.dart). Dungeon paths are written
  // as 'Path 1 - Hodgins'.
  static String gameName(String english) {
    if (!_traditionalChinese || english == null) return english;

    final direct = gameNamesTraditionalChinese[english];
    if (direct != null) return direct;

    final path = RegExp(r'^Path (\d) - (.+)$').firstMatch(english);
    if (path != null) {
      final name = dungeonPathNamesTraditionalChinese[path.group(2)];
      if (name != null) return '路線 ${path.group(1)} - $name';
    }

    return english;
  }

  static String get tipLabel => _t('Tip: ', '提示：');
  static String get warningLabel => _t('Warning: ', '警告：');

  // Builds, skills and traits
  static String get skills => _t('Skills', '技能');
  static String get specializationsCard => _t('Skills', '特長');
  static String get effects => _t('Effects', '效果');
  static String get noSpecializationChosen => _t('No specialization chosen', '尚未選擇特長');

  // Codes from the game data that are shown as they are: attributes of a
  // trait, combo fields and finishers, skill types and the slot of a trait.
  static String buildText(String english) {
    if (!_traditionalChinese || english == null) return english;
    return _buildTexts[english] ?? english;
  }

  static const Map<String, String> _buildTexts = {
    'Power': '力量',
    'Precision': '精準',
    'Toughness': '強韌',
    'Vitality': '活力',
    'ConditionDamage': '狀態傷害',
    'ConditionDuration': '狀態持續時間',
    'BoonDuration': '增益持續時間',
    'CritDamage': '暴擊傷害',
    'Healing': '治療',
    'Dark': '黑暗',
    'Ethereal': '虛幻',
    'Fire': '火焰',
    'Ice': '冰霜',
    'Light': '光明',
    'Lightning': '閃電',
    'Poison': '毒',
    'Smoke': '煙霧',
    'Water': '水',
    'Blast': '爆炸',
    'Leap': '跳躍',
    'Projectile': '投射物',
    'Whirl': '旋風',
    'Bundle': '持握物',
    'Elite': '精英',
    'Heal': '治療',
    'Monster': '怪物',
    'Pet': '寵物',
    'Profession': '職業',
    'Toolbelt': '工具腰帶',
    'Utility': '實用',
    'Weapon': '武器',
    'Range': '射程',
    'Recharge': '冷卻時間',
    'Combo Finisher': '組合終結技',
    'Combo Field': '組合場',
    'Unblockable': '無法格擋',
    'StunBreak': '解除控制',
    'Minor trait': '次要特性',
    'Major trait': '主要特性',
  };

  // Error page
  static String get errorLoadingApp => _t(
    'There was an error while loading GW2 Companion',
    '載入 GW2 Companion 時發生錯誤'
  );
  static String get errorSendLogHint => _t(
    'You can send the error log to the developer to get the issue fixed.',
    '可以把錯誤記錄寄給開發者，協助修正問題。'
  );
  static String get errorContactHint => _t(
    'You will be contacted shortly afterwards with an estimation on when the issue will be fixed.',
    '之後會盡快通知預計的修正時間。'
  );
  static String get sendErrorLogByMail => _t('Send error log by mail', '以電子郵件寄送錯誤記錄');
  static String get errorLogCopied => _t('Error log copied to clipboard', '錯誤記錄已複製到剪貼簿');
  static String get copyErrorLog => _t('Copy error log to clipboard', '複製錯誤記錄到剪貼簿');

  // Durations, for example '1 hour 5 minutes'. [total] is the length of the
  // whole duration in that unit, English uses it for the plural.
  static String hoursText(int hours) => _t('$hours hour${hours > 1 ? 's' : ''}', '$hours 小時');
  static String minutesText(int minutes, int total) =>
    _t('$minutes minute${total > 1 ? 's' : ''}', '$minutes 分鐘');
  static String secondsText(int seconds, int total) =>
    _t('$seconds second${total > 1 ? 's' : ''}', '$seconds 秒');

  // Seconds of a fact, for example '30s'
  static String secondsShort(num seconds) => _t('${seconds}s', '$seconds 秒');
}
