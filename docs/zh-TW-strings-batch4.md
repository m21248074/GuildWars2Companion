# 介面文字對照表:第四批(事件、世界王、PvP、大型地下城、地下城、錢包、更新日誌彈窗)

直接改「繁體中文」欄位即可,改完告訴我。備註打 `?` 的是我不確定、希望你看一下的地方。
翻譯依 [詞表](zh-TW-glossary.md) 與其中的「排版與語氣」。
「位置」是原始碼的檔案與行號(`features/` 底下)。大括號 `{x}` 是程式會代入的變數,請原樣保留。

## 事件與世界王

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Meta Events | 大型事件 | meta_event/pages/meta_events.dart:40 | 詞表已有 |
| World Bosses | 世界王 | world_boss/pages/world_bosses.dart:41 | 詞表已有(首頁寫 World bosses) |
| the meta events | 大型事件 | meta_events.dart:48 | 錯誤畫面名詞 |
| the meta event | 這個大型事件 | meta_event/pages/meta_event.dart:43 | |
| the world bosses | 世界王 | world_bosses.dart:53 | |
| Active | 進行中 | meta_event.dart:120、meta_events.dart:183、world_bosses.dart:161 | |
| Spawn Times | 出現時間 | event/widgets/times_card.dart:27 | |
| Stats | 屬性 | world_boss/widgets/stats_card.dart:17 | ? 這裡是世界王的資料,也可用「基本資料」 |
| Level | 等級 | stats_card.dart:21 | |
| Map | 地圖 | stats_card.dart:25 | |
| Waypoint | 傳送點 | stats_card.dart:29 | |

事件頁上的資料片分區會用第二批的「泰瑞亞 / 決戰邁古瑪 / 火焰之路 / 冰巢傳說 / 巨龍絕境」。

## 排程通知(新增通知的三個步驟)

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Choose a notification type | 選擇通知類型 | event/pages/schedule_notification_type.dart:31 | |
| Daily notification | 每日通知 | schedule_notification_type.dart:43 | |
| One-time notification | 單次通知 | schedule_notification_type.dart:43 | |
| Receive a daily notification at the selected time | 每天在選定的時間通知 | schedule_notification_type.dart:47 | |
| Receive a single notification at the selected date and time | 在選定的日期與時間通知一次 | schedule_notification_type.dart:47 | |
| You can plan multiple notifications for a single event or world boss. | 同一個事件或世界王可以排定多個通知。 | schedule_notification_type.dart:55 | |
| If you're experiencing issues with not receiving the one-time notifications, please disable battery management for this app. | 如果收不到單次通知，請關閉這個 App 的電池管理。 | schedule_notification_type.dart:58 | |
| If you're experiencing significantly delayed daily notifications, please use the one-time option. | 如果每日通知延遲嚴重，請改用單次通知。 | schedule_notification_type.dart:62 | |
| Next | 下一步 | schedule_notification_type.dart:77、schedule_notification_time.dart:115 | |
| Choose a date and spawn time | 選擇日期與出現時間 | schedule_notification_time.dart:55 | 單次通知 |
| Choose a spawn time | 選擇出現時間 | schedule_notification_time.dart:55 | 每日通知 |
| Please select a date or time. | 請選擇日期或時間。 | schedule_notification_time.dart:101 | |
| Date: | 日期： | schedule_notification_time.dart:161 | |
| Time: | 時間： | schedule_notification_time.dart:222 | |
| Choose a notification time | 選擇通知時間 | schedule_notification_offset.dart:53 | |
| At spawn time | 出現時 | schedule_notification_offset.dart:68 | |
| {n} minutes before spawning | 出現前 {n} 分鐘 | schedule_notification_offset.dart:68 | |
| Add notification | 新增通知 | schedule_notification_offset.dart:92 | |

