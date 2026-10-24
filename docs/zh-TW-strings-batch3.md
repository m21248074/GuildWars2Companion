# 介面文字對照表:第三批(角色、銀行、交易所、物品)

直接改「繁體中文」欄位即可,改完告訴我。備註打 `?` 的是我不確定、希望你看一下的地方。
翻譯依 [詞表](zh-TW-glossary.md) 與其中的「排版與語氣」。
「位置」是原始碼的檔案與行號(`features/` 底下)。大括號 `{x}` 是程式會代入的變數,請原樣保留。

## 角色

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Characters | 角色 | character/pages/characters.dart:21 | |
| Level {level} {race} {profession} | {level} 級{race}{profession} | characters.dart:85 | 例:80 級人類守護者(種族、職業名稱來自遊戲資料) |
| {n} hours of playtime | 遊玩 {n} 小時 | characters.dart:86 | |
| Level | 等級 | character/pages/character.dart:82 | |
| Playtime | 遊玩時間 | character.dart:87 | 詞表已有 |
| h(遊玩時間的單位) | 小時 | character.dart:88 | 改小時看看 |
| Deaths | 死亡次數 | character.dart:92 | |
| Equipment | 裝備 | character.dart:192、equipment_selection.dart:24 | 詞表已有 |
| Builds | 配置 | character.dart:219、build_selection.dart:24 | ? 遊戲內多叫「配置」或「建置」 |
| Inventory | 物品欄 | character.dart:238、inventory.dart:26 | 詞表已有 |
| Nameless build | 未命名的配置 | build_selection.dart:75、bank/pages/build_selection.dart:46 | |
| Nameless equipment build | 未命名的裝備配置 | equipment.dart:26、equipment_selection.dart:76 | |
| Active | 使用中 | build_selection.dart:79、equipment_selection.dart:80 | |
| Crafting disciplines | 製作專長 | character/widgets/crafting_card.dart:24 | 製作專業 |

## 銀行

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Bank | 銀行 | bank/pages/bank.dart:22、55 | 詞表已有 |
| Materials | 材料 | bank.dart:70、material.dart:19 | 詞表已有 |
| Shared inventory | 共用物品欄 | bank.dart:85、generic_bank.dart:28 | |
| Build storage | 配置儲存 | bank.dart:100、build_selection.dart:20 | 詞表已有 |
| {n} / {m} slots | {n} / {m} 格 | generic_bank.dart:90 | |

## 交易所

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Trading Post | 交易所 | trading_post/pages/trading_post.dart:31 | 詞表已有 |
| Buying | 購買中 | trading_post.dart:45 | 四個分頁 |
| Selling | 出售中 | trading_post.dart:55 | |
| Bought | 已購買 | trading_post.dart:65 | |
| Sold | 已售出 | trading_post.dart:75 | |
| No items found | 找不到任何物品 | trading_post.dart:172、trading_post_item.dart:143、delivery.dart:149 | |
| No orders found | 找不到任何訂單 | trading_post_item.dart:136 | |
| Buyers | 買家 | trading_post_item.dart:85 | |
| Sellers | 賣家 | trading_post_item.dart:93 | |
| {qty} Ordered | {qty} 個訂購中 | trading_post_item.dart:135、241 |  |
| {qty} Available | {qty} 個可購買 | trading_post_item.dart:142、241 |  |
| Items: | 物品： | trading_post/widgets/delivery.dart:101 | 領取箱 |
| Funds: | 款項： | delivery.dart:118 | |

## 物品內頁

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Transmuted | 已變換 | item/pages/item.dart:45 | 遊戲內的「變換」(Transmutation) |
| Description | 描述 | item.dart:47 | |
| Effect description | 效果描述 | item.dart:50 | |
| Upgrades | 升級 | item.dart:52 | ? 指鑲嵌的符文、符印等 |
| Infusions | 灌注 | item.dart:54 | |
| Stats | 屬性 | item/widgets/details_card.dart:20、29 | |
| Rarity | 稀有度 | details_card.dart:22 | |
| Value | 價值 | item/widgets/value_card.dart:21 | |
| Vendor | 商人賣價 | value_card.dart:25 |  |
| Trading Post Buy | 交易所買價 | value_card.dart:29 | |
| Trading Post Sell | 交易所賣價 | value_card.dart:34 | |
| Type | 類型 | item/services/item.dart:88 等 | |
| Weight Class | 護甲類別 | item.dart:89 | 輕、中、重 |
| Defense | 防禦 | item.dart | |
| Weapon Strength | 武器強度 | item.dart | |
| Size | 大小 | item.dart | 背包的格數 |
| Effect Type | 效果類型 | item.dart | |
| Duration | 持續時間 | item.dart | |
| Charges | 使用次數 | item.dart | ? |

