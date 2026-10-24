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
}
