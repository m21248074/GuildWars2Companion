# 介面文字對照表:第二批(帳號與 API 金鑰、成就、每日任務、精通)

直接改「繁體中文」欄位即可,改完告訴我。備註打 `?` 的是我不確定、希望你看一下的地方。
翻譯依 [詞表](zh-TW-glossary.md) 與其中的「排版與語氣」。

寫法說明:
- `{name}`、`{date}` 這類大括號是程式會代入的變數,請原樣保留。
- `\n` 表示換行。
- 「位置」是原始碼的檔案與行號(`features/` 底下)。

## 帳號:API 金鑰清單頁

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Api Keys | API 金鑰 | account/widgets/layout.dart:12 | |
| GW2 Companion | GW2 Companion | account/widgets/layout.dart:63 | App 名稱,保留英文 |
| No Api Keys found | 找不到任何 API 金鑰 | account/pages/token.dart:200 | |
| Add one using the button in the bottom right corner. | 請使用右下角的按鈕新增。 | token.dart:207 | |
| Added: {date} | 新增日期：{date} | account/widgets/token_button.dart:28 | |
| Delete Api Key | 刪除 API 金鑰 | account/widgets/dismissible_button.dart:72 | 滑動刪除時顯示 |

## 帳號:新增金鑰(右下角選單與對話框)

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Enter Api Key by Qr Code | 以 QR Code 輸入 API 金鑰 | account/pages/token.dart:94 | |
| Enter Api Key by text | 以文字輸入 API 金鑰 | token.dart:106 | |
| How do I get an Api Key? | 如何取得 API 金鑰？ | token.dart:116、how_to.dart:11 | 選單項與說明頁標題 |
| Settings | 設定 | token.dart:128 | |
| Add your Guild Wars 2 Api Key | 新增 Guild Wars 2 的 API 金鑰 | token.dart:150 | |
| Api Key | API 金鑰 | token.dart:154 | 輸入框的標籤 |
| Add | 新增 | token.dart:171 | |
| Cancel | 取消 | token.dart:160 | 詞表已有 |

## 帳號:QR Code 掃描頁

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Scan your Qr Code | 掃描 QR Code | account/pages/qr_code.dart:24 | |
| Taking too long? The app might not have permission to use the camera. | 等太久了嗎？ App 可能沒有使用相機的權限。 | qr_code.dart:56 | |
| Checking Api Key... | 正在檢查 API 金鑰… | qr_code.dart:97 | |

## 帳號:如何取得 API 金鑰

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| To use the Guild Wars 2 Companion app, you need to generate a personal Api Key on the Arenanet website: | 使用 Guild Wars 2 Companion 需要先在 ArenaNet 網站產生個人的 API 金鑰： | account/pages/how_to.dart:18 | |
| account.arena.net/applications | account.arena.net/applications | how_to.dart:24 | 網址,保留 |
| Instructions | 步驟 | how_to.dart:29 | ? 也可用「操作說明」 |
| After navigating to the above mentioned website, click on the 'New Key' button to generate a new key. | 前往上述網站後，點選「New Key」按鈕以產生新的金鑰。 | how_to.dart:34 | 網站上的按鈕是英文,所以保留 New Key |
| On the next page, enter a name for the key and select which elements you want to app to have access to. | 在下一頁輸入金鑰的名稱，並選擇要讓 App 存取哪些項目。 | how_to.dart:40 | 原文有錯字(want to app),我照原意翻 |
| We recommend to select all the options to get the optimal experience. | 建議勾選所有選項，以獲得最完整的體驗。 | how_to.dart:45 | |
| Keep in mind, the app can only retrieve the selected information. The app cannot make any changes to your account, and the retrieved information will stay on your phone and won't be shared. | 請注意，App 只能讀取已選取的資訊，無法對帳號做任何變更，取得的資訊只會留在手機上，不會被分享。 | how_to.dart:50 | |
| After creating a new api key, copy and paste the key in the app, or scan the qr code. | 建立新的 API 金鑰後，將金鑰複製貼上到 App，或掃描 QR Code。 | how_to.dart:56 | |

## 帳號:訊息(顯示在輸入金鑰畫面上的提示)

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Api error: {message} | API 錯誤：{message} | account/bloc/account_bloc.dart:75、96、116 | {message} 是 ArenaNet 回傳的英文訊息,無法翻譯 |
| Network error | 網路錯誤 | account_bloc.dart:78、119 | |
| Api Key added | 已新增 API 金鑰 | account_bloc.dart:112 | |
| Api Key removed | 已移除 API 金鑰 | account_bloc.dart:126 | |

