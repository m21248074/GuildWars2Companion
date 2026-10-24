# 介面文字對照表:第一批(底部分頁、首頁、設定頁)

直接改「繁體中文」欄位即可,改完告訴我。備註打 `?` 的是我不確定、希望你看一下的地方。
翻譯依 [詞表](zh-TW-glossary.md) 與其中的「排版與語氣」。

寫法說明:
- `{name}`、`{title}`、`{N}` 這類大括號是程式會代入的變數,請原樣保留。
- `\n` 表示換行。
- 「位置」是原始碼的檔案與行號,方便你對照畫面。

## 底部分頁列

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Home | 首頁 | tabs/services/tab.dart:29 | |
| Characters | 角色 | tabs/services/tab.dart:30 | |
| Bank | 銀行 | tabs/services/tab.dart:31 | |
| Trading | 交易所 | tabs/services/tab.dart:32 | 原文是 Trading,詞表的 Trading Post 為「交易所」 |
| Progression | 進度 | tabs/services/tab.dart:33 | |
| Loading account information | 正在載入帳號資訊 | tabs/pages/tab.dart:112 | |

## 首頁

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Welcome {name} | 歡迎 {name} | home/pages/home.dart:36 | |
| Playtime | 遊玩時間 | home/widgets/playtime_info_box.dart:14 | |
| Mastery level | 專精等級 | mastery/widgets/info_box.dart | |
| Achievements | 成就 | achievement/widgets/info_box.dart | |
| Wallet | 錢包 | wallet/widgets/button.dart | |
| World bosses | 世界王 | world_boss/widgets/button.dart:17 | |
| Meta Events | 大型事件 | meta_event/widgets/button.dart:13 | |
| PvP | PvP | pvp/widgets/button.dart:13 | |
| Raids | 大型地下城 | raid/widgets/button.dart:17 | |
| Dungeons | 地下城 | dungeon/widgets/button.dart:17 | |

## 錯誤畫面(整個 App 共用)

英文原本是把名詞塞進句子裡(Something went wrong while loading **the account**),中文語序不同,
所以我把名詞單獨列出,每個畫面各自翻。這一批只有「帳號」。

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Something went wrong while loading {title} | 載入{title}時發生問題 | error/widgets/error.dart:23 | |
| the account | 帳號 | home/pages/home.dart:120、tabs/pages/tab.dart:71 | 其他畫面的名詞之後再翻 |
| Please check your internet connection | 請檢查網路連線 | error/widgets/error.dart:31 | |
| Click here to try again | 點此重試 | error/widgets/error.dart:39 | |

## 設定頁

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Guild Wars 2 Companion | Guild Wars 2 Companion | configuration/pages/configuration.dart:39 | App 名稱,保留英文 |
| By Daniël Scholte / Revolt.2860 | 作者:Daniël Scholte / Revolt.2860 | configuration.dart:45 | |
| Version {version} - Build {build} | 版本 {version} - 組建 {build} | configuration.dart:242 | 「組建」? 也可用「建置」 |
| Thanks to the Guild Wars 2 Wiki and GW2.Ninja for the event timers. | 感謝 Guild Wars 2 Wiki 與 GW2.Ninja 提供事件計時資料。 | configuration.dart:59 | |
| ©2010–2018 ArenaNet, LLC. All rights reserved. …(法律聲明) | (保留英文,不翻譯) | configuration.dart:66 | 商標與版權聲明,建議保留原文 |
| Theme | 主題 | configuration.dart:72 | |
| Scheduled notifications | 排程通知 | configuration.dart:84 | |
| Api and Wiki Language | API 與 Wiki 語言 | configuration.dart:96 | |
| Time notation | 時間格式 | configuration.dart:108 | |
| Caching | 快取 | configuration.dart:120 | |
| Frequently asked questions | 常見問題 | configuration.dart:132 | |
| Changelog | 更新日誌 | configuration/pages/configuration.dart:144 | settings menu item and the page title (changelog/pages/changelog.dart:14) |
| View the project on Github | 在 GitHub 上查看專案 | configuration.dart:156 | |
| Enjoying the app? | 喜歡這個 App 嗎? | configuration.dart:167 | |
| Review the app on the {platform}! | 到 {platform} 評價這個 App! | configuration.dart:172 | |
| Review the app | 評價 App | configuration.dart:194 | |
| App Store | App Store | configuration.dart:215 | 保留英文 |
| Play Store | Play Store | configuration.dart:215 | 保留英文 |

## 設定:主題頁

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Light | 淺色 | configuration/pages/theme.dart:23 | |
| Dark | 深色 | theme.dart:24 | |
| Use system theme | 使用系統主題 | theme.dart:25 | |

