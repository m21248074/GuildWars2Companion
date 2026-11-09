# 接手更新的狀態(`revival` 分支)

這份文件整理從原作者封存的 GW2 Companion 接手後做了什麼、資料從哪裡來、怎麼建置,以及還沒做的事。
原專案:DanielScholte/GuildWars2Companion(GPL-3.0)。

## 已完成

**可以建置與執行**
- 用 Flutter 2.10.5 建置(原專案的舊版本已經建不起來),不需要私有的簽署金鑰。
- 修了啟動卡死(資料庫關閉要 `await`)、首頁精通與成就顯示 `?`、載入太慢(平行載入與快取)。

**繁體中文**
- 新增語言「繁體中文」。遊戲資料只有簡體中文,請求 `zh` 後在回應端轉成繁體(`lib/core/utils/chinese_converter.dart`,OpenCC 詞組與字表放在 `assets/data/opencc/`,Apache-2.0)。
- 介面文字集中在 `lib/core/localization/strings.dart`(`AppStrings`),英文是原文。
- App 內附資料檔(世界王、大型地下城、地下城、大型事件、進攻任務)裡的英文名稱,載入時查表翻譯(`lib/core/localization/game_names.dart`,由 `docs/zh-TW-strings-batch4.md` 的表格產生)。
- 對照表與詞表:`docs/zh-TW-glossary.md`、`docs/zh-TW-strings-batch1.md` 到 `batch5.md`。表格的最後一欄標示每個詞的來源與是否在遊戲內驗證過。

**新內容**
- 精通:認得新的地區(翡翠、天界、荒野、魔法),加上依資料片分組的標題列與正確的排序。
- 大型地下城:補上巴里爾山(`mount_balrior`)。
- 巫師寶庫(取代已失效的每日任務):每日、每週、特別目標與商店。
- 進攻任務:14 個任務的「本週」「通關過」「挑戰模式」「傳奇模式」。
- 大型事件計時:補上天界之謎、珍瑟荒野、永恆願景(10 個事件,資料來自 Wiki `Widget:Event_timer/data.json` v5.4;既有地圖已核對一致)。
- 每日迷霧碎層:`achievements/daily` 仍是 503,改用 Wiki 的 15 天輪替表(`assets/data/daily_fractals.json`,組別 = 年內日序 mod 15,UTC 換日)在本地推算今天與明天;API 恢復時會優先用 API。

## 資料來源與名稱的出處

| 內容 | 來源 |
|---|---|
| 地圖、傳送點名稱 | 遊戲 API 的簡體名稱轉繁體 |
| 世界王、副本首領、事件階段 | 遊戲 API(成就名稱)、台灣社群的 Blish HUD 事件模組翻譯(m21248074 的 fork)、KillProof.me 外掛的繁中翻譯 |
| 地下城路線名稱 | 灰機 wiki 地下城頁(簡體轉繁體) |
| 進攻任務名稱 | 遊戲 API 每週團本遭遇成就(9125)的項目名稱 |
| 資料片名稱 | 遊戲 API 的成就分類 |
| 技能、特性、組合場等用語 | 遊戲內驗證,`batch5.md` 標明 |

遊戲的圖片與名稱屬於 ArenaNet,設定頁已有原作者的法律聲明。巴里爾山的兩張圖是從概念圖裁切而來。

## 建置

- Flutter 2.10.5(`flutter build apk --profile --no-pub`),專案仍是 null safety 之前的 Dart。
- 必須用 JDK 8,並設 `GRADLE_USER_HOME` 指向指定 JDK 8 的 Gradle 設定,否則 Flutter 2.10 會改用較新的 JDK,Gradle 6.7 直接失敗。
- `pubspec.yaml` 有暫時的 `dependency_overrides: path_provider: 1.6.28`(JDK 8 編不了新版 path_provider_android),換新 JDK 後要拿掉。
- 測試版的套件名稱有 `.dev` 後綴,不會蓋掉 Play 商店的版本。
- 建置失敗時舊的 APK 還在,安裝前要確認 APK 的修改時間。

## 原本等 GW2 Wiki 恢復的項目(已處理)

- **進攻任務的冰巢傳說**:Wiki 確認冰巢傳說沒有挑戰模式;遊戲裡的「傳奇首領擊殺」成就只對應其中三個任務,使用者決定不顯示「通關過」,所以維持只顯示「本週」。

## 其他待辦

- **資料片名稱**:已統一成遊戲內的「烈焰征途」「泰瑞亞中心」。
- **載入逾時**:冷啟動後第一次載入角色或世界王偶爾顯示錯誤頁,點重試約 20 秒後成功,原因還沒查。
- **進攻任務的厄拉傳奇挑戰**:在巴里爾山團本,不在進攻任務頁。
- **技能類型**:持握物、工具腰帶等譯名沒驗證過。
- **巫師寶庫的商店**:一般類商品的「已購買」API 回傳全是 0(用真實帳號確認過),所以只顯示購買上限。
- **其他**:null safety 遷移、拿掉 `path_provider` 釘版、升 `targetSdk`;離線啟動、切換帳號、金鑰被撤銷的情況尚未測。
