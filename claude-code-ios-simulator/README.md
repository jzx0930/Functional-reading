> 📄 **[👉 開啟互動說明頁（index.html）](https://jzx0930.github.io/Functional-reading/claude-code-ios-simulator/index.html)**

# Claude Code — iOS Simulator（公開測試版）

- 分類：AI Coding / iOS 開發 / 官方功能
- 一句話用途：Claude Code Desktop 整合 iOS 模擬器，讓 AI 能自己建置、啟動、操作 App 並讀畫面驗證，發現 Bug 後繼續迭代——把「寫程式→執行→操作→驗證→修正」收在同一個工作區。
- 來源貼文：Threads [@aiposthub](https://www.threads.com/@aiposthub/post/DbFE4qhgYq3)（3.7 萬瀏覽）

## 它是什麼

Anthropic 在 Claude Code Desktop 推出 **iOS Simulator 公開測試版**。模擬器直接出現在 Claude Code 對話旁邊，Claude 可以自己把 App 跑起來、操作介面、看畫面確認結果，開發者也能隨時接手手動操作。

## 它能做什麼

給一句指令（例如「把 App 跑起來，測試整個註冊流程」），Claude 可以：

- 編譯並安裝 App
- 在模擬器啟動 App
- 點擊、滑動、操作介面
- 讀取畫面確認修改結果
- 發現 Bug 後繼續迭代

意義：AI Coding 從「寫程式 → 交給人類測試」進化成「寫程式 → 執行 → 操作 → 驗證 → 修正」全在同一工作區完成，補上了 AI 寫完程式後的**視覺驗證**這一塊。

## 使用限制與注意事項（貼文＋留言）

- 目前**僅支援 macOS**，需安裝 **Xcode**（含 iOS 平台），使用 Claude Code Desktop 的本機工作階段。
- **隱私**：Claude 操作模擬器取得的截圖會傳送至 Anthropic，測試時建議**不要登入真實帳號**。
- 留言的務實提醒：模擬器不能完全取代真機測試；上架仍要面對 App Store 的真人測試者、內測／封測／公測與送審流程，這段痛點它還沒解決。它主要價值在整合工作視窗（以前要開兩個程式，現在一個 Claude 搞定）。
- Android 模擬器支援據傳仍在準備中。

## 資料來源

- 介紹貼文：https://www.threads.com/@aiposthub/post/DbFE4qhgYq3 （擷取於 2026-07-17）
- 留言引用來源：MacRumors 報導