## 設定:時間格式頁

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| 24 hours | 24 小時制 | configuration/pages/time.dart:20 | |
| 12 hours | 12 小時制 | time.dart:21 | |

## 設定:語言頁

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| English | English | configuration/pages/language.dart | 語言名稱我建議一律用該語言自己的寫法(下面幾列),這樣不管介面用什麼語言都找得到 ? |
| Spanish | Español | language.dart | ? |
| German | Deutsch | language.dart | ? |
| French | Français | language.dart | ? |
| Chinese | 簡體中文 | language.dart | ? |
| Chinese (Traditional) | 繁體中文 | language.dart:29 | ? |
| Change language | 變更語言 | language.dart:69、86 | 對話框標題與按鈕 |
| Are you sure that you want to change the language?\nThis will also clear your cache and require you to restart the app. | 確定要變更語言嗎?\n這也會清除快取,並需要重新啟動 App。 | language.dart:69 | |
| Cancel | 取消 | language.dart | 全 App 共用 |

## 設定:快取頁

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Cached {header} | 已快取的{header} | configuration/pages/caching.dart:185 | {header} 見下面六列 |
| achievements | 成就 | caching.dart:61 | |
| items | 物品 | caching.dart:65 | |
| skins | 外觀 | caching.dart:69 | ? |
| minis | 迷你寵物 | caching.dart:73 | ? |
| skills | 技能 | caching.dart:77 | |
| traits | 特性 | caching.dart:81 | |
| Error | 錯誤 | caching.dart:186 | |
| Loading... | 載入中… | caching.dart:199 | |
| Clear cache | 清除快取 | caching.dart:84、118、134 | 按鈕與對話框標題 |
| Clearing cache... | 正在清除快取… | caching.dart:84 | |
| Are you sure that you want to clear the cache? | 確定要清除快取嗎? | caching.dart:120 | |
| Caching allows GW2 Companion to load quicker while saving bandwidth and reducing the possibility for connection failures.\nOnly mostly static data such as Achievements and Items are cached. Progression isn't cached.\nExperiencing issues with cached data, such as outdated information? Try clearing the cache. | 快取可以讓 GW2 Companion 載入得更快,同時節省流量,並降低連線失敗的機率。\n只有成就、物品這類大多不會變動的資料會被快取,進度不會被快取。\n快取的資料有問題,例如資訊過時嗎?請試著清除快取。 | caching.dart:93 | |

## 設定:常見問題頁

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Why are my achievement points or mastery level incorrect? | 為什麼成就點數或專精等級不正確? | configuration/pages/faq.dart:19 | |
| All data in the GW2 Companion app is retrieved from the official Guild Wars 2 Api.\nSome Achievements and Masteries are currently missing from the Api, causing the total points to be off from the in-game number.\nOnce ArenaNet updates the Api to include the missing Achievements and Masteries, these should automatically appear in the app. | GW2 Companion 的所有資料都來自官方的 Guild Wars 2 API。\n部分成就和專精目前沒有收錄在 API 中,導致總點數與遊戲內的數字不符。\n等 ArenaNet 更新 API 補上這些成就和專精之後,它們就會自動出現在 App 中。 | faq.dart:23 | |

## 設定:排程通知頁

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| No notifications scheduled | 尚未排定任何通知 | event/widgets/notification_list.dart:77 | |
| No notifications scheduled for this event | 這個事件尚未排定通知 | notification_list.dart:60 | |
| {N} minutes before | 提前 {N} 分鐘 | notification_list.dart:120 | |
| When spawning at | 出現時 | notification_list.dart:120 | ? 後面會接時間,要看畫面上下文才能確定語句通不通順 |
| Remove scheduled notification | 移除排程通知 | notification_list.dart:130 | |
| Are you sure that you want to remove this scheduled notification? | 確定要移除這個排程通知嗎? | notification_list.dart:132 | |
| Remove | 移除 | notification_list.dart:146 | dialog button |
| Tomorrow | 明天 | (之後的批次) | 詞表已有 |

## 這批我還沒處理的

- 帳號頁(輸入 API 金鑰、QR code、教學)屬於下一批。
- 日期與時間的格式(例如 `yyyy-MM-dd`、12/24 小時顯示)沿用 App 現有邏輯,不翻譯。
- 其他畫面用到的 `{title}`(其他名詞)之後各自處理。


## Added after the first review

| English | zh-TW | Location | Note |
|---|---|---|---|
| Version {version} (changelog headings) | 版本 {version} | changelog/pages/changelog.dart:29 | the change notes themselves stay in English |