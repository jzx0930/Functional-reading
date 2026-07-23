# Functional Reading

> 🌐 **[👉 開啟線上總覽網站（GitHub Pages）](https://jzx0930.github.io/Functional-reading/)** — 卡片牆＋每個工具的互動說明頁

閱讀網路上的各種工具，整理、實測並用自己的話說明。這個資料夾用來存放這些工具的筆記與相關檔案。

## 用途

- 收錄從網路上看到、值得記錄的工具（軟體、函式庫、線上服務、指令、外掛等）
- 對每個工具寫下：它解決什麼問題、怎麼用、實際試用心得
- 把相關的設定檔、範例、截圖一併存放，方便日後查閱

## 資料夾結構

```
Functional-reading/
├── README.md          ← 本檔（總覽與索引）
├── list.txt           ← 工具清單
├── tools/             ← 每個工具一個資料夾或一份筆記
│   └── <工具名稱>/
│       ├── notes.md   ← 說明、用途、心得
│       └── ...        ← 範例、設定、截圖等
└── assets/            ← 共用圖片、附件
```

## 每個工具筆記建議格式

```markdown
# 工具名稱

- 連結：
- 分類：
- 一句話用途：

## 它解決什麼問題

## 安裝 / 使用方式

## 實測心得

## 備註
```

## 工具索引

| 工具 | 分類 | 一句話說明 | 筆記 |
|------|------|-----------|------|
| [scroll-world](https://github.com/oso95/scroll-world) | AI Skill / 網頁特效 | 把任何品牌變成滾動穿越的 3D 世界 landing page | [scroll-world/](./scroll-world/README.md) |
| [mattpocock/skills](https://github.com/mattpocock/skills) | AI Skills / 工程工作流 | 一整套「真實工程」用的 agent skills | [mattpocock-skills/](./mattpocock-skills/README.md) |
| [codebase-memory-mcp](https://github.com/DeusData/codebase-memory-mcp) | AI Coding / MCP | 把 codebase 索引成知識圖譜，讓 AI 省 token | [codebase-memory-mcp/](./codebase-memory-mcp/README.md) |
| [FeralUI Gradients](https://feralui.dev) | 設計工具 | 可調形狀／模糊／噪點的進階漸層產生器 | [feralui-gradients/](./feralui-gradients/README.md) |
| [taste-skill](https://github.com/Leonxlnx/taste-skill) | AI Skill / 前端 | 矯正 AI 前端審美，寫出有高級感的網頁 | [taste-skill/](./taste-skill/README.md) |
| [curated-codex-skills](https://github.com/George930502/curated-codex-skills) | AI Skills / Codex | 精選、實戰測試的 Codex 工作流與 prompt skills | [curated-codex-skills/](./curated-codex-skills/README.md) |
| [awesome](https://github.com/sindresorhus/awesome) | 資源索引 | 全世界頂級 awesome 精選清單的終極索引 | [awesome-list/](./awesome-list/README.md) |
| Google AI Studio 發布 | AI 建站 / 部署 | Vibe coding 網頁一鍵發布並綁自訂網域 | [ai-studio-publish/](./ai-studio-publish/README.md) |
| Blender MCP | AI × 3D / MCP | 讓 AI 直接操控 Blender 建模與渲染 | [blender-mcp/](./blender-mcp/README.md) |
| [Higgsfield MCP](https://higgsfield.ai) | AI 影像影片 / MCP | 讓 AI agent 調用 Higgsfield 生成視覺與動效 | [higgsfield-mcp/](./higgsfield-mcp/README.md) |
| 自然感網頁案例 | 前端案例 | Three.js + GSAP + AI 的有機網頁體驗 | [nature-web-threejs-gsap/](./nature-web-threejs-gsap/README.md) |

## 慣例

- 語言：中文為主，指令與程式碼保留原文
- 命名：資料夾用工具原名（英文），檔名用小寫
- 每新增一個工具，記得回來更新上面的「工具索引」
