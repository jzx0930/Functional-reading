> 📄 **[👉 開啟互動說明頁（index.html）](https://jzx0930.github.io/Functional-reading/multi-agent-cad/index.html)**

# MAC — Multi-Agent CAD

- 連結：https://github.com/Pan-Chera/Multi-Agent-CAD
- 作者／單位：Guanxing Qu、Xueyan Zou（清華大學 IEI Lab）
- 分類：AI × CAD / 多 agent / text-to-3D 列印
- 授權：MIT
- 一句話用途：用 4 個協作 agent 把「精簡的自然語言」直接變成可 3D 列印的 CAD 模型（STEP/STL），比單 agent 省 116× token。
- 來源：list.txt 直接收錄的 GitHub 連結

## 它是什麼

MAC 把 text-to-CAD 的生成流程拆成 4 個 agent，用 LangGraph 狀態機串起來。agent 之間只傳「精簡的結構化狀態」（CADBrief、ArchitectPlan、QA 報告），而不是塞整段對話歷史，因此 token 壓到 1/116。底層用 build123d（algebraic B-rep CAD kernel）。

**核心洞見**：瓶頸不是「CAD 能力」，而是「推理組織沒效率」——單 agent 跑 10 題就燒掉 103M token、1,307 次 API 呼叫。

## 4 個 agent（pipeline）

1. **Spec Planner**：自然語言 → CADBrief JSON（只留 3 個驗證目標）
2. **Geometric Architect**：CADBrief → ArchitectPlan JSON（草圖、步驟、選擇器）
3. **Python Coder**：ArchitectPlan → build123d 程式（先用確定性翻譯器，不夠再交 Aider）
4. **Autonomous Skill Loop**：程式 + STEP/STL → 最終 STEP + 雙引擎 QA（Aider 修復迴圈）

## 數據（10 題 / 141 特徵，Qwen 3.7-max）

- Token：103.9M → **896k（116× 少）**
- 成本：¥125.69 → **¥9.67（13× 便宜）**
- API 呼叫：1,307 → **50（26× 少）**
- 特徵通過率：97.9% → **99.3%**
- 牆鐘時間：約 **10× 快**（估計值）

## 主要特色

- **結構化狀態傳遞**，不重播對話 → token 指數成長變線性。
- **零 token 確定性翻譯器**：常見 CAD 操作（extrude、revolve、hole、boolean、pattern、mirror、fillet、chamfer、shell…）直接由 ArchitectPlan 翻成程式，不呼叫 LLM，只有邊角案例才交給 Aider。
- **白箱可稽核**：每個中間產物都寫到磁碟，可在每次 QA 檢查點介入、覆寫、補充修改需求。
- **混合路由**：4 個階段各自可挑不同模型（便宜模型跑 Spec Planner、強模型跑 Architect/Coder、Claude/GPT 跑修復），甚至把某一階段換成自己訓練的本地小模型。
- **可動關節「print-in-place」**：多個獨立實體共存於一個 STEP，留 0.4–1mm 間隙，列印完直接會動（球中籠、陀螺儀等）。

## 安裝 / 使用

- Python 3.11，`conda env create -f environment.yml`（Windows 建議走 conda，不要純 pip）。
- 支援任何 **OpenAI 相容端點**（OpenAI、DeepSeek、Gemini、本地 Ollama、Claude 經 gateway），改 `config.py` 兩個欄位即可，非鎖定阿里雲。
- 兩種跑法：**終端機**（可 10 秒檢查點中途注入需求／中止）或 **Web UI**（瀏覽器內 3D 預覽 + 一鍵下載）。
- 產出：`temp_output_0.step` / `.stl`、`temp_design_0.py`（build123d 原始碼）等。

## 相關

與本站 AI×3D 主題相近但方向不同：[img2threejs](../img2threejs/README.md)（圖轉 Three.js 網頁模型）、[ghostpoly-ai](../ghostpoly-ai/README.md)（遊戲 low-poly）。MAC 主打**可列印、可量測的機械件 CAD**（STEP）。

## 資料來源

- GitHub：https://github.com/Pan-Chera/Multi-Agent-CAD （擷取於 2026-07-23）
- 基準對照：earthtojake/text-to-cad（CAD Skills）