## PvP

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| PvP | PvP | pvp/pages/pvp.dart:67 | 保留英文 |
| PvP Statistics | PvP 統計 | pvp.dart:31 | 錯誤畫面名詞 |
| Rank {n} | {n} 級 | pvp.dart:110 | ? 也可用「等級 {n}」(遊戲內是 PvP 等級) |
| Unranked winrate(中間換行) | 非排名賽 勝率(中間換行) | pvp.dart:137 | 換行保留 |
| Ranked winrate(中間換行) | 排名賽 勝率(中間換行) | pvp.dart:143 | |
| Ranked seasons | 排名賽季 | pvp.dart:164、seasons.dart:25 | 詞表已有 |
| Game history | 對戰紀錄 | pvp.dart:176、games.dart:21 | |
| game history | 對戰紀錄 | games.dart:28 | 錯誤畫面名詞 |
| PvP Seasons | PvP 賽季 | seasons.dart:32 | 錯誤畫面名詞 |
| No pvp games found | 找不到任何 PvP 對戰 | games.dart:38 | |
| No ranked seasons with participation found | 找不到有參與的排名賽季 | seasons.dart:42 | |
| Rewards | 獎勵 | season.dart:63 | |
| Victory | 勝利 | games.dart:129 | 對戰結果(目前直接顯示 API 代號) |
| Defeat | 敗北 | games.dart:131 | ? 也可用「失敗」 |

## 大型地下城、地下城、錢包

| 英文 | 繁體中文 | 位置 | 備註 |
|---|---|---|---|
| Raids | 大型地下城 | raid/pages/raids.dart:23 | 詞表已有 |
| the raids | 大型地下城 | raids.dart:31 | |
| the raid | 這個大型地下城 | raid.dart:68 | |
| Weekly Progress | 本週進度 | raid.dart:123 | |
| Bosses | 首領 | raid.dart:123 | |
| Dungeons | 地下城 | dungeon/pages/dungeons.dart:22 | 詞表已有 |
| the dungeons | 地下城 | dungeons.dart:30 | |
| the dungeon | 這個地下城 | dungeon.dart:32 | |
| Daily Progress | 今日進度 | dungeon/widgets/progress_card.dart:18 | ? 地下城的「每日」是每天重置的首次獎勵 |
| Paths | 路線 | progress_card.dart:18 | |
| Wallet | 錢包 | wallet/pages/wallet.dart:20 | 詞表已有 |
| the wallet | 錢包 | wallet.dart:28 | |

## 更新日誌彈窗(升級後第一次開啟時)

更新日誌的每一條內容(changes)維持英文,這是第一批的決定。

| 英文 | 繁體中文 | 位置 |
|---|---|---|
| Welcome back! | 歡迎回來！ | changelog/widgets/changelog.dart:92 |
| Since your last visit, the following new features have been added to the app: | 自上次使用以來，App 新增了以下功能： | changelog.dart:103 |
| Continue | 繼續 | changelog.dart:139 |

## 名稱:地圖、傳送點、副本

下面三節的名稱不是介面文字,而是 App 內附的資料檔(`assets/data/*.json`)裡寫死的英文。
來源欄:**資料** = 遊戲 API 的地圖、傳送點名稱(簡體轉繁體,和遊戲資料畫面一致);
**社群** = 台灣玩家社群的 Blish HUD 事件模組中文翻譯(m21248074 的 fork;大型地下城首領另參考同一人 fork 的 KillProof.me 外掛中文),其中玩家綽號(例如「戰場惡犬」「焦油」)我沒採用;**成就** = 取自遊戲 API 的成就名稱;**自擬** = 我自己譯的,多半是人名、音譯,不確定和遊戲一致,**請特別審**。
不想翻的(例如人名首領)直接把繁體欄改回英文就好。

