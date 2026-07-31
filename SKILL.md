---
name: functional-reading
description: Functional-reading 專案的完整工作手冊。當使用者說「開始更新」「做成 HTML」「上線 / push」「照片轉 3D」「即時調版面」等，讀本檔照對應流程做。涵蓋：list 連結整理、HTML 說明頁與互動 demo 生成、總覽首頁、GitHub Pages 發布、commit 標題/描述產生、原創小工具。
---

# Functional-reading 專案手冊

一個「閱讀網路工具 → 整理成筆記＋可展示網頁 → 發布到 GitHub Pages」的專案，另含幾個自製小工具。

- GitHub repo：`https://github.com/jzx0930/Functional-reading`（branch `main`）
- 線上網站（GitHub Pages）：`https://jzx0930.github.io/Functional-reading/`
- 每個工具一個資料夾，內含 `README.md`（筆記）＋ `index.html`（說明／展示頁）。

---

## A. 「開始更新」：整理 list.txt 連結

觸發詞：**開始更新 / 更新 / 掃一次 list**。

1. 讀 `list.txt`：`tr -d '\r'` 去 CRLF → 抓 `https://` 開頭 → `sed 's/?.*//'` 去追蹤參數 → 去重。忽略截斷／壞掉的網址（抓 post ID 判斷）。
2. 逐一閱讀：
   - **GitHub**：直接讀 repo。
   - **Threads**：純 JS 渲染，`web_fetch` 會空白，**必須用 Claude in Chrome**：`tabs_context_mcp{createIfEmpty}` → `navigate` → `get_page_text`。擴充功能沒連線就請使用者開側邊欄登入。
   - **⚠️ 一定要讀留言區**：常有安裝指令、官方步驟、反面觀點、相關工具、demo 連結，都要寫進 README。
3. 判斷該貼文主打的工具 → 以 **kebab-case 功能命名**建資料夾。已存在就比對補充（尤其留言）。
4. 寫 `README.md`（見 C 節模板），最上方加 Pages 開啟連結。
5. 若使用者要，順手生成 `index.html`（見 B 節）並更新首頁卡片（D 節）。
6. 回報表格：連結 → 資料夾 → 狀態（新建／已存在補充／無效跳過）。指出重複行／壞網址並問是否清理。

---

## B. 生成 index.html 說明頁

每個工具資料夾放一個自足（single-file）的 `index.html`。兩種類型：

### B1. 互動 demo 類（元件／動效工具）
親手用 CSS/JS/Canvas 或 Three.js 寫出可玩的 demo（拖桿、hover、旋轉…）。例：漸層產生器、思考球體、微互動按鈕、捲動視差、跑貓、shader lines、飄葉、Three.js 模型。
- Three.js 從 `https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js` 載入。
- 自己寫 pointer 拖曳旋轉 + wheel 縮放（不依賴 OrbitControls）。

### B2. 工具/服務類（GitHub/官網型）
說明排版 + 官網/GitHub 連結按鈕 + **圖片位**：
```html
<div class="prev"><img src="preview.png" onerror="this.style.display='none';this.nextElementSibling.style.display='flex'">
<div class="ph">把截圖命名為 preview.png 放進本資料夾即可顯示</div></div>
```
（GitHub、Google、Threads 多半禁止 iframe，所以用「圖片位 + 開啟連結」而非 iframe。）

### 共用視覺規範
- 頂部：返回總覽連結 `<a href="../index.html">← 返回總覽</a>`、標題、分類 tag 膠囊、一句話 lead。
- 卡片式 section，`h2` 前面加一條主色小色塊。
- 用 CSS 變數定主色，每個工具可換色系。含「資料來源」段（官網/GitHub + 貼文 + 擷取日期）。

---

## C. README.md 模板

```markdown
> 📄 **[👉 開啟互動說明頁（index.html）](https://jzx0930.github.io/Functional-reading/<資料夾>/index.html)**

# <工具名稱>

- 連結：<GitHub 或官網>
- 分類：<...>
- 一句話用途：<...>
- 來源貼文：Threads [@帳號](URL)（瀏覽數）

## 它是什麼 / 主要功能 / 安裝或使用 / 注意事項（含留言正反觀點）/ 相關 / 資料來源
```
README 最上方那行是「開啟 HTML」的 **Pages 絕對網址**（這樣在 GitHub 網站上點也能開渲染頁；相對路徑在 github.com 只會顯示原始碼）。

