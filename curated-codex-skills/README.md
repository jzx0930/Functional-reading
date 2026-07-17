# curated-codex-skills

- 連結：https://github.com/George930502/curated-codex-skills
- 作者：George930502
- 分類：AI Agent Skills / Codex 工作流
- 一句話用途：一套經過實戰測試、精選的 Codex skills 與可重用工作流，讓 agentic 工作更可靠。
- 來源貼文：Threads [@george.930502](https://www.threads.com/@george.930502/post/Daxt0dRGIiI)

## 背景與理念

作者統整了長期使用 coding agents 的心得，提出提升 agent 表現的三要素：夠好的 prompt、夠完整的 harness 環境、夠全面的 plugins。核心心得：

1. 把一句 prompt 寫好，效益最顯著、門檻最低。
2. skills 不是裝越多越好，要裝適合自己的（作者常用不超過 20 個）。
3. 工程與生產力任務推薦搭配 [mattpocock/skills](https://github.com/mattpocock/skills)。

他把這些心得串成這套工作流。

## 內含 skills（v0）

- **prompt-master-gpt5** — 依官方文件把一段 prompt polish 成「GPT 5.6 系列模型最能發揮」的寫法。適用於任務已明確、只想優化 prompt 格式的情境。
- **prompt-review-and-dispatch** — 建立在前者之上，額外加一層「grilling gate」（靈感來自 Matt Pocock 的工作流：不用 plan mode，讓 agent 透過決策樹不斷拷問你、釐清需求）。適用於只知道大方向、還不確定具體任務時；對齊完成後自動 polish 成最佳 prompt。

## 使用體驗

- 所有輸入採原生「可點選輸入」，不用打字（除非要 steer 方向）。
- 宣稱已跨平台測試（Windows、Mac、Linux）與多種開發環境。
- 目前為 v0，作者會持續更新；安裝或使用問題可到 repo 開 issue。

## 資料來源

- GitHub：https://github.com/George930502/curated-codex-skills
- 介紹貼文：https://www.threads.com/@george.930502/post/Daxt0dRGIiI （擷取於 2026-07-17）