| 英文 | 繁體中文 | 來源 |
|---|---|---|
| Ascalonian Catacombs | 阿斯卡隆墓穴 | 資料 |
| Auric Basin | 赤金盆地 | 資料 |
| Bastion of the Penitent | 懺悔者堡壘 | 資料 |
| Bjora Marches | 波卓拉邊境 | 資料 |
| Blazeridge Steppes | 裂脊草原 | 資料 |
| Bloodtide Coast | 血潮海岸 | 資料 |
| Caledon Forest | 卡勒頓之森 | 資料 |
| Camp Karka Waypoint | 喀殼營地傳送點 | 資料 |
| Caudecus's Manor | 考迪克斯莊園 | 資料 |
| Citadel of Flame | 烈焰壁壘 | 資料 |
| Cloven Hoof Waypoint | 偶蹄傳送點 | 資料 |
| Crucible of Eternity | 永恆熔爐 | 資料 |
| Crystal Oasis | 水晶綠洲 | 資料 |
| Cursed Shore | 詛咒海岸 | 資料 |
| Desert Highlands | 沙漠高地 | 資料 |
| Domain of Istan | 伊斯坦領域 | 資料 |
| Domain of Vabbi | 瓦比領域 | 資料 |
| Doomlore Shrine | 厄運傳說聖壇 | 資料 |
| Dragon's End | 巨龍盡頭 | 資料 |
| Dragon's Stand | 巨龍陣地 | 資料 |
| Dragonstorm | 巨龍風暴 | 資料 |
| Dragonstorm (Public) | 巨龍風暴（公開） | 資料 |
| Dredgehaunt Cliffs | 掘洞懸崖 | 資料 |
| Dry Top | 乾涸高地 | 資料 |
| Earthshake Waypoint | 地震傳送點 | 資料 |
| Elon Riverlands | 伊倫河灣 | 資料 |
| Fireheart Rise | 炎心高地 | 資料 |
| Firthside Vigil Waypoint | 峽口駐守站傳送點 | 資料 |
| Frostgorge Sound | 霜谷之音 | 資料 |
| Gendarran Fields | 甘達拉戰區 | 資料 |
| Grothmar Valley | 戈瑟瑪山谷 | 資料 |
| Hall of Chains | 鎖鏈殿堂 | 資料 |
| Harathi Hinterlands | 哈拉希腹地 | 資料 |
| Honor of the Waves | 海浪之譽 | 資料 |
| Iron Marches | 鋼鐵平原 | 資料 |
| Jahai Bluffs | 亞哈懸崖 | 資料 |
| Krennak's Homestead Waypoint | 科倫納克的山莊傳送點 | 資料 |
| Lake Doric | 多里克湖 | 資料 |
| Laughing Gull Waypoint | 笑鷗傳送點 | 資料 |
| Lowland Burns Waypoint | 灼熱盆地傳送點 | 資料 |
| Maelstrom's Waypoint | 漩渦傳送點 | 資料 |
| Metrica Province | 度量領域 | 資料 |
| Mount Maelstrom | 漩渦山 | 資料 |
| Muridian Waypoint | 子午線傳送點 | 資料 |
| Mythwright Gambit | 秘法對決 | 資料 |
| New Kaineng City | 新凱寧城 | 資料 |
| New Loamhurst | 新沃土之森 | 資料 |
| Noran's Homestead | 諾蘭山莊 | 資料 |
| Old Sledge Site Waypoint | 舊錘據點傳送點 | 資料 |
| Plains of Ashford | 阿什福德平原 | 資料 |
| Queensdale | 女王谷 | 資料 |
| River of Souls | 魂河 | 資料 |
| Saidra's Haven | 塞德拉避難所 | 資料 |
| Salvation Pass | 救贖小道 | 資料 |
| Seitung Province | 青函省 | 資料 |
| Sorrow's Embrace | 悲傷之擁 | 資料 |
| Southsun Cove | 南陽海灣 | 資料 |
| Sparkfly Fen | 閃螢沼澤 | 資料 |
| Spirit Vale | 靈魂山谷 | 資料 |
| Splintered Coast Waypoint | 破碎海岸傳送點 | 資料 |
| Stronghold of the Faithful | 信仰要塞 | 資料 |
| Swamplost Haven Waypoint | 迷沼避難所傳送點 | 資料 |
| Tangled Depths | 纏藤深淵 | 資料 |
| The Desolation | 荒蕪之地 | 資料 |
| The Echovald Wilds | 科瓦德荒野 | 資料 |
| The Key of Ahdashim | 阿達西姆之鑰 | 資料 |
| The Ruined City of Arah | 亞拉城廢墟 | 資料 |
| Thunderhead Keep | 雷雲要塞 | 資料 |
| Thunderhead Peaks | 雷雲高峰 | 資料 |
| Timberline Falls | 林線瀑布 | 資料 |
| Twilight Arbor | 暮光之根 | 資料 |
| Twilight Arbor Waypoint | 暮光之根傳送點 | 資料 |
| Twisted Castle | 扭曲城堡 | 資料 |
| Verdant Brink | 蒼翠邊界 | 資料 |
| Wayfarer Foothills | 旅者丘陵 | 資料 |