## 錯誤畫面的名詞(接在「載入{title}時發生問題」裡)

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| the achievements | 成就 | achievement 多個頁面 | 例:載入成就時發生問題 |
| the achievement | 這個成就 | achievement/pages/achievement.dart:42、59、79 | |
| the progression | 進度 | achievement/pages/progression.dart:30 | |
| the masteries | 專精 | mastery/pages/masteries.dart:28 等 | |

## 進度頁與成就清單

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Progression | 進度 | achievement/pages/progression.dart:22 | |
| Achievements | 成就 | progression.dart:73、achievement_categories.dart:21 | |
| Favorite achievements | 收藏成就 | progression.dart:85、favorite_achievements.dart:17 | |
| Dailies | 每日任務 | progression.dart:97、daily_categories.dart:20 | |
| Masteries | 專精 | progression.dart:109、mastery/pages/masteries.dart:20 | |

## 每日任務

分類的英文代號(PvE、PvP、WvW、Fractals)在程式裡也當作辨識用,我只翻顯示的文字,不動辨識用的值。

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| {category} Dailies | {category} 每日任務 | achievement/pages/dailies.dart:25 | {category} 見下面四列 |
| PvE | PvE | daily_categories.dart:50 | 保留英文 |
| PvP | PvP | daily_categories.dart:58 | 保留英文 |
| WvW | WvW | daily_categories.dart:66 | 保留英文 |
| Fractals | 迷霧碎層 | daily_categories.dart:74 | 詞表 |
| Today | 今天 | dailies.dart:39 | |
| Tomorrow | 明天 | dailies.dart:47 | 詞表已有 |
| Level 80 | 80 級 | dailies.dart:164 | |
| Level {min} - {max} | {min} - {max} 級 | dailies.dart:164 | |

## 成就內頁

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Description | 描述 | achievement/pages/achievement.dart:285、mastery/pages/mastery_level.dart:86 | |
| Locked description | 未解鎖的描述 | achievement.dart:287 | ? |
| Requirement | 條件 | achievement.dart:289 | ? 也可用「需求」 |
| Rewards | 獎勵 | achievement/widgets/rewards_card.dart:22 | |
| {region} Mastery point | {region}專精點數 | rewards_card.dart:74 | {region} 見最後一節 |
| Prerequisites | 前置成就 | achievement/widgets/prerequisites_card.dart:24 | |
| Objectives | 目標 | achievement/widgets/bits_card.dart:26 | |
| Collection | 收藏 | bits_card.dart:77 | |
| Unknown item | 未知物品 | bits_card.dart:130 | 詞表已有 |

## 精通頁

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Completed | 已完成 | mastery/pages/mastery_level.dart:55 | |
| Instructions | 操作說明 | mastery_level.dart:88、90 | ? |
| Region | 地區 | mastery_level.dart:94 | |
| Mastery points | 專精點數 | mastery_level.dart:98 | |
| Experience | 經驗值 | mastery_level.dart:102 | |

## 資料片與地區名稱(顯示在「{region}專精點數」)

來源是程式裡的 `GuildWarsUtil.masteryName`。為了和遊戲資料畫面一致,我對照了 API 簡體資料
裡這些資料片的名稱。**Heart of Thorns 在資料裡叫「決戰邁古瑪」**(簡體:决战迈古玛),
台灣玩家常聽到的是「荊棘之心」,請你決定要用哪個。

| 英文 | 繁體中文 | 備註 |
|---|---|---|
| Tyria | 泰瑞亞 | |
| Heart of Thorns | 決戰邁古瑪 | ? 資料用詞;也可用「荊棘之心」 |
| Path of Fire | 火焰之路 | 與資料一致 |
| Icebrood Saga | 冰霜傳說 | 冰巢傳說 |
| End of Dragons | 巨龍絕境 | 與資料一致 |

## 這批沒有翻譯的(程式用來辨識的值,不是顯示文字)

`Coins`、`Item`、`Skin`、`Minipet`、`Title`、`Mastery`、`Text`(API 回傳的獎勵與目標類型),
以及 `Desert`、`Maguuma`、`Tyria`、`Tundra`、`Icebrood`(精通地區代號)。翻了會讓功能壞掉。

## 之後要處理的(不是翻譯問題)

API 的精通地區現在還有 `Jade`、`Sky`、`Wild`、`Magic` 四個(分別是巨龍絕境、天界之謎、珍瑟荒野、永恆願景),
程式的地區對照表不認得它們,精通頁會直接顯示原始代號,圖示和顏色也是預設值。
這屬於「補新內容」,等翻譯告一段落再一起做。
