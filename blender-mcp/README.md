> 📄 **[👉 開啟互動說明頁（index.html）](https://jzx0930.github.io/Functional-reading/blender-mcp/index.html)**

# Blender MCP

- 分類：AI × 3D / MCP Server
- 一句話用途：透過 MCP 讓 AI 模型（如 GPT-5.6 Sol、Claude）直接操控 Blender 進行 3D 建模與渲染。
- 來源貼文：Threads [@kikitataysi](https://www.threads.com/@kikitataysi/post/DaytuZ6ElFo)（7.1 萬瀏覽）
- 常見實作：https://github.com/ahujasid/blender-mcp

## 它是什麼

Blender MCP 是一個把 Blender 接上 MCP（Model Context Protocol）的伺服器，讓支援 MCP 的 AI agent 能直接下指令操控 Blender：建立／調整模型、佈置場景、設定鏡頭與材質、觸發渲染等。貼文示範用 **GPT-5.6 Sol 調用 Blender MCP** 自動完成 3D 場景。

（社群另有案例：在 Cursor 裡用一句 prompt 讓 GPT-5.6 Sol 自動設定 Blender MCP、建出漂浮的 MacBook 並自行渲染；也有人讓它花約 2 小時逐一造出機械手臂零件並嘗試 rigging。）

## 能做 / 目前限制（社群觀點）

貼文以「AI 會不會取代 3D 建模師」為引子，留言區有大量正反討論，值得一併記錄：

- **看好**：真正的專家已把 AI 融入工作流，用它加速粗活。
- **保留**：目前 AI 生成常是「調用現成素材」擺設渲染；在正確拓撲（topology）、佈線、UV 拆解、拔模／公差／組裝順序等「可生產」的細節上仍不足，生成的檔案未必能直接用於製造。
- 結論傾向：AI 是強力輔助工具，但「只能看不能用」的產出對生產端意義有限；短期內較難取代真正掌握 Blender 與 3D 專業的人。

## 適用情境

想用自然語言驅動 Blender 做概念設計、快速原型、場景搭建與渲染；或研究 AI agent 操控專業軟體的可能性。實際佈線／UV／可製造性仍需人工把關。

## 資料來源

- 介紹貼文：https://www.threads.com/@kikitataysi/post/DaytuZ6ElFo （擷取於 2026-07-17）
- 常見開源實作：https://github.com/ahujasid/blender-mcp
