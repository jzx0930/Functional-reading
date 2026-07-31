> 📄 **[👉 開啟互動說明頁（index.html）](https://jzx0930.github.io/Functional-reading/img2threejs/index.html)**

# img2threejs

- 連結：https://github.com/img2threejs/img2threejs
- 分類：AI × 3D / Three.js / image-to-3D
- 一句話用途：把一張參考圖重建成「純程式碼、程序化、通過品質把關、可直接動畫」的 Three.js 模型；主打 token 高效的 image-to-3D。
- 來源貼文：Threads [@shawn.cccc](https://www.threads.com/@shawn.cccc/post/DbSGwxgiRva)（2.3 萬瀏覽）

## 它是什麼

img2threejs 是一個開源專案，把 vibe coding 和 3D 創作接起來。接上 Codex 5.6（或類似 agent）後，一張參考圖就能跑通這條流程：

**2D 圖像 → 結構分析 → Three.js 程序化模型 → 瀏覽器即時互動**

## 三個重點

1. **意圖識別**：一張圖，模型就能精準捕捉 3D 對象的形態與細節意圖。
2. **代碼化身**：把意圖轉成可編輯、可動畫的 Three.js 程式碼，告別傳統建模的繁瑣。
3. **動畫就緒**：生成的模型自帶運行時層級（runtime hierarchy），直接用於遊戲、XR，實現「從圖像到可動資產」的閉環。

與一般「圖生模型」不同，它的亮點是**圖生程式碼**——產出的是可讀、可改的 Three.js code，不是黑盒 mesh。

## 安裝 / 使用（官方步驟）

它是給 **Claude Code / Codex / OpenCode** 用的 skill，不是獨立 app。腳本只需 Python 3.10+（標準庫，免 pip）。

1. **安裝**：把 repo clone 進 skills 資料夾
   ```bash
   git clone https://github.com/img2threejs/img2threejs.git ~/.claude/skills/img2threejs
   ```
   （Windows 一鍵安裝：本資料夾的 `install-img2threejs.bat`，會 clone 到 `%USERPROFILE%\.claude\skills\img2threejs`）
2. **呼叫**：在 Claude Code 附上一張物件圖，執行
   ```
   /img2threejs Rebuild this object as a Three.js model, keep the proportions, angles, and colours.
   ```
3. **跟著 pipeline**：它會驗證圖片、寫評估與 spec、分階段（blockout → 結構 → 形體 → 材質 → 表面 → 光照 → 互動 → 最佳化）生成 factory，每階段給你 reference-vs-render 對照直到相符。

**產出**：一個 `ObjectSculptSpec` JSON ＋ 一個 TypeScript `createXXXModel()` factory（回傳 `THREE.Group`，含 pivots/sockets/colliders 的 runtime 階層），可直接用於動畫／遊戲／XR。

**限制（作者誠實聲明）**：單張圖看不到背面、無法保證精確幾何；擅長硬表面物件，角色是風格化重建而非寫實。授權 Apache 2.0。

## 相關（留言／相關串文）

- 有人分享一個極簡 Codex 提示，把一張場景圖還原成可環繞的 3D 展示頁：
  > 「用 Three.js 建立逼真還原圖片中場景的完整可環繞 3D 精美展示頁，你可用 ImageGen 生成任何必要素材，直至達到無可挑剔可以公開發佈的水平。」
  觀察：提示加入「可公開發佈」幾個字，Codex 似乎更重視程式品質與完成度。
- 本資料夾同屬 AI×3D：[blender-mcp](../blender-mcp/README.md)、[ghostpoly-ai](../ghostpoly-ai/README.md)。

## 資料來源

- GitHub：https://github.com/img2threejs/img2threejs
- 介紹貼文：https://www.threads.com/@shawn.cccc/post/DbSGwxgiRva （擷取於 2026-07-23）
