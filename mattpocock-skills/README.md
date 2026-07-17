# mattpocock/skills — Skills for Real Engineers

- 連結：https://github.com/mattpocock/skills
- 作者：Matt Pocock
- 分類：AI Agent Skills / 軟體工程工作流
- 授權：MIT
- 一句話用途：Matt Pocock 每天用來做「真實工程」而非 vibe coding 的一整套 agent skills，直接來自他的 `.claude` 目錄。

## 它是什麼

一組給 Claude Code、Codex 及其他相容 Agent Skills 標準的 coding agent 使用的技能集合。設計理念是**小、好改、可組合**、與模型無關（works with any model）。不像 GSD、BMAD、Spec-Kit 那類「接管整個流程」的方法會拿走你的控制權、讓流程中的 bug 難以解決——這套刻意保持輕量，鼓勵你自行修改、變成自己的東西。

## 快速開始（約 30 秒）

1. 執行 skills.sh 安裝器：

```
npx skills@latest add mattpocock/skills
```

2. 選你要的 skills 和要安裝到哪些 coding agent。**務必勾選 `/setup-matt-pocock-skills`**。

3. 在 agent 裡執行 `/setup-matt-pocock-skills`，它會：
   - 問你要用哪個 issue tracker（GitHub、Linear 或本地檔案）
   - 問你 triage 時貼在 ticket 上的標籤（`/triage` 會用到）
   - 問你建立的文件要存在哪
4. 完成，即可使用。

## 以 Claude Code plugin 安裝

想要免維護、隨版本更新的安裝方式，這套也以原生 Claude Code plugin 形式發布：

```
/plugin marketplace add mattpocock/skills
/plugin install mattpocock-skills@mattpocock
```

或從 shell：

```
claude plugin marketplace add mattpocock/skills
claude plugin install mattpocock-skills@mattpocock
```

安裝後每個 repo 執行一次 `/setup-matt-pocock-skills`。

**兩種安裝、兩種哲學**：
- **skills.sh** 把 skills 複製進你的專案，你可以自由改、變成自己的。
- **plugin** 保持唯讀、永遠最新的 bundle，你不編輯它——想要「直接能用、跟著它演進」時最適合。

## 為什麼有這些 skills（解決四大失敗模式）

**#1 Agent 沒做出我想要的** — 溝通落差。解法是**盤問（grilling）**：讓 agent 反過來詳細問你要建什麼。用 `/grill-me`（非程式用途）或 `/grill-with-docs`（同時建立領域模型）。這是作者最受歡迎的 skills，每次要改動前都建議先用。

**#2 Agent 太囉嗦** — 缺乏共通語言。解法是建立一份幫 agent 解碼專案術語的文件（`CONTEXT.md`）。例如把「當某課程的某節被『實體化』時出問題」濃縮成「materialization cascade 出問題」。內建於 `/grill-with-docs`，作者稱這可能是整個 repo 最強的技巧。

**#3 程式跑不動** — 缺乏回饋迴路。解法是靜態型別、瀏覽器存取、自動化測試。`/tdd` 提供 red-green-refactor（先寫失敗測試再修好）迴路；`/diagnosing-bugs` 把除錯最佳實務包成簡單迴路。

**#4 做出一坨爛泥（ball of mud）** — agent 加速開發也加速了軟體熵。解法是每天在意程式設計品質。`/to-spec` 在建立 spec 前先問你動到哪些模組；`/improve-codebase-architecture` 幫你搶救已變成爛泥的 codebase，建議每隔幾天跑一次。

## Skills 參考清單

依「誰能呼叫」分兩類：**User-invoked**（只有你輸入才觸發，負責編排）與 **Model-invoked**（你或 agent 遇到合適任務時自動觸發，承載可重用的紀律）。

### Engineering（工程）

**User-invoked**
- `ask-matt` — 幫你判斷該用哪個 skill／流程的路由器。
- `grill-with-docs` — 盤問同時建立領域模型，更新 `CONTEXT.md` 與 ADR。
- `triage` — 讓 issue 走過一套 triage 角色狀態機。
- `improve-codebase-architecture` — 掃描 codebase 找可「深化」的機會，出視覺化 HTML 報告，再針對你選的項目盤問。
- `setup-matt-pocock-skills` — 為 repo 設定工程 skills（issue tracker、triage 標籤、文件配置），每 repo 先跑一次。
- `to-spec` — 把當前對話變成 spec 並發布到 issue tracker（不訪談，只綜整已討論內容）。
- `to-tickets` — 把計畫／spec／對話拆成一組 tracer-bullet tickets，並標出彼此的阻擋關係。
- `implement` — 依 spec 或 tickets 執行開發，在預定接縫驅動 `/tdd`，提交前跑 `/code-review`。
- `wayfinder` — 把超過單一 agent session 容量的大工作，規劃成 issue tracker 上一張調查 tickets 的共享地圖，逐一解決直到路徑清晰。

**Model-invoked**
- `prototype` — 建一個丟棄式原型回答設計問題（可跑的終端 app，或多個可切換的 UI 變體）。
- `diagnosing-bugs` — 硬 bug／效能退化的紀律化診斷迴路：重現 → 最小化 → 假設 → 埋點 → 修 → 回歸測試。
- `research` — 針對高可信一手來源調查問題，把發現存成 repo 內附引用的 Markdown，以背景 agent 執行。
- `tdd` — red-green-refactor 的測試驅動開發，一次一個垂直切片。
- `domain-modeling` — 主動建立與打磨專案領域模型，用邊界案例壓力測試，更新 `CONTEXT.md` 與 ADR。
- `codebase-design` — 設計「深模組」的共通紀律與詞彙：小介面後面藏大量行為，放在乾淨接縫、可透過介面測試。
- `code-review` — 對 diff 做雙軸審查：Standards（是否遵守 repo 規範 + Fowler 壞味道基準）與 Spec（是否忠實實作原始需求），以平行子 agent 執行避免互相汙染。
- `resolving-merge-conflicts` — 逐個 hunk 處理進行中的 git merge／rebase 衝突，依雙方意圖解決後完成操作，絕不 `--abort`。

### Productivity（生產力，非程式限定）

**User-invoked**
- `grill-me` — 針對計畫或設計被徹底盤問，直到決策樹每個分支都解決。
- `handoff` — 把當前對話壓縮成交接文件，讓另一個 agent 接手。
- `teach` — 跨多個 session 教你一個新技能或概念，用當前目錄當有狀態的教學工作區。
- `writing-great-skills` — 寫好、改好 skill 的參考：讓 skill 可預測的詞彙與原則。

**Model-invoked**
- `grilling` — 徹底訪談使用者直到決策樹每個分支解決，是 `grill-me` 與 `grill-with-docs` 背後可重用的迴路。

## 心得 / 適用情境

適合想把 AI coding agent 用在「認真開發、可維護的真實專案」而非快速拼湊的人。核心價值不是幫你自動寫更多程式，而是把軟體工程基本功（對齊需求、共通語言、回饋迴路、模組設計）變成可重複的 skill。可搭配 GitHub／Linear 使用；門檻是需要花點時間理解各 skill 的分工與 grilling 流程。

## 資料來源

- GitHub：https://github.com/mattpocock/skills （擷取於 2026-07-17）
- 安裝器：https://skills.sh/mattpocock/skills
