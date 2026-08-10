> 📄 **[👉 開啟互動說明頁（index.html）](https://jzx0930.github.io/Functional-reading/editorial-vision-studio/index.html)**

# Editorial Vision Studio

- 連結：https://github.com/Yu-0312/editorial-vision-studio
- 作者：Max Wang（@Yu-0312）
- 分類：AI 生圖 / Codex skill / 視覺導演
- 授權：MIT
- 一句話用途：給 AI 圖像生成的「視覺導演」工作流——先判斷用途、拆解畫面語言、選版面與風格，再輸出可執行的生成請求，讓圖更像雜誌、展覽海報、品牌主視覺或極簡插畫。
- 來源：list.txt 直接收錄的 GitHub 連結

## 它是什麼

不只是「寫提示詞」，而是一套視覺導演工作流：先定用途 → 決定視覺語言 → 選版面／風格特徵 → 用轉接器轉成各模型可用的 prompt → 產圖前檢查衝突。把照片當「內容參考」重新構圖成極簡編輯插畫（米白紙底、大量留白、克制幾何、低飽和色盤），而不是照片濾鏡。

## 它能做什麼

- 先判斷用途（展覽輸出、海報、活動主視覺、產品編輯圖、網站首圖、小誌、情緒看板）。
- 先決定視覺語言再選風格，避免只靠「好看的風格詞」碰運氣。
- 規劃版面、字體、色盤、抽象程度、材質權限與補救策略。
- 透過 `adapters/` 轉成 GPT Image、Flux、Ideogram 或通用模型的提示詞（刻意保持模型無關）。
- 產圖前檢查衝突（如 MUJI 卻用過重標題、展覽圖塞太多文字）。

## 安裝成 Codex 技能

```bash
mkdir -p ~/.codex/skills
cp -R editorial-vision-studio ~/.codex/skills/editorial-vision-studio
```

之後可請 Codex：「使用 editorial-vision-studio，將這張照片重新構圖為極簡展覽插畫提示詞；不要保留寫實攝影細節。」

## 快速提示詞（節錄）

> 建立一張極簡編輯展覽插畫，不要做成照片轉插畫。在象牙白紙底上，只用三到五個經過簡化的象徵性形體重新構成場景……至少保留 55% 安靜空白；色盤：暖象牙白、炭褐、一種低飽和大地色、一種冷中性色，最多再加一個小型色彩焦點。

## 相關

同屬「用 AI 做設計」的主題：[taste-skill](../taste-skill/README.md)（前端審美）。生成後要放進網頁可搭配 [mingcute-icons](../mingcute-icons/README.md) 等資源。

## 資料來源

- GitHub：https://github.com/Yu-0312/editorial-vision-studio （擷取於 2026-07-23）
