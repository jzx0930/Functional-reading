# GhostPoly AI

- 連結：https://ghostpoly.com （官網／候補名單；以貼文帳號 [@ghostpolyjs](https://www.threads.com/@ghostpolyjs) 為準）
- 分類：AI × 3D / 遊戲開發 / low-poly 建模
- 一句話用途：AI 驅動的 low-poly 3D 建模與綁定（rigging）工具，產出「結構化、可直接進生產」的模型，方便交給遊戲引擎或 coding agent 使用。
- 來源貼文：Threads [@ghostpolyjs](https://www.threads.com/@ghostpolyjs/post/Da36KydAbmX)（GhostPoly + Fable 5：15 分鐘做出 3D 模型＋模擬場景）

## 它是什麼

GhostPoly AI 是專為遊戲開發／即時 3D 打造的 AI 建模工具。與「只能生出好看但不能用」的 AI 3D 不同，它主打產出**結構化、可立即用於生產**的 low-poly 模型：

- 分離的零件（separated parts）與階層（hierarchy）
- FK pivots（正向運動學樞紐）
- PBR 材質
- watertight（封閉不漏）網格
- 給 coding agent 用的 metadata

## 工作流程（作者示範）

依系列貼文，典型流程是：

```
Generate low-poly（生成低多邊形）
   → Refine（細修）
   → Rig（綁定骨架）
   → Export（匯出，含 auto-UV 自動拆 UV）
   → 交給 coding agent 接手
```

延伸：也展示過讓 **Codex 在 5 分鐘內為 GhostPoly 模型做動畫**、以及 **GhostPoly + Fable 5** 快速做出可模擬的 3D 場景。

## 定位（對照 blender-mcp 的討論）

先前 [blender-mcp](../blender-mcp/README.md) 留言區專業者的主要質疑，是 AI 生成 3D 常缺正確拓撲、佈線、UV、可製造性。GhostPoly 正是主打補上這塊——強調「結構化、可直接進生產」的 auto-UV 與階層化模型，方向上是要解決那些痛點。實際成效仍建議自行驗證。

## 狀態

- 目前為候補名單（waitlist）階段。

## 資料來源

- 貼文帳號：https://www.threads.com/@ghostpolyjs
- 介紹貼文：https://www.threads.com/@ghostpolyjs/post/Da36KydAbmX （擷取於 2026-07-17）
