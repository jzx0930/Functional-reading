# Google AI Studio — 直接發布網站

- 分類：AI 建站 / 部署（Vibe coding）
- 一句話用途：在 Google AI Studio 用 Vibe coding 做完網頁後，可直接發布上線並綁自訂網域，不必再靠 Vercel／Netlify。
- 來源貼文：Threads [@bboy_anlee](https://www.threads.com/@bboy_anlee/post/Da2-411DITK)

## 它解決什麼問題

過去用 AI 生成網頁後，還要另外丟到 Vercel、Netlify 之類的平台部署。AI Studio 現在能直接把 Vibe coding 做好的網頁一鍵發布上線，減少對其他部署平台的依賴。

## 操作步驟（AI Studio）

1. 在 AI Studio 用 Vibe coding 生成完網站，點右上角 **Publish**。
2. 選 **Custom domain** 綁定自己的網域，或用 `ai-studio.app` 的免費子網域直接上線。
3. 按 **Deploy**，等 1–2 分鐘就能在網路上看到。

## 延伸：Google Cloud / Firebase Studio 也可以（流程多一步）

- **Firebase Studio / App Builder**：用 App Prototyping agent 做完後點 Publish，會先部署到 App Hosting 拿到 `firebase.app` 網址；要用自訂網域就到 Firebase console → App Hosting → Add custom domain，驗證 DNS 並加 A/AAAA 紀錄。
- **Google AI Studio 的網站**：通常要改用 Cloud Run 部署，再到 Cloud Run → Custom domains 驗證並設定 DNS。

> 註：以上延伸步驟出自貼文中 meta.ai 的回覆，實際操作與服務綁定情況（是否能完全獨立運行）建議自行驗證。

## 相關

同作者另提到 **TypeUI**（有現成網頁設計風格 skill，可安裝到 AI Agent 讓生成網站少一點 AI 味；免費帳號有額度限制）。

## 資料來源

- 介紹貼文：https://www.threads.com/@bboy_anlee/post/Da2-411DITK （擷取於 2026-07-17）
