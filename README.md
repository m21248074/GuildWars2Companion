<p align="center">
    <img src="misc/readme/logo-v2.png" width="200">
</p>
<h1 align="center" style="margin: 0px;">GW2 Companion</h1>
<h3 align="center" style="margin: 0px;">非官方、開源的激戰2 App(繁體中文版)</h3>
<p align="center" style="margin: 8px;">
    <a href="https://github.com/m21248074/GuildWars2Companion/releases/latest" target="_blank">
        <img src="https://img.shields.io/github/v/release/m21248074/GuildWars2Companion?style=for-the-badge&label=%E4%B8%8B%E8%BC%89%20APK">
    </a>
    <a href="https://www.gnu.org/licenses/gpl-3.0.en.html" target="_blank">
        <img src="https://img.shields.io/github/license/m21248074/GuildWars2Companion.svg?style=for-the-badge">
    </a>
    <a href="https://github.com/m21248074/GuildWars2Companion/issues" target="_blank">
        <img alt="GitHub issues" src="https://img.shields.io/github/issues/m21248074/GuildWars2Companion?style=for-the-badge">
    </a>
</p>

## 簡介
GW2 Companion 幫你追蹤帳號進度與角色,並提供在泰瑞亞冒險時用得到的資訊。

這個版本接手自 [DanielScholte/GuildWars2Companion](https://github.com/DanielScholte/GuildWars2Companion)。原專案已封存,也已從 Google Play 與 App Store 下架;這裡讓它重新可以建置、可以使用,補上新資料片的內容,並加入繁體中文。感謝原作者 Daniel Scholte 的原始設計與程式碼。

## 下載與安裝
到 [Releases](https://github.com/m21248074/GuildWars2Companion/releases) 下載最新的 APK,在 Android 手機上安裝即可(需要 Android 5.0 以上)。

- 目前沒有上架任何商店,也沒有 iOS 版本。
- APK 用 debug 金鑰簽署。如果手機裝過原作者的 Play 商店版(套件名稱相同),要先解除安裝。之後若更換簽署金鑰,新版也無法直接覆蓋安裝,需要先解除安裝。
- 全新安裝的預設語言是英文,請在設定裡切換成「繁體中文」。
- 使用時需要到 [account.arena.net](https://account.arena.net/applications) 建立 API 金鑰,並在 App 內加入。App 會依金鑰的權限調整可用的功能。

## 功能
- 可加入多把金鑰,方便管理多個帳號。
- 介面依 API 金鑰的權限動態調整。
- 帳號總覽。
- 世界王與大型事件計時,含天界之謎、珍瑟荒野、永恆願景的新事件。
- 世界王、大型地下城、地下城、進攻任務自每日或每週重置後的進度。
- 巫師寶庫:每日、每週、特別目標與商店。
- PvP 賽季排名與對戰紀錄。
- 角色的物品欄、build 範本與裝備。
- 詳細的物品資訊,包含交易所價格、灌注與徽記。
- 銀行,含共用物品欄、完整的材料倉庫與 build 倉庫。
- 交易所歷史與目前的掛單,以及完整的領取箱(金幣與物品)。
- 全部成就與進度。
- 今天與明天的每日迷霧碎層。
- 專精與進度。

### 與原專案不同的地方
- 遊戲資料的 API 只有簡體中文,所以 App 在收到資料後轉成繁體(OpenCC 的台灣用語規則,Apache-2.0)。用詞是遊戲資料的譯名,和遊戲內的繁體中文版有些不同。
- 每日迷霧碎層:遊戲的每日 API 已停用,改用 [GW2 Wiki](https://wiki.guildwars2.com/wiki/Daily_Fractals) 的 15 天輪替表在本機推算。
- 每日任務(PvE、PvP、WvW)已被遊戲的巫師寶庫取代,所以只保留每日迷霧碎層。

## 截圖
截圖是原專案的舊版介面。

<p align="center">
  <img src="misc/readme/screenshots/home.png" hspace="4">
  <img src="misc/readme/screenshots/inventory.png" hspace="4">
  <img src="misc/readme/screenshots/achievements.png" hspace="4">
</p>

## 開發
需要先安裝:
- [Git](https://git-scm.com/)
- [Flutter](https://flutter.dev/) 2.10.5(專案還是 null safety 之前的 Dart,新版 Flutter 建置不了)
- JDK 8(用較新的 JDK 時,Gradle 6.7 會失敗)

先複製專案:

```
$ git clone https://github.com/m21248074/GuildWars2Companion.git
```

下載相依套件:

```
$ flutter pub get
```

執行:

```
$ flutter run
```

建置、簽署、發版的步驟與踩過的坑,以及還沒做的事,請看 [docs/STATUS.md](docs/STATUS.md)。翻譯用的詞表與對照表在 [docs/](docs/) 底下。

## 參與
想參與的話,請先閱讀[貢獻指南](CONTRIBUTING.md),再開 [issue](https://github.com/m21248074/GuildWars2Companion/issues) 或 [pull request](https://github.com/m21248074/GuildWars2Companion/pulls)。

## 授權
[GNU GPL v3](https://www.gnu.org/licenses/gpl-3.0.en.html)

遊戲的圖片與名稱屬於 ArenaNet。

©2010–2018 ArenaNet, LLC. All rights reserved. Guild Wars, Guild Wars 2, Heart of Thorns, Guild Wars 2: Path of Fire, ArenaNet, NCSOFT, the Interlocking NC Logo, and all associated logos and designs are trademarks or registered trademarks of NCSOFT Corporation. All other trademarks are the property of their respective owners.
