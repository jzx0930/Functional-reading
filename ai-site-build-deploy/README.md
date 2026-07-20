# AI 自架網站 + 部署 + SEO 流程

- 分類：工作流 / 方法（非單一工具）
- 一句話用途：用訂閱制 AI（Codex／Claude Code）自己做出產品行銷網站，並串接 GitHub + Vercel + Cloudflare 自動部署上線，再用 SEO 帶自然流量的完整流程。
- 來源貼文：Threads [@linyh98](https://www.threads.com/@linyh98/post/DbABALKEtaa)（創業日記）

> 註：這則貼文分享的是**做法／流程**，不是一個可安裝的工具，因此本筆記記錄的是「步驟」而非「安裝」。

## 適用對象

已經有產品、想自己做網站又不想花大錢請人，且手上有 AI 訂閱工具（ChatGPT／Claude 等）、願意動手的人。

## 建站 + 部署流程

1. **請 Codex／Claude Code 幫你做網站**：直接跟它討論你想要的樣子。
2. **申請 GitHub 帳號**：讓 AI 幫你把網站程式碼同步上去。
3. **申請 Vercel 帳號**：綁定 GitHub 專案，之後 GitHub 一有改動就自動重新部署。
4. **購買網域**：作者用 Cloudflare 買，覺得便宜好用。
5. **在 Vercel 加入自訂網域、設定 DNS**：這步較複雜，可請 AI 協助。

**懶人合併版**：直接跟 Codex／Claude Code 說「我有一個 XXX 產品，想做一個產品行銷網站，不需要後台，需要串接 GitHub、Vercel 自動部署」，剩下就是反覆討論到自己順眼為止。

## SEO：帶自然流量（作者做法）

AI 目前較難完全代勞的部分：

1. 設定與尋找關鍵字，包含長尾關鍵字。
2. 用這些關鍵字再請 AI 寫對應文章。
3. **文章一定要「去 AI 化」**：作者推薦工具 **better-writing**。
4. 把網站 sitemap 交給 Google Search Console，依錯誤回頭調整 sitemap。

作者心得：SEO 方法很多、仍在嘗試，但照做已有一點穩定的自然流量進來。

## 觀念釐清：三層架構，別把 GitHub Pages 跟 Cloudflare 搞混

容易混淆的點：GitHub Pages 與 Cloudflare **不是同一層**，職責不同。把三個角色拆開看：

- **GitHub（repo）**：存放原始碼的地方。
- **網站主機（GitHub Pages 或 Vercel）**：把程式碼變成「能打開的網站」並對外服務。
- **Cloudflare**：買網域＋管 DNS 的地方（順帶 CDN／代理）。

所以真正「二選一」的是 **GitHub Pages vs Vercel**（誰當主機）；Cloudflare 是網域／DNS 那一層，**不管主機選哪個都能掛上 Cloudflare 買的自訂網域**。

### GitHub Pages vs Vercel（當主機）

| | GitHub Pages | Vercel |
|---|---|---|
| 適合網站 | 純靜態（HTML/CSS/JS、靜態產生器） | 靜態 + 動態（Next.js SSR、serverless/edge functions） |
| 建置流程 | 有限（Jekyll 或自寫 GitHub Actions） | 內建完整 build pipeline，偵測框架自動處理 |
| 自動部署 | 可（透過 Actions） | 原生支援，push 就重部署，還有每個 commit 的 preview 網址 |
| 自訂網域 | 可掛 | 可掛 |
| 費用 | 免費 | 有免費額度，個人專案通常夠用 |

一句話：**GitHub 存碼 → Vercel 建置＋託管並自動部署 → Cloudflare 提供網域與 DNS 指向 Vercel**。若是純靜態網站，其實用 GitHub Pages 當主機也行、一樣能掛 Cloudflare 網域；作者選 Vercel，是因為自動部署、preview、對現代框架（尤其 Next.js 動態功能）的支援比 Pages 完整、省事許多。

## 注意事項（留言區補充）

- 最容易卡的是「網域」那步：Cloudflare 改了 DNS，但 Vercel 沒抓到正確的 CNAME，會一直顯示 **pending**；要手動回 Vercel domain 設定重新驗證一次才會過。此坑無論主機選誰，只要用自訂網域都可能遇到。其他步驟照做基本沒問題。

## 相關

- 本資料夾 [ai-studio-publish](../ai-studio-publish/README.md) 是「不經 Vercel、直接在 AI Studio 發布」的另一種部署路線。
- 去 AI 味的方向也可搭配 [taste-skill](../taste-skill/README.md)（前端審美）。

## 資料來源

- 介紹貼文：https://www.threads.com/@linyh98/post/DbABALKEtaa （擷取於 2026-07-17）
