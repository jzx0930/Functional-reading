# scroll-world

- 連結：https://github.com/oso95/scroll-world
- 作者：oso95
- 分類：AI Agent Skill / 網頁視覺特效
- 授權：MIT
- 一句話用途：一個 agent skill，把任何品牌或產業變成「滾動穿越的 3D 世界」landing page。

## 它是什麼

`scroll-world` 是一個給 **Claude Code、Codex 及任何相容 `SKILL.md` 的 AI agent** 使用的技能。它會產生一種沉浸式、由捲動進度驅動（scroll-scrubbed）的「飛越世界」網頁：當你往下捲動時，鏡頭會從每個場景的**外部**飛進**內部**，再無縫接到下一個場景，全程**沒有剪接**，像是一段連續不斷的飛行（概念類似 Emons 物流網站，但可套用到任何主題）。

捲動本身只是控制「時間軸」，鏡頭是真的在移動——這正是 Apple 產品頁那種捲動敘事的技術。

## 運作原理

它靠 [Higgsfield](https://higgsfield.ai) 產生美術素材：
- 用 GPT Image 2 生成一致風格的等角（isometric）立體場景圖
- 用 Seedance image-to-video 生成鏡頭飛行片段
- 產生把相鄰場景接起來的 **connector（銜接）片段**，而且是從鄰接場景「實際算出的畫格」去生成，所以每個接縫都是畫格完全對齊、看不出接痕

框架無關（framework-agnostic）：你拿到的是 Higgsfield 生成流程、prompt 模板，以及一支可攜的純 JavaScript 捲動引擎，能放進純 HTML、Next.js、Vue 或 Python 服務的頁面，不預設任何技術棧。

## 被呼叫時，它會做三件事

1. **訪談你** — 主題／產業與定位、品牌套件（可從網址匯入、直接提供、或由它提案）、美術方向，以及鏡頭依序造訪的場景。
2. **用 Higgsfield 生成素材** — 每個場景一張靜圖、一段「俯衝進入」鏡頭片段，以及銜接連續場景的 connector 片段。
3. **組裝** — 一支以設定檔驅動的捲動引擎，把整條鏈當成一次連續飛行播放。

## 安裝方式

### Claude Code（推薦，以 plugin 安裝）

```
/plugin marketplace add oso95/scroll-world
/plugin install scroll-world@scroll-world
```

然後直接要它做一個捲動穿越世界的 landing page，或呼叫 `/scroll-world`。

### Codex 及其他 agent（透過 skills CLI）

用 [Vercel 的 skills CLI](https://github.com/vercel-labs/skills)（可裝進 Codex、Claude Code、Cursor 等 20+ 種 agent）：

```
npx skills add oso95/scroll-world            # 依提示選擇你的 agent
npx skills add oso95/scroll-world -a codex   # 或直接指定 Codex
```

在 Codex 用 `$scroll-world` 呼叫（或 `/skills` 瀏覽）。

### 手動安裝（drop-in skill）

```
git clone https://github.com/oso95/scroll-world
cp -R scroll-world/skills/scroll-world ~/.claude/skills/   # Claude Code
cp -R scroll-world/skills/scroll-world ~/.codex/skills/    # Codex
```

## 前置需求

- [Higgsfield CLI](https://higgsfield.ai)，需登入（`higgsfield auth login`）且有 credits。
- `ffmpeg` / `ffprobe`：用於畫格擷取與編碼。
- Python 3 + Pillow（選用，僅用於透明場景去背）。

## Skill 內容結構

```
skills/scroll-world/
├── SKILL.md                    流程 + 接縫規則 + 常見陷阱
└── references/
    ├── prompts.md              訪談清單 + 每個 Higgsfield prompt 模板
    ├── pipeline.md             可直接複製的批次腳本（生成 → 畫格 → 銜接 → 編碼）
    ├── scrub-engine.js         可攜、設定檔驅動的捲動引擎（blob-seek、延遲載入、接縫淡接）
    ├── index-template.html     掛載引擎的最小獨立頁面
    └── knockout.py             浮動場景的背景去背
```

## 注意事項

- 素材生成會消耗 Higgsfield credits（N 個場景約需 N 次圖片生成 + 約 2N−1 次影片生成），且耗時較久；skill 會在背景執行並輪詢進度。
- 生成的 `.mp4` / `.webp` 素材是各專案獨立產生的，不會隨 repo 一起附上。

## 心得 / 適用情境

適合想做「品牌敘事型」「產品發表型」的高視覺衝擊 landing page，尤其是那種一路捲動、鏡頭連續穿梭的效果。重點是它把整套 AI 生成 + 捲動引擎流程包成一個 skill，缺點是仰賴 Higgsfield（付費 credits）與 ffmpeg。

## 資料來源

- GitHub：https://github.com/oso95/scroll-world （擷取於 2026-07-17）
