# codebase-memory-mcp

- 連結：https://github.com/DeusData/codebase-memory-mcp
- 作者／組織：DeusData
- 分類：AI Coding / MCP Server / 程式碼索引
- 授權：MIT
- 一句話用途：把整個 codebase 索引成持久化的知識圖譜，讓 AI coding agent 直接查結構，不必每次重讀專案、大幅省 token。
- 來源貼文：Threads [@lawrenceteh_](https://www.threads.com/@lawrenceteh_/post/DaPtdrBCNdO)

## 它解決什麼問題

AI 很「健忘」：每次叫它改一點東西，往往要把整個專案重讀一遍，又慢、又燒 token、還容易漏掉關聯（改了 A 會連帶影響 B、C、D 這種）。

`codebase-memory-mcp` 是一個高效能的**程式碼智慧 MCP server**。它先幫你的專案建一份索引，存成持久化的**知識圖譜**（函式、類別、呼叫鏈、HTTP 路由、跨服務連結等），之後 AI agent 用圖查詢就能直接看懂結構，不用逐檔 grep／read。

重點：**它本身不含 LLM**，只是結構分析後端；智慧與查詢翻譯交給連上的 MCP agent。因此不需要額外 API key 或費用。

## 主要特色與宣稱

- **158 種程式語言**：全部用內建的 tree-sitter 語法編進 binary。
- **省 token**：官方宣稱「120x fewer tokens」——5 個結構查詢約 3,400 tokens，對比逐檔搜尋約 412,000 tokens（效能章節寫成 99.2% 減少）。
- **速度**：一般 repo 毫秒級建索引；Linux kernel（28M 行、7.5 萬檔）完整索引約 3 分鐘；結構查詢 <1ms。（Apple M3 Pro 實測）
- **全程本機執行 / 隱私**：所有處理 100% 在本機，程式碼不外流，無 telemetry、無 API key、無 Docker、無 Ollama。
- **零依賴**：單一靜態 binary（純 C），支援 macOS、Linux、Windows。
- **14 個 MCP 工具**、支援 **11 種 coding agent**，12 種語言有 Hybrid LSP 型別解析。
- **研究背書**：arXiv 預印本（2603.27277），在 31 個真實 repo 上評估，宣稱 83% 答案品質、10× 更少 token、2.1× 更少工具呼叫。
- **社群信號**：約 31k stars，並附 OpenSSF Scorecard、SLSA Level 3、Sigstore 簽章、SHA-256、VirusTotal、CodeQL 等安全標章。

## 運作原理（概念）

- **兩層解析**：(1) tree-sitter AST 快速語法解析（158 語言皆適用，抓定義／呼叫／import）；(2) Hybrid LSP 以輕量 C 實作型別解析，精修呼叫與使用邊，不需為每個專案開語言伺服器行程。完整 Hybrid LSP 語言：Python、TS/JS/JSX/TSX、PHP、C#、Go、C、C++、Java、Kotlin、Rust、Perl。
- **知識圖譜** 存於 SQLite（節點如 File/Class/Function/Route，邊如 CALLS/IMPORTS/IMPLEMENTS/HTTP_CALLS…）。
- **RAM-first 索引**：LZ4 壓縮、記憶體內 SQLite、多階段（結構→定義→呼叫→HTTP 連結→設定→測試），索引完把記憶體還給 OS。
- **自動同步**：背景 watcher 偵測 git／檔案變動並重新索引。
- **搜尋**：語意（內建 Nomic 嵌入，免 API）、BM25 全文、結構、grep 式搜尋。
- **持久化**：DB 存在 `~/.cache/codebase-memory-mcp/`；重置用 `rm -rf ~/.cache/codebase-memory-mcp/`。
- 選配：可提交 `.codebase-memory/graph.db.zst` 團隊共享快照；另有 `localhost:9749` 的 3D 圖譜視覺化 UI。

## 安裝

一行安裝（macOS / Linux）：

```
curl -fsSL https://raw.githubusercontent.com/DeusData/codebase-memory-mcp/main/install.sh | bash
```

含視覺化 UI：

```
curl -fsSL https://raw.githubusercontent.com/DeusData/codebase-memory-mcp/main/install.sh | bash -s -- --ui
```

Windows（PowerShell）：

```
Invoke-WebRequest -Uri https://raw.githubusercontent.com/DeusData/codebase-memory-mcp/main/install.ps1 -OutFile install.ps1
notepad install.ps1        # 建議先檢視腳本
Unblock-File .\install.ps1
.\install.ps1
```

> 若遇 execution-policy 錯誤，先跑 `Set-ExecutionPolicy -Scope Process Bypass`，或 `PowerShell -ExecutionPolicy Bypass -File .\install.ps1`。

套件管理器也支援 npm、PyPI、Homebrew、Scoop、Winget、Chocolatey、AUR、`go install`。

在 Claude Code 裡也可以直接用自然語言安裝：對它說
「Install this MCP server: https://github.com/DeusData/codebase-memory-mcp」

安裝後重啟 agent，說一句「Index this project」即可開始建索引。

## 支援的 agent（11 種）

Claude Code、Codex CLI、Gemini CLI、Zed、OpenCode、Antigravity、Aider、KiloCode、VS Code、OpenClaw、Kiro（topics 也列出 Cursor、Windsurf）。`install` 會自動偵測並寫好各 agent 的 MCP 設定；Claude Code 會另外寫入 `.claude/.mcp.json`、4 個 Skills 及一個不阻擋的 PreToolUse hook。

## 需求

- 執行：只需單一靜態 binary，無 Docker／runtime 依賴／API key。平台 macOS(arm64/amd64)、Linux(arm64/amd64)、Windows(amd64)。
- 從原始碼建置：C/C++ 編譯器、zlib、Git。

## 注意事項 / 社群評價

- 它**會讀你的 codebase，也會寫入 agent 的設定檔**（MCP 設定、指令檔、pre-tool hook），安裝前值得先看過權限與腳本（貼文留言區也有人提醒自行驗證「全本機執行」的宣稱）。
- 不是 LLM，需搭配 MCP agent 才有用。
- Windows SmartScreen 可能對未簽章 binary 示警（「更多資訊」→「仍要執行」）。
- `uninstall` 會移除設定／skills／hooks，但**不會**刪除 binary 與 SQLite 資料庫。
- 留言區有正反意見：有人覺得是真痛點、方向正確；也有人說「我做了同款結果沒在用、還佔資源」，以及「99% 省 token 是跟『讀完整本書』比，正常人本來就會翻目錄」。

## 資料來源

- GitHub：https://github.com/DeusData/codebase-memory-mcp （擷取於 2026-07-17）
- 介紹貼文：https://www.threads.com/@lawrenceteh_/post/DaPtdrBCNdO