---

## D. 總覽首頁 index.html（卡片牆）

- 放在專案根目錄，分類分區（原創小工具 / 前端動效 / AI×3D / AI Coding / 建站資源）。
- 每張卡片連到 `資料夾/index.html`，含 emoji、名稱、一句話、分類 tag；互動頁加「互動」badge。
- 有即時搜尋（依 `data-k` 關鍵字 + 內文過濾），空區自動隱藏。
- **原創小工具專區**放在最上面，收錄我為使用者做的工具（photo-to-3d、euphorbia-3d…）。

---

## E. 發布到 GitHub Pages

線上網址只是 repo 的副本：**改本機來源檔 → 推上去 → Pages 1–2 分鐘後更新**。首次要在 GitHub → Settings → Pages → Source 選 `main` / `root` 存檔一次。

### E1. push.bat（一鍵）
專案根目錄的 `push.bat`：`git add -A` → `git commit` → `git push`。
- **.bat 必須純 ASCII 英文、不要用括號區塊**（用 `goto`/label）。中文＋full-width 括號會被 cmd 的系統編碼吃掉引號，導致 `-m` 被拆、中文被當指令執行。

### E2. GitHub Desktop（使用者偏好）
使用者也會用 GitHub Desktop 手動推。**每次改完，我要主動給可貼上的：**
- **Summary（標題）**：一行、簡潔。
- **Description（描述）**：條列這次改了什麼。
使用者貼進左下欄位 → Commit to main → Push origin。
（若顯示「0 changed files / No local changes」＝已被 push.bat 提交過，確認右上角沒待 Push 即為完成。）

我（在此環境）**無法**幫忙 push：沒有使用者 GitHub 憑證，且沙箱對 GitHub 網路被擋（403）。也無法用 `file://` 在瀏覽器開本機檔（navigate 會強制加 https）——要驗證頁面就用視覺化 widget 即時渲染給使用者看。

---

## F. 原創小工具（我為使用者做的）

- **photo-to-3d/**：上傳照片 → Three.js 生成可旋轉立體。兩種深度：亮度即時、AI 深度（Depth Anything，`@huggingface/transformers` from jsdelivr，瀏覽器內跑）。可匯出 .obj / PNG。
- **euphorbia-3d/**：由使用者提供的棒球球多肉照片，程序化重建的 Three.js 模型（8 縱稜、程序化貼圖、黑盆礫石）。可旋轉／線框／匯出 .obj。
- 流程：使用者傳照片 → 我看圖寫 Three.js 程序化模型 → 用視覺化 widget 即時預覽驗證 → 存成 viewer 頁 → 加進首頁「原創小工具」→ 給 commit 訊息讓使用者推。
- 相關另有獨立 skill：**live-layout-editor**（拖桿即時調版面，把版面數值抽成 CSS 變數）。

---

## G. img2threejs（外部 skill，已在使用者本機安裝）

img2threejs 是給 Claude Code / Codex / OpenCode 的 skill（非 app）。安裝：`git clone https://github.com/img2threejs/img2threejs.git ~/.claude/skills/img2threejs`（Windows 一鍵：`install-img2threejs.bat`）。在 Claude Code 附物件圖執行 `/img2threejs ...`。需 Python 3.10+（標準庫）。

---

## H. 現有資料夾（截至 2026-07-23）

原創：photo-to-3d、euphorbia-3d。
外部工具：21st-dev、amicro、animata、icon-animator、feralui-gradients、thinking-orbs、scroll-world、vue-bits、blender-mcp、ghostpoly-ai、nature-web-threejs-gsap、paper-roll-threejs、higgsfield-mcp、img2threejs、codebase-memory-mcp、curated-codex-skills、mattpocock-skills、fable-method、taste-skill、claude-code-ios-simulator、poolside-laguna、runcat-neo、ai-studio-publish、ai-site-build-deploy、awesome-list。

## 備註
本檔為專案內工作說明文件，供讀取後執行；非已註冊的系統 skill。
