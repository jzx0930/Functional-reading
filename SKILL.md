---
name: functional-reading-update
description: 當使用者說「開始更新」時，讀取本檔後執行 list.txt 連結整理流程——逐一閱讀每個連結（含貼文留言區），為每個工具／功能建立以功能命名的資料夾並撰寫詳細 README.md。
---

# Functional-reading 更新流程

## 觸發時機

使用者說「**開始更新**」（或類似：更新、掃一次 list、處理清單）時，先讀本檔，再照下列流程做。

## 目標

把 `list.txt` 內的每個連結讀懂，為每個「工具／功能」在本資料夾建立一個**以該功能命名的子資料夾**，裡面放一份**詳細的 `README.md`** 說明它的功能、用法與注意事項。

## 步驟

### 1. 讀取並整理 list.txt

- 用 `tr -d '\r'` 去掉 Windows 換行符後再讀（list.txt 是 CRLF）。
- **去重**：清單常有重複行，同一 URL 只處理一次。
- **忽略無效連結**：被截斷的網址（如 `https://www.threads.co`）、或結尾參數黏在一起格式壞掉的，抓貼文 ID 判斷；ID 正常就照常讀，整條壞掉就跳過並回報。

### 2. 逐一閱讀連結

- **GitHub 連結**：直接讀 repo（README、說明）。
- **Threads 連結**：Threads 是純 JavaScript 渲染，`web_fetch` 會回傳空白。必須用 **Claude in Chrome 瀏覽器工具**：
  1. `tabs_context_mcp{createIfEmpty:true}` 取得 tabId
  2. `navigate` 到貼文網址
  3. `get_page_text` 取正文
  - 若擴充功能沒連線，提醒使用者：打開 Chrome 側邊面板並用同一帳號登入後再重試。
- **⚠️ 一定要看留言區**：貼文留言區常有關鍵補充——安裝指令、官方操作步驟、專業者的反面觀點、相關工具、demo 連結。這些都要一併讀進去、寫進 README。

### 3. 判斷這則貼文在講什麼工具／功能

- 找出貼文主打的工具名稱、GitHub repo 或官網。

### 4. 建立資料夾 + 撰寫 README

- 資料夾名稱用 **kebab-case、以功能命名**（例：`taste-skill`、`blender-mcp`、`ai-studio-publish`）。
- **若資料夾已存在**：不重建，改為比對現有 README，把這次（尤其留言區）新增的資訊補進去。
- README 用繁體中文，結構參考下方模板。

### 5. 回報

- 用表格列出：每個連結 → 對應資料夾 → 狀態（新建／已存在已補充／無效跳過）。
- 指出 list.txt 裡的重複行或壞掉的網址，並詢問是否要清理。

## README.md 模板

```markdown
# <工具／功能名稱>

- 連結：<GitHub 或官網>
- 作者／組織：<若有>
- 分類：<例：AI Coding / MCP Server / 設計工具>
- 授權：<若有>
- 一句話用途：<一句話講清楚它做什麼>
- 來源貼文：Threads [@帳號](貼文網址)（若有瀏覽數可註明）

## 它是什麼 / 它解決什麼問題

<背景、痛點、核心概念>

## 主要功能 / 特色

<條列或段落>

## 安裝 / 操作步驟

<若留言區或貼文有給，寫進來；標明來源>

## 使用建議 / 注意事項 / 踩坑

<含留言區的正反觀點、限制、費用等>

## 相關

<同作者其他工具、相關 repo，可用相對連結指向本資料夾其他筆記>

## 資料來源

- <官網 / GitHub>
- 介紹貼文：<URL>（擷取於 YYYY-MM-DD）
```

## 現有資料夾對照（截至 2026-07-17）

| 資料夾 | 主題 | 來源 |
|---|---|---|
| scroll-world | 捲動視差網頁 skill | github.com/oso95/scroll-world |
| mattpocock-skills | Matt Pocock 的 agent skills | github.com/mattpocock/skills |
| codebase-memory-mcp | 程式碼索引知識圖譜 MCP | @lawrenceteh_ |
| nature-web-threejs-gsap | Three.js+GSAP 自然感網頁案例 | @kaolti |
| ai-studio-publish | AI Studio 直接發布網站 | @bboy_anlee |
| awesome-list | sindresorhus/awesome 資源索引 | @soveryai9319 |
| curated-codex-skills | 精選 Codex skills 工作流 | @george.930502 |
| feralui-gradients | 進階漸層設計工具 | @bing_sunzhi |
| taste-skill | 矯正 AI 前端審美的 skill | @darks0603 |
| higgsfield-mcp | AI 影像／影片生成 MCP | @dmitriyinin |
| blender-mcp | AI 操控 Blender 的 MCP | @kikitataysi |

## 備註

- 本檔是本資料夾內的工作流程說明文件，供 Cowork 讀取後執行，並非已註冊的系統 skill。