## 稀有度(目前直接顯示英文代號)

| 英文 | 繁體中文 | 備註 |
|---|---|---|
| Junk | 垃圾 | 與遊戲資料用詞一致 |
| Basic | 基本 | |
| Fine | 優質 | |
| Masterwork | 精製 | |
| Rare | 稀有 | |
| Exotic | 異域 | |
| Ascended | 昇華 | |
| Legendary | 傳奇 | |

## 物品旗標(物品內頁的標籤)

| 英文 | 繁體中文 | 備註 |
|---|---|---|
| Account bound on use | 使用後帳號綁定 | |
| Account bound | 帳號綁定 | |
| Attuned | 已調和 | |
| Bulk consumable | 可批次使用 | |
| Warning on delete | 刪除時警告 | |
| Suffix hidden | 隱藏後綴 | |
| Infused | 已灌注 | |
| Monster only item | 怪物專用物品 | |
| Cannot be used in the Mystic Forge | 無法用於神秘熔爐 | |
| Cannot be salvaged | 無法拆解 | |
| Cannot be sold | 無法出售 | |
| Not upgradeable | 無法升級 | |
| Cannot be used underwater | 無法在水中使用 | |
| Soul bound on acquire | 獲得後靈魂綁定 | |
| Soul bound on use | 使用後靈魂綁定 | |

## 物品類型(`itemTypeToName`,沒列到的目前直接顯示 API 代號)

| 英文 | 繁體中文 | 備註 |
|---|---|---|
| Helm Aquatic | 水下頭盔 | |
| Appearance Change | 外觀變更 | |
| Npc Contract | NPC 契約 | |
| Random Mount Unlock | 隨機坐騎解鎖 | |
| Random Unlock | 隨機解鎖 | |
| Upgrade Removal | 升級拆除 | |
| Teleport To Friend | 傳送至好友 | |
| Crafting Material | 製作材料 | |
| Upgrade Component | 升級組件 | |

物品內頁「類型」只會顯示頂層類型(程式裡 `item.type`),護甲類別只有四種,所以只補這些:

| 英文 | 繁體中文 | 備註 |
|---|---|---|
| Armor | 護甲 | |
| Weapon | 武器 | |
| Back | 背部 | |
| Bag | 背包 | |
| Consumable | 消耗品 | |
| Container | 容器 | |
| Gathering | 採集工具 | |
| Gizmo | 小玩意 | |
| Key | 鑰匙 | |
| MiniPet | 迷你寵物 | |
| Tool | 工具 | |
| Trinket | 飾品 | |
| Trophy | 戰利品 | |
| Heavy | 重型 | 護甲類別 |
| Medium | 中型 | |
| Light | 輕型 | |
| Clothing | 衣物 | |

## 錯誤畫面的名詞(接在「載入{title}時發生問題」裡)

| 英文 | 繁體中文 | 位置 |
|---|---|---|
| the characters | 角色 | characters.dart:29 |
| the character | 這個角色 | character 多個頁面 |
| the character builds | 這個角色的配置 | build_selection.dart:44 等 |
| the character items | 這個角色的物品 | inventory.dart:46 |
| the bank | 銀行 | bank.dart:30 |
| the shared inventory | 共用物品欄 | generic_bank.dart:36 |
| the build storage | 配置儲存 | bank/pages/build_selection.dart:28 |
| the material storage | 材料 | material.dart:27 |
| the trading post | 交易所 | trading_post.dart:92 |
| the listings | 掛單 | trading_post_item.dart:108、118 |

## 這批沒有翻譯的

裝備欄位代號(`Helm`、`WeaponA1` 等,只用來找圖示)、權限代號(`inventories`、`builds`)、
API 的物品類型代號當作辨識用的值(只翻顯示文字)。