## 名稱:首領與事件階段

| 英文 | 繁體中文 | 來源 |
|---|---|---|
| Admiral Taidha Covington | 泰達·科文頓 | 社群 |
| Modniir Ulgoth | 莫迪爾·沃爾格斯 | 社群 |
| Svanir Shaman Chief | 斯瓦尼亞薩滿 | 社群 |
| Tequatl the Sunless | 吞噬托 | 社群 |
| Sandstorm | 沙塵暴 | 社群 |
| Junundu Rising | 巨努多崛起 | 社群 |
| Maws of Torment | 磨難血口 | 社群 |
| Serpents' Ire | 巨蛇之怒 | 社群 |
| Palawadan | 帕拉瓦 | 社群 |
| Preparations | 準備階段 | 社群 |
| Prep | 準備階段 | 社群 |
| Kaineng Blackout | 凱寧城斷電 | 社群 |
| The Battle for the Jade Sea | 翠玉之海之戰 | 社群 |
| Aetherblade Assault | 以太之刃突襲 | 社群 |
| Drakkar and Spirits of the Wild | 德拉克與荒野之靈 | 社群 |
| Ley-Line Anomaly | 魔徑異常體 | 社群 |
| Ooze Pits | 軟泥鬥坑試煉 | 社群 |
| The Path to Ascension: Augury Rock | 晉升之路：占卜岩 | 社群 |
| Pinata/Reset | 彩罐丘牙獸／重置 | 社群 |
| Cantha: Day and Night | 凱珊的日夜 | 社群 |
| Night Bosses | 夜晚首領 | 社群 |
| Gang War | 幫派戰爭 | 社群 |
| Dragonstorm (Public) | 巨龍風暴（公開） | 社群 |
| Gorseval the Multifarious | 多變藤 戈瑟瓦爾 | 社群 |
| Sabetha the Saboteur | 破壞者 薩蓓莎 | 社群 |
| Matthias Gabrel | 馬蒂亞斯·加布瑞爾 | 社群 |
| Cairn the Indomitable | 不屈的凱玲 | 社群 |
| Samarog | 薩瑪洛格 | 社群 |
| Cardinal Adina | 基石守護者 艾迪娜 | 社群 |
| Cardinal Sabir | 基石守護者 薩比爾 | 社群 |
| Claw of Jormag | 卓瑪之爪 | 成就 |
| Fire Elemental | 火焰元素 | 成就 |
| Great Jungle Wurm | 巨型叢林地蟲 | 成就 |
| Inquest Golem Mark II | 審訊團魔像馬克II型 | 成就 |
| Karka Queen | 喀殼蟲女王 | 成就 |
| Megadestroyer | 超能毀滅者 | 成就 |
| Shadow Behemoth | 暗影巨獸 | 成就 |
| The Shatterer | 碎裂巨獸 | 成就 |
| Vale Guardian | 山谷守護者 | 成就 |
| Slothasor | 斯洛薩索 | 成就 |
| Keep Construct | 要塞構造體 | 成就 |
| Xera | 琦拉 | 成就 |
| Mursaat Overseer | 末世魔監工 | 成就 |
| Deimos | 戴莫斯 | 成就 |
| Soulless Horror | 無魂懼魔 | 成就 |
| Dhuum | 德姆 | 成就 |
| Conjured Amalgamate | 咒術融合體 | 成就 |
| Twin Largos | 孿生蝶翼人 | 成就 |
| Qadim | 卡迪姆 | 成就 |
| Qadim the Peerless | 無可匹敵的卡迪姆 | 成就 |
| Siege the Stronghold | 要塞圍攻 | 成就 |
| Chak Gerent | 查克蟲王 | 成就 |
| Death-Branded Shatterer | 死亡烙印碎裂巨獸 | 成就 |
| Octovine | 八爪藤 | 成就 |
| Crash Site | 墜毀點 | 成就 |
| Pylons | 能量塔 | 成就 |
| Buried Treasure | 埋藏的寶藏 | 成就 |
| Triple Trouble Wurm | 三頭地蟲 | 自擬 |
| Spirit Woods | 靈魂森林 | 自擬 |
| Protect the caged prisoners | 保護被關押的囚犯 | 自擬 |
| Front Gate | 前門 | 自擬 |
| Statues of Grenth | 格林斯雕像 | 自擬 |
| Story | 故事 | 自擬 |
| Challenges | 挑戰 | 自擬 |
| Dawn | 黎明 | 自擬 |
| Day | 白天 | 自擬 |
| Day and Night | 日夜 | 自擬 |
| Daytime | 白天 | 自擬 |
| Defend Jora's Keep | 防守焦拉要塞 | 自擬 |
| Doppelganger | 分身 | 自擬 |
| Dusk | 黃昏 | 自擬 |
| Effigy | 雕像 | 自擬 |
| Escorts | 護送 | 自擬 |
| Forged with Fire | 烈火鍛造 | 自擬 |
| Help the Outposts | 協助前哨 | 自擬 |
| Icebrood Champions | 冰巢勇者 | 自擬 |
| Metal Concert | 金屬演唱會 | 自擬 |
| Night | 夜晚 | 自擬 |
| Reset | 重置 | 自擬 |
| Rounds 1 to 3 | 第 1 到 3 回合 | 自擬 |
| Shards and Construct | 碎片與構造體 | 自擬 |
| Start | 開始 | 自擬 |
| The Oil Floes | 浮油冰原 | 自擬 |
| Hard World Bosses | 困難世界王 | 自擬 |
| World Bosses | 世界王 | 自擬 |

