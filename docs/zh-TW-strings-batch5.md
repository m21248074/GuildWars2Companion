# 介面文字對照表:第五批(配置、技能與特性頁、錯誤畫面、時間長度)

這一批我先套用再請你審,有疑慮的地方打 `?`,改了告訴我。
翻譯依 [詞表](zh-TW-glossary.md) 與其中的「排版與語氣」。

## 配置、技能、特性

| 英文 | 繁體中文 | 備註 |
|---|---|---|
| Nameless build | 未命名的配置 | 第三批已有 |
| Skills(技能卡) | 技能 | |
| Skills(特長卡) | 特長 | 原作者英文寫成 Skills,實際內容是特長,中文照內容寫 |
| No specialization chosen | 尚未選擇特長 | |
| Description | 描述 | |
| Stats | 屬性 | 技能與特性的事實列表 |
| Effects | 效果 | 增益、症狀那一張卡 |
| Minor trait | 次要特性 |  也可用「小型特性」 |
| Major trait | 主要特性 |  也可用「大型特性」 |

## 事實列表裡的代號(API 直接給英文代號)

| 英文 | 繁體中文 | 備註 |
|---|---|---|
| Power | 威力 | |
| Precision | 精準 | |
| Toughness | 堅韌 | |
| Vitality | 體力 | |
| ConditionDamage | 症狀傷害 | 遊戲資料稱 Condition 為「症狀」 |
| ConditionDuration | 症狀持續時間 | |
| BoonDuration | 增益持續時間 | |
| CritDamage | 暴擊傷害 | |
| Healing | 治療 | |
| Range | 範圍 | 遊戲內驗證 |
| Recharge | 冷卻時間 | |
| Combo Field | 組合技區域 | 遊戲內驗證 |
| Combo Finisher | 組合終結技 | |
| Unblockable | 無法格擋 | 遊戲內驗證 |
| StunBreak | 解除昏迷 | 遊戲內驗證 |
| Dark / Ethereal / Fire / Ice / Light / Lightning / Poison / Smoke / Water | 黑暗 / 幻光 / 火焰 / 寒冰 / 光明 / 閃電 / 毒素 / 煙霧 / 流水 | 組合場種類,幻光、寒冰、毒素、流水是遊戲內驗證的 |
| Blast / Leap / Projectile / Whirl | 爆炸 / 跳躍 / 物理投射物 / 旋風 | 組合終結技種類。爆炸、跳躍、旋風在遊戲資料的技能描述裡有出現(「爆炸終結技」等),投射物沒有找到 |
| Bundle / Elite / Heal / Monster / Pet / Profession / Toolbelt / Utility / Weapon | 持握物 / 精英 / 治療 / 怪物 / 寵物 / 職業 / 工具腰帶 / 實用 / 武器 | ? 技能類型,顯示在技能名稱下方 |
| 30s | 30 秒 | 持續時間與冷卻的單位 |

## 錯誤畫面(程式啟動失敗時才會看到)

| 英文 | 繁體中文 |
|---|---|
| There was an error while loading GW2 Companion | 載入 GW2 Companion 時發生錯誤 |
| You can send the error log to the developer to get the issue fixed. | 可以把錯誤記錄寄給開發者，協助修正問題。 |
| You will be contacted shortly afterwards with an estimation on when the issue will be fixed. | 之後會盡快通知預計的修正時間。 |
| Send error log by mail | 以電子郵件寄送錯誤記錄 |
| Error log copied to clipboard | 錯誤記錄已複製到剪貼簿 |
| Copy error log to clipboard | 複製錯誤記錄到剪貼簿 |

寄給開發者的信件主旨(`GW2 Companion error log`)維持英文,因為對方看英文。

## 時間長度(物品「持續時間」)

| 英文 | 繁體中文 |
|---|---|
| 1 hour 5 minutes 30 seconds | 1 小時 5 分鐘 30 秒 |

## 在遊戲裡驗證用的 chat code

把 code 貼進遊戲聊天框送出,點開連結看技能說明,對照遊戲怎麼稱呼。技能名稱是 App 現在顯示的繁體名稱。
「遊戲裡的叫法」留空,驗證後填入或直接告訴我。有些技能要特定職業才看得到(手雷、醫療包、工具腰帶是工程師,虹吸是死靈),
但連結貼在聊天框,沒學到也能點開看說明。

