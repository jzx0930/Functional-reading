> 🌊 **[👉 開啟 Demo（index.html）](https://jzx0930.github.io/Functional-reading/ascii-ocean/index.html)**

# ASCII Ocean — 用字元當像素的水下場景

- 分類：網頁美學 / ASCII 渲染 / 反「視覺軍備競賽」
- 一句話用途：不用 WebGL、不載任何套件，單一 HTML 檔即時渲染一隻會拍翼盤旋的蝠鱝。
- 起因：看到 [stackedlol/ascii-sharks](https://github.com/stackedlol/ascii-sharks) 爆紅，自己把原理實作一遍。

## 原理

整個效果只有兩件事：

1. **3D 點投影到字元格 + z-buffer** —— 把世界座標的點投到一個 `COLS × ROWS` 的格子上，每格記錄最近的深度與亮度。
2. **亮度對應字元** —— `" .,:;clodxkO0KXNWM@"` 這串字的「墨水量」由疏到密，就是一條灰階。把 0~1 的亮度查表成字元。

輸出是一大塊純文字，丟進一個 `<pre>` 的 `textContent`。沒有 canvas 繪圖，沒有 WebGL。

上色也不逐格做：`<pre>` 鋪一層垂直漸層，用 `background-clip:text` 讓文字透出顏色，所以上色完全不花每格成本。

## 踩到的坑（都是實際改出來的）

- **點雲要固定「螢幕上」的密度，不是世界座標的密度。** 固定間距取樣的話，遠處的點會擠在同幾列裡糊成一團。x 的步距要隨距離線性放大；z 的步距因為列距隨 1/z² 收斂，必須**平方成長**。
- **水面不能用 `N·L` 打光。** 水面幾乎水平，法線跟光線的夾角變化太小，每一點都吃滿高光 → 整片死白。改用「坡度」：平的地方透光（亮），斜的地方折走（暗），波紋才出得來。
- **抖動（dither）只能加在本來就有亮度的地方。** 無條件加減會把近乎全黑的背景變成一片棋盤格雜點。
- **構圖比技術重要。** 第一版塞了水面、海床、海草、水母、魚群，結果整片雜訊什麼都看不出來。砍到剩一個主體 + 近乎空白的背景才成立。
- **用終端機 debug，不要盯著瀏覽器猜。** 架個最小 DOM stub 用 node 跑幾禎、把字元畫面 `console.log` 出來，形狀對不對一眼就知道。`cam.pitch` 正負號寫反、區域變數洩漏這類 bug 也是這樣抓到的。

## 操作

| 鍵 | 作用 |
|---|---|
| 滑鼠移動 | 視角 |
| `空白鍵` | 暫停 |
| `C` | 切換字元梯度（3 種） |
| `D` | 只看深度圖 |
| `W` | 開關抖動 |

## 相關

- [stackedlol/ascii-sharks](https://github.com/stackedlol/ascii-sharks) —— TypeScript、MIT，畫在 canvas 上的 ASCII 海洋元件庫。本專案不是它的移植，是同一套原理的獨立實作。
- 站內方向相近者：[img2threejs](../img2threejs/README.md)（圖轉 Three.js 網頁模型）。那是重量級 3D；本專案剛好相反，主張用最輕的手段換視覺效果。