## 名稱:地下城路線

路線名稱的格式是「Path N - 名字」,前半一律翻成「路線 N - 」,下面只列名字。

| 英文(名字) | 繁體中文 | 來源 |
|---|---|---|
| Hodgins | 霍金斯 | 自擬 |
| Detha | 德莎 | 自擬 |
| Tzark | 扎克 | 自擬 |
| Asura | 阿蘇拉 | 自擬 |
| Butcher | 屠夫 | 自擬 |
| Fergg | 費格 | 自擬 |
| Ferrah | 費拉 | 自擬 |
| Jotun | 約頓 | 自擬 |
| Leurent (Up) | 勒朗（上層） | 自擬 |
| Submarine | 潛水艇 | 自擬 |
| Magg | 馬格 | 自擬 |
| Mursaat | 末世魔 | 自擬 |
| Plunderer | 掠奪者 | 自擬 |
| Rasolov | 拉索洛夫 | 自擬 |
| Seraph | 熾天使 | 自擬 |
| Teleporter | 傳送者 | 自擬 |
| Butler | 管家 | 自擬 |
| Forgotten | 被遺忘者 | 自擬 |
| Front door | 前門 | 自擬 |
| Koptev | 科普捷夫 | 自擬 |
| Rhiannon | 蕾安儂 | 自擬 |
| Vevina (Forward) | 薇薇娜（前進） | 自擬 |
| Zealot | 狂熱者 | 自擬 |
| Aetherpath | 以太之路 | 自擬 |
| Seer | 先知 | 自擬 |

## 這批沒有翻譯的

程式用來辨識的代號(`/event`、各種 id)、地圖區域代號(`Tyria`、`Maguuma` 等)、貨幣名稱(來自 API,已是中文)。