| 分類 | 代號 | 目前的譯名 | 範例技能 | 英文名 | chat code | 遊戲裡的叫法 |
|---|---|---|---|---|---|---|
| 組合場種類 | Dark | 黑暗 | 腐臭領域(技能) | Fetid Ground | `[&Bj8pAAA=]` | |
| 組合場種類 | Ethereal | 幻光 | 渦流陷阱(技能) | Vortex | `[&Bg8oAAA=]` | |
| 組合場種類 | Fire | 火焰 | 熔岩噴泉(技能) | Lava Font | `[&BqwVAAA=]` | |
| 組合場種類 | Ice | 寒冰 | 冰封爆裂(技能) | Frozen Burst | `[&Bm8VAAA=]` | |
| 組合場種類 | Light | 光明 | 投擲R型試劑(技能) | Toss Elixir R | `[&BusWAAA=]` | |
| 組合場種類 | Lightning | 閃電 | 閃電牢籠(技能) | Lightning Cage | `[&BhIWAAA=]` | |
| 組合場種類 | Poison | 毒素 | 化學力場(技能) | Chemical Field | `[&Bkd2AAA=]` | |
| 組合場種類 | Smoke | 煙霧 | 黑暗水霧(技能) | Dark Water | `[&Bm2jAAA=]` | |
| 組合場種類 | Water | 流水 | 間歇溫泉(技能) | Geyser | `[&BjEWAAA=]` | |
| 組合終結技種類 | Blast | 爆炸 | 引爆步槍炮臺(技能) | Detonate Rifle Turret | `[&BkUXAAA=]` | |
| 組合終結技種類 | Leap | 跳躍 | 空中敏捷(技能) | Aerial Agility | `[&BnQYAQA=]` | |
| 組合終結技種類 | Projectile | 物理投射物 | 倒鉤拉拽(技能) | Barbed Pull | `[&BnA4AAA=]` | |
| 組合終結技種類 | Whirl | 旋風 | 炫目光輝(技能) | Brilliance | `[&BucjAAA=]` | |
| 技能類型 | Bundle | 持握物 | 齒盾(技能) | Gear Shield | `[&Bm4XAAA=]` | |
| 技能類型 | Elite | 精英 | 暗影融合(技能) | Shadow Meld | `[&BsSxAAA=]` | |
| 技能類型 | Heal | 治療 | 收起醫療包(技能) | Stow Med Kit | `[&Bt0XAAA=]` | |
| 技能類型 | Pet | 寵物 | (找不到合適的例子) | | | |
| 技能類型 | Profession | 職業 | 虹吸(技能) | Siphon | `[&Blv2AAA=]` | |
| 技能類型 | Toolbelt | 工具腰帶 | 手雷彈幕(技能) | Grenade Barrage | `[&BrIWAAA=]` | |
| 技能類型 | Utility | 實用 | 收起手雷包(技能) | Stow Grenade Kit | `[&Bt4XAAA=]` | |
| 技能類型 | Weapon | 武器 | 關閉異世連結(技能) | Deactivate Otherworldly Bond | `[&BrIYAQA=]` | |
| 屬性(特性裡的加成) | Power | 威力 | 靈魂抓攫(技能) | Soul Grasp | `[&BgrXAAA=]` | |
| 屬性(特性裡的加成) | Precision | 精準 | 巫妖形態(技能) | Lich Form | `[&BjYpAAA=]` | |
| 屬性(特性裡的加成) | Toughness | 堅韌 | (找不到合適的例子) | | | |
| 屬性(特性裡的加成) | Vitality | 體力 | (找不到合適的例子) | | | |
| 屬性(特性裡的加成) | ConditionDamage | 症狀傷害 | (找不到合適的例子) | | | |
| 屬性(特性裡的加成) | ConditionDuration | 症狀持續時間 | (找不到合適的例子) | | | |
| 屬性(特性裡的加成) | BoonDuration | 增益持續時間 | (找不到合適的例子) | | | |
| 屬性(特性裡的加成) | CritDamage | 暴擊傷害 | (找不到合適的例子) | | | |
| 屬性(特性裡的加成) | Healing | 治療 | 刺擊(技能) | Stab | `[&BjgzAAA=]` | |
| 事實列表的標題 | Unblockable | 無法格擋 | 磁鐵(技能) | Magnet | `[&BmwXAAA=]` | |
| 事實列表的標題 | StunBreak | 解除昏迷 | 閃光傳送(技能) | Blink | `[&BtgnAAA=]` | |
| 事實列表的標題 | Range | 範圍 | 飛踢(技能) | Kick | `[&BjSiAAA=]` | |
| 事實列表的標題 | Recharge | 冷卻時間 | 能量結合(技能) | Energy Meld | `[&BiX1AAA=]` | |

沒有例子的項目(寵物技能類型、強韌、活力、狀態傷害、狀態持續時間、增益持續時間、暴擊傷害)
在玩家看得到的技能裡我找不到,請憑遊戲裡的印象確認。

## 這批沒有翻譯的

法律聲明與商店名稱(Play Store)、語言清單的各語言自稱、信件主旨。
每日任務與 Wizard Vault 仍照先前決定留到最後。
