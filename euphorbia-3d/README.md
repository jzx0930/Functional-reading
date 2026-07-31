> 📄 **[👉 開啟 3D 模型（index.html）](https://jzx0930.github.io/Functional-reading/euphorbia-3d/index.html)**

# Euphorbia obesa（棒球球）— 照片轉 3D

- 分類：AI × 3D / 程序化 Three.js / 照片重建
- 一句話用途：由一張參考照片重建出來的程序化 Three.js 3D 模型，可旋轉、可匯出 .obj。
- 做法：img2threejs 精神的「reconstruction-by-code」——整個物件用程式生成，非匯入的 mesh。

## 重建了什麼

- 略扁的球狀主體
- 8 條縱稜與凹溝（幾何位移）
- 灰綠底色 + 褐色鋸齒縫線 + 鏽斑（程序化 canvas 貼圖）
- 稜線上的疣點
- 頂部小花苞
- 黑色圓盆 + 礫石鋪面

## 操作

拖曳旋轉、滾輪縮放；可切線框、暫停旋轉、重設視角。**下載 .obj** 匯出 3D 模型（可進 Blender／遊戲引擎）、**下載 PNG** 存截圖。

## 備註

單張照片只能看到正面，背面為對稱推測；屬 2.5D→3D 的近似重建，非多角度精確建模。
