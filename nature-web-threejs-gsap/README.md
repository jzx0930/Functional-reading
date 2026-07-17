# 自然感網頁體驗（Three.js + GSAP + GPT 5.6 案例）

- 分類：前端案例 / 技術組合（非單一工具）
- 一句話用途：一個「把大自然放進網頁」的互動視覺案例，示範用 Three.js + GSAP + AI 生成打造有機、療癒感的網頁體驗。
- 來源貼文：Threads [@kaolti](https://www.threads.com/@kaolti/post/Da1VJwTgpbE)
- Demo：https://quietude-rho.vercel.app （作者貼文提及，屬第三方連結，開啟前請留意）

> 註：這則貼文分享的是**作品／技術組合**，不是一個可安裝的工具，因此本筆記記錄的是「做法」而非「安裝」。

## 技術組合

- **Three.js** — 3D 場景與粒子、葉片等有機元素的即時渲染。
- **GSAP** — 捲動與互動動畫（timeline、ScrollTrigger 等）。
- **GPT 5.6 Sol** — 協助生成／編寫程式與素材（Vibe coding）。

作者強調想法是「設計裡需要更多自然」，成品像把瀏覽器變成一座小溫室，滑鼠滑過會有葉片散開又聚合的互動。

## 相關做法（留言區補充）

- 有人用純 canvas + physics（不用 Three.js）做粒子球，靠 spring-back 手感營造療癒互動。
- 另一種「等角 3D 房子」做法：Spline 出黏土質感模型與柔和陰影（單一 component 內嵌、免 Three.js）＋ 正交相機（orthographic camera）維持等角線條＋ GSAP ScrollTrigger 逐步揭露＋近白背景配單一 teal 點綴。

## 可借鏡處

想做「有質感、有機、會呼吸」的 landing page 時，這組 Three.js／Spline + GSAP + AI 生成的搭配是很好的參考方向；重點在氛圍與互動手感，而非堆功能。

## 資料來源

- 介紹貼文：https://www.threads.com/@kaolti/post/Da1VJwTgpbE （擷取於 2026-07-17）
