# 🎮 遊戲開發 Agent 團隊（Claude Code 專用）

一支可攜帶的 **9 人資深遊戲開發團隊**，以 [Claude Code](https://claude.com/claude-code) 的
subagent 形式打包。方向為 **Unity / C# / URP**，品質標準是**做出能上架 Steam 的完成品**。
不綁定任何特定遊戲——任何專案都能直接使用。

> 英文版說明請見 [README.md](README.md)。Agent 本體的 prompt 為英文（效果較穩定），
> 對話時用中文跟他們溝通即可，回覆會跟著你的語言。

---

## 🧑‍🤝‍🧑 團隊名冊

| Agent | 負責範圍 | 什麼時候找他 |
|---|---|---|
| 🎲 `game-designer` 遊戲設計師 | 核心迴圈、機制、系統、數值平衡 | 「這樣玩好不好玩？」「冷卻時間幾秒？」 |
| 🗺️ `level-designer` 關卡設計師 | 關卡佈局、節奏、encounter、難度曲線 | 「幫我規劃 vertical slice」「這關教什麼？」 |
| 📖 `narrative-designer` 敘事設計師 | 劇情、世界觀、角色、環境敘事 | 「幫我展開世界觀」「這段對白怎麼寫？」 |
| 🎨 `art-director` 美術總監 | 視覺風格、配色、素材預算、UI 風格 | 「美術方向怎麼定？」「這預算做得完嗎？」 |
| 🎧 `audio-designer` 音效設計師 | 音效、配樂方向、空間音效、middleware | 「要用 FMOD 嗎？」「這動作該有什麼聲音？」 |
| 🔧 `unity-tech-lead` 技術主程 | Unity 架構、shader、效能、工具鏈 | 「這在 Unity 怎麼做？」「存檔系統怎麼設計？」 |
| 📋 `producer` 製作人 | scope、里程碑、砍功能、風險 | 「排個時程」「這功能該不該做？」 |
| 📣 `marketing-steam-strategist` 行銷策略 | Steam 頁面、wishlist、預告片、上市 | 「商店頁怎麼寫？」「什麼時候上 Next Fest？」 |
| ⚖️ `legal-ip-advisor` 法務顧問 | 素材授權、商標、上架文件 | 「這字型能商用嗎？」「遊戲名字有沒有撞？」⚠️ 非律師 |

每一位都是「資深老手」人設：任務不清楚會**主動反問你**、結尾固定有「🌟 Tasks / Questions」
區塊列出需要你決定的事、知道什麼事該轉給哪位隊友。

---

## 🕹️ 怎麼召喚

在這個資料夾裡開 Claude Code，然後二選一：

**直接點名：**
> 請 game-designer 幫我設計一個核心迴圈
> 叫 producer 排一下 9 個月的時程

**自然描述**，讓 Claude 自動派工：
> 我想做一個用回聲定位探索的機制 →（自動派給 game-designer）

---

## ⚡ 接力指令（一鍵管線）

`.claude/commands/` 裡有 5 個現成指令，全部**一次只跑一位 agent**（訂閱方案友善）：

| 指令 | 接力順序 | 用途 |
|---|---|---|
| `/kickoff 功能描述` | producer → game-designer → unity-tech-lead → level-designer | 評估並規格化一個新功能。producer 覺得不值得做會**在第一棒就喊停**，不浪費後面的 token |
| `/asset-check 素材+用途` | 對應領域 → legal-ip-advisor → 授權清單 | 審查第三方素材（字型/音樂/素材包）能不能用 |
| `/release-prep 目標檔期` | marketing → producer → legal | 上市準備體檢，產出 readiness 記分卡 |
| `/story 故事主題` | narrative → level-designer → art-director | 開發一段故事內容並落地到關卡與美術 |
| `/standup` | （不派任何 agent，幾乎免費） | 讀團隊筆記、彙報目前所有決策與未決事項。**建議每次開工先跑這個** |

---

## 🤝 團隊怎麼協作

- **`CLAUDE.md` 是團隊章程**——每個 session 和每位 agent 都會自動載入。裡面有名冊、
  接力規則、和省 token 紀律（一次一位、跨域最多兩位、小問題不派 agent）。
- **`.claude/notes/` 是團隊白板**——每位 agent 開工前先讀自己的筆記（必要時也讀隊友的），
  做完把重要決策寫回去。**專案做越久，團隊越有記憶**，而且筆記跟著資料夾走。

---

## 📦 安裝與攜帶

**方式 A——專案模式（推薦）：**
什麼都不用裝。把整個資料夾放到哪，`cd` 進去開 Claude Code 就全套生效。
直接在這個資料夾裡開發你的遊戲也可以。

**方式 B——全域模式（每個資料夾都叫得到）：**

```bash
./install.sh            # 複製 9 位到 ~/.claude/agents/
./install.sh --link     # 用連結代替複製（repo 更新自動同步）
./install.sh --dry-run  # 只預覽，不動任何東西
./install.sh --uninstall
```

注意：全域模式下，notes 會寫在「你當下所在的專案」裡——每個遊戲專案各自累積記憶，
互不污染（這通常是你要的）。但團隊章程 CLAUDE.md 只在有它的專案裡生效。

**💾 換電腦：**

```bash
# 有 GitHub 的話
git clone <這個 repo>

# 或用 zip / 雲端硬碟
壓縮整個資料夾 → 傳過去 → 解壓 → cd 進去 → 開 Claude Code
```

git 歷史和累積的筆記都會一起帶走。

---

## 🚀 建議的開工流程

1. `/standup` —— 30 秒了解白板現況（第一次會是空的，正常）
2. 給團隊你的遊戲概念：`/kickoff 一句話描述你的遊戲或機制`
3. 之後日常：小事直接在主對話聊，值得專家出手時再點名或跑接力指令
4. 想到素材就 `/asset-check`，別等上架前才發現授權有問題

---

## 📝 注意事項

- 這些 `.md` 是 Claude Code 的 subagent 定義檔——只在 Claude Code 裡有作用，
  不是一般文件。
- Agent 不寫死 Unity 版本，會自己查專案用哪版再給建議。
- `legal-ip-advisor` 是盡職調查助手，**不是律師**——重大法律決定請諮詢真正的律師。
- Agent 不會自動 git commit / push——版本控制的主導權在你手上。

---

## 📜 授權

以 [MIT License](LICENSE) 釋出——拿去用、改、放進你自己的專案都行，
商業用途也沒問題。願意留個署名我們會很開心，但完全不強求。

## 🙏 致謝

這些 agent 是在 AI 協助下撰寫的，參考了 Claude Code 社群公開分享的 agent
設計——特別是 MIT 授權的 [**agency-agents**](https://github.com/msitarzewski/agency-agents) 專案（"The Agency"）的遊戲開發
部門，本包多位 agent 吸收了它的工藝經驗。這裡的每個想法，都站在願意把
自己的手藝寫下來、分享出去的人們的肩膀上。謝謝你們。

---

*Made with ❤️ by the community, for the community.*
