> 📄 **[👉 開啟互動說明頁（index.html）](https://jzx0930.github.io/Functional-reading/codex-web-to-video/index.html)**

# 用 Codex 把網頁轉成影片

- 分類：AI 影片 / Codex 工作流（非單一工具）
- 一句話用途：用 Codex 把「網頁／WebGPU demo（含互動元素、動態圖表）」直接轉成影片，省掉整個後製流程。
- 來源貼文：Threads [@krumjahn](https://www.threads.com/@krumjahn/post/DbkgrD0lPLA)（1 萬瀏覽）

## 這則在講什麼

有人用 Codex 一天內把 8 個網頁變成影片。花約 10 分鐘就能把產品演示（WebGPU code、互動元素、動態圖表）直接轉成自動化影片——不用卡幀數、不用調色、不用等 render。對做產品 demo 的人來說，省掉的不只是軟體費用，而是整個後製流程；省下的時間可以多做幾個 demo。

## 示範專案

- **Noniv/snowflow_demo**：用 WebGPU + Babylon.js + 手寫 WGSL 做的即時程序化雪景 demo（GPU 生成地形、雪變形、程序化角色、布料、水花、大氣等）。就是被轉成影片的那種高互動網頁。GitHub（貼文短網址 `dub.sh/19RAM...`）。

## 相關：Codex 影片 skills（留言區補充）

留言提到「Codex 5.6 + 4 個 skill 全流程閉環（腳本 → 動效 → 剪輯 → 渲染）」：

- **HyperFrames**（內建外掛）：整片規劃、動效、合成與最終渲染，把文字構思轉成動態視訊框架。
- **Remotion**（內建外掛）：以 React 模板用程式碼大量生產高質感影片，適合數位人＋動效。
- **video-use**：處理真人素材的剪輯，自動辨識鏡頭、卡點、後製。
- **Seedance**：頂級影片大模型的提示詞工具，生成電影級運鏡與實拍感指令。
- **DEXA VFX LAB**（dexa.art/vfx）：214 種動效在瀏覽器即時比較、調參，可匯出 Remotion 用 TSX/JSON 或 HyperFrames 用 HTML。

## 重點

這類「網頁 → 影片」把 demo 製作的瓶頸從「錄影＋後製」變成「一句話生成」。實際品質仍依素材與 prompt 而定，值得自己試。

## 資料來源

- 介紹貼文：https://www.threads.com/@krumjahn/post/DbkgrD0lPLA （擷取於 2026-07-23）
- 示範 repo：Noniv/snowflow_demo（WebGPU 雪景）
