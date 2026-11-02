# 上古器灵 UI 改版合入说明

本包是在本地预览里调好的 UI 改版，覆盖标题页、局内 HUD、触屏按钮、武位 dock、结算页、行囊/菜单/底部操作栏、伤害飘字、按钮焦点态，以及中 / 英界面切换。
基本是样式与静态资源；需要改源码的有三处：武位 dock 补一个 class（见第 3 条），声音面板补静音联动（见第 7 条），天赋面板窄屏改单页（见第 8 条）；另需在入口 HTML 加两个脚本（见第 9、10 条）。

## 目录

| 路径 | 说明 |
| --- | --- |
| `ui-skin.css` | **合入用这个**。下面 5 个源文件按顺序合并，每条选择器已加 `html:not(#__ui-skin)` 前缀，优先级高于游戏原样式，层叠结果与本地预览逐元素一致 |
| `png/` | 样式用到的 SVG/PNG（按钮框、底纹、槽位图标、HUD 框等），用 `url(./png/...)` 相对引用 |
| `font/` | 伤害飘字毛笔字体 `dmg-brush.woff2`（Ma Shan Zheng 子集，SIL OFL 1.1，许可证随附） |
| `i18n/` | 中 / 英切换：`ui-i18n.js`（运行时翻译层 + 切换按钮）与 `i18n-en.json`（英文字典），两者必须同目录 |
| `js/` | `reliquary-grid.js`（行囊网格遮罩 + 全界面 41 枚《黑神话》宣白石刻纯矢量 `<svg><path>` 图标内联挂载）与 `wukong-icons.ts`（纯矢量图标 TS 注册表） |
| `world-assets/` | 局内 3D 场景掉落指示（玄玉八角菱章 `?` + 温润灵柱 `3577dc0e-d838-5a91-bafd-c364d045a34d`）与怪物头顶词条/绝相符印（`920907b9-76be-56df-b124-218a3973cf8c`）的 WebGPU 图集覆盖包（由纯矢量 `png/world-loot-atlas.svg` 与 `png/world-sigil-atlas.svg` 编译生成） |
| `src/` | 5 个源文件（`hud-bar` / `hud-touch` / `hud-wpn-lite` / `title-menu` / `fullscreen`），仅供阅读或二次修改，不要和 `ui-skin.css` 同时加载 |
| `VERSION` | 包版本号 |

## 合入要求

1. 把 `ui-skin.css`、`png/`、`font/` 放进游戏的静态资源目录，三者保持同级（CSS 内的相对路径依赖这个结构）。
2. `ui-skin.css` 必须在游戏**全部**样式之后加载（入口 HTML 里最后一个 `<link>`，或入口样式的最后一个 `@import`）。不要去掉选择器前缀，也不要改视觉数值。
3. 武位 dock：给渲染 `.play-hud-dock` 的组件加上 class `play-hud-dock--lite`（预览里是脚本补的）。
4. 伤害飘字：五行色按 `[data-forgeax-damage-number]` 的 `data-element`、暴击按 `data-critical` 匹配；削甲只能按行内色 `rgb(196, 205, 212)` 识别，若游戏改了削甲色需同步该选择器。
5. 行囊/结算面板必须保持半透明：物品模型和角色由 DOM 背后的 WebGL 画布绘制，不要把这些面板背景改成不透明。
6. 焦点态：已统一取消矩形 outline，改为沿元素轮廓的提亮 + 金色外晕（键盘 `:focus-visible`、手柄 `:focus` 与 `[data-pad-focus]`）。不要再加回 outline。
7. 声音面板静音联动（改 `audio-settings` 组件源码，构建产物里是 `assets/audio-settings-*.js`）：
   - 刷新面板时，若 `preferences().muted` 为真，三条音量滑杆的 `value` 和右侧 `<output>` 都显示 `0` / `0%`；保存的音量值本身不改，取消静音后滑杆恢复原值。
   - 处理滑杆 `input` 事件时，若当前处于静音，在 `setPreferences({[音量键]: 值})` 里一并传 `muted: false`，即拖动滑杆自动解除静音。
8. 天赋面板窄屏单页（改 `talent` 面板组件源码，构建产物里是 `assets/talent-*.js`；`ui-skin.css` 已负责把技能板页签、技能树、节点卡、草案栏排在同一屏）：
   - 窄屏（`matchMedia('(max-width:900px)')`）不再分「技能板 → 技能树 → 详情」三层：移动端视图状态（构建产物里的 `D`，写到 `.talent-panel` 的 `data-mobile-view`）初始值、换局重置值、点技能板后的值都改为 `detail`，点节点时保持 `detail`。这样「发现」区在窄屏也会加载（它只在 `detail` 时请求）。
   - 「返回」处理（构建产物里的 `$()`）在窄屏也返回 `false`，不再逐层后退，手柄/键盘返回键直接交给菜单处理；`.talent-panel__views`（返回按钮 + 面包屑）窄屏可不再渲染，样式里已隐藏。
   - 「重置」改为二次确认：第一次点击只给 `.talent-panel` 加 `data-reset-arm` 属性，并把状态文案设为「再点一次「确认重置」会清空全部加点（含已应用）」；再次点击才执行 `reset()` 并移除该属性；执行其它任何操作（投入、撤销、放弃、应用）时也移除该属性。按钮显示「确认重置」由样式按 `[data-reset-arm]` 完成。
9. 中 / 英切换（不改游戏组件源码）：
   - 把 `i18n/` 整个目录放到静态资源目录（与 `ui-skin.css` 同级即可），在入口 HTML 里加 `<script src="./i18n/ui-i18n.js?v=<包版本>" defer></script>`。必须是普通脚本（不要 `type="module"`），脚本按自身地址找同目录的 `i18n-en.json`，并把 `?v=` 原样带给字典用于刷新缓存。
   - 脚本会在开始界面 / 局内 HUD 顶部工具栏（`.spirit-menu__toolbar` 第一个）和菜单顶栏（`[data-gamepad-status-toggle]` 之前）各插一枚 `button.ui-lang-toggle`：中文时显示「EN」，英文时显示「中」。选择存 `localStorage['ai-weapon-spirit:ui-lang']`，刷新后保持。
   - 英文时 `<html>` 带 `data-ui-lang="en" lang="en"`；`ui-skin.css` 里 `html[data-ui-lang="en"]` 开头的规则负责英文排版（西文字体、字距、导航小型大写、长文案的换行与缩字号、伪元素文案英文版）。不要删这些规则。
   - 翻译方式是监听 DOM 文本 / `title` / `aria-label` / `placeholder` / `alt`，按字典整句、模板句（`{0}` 占位）、「·」「：」分段依次匹配；切回中文时逐节点还原原文。游戏代码继续只写中文即可。
   - 不翻译：AI 聊天内容（`.chat-log` / `.chat-compose`）、输入框内容、标题 Logo 图片、菜单背景的书法水印字（渡/囊/途/身/鉴）。如某处不希望被翻译，给元素加 `data-i18n-skip`。
   - 以后新增中文文案：未命中的句子会记在 `window.__uiI18n.misses`，补进 `i18n-en.json`（`exact` 为整句对照，`patterns` 为 `[中文模板, 英文模板]`）即可。
10. 多格物品下方不露格线（行囊 / 货架 / 仓库）与全界面纯矢量图标（零位图资产）：
   - 格子底纹已从 `.reliquary__grid` 背景移到 `.reliquary__grid::before`，并套用网格上的 CSS 变量 `--occ-mask` 作遮罩。物品必须保持透明（模型在背后的 WebGL 画布上），所以只能把格子底纹在多格物品处挖空。
   - 预览里由 `js/reliquary-grid.js` 计算：按网格内 `.reliquary__item` 的 `data-item-width/height` 和行内 `grid-column/grid-row` 起点，生成 evenodd 挖洞的 SVG 写入 `--occ-mask`。入口 HTML 加 `<script src="./js/reliquary-grid.js?v=<包版本>" defer></script>` 即可；也可以在渲染网格的组件里直接设置该变量，效果相同。
   - **全界面 41 枚图标 100% 纯矢量 `.svg` + `.ts` 化（零 `.png` 位图资产）**：行囊 7 枚装备槽位图标（`fs-slot-*.svg`）与 34 枚角色属性/五行/符印/天赋图标（`ic-*.svg`）已全部重构为无 `<defs>` 的手绘级纯 `<svg><path>` 矢量文件（宣白 `#e2dac7` + 浓墨阴刻 `#171512`），彻底移除此前的 `.png` 图标文件；同时提供 `js/wukong-icons.ts`（导出 `SLOT_ICON_SVGS`、`WUKONG_ICON_SVGS`、`WUKONG_SHORT_KEY_SVGS`），并由 `js/reliquary-grid.js` 自动将纯矢量 `<path>` 注入真实 DOM `<svg>` 节点（含属性栏、器物检视卡、行囊空槽、境界天赋树、词条池与百物图鉴）。合入时请同步删除旧静态目录中残留的 `png/fs-slot-*.png` 与 `png/ic-*.png`。
   - 未鉴定物品（`.reliquary__unknown`）与 **3D 场景地面掉落指示**统一为《黑神话》东方灵蕴风格：
     - 行囊内未鉴定格使用纯矢量 `png/ic-sealed-item.svg`；
     - 局内 3D 场景掉落指示（`assets/packs/presentation/difficulty/loot-atlas.pack.ts` -> GUID `3577dc0e-d838-5a91-bafd-c364d045a34d`）与怪物头顶词条/绝相符印（`assets/packs/presentation/difficulty/sigil-atlas.pack.ts` -> GUID `920907b9-76be-56df-b124-218a3973cf8c`）已由纯矢量源文件 `png/world-loot-atlas.svg`（Rows 0..6 扶摇灵烟+流萤微粒、Row 7 独立贴地径向圆晕、Row 8 3D 灵蕴宝珠与流光旋环）与 `png/world-sigil-atlas.svg`（61 枚宣白石刻拓片）生成，并导出在 `world-assets/` 目录下。
     - **WebGPU 精灵着色器失真修复（已内置于 `js/reliquary-grid.js` 的 `GPUDevice.prototype.createShaderModule` 钩子，无需改引擎源码即可生效）**：修复了 `sprite.wgsl` 中 `translucent_fog` 将白天大气雾 `inscatter` 叠加到场景图标导致深色变成水泥灰 `rgb(118,124,122)`，以及 `linear_to_srgb(premult)` 将边缘透明度放大为 `alpha^0.4545` 产生生硬亮边外壳的两处失真。
     - **场景掉落立体融合与四层动效升级（改 `src/presentation/difficulty-markers.ts` 与 `src/numerics/gpu-pickup-renderer.ts`）**：
       1. 在 `gpu-pickup-renderer.ts` 中恢复 `item` 的地面 3D 旋转晶石渲染（不再因 `separateSealedProxies` 跳过 `item`）；
       2. 在 `difficulty-markers.ts` 中为掉落物叠加四层立体表现：**① 贴地呼吸圆晕（XZ 地面投影采样图集第 7 行独立径向圆晕 `8 / 9, -1 / 9`，四角严格零阿尔法，消除地面矩形贴片与光柱底切线）+ ② 主层 8fps 扶摇灵烟与流萤升腾（采样前 7 行 `% 7`）+ ③ 副层 13fps 视差流光束（采样前 7 行 `% 7`）+ ④ 悬空 3D 灵蕴宝珠 `±0.14m` 上下悬浮呼吸与缩放脉动（采样第 8 行 `8 / 9, 1 / 9`）**。
11. 行囊与角色属性三栏常驻 + 局内菜单顶栏关闭按钮常驻 + 器灵对话（`.spirit-chat`）层级与 3D 武器舞台修复：
   - 行囊右侧角色属性面板（`.preparation-character-panel`）：桌面/横屏分辨率下始终激活（将原本 `Qt.onVisibility(I&&(en.matches||e))` 改为 `Qt.onVisibility(I)`，或将 `1400px × 901px` 媒体查询放宽至 `860px × 450px`；`reliquary-grid.js` 已内置 `matchMedia` 兼容补丁）。
   - 局内菜单顶栏关闭按钮（`[data-menu-close]`）：波间整装全部页签与战斗暂停均常驻显示（将 `a.hidden=!p&&g.requiresPreparation` 改为 `a.hidden=!1`）。
   - **器灵对话弹窗（`.spirit-chat`）视觉层级与 3D 武器舞台重构（已全部包含在 `ui-skin.css` 与 `js/reliquary-grid.js` 中，无需改业务源码）**：
     1. 修复了此前 `.reliquary__inspect .reliquary__item-header` 未限定 `:not([data-dialogue="true"])` 导致对话右栏顶部 3D 武器展示区被压缩成 `46px` 窄缝、下半截沦为空白黑框的缺陷，恢复完整的 3D 悬剑展示舞台与品质背光；
     2. 左栏顶部将「对话 / 轨迹」页签与右侧「◈ 识海 · DeepSeek 运行框架 · 上下文」胶囊合流到同一行，并将 4 枚话术按钮重构为**双层阶梯主次布局**（上排突出 2 枚核心 Agent 权能大卡：`⚡ 商量调校` 与 `❖ 谈谈认主`，下排收敛 2 枚日常闲叙轻标签）；
     3. 对话空状态升级为带动态旋转阵环的「器灵璇玑心相仪」开放式舞台，并将右栏「器灵协作 · 我愿认主」与「五行洞察 / 灵识重排」神通卡升级为朱砂鎏金认主大印与宣白石刻纯矢量图标卡。
   - **首次体验抉择弹窗（`[data-first-play-prompt]`）与新增引导/流程浮层全套古风样式（已全部包含在 `ui-skin.css`、`js/reliquary-grid.js`、`i18n/i18n-en.json` 中，无需改业务源码）**：
     1. 将原本无 CSS 样式的 `section[data-first-play-prompt]`（「是否体验教学关与初版剧情？」）重塑为《黑神话》古玉金边礼匣（「初入灵境 · 问心择途」+「壹·旧剑初醒 → 贰·青竹试剑 → 叁·首境整备」三段流程玉签），并将「体验教学与剧情」（朱砂鎏金主印大卡）与「跳过，直接开始」（玄玉青铜内敛副卡）拉开清晰的主次视觉层级；
     2. 同步覆盖新修行/教学练习确认弹窗（`dialog.new-expedition-confirmation`）、教学完成横匾（`[data-teaching-completion]`）、跳过演出按钮（`[data-teaching-entrance-skip]`）、战后整备区域介绍浮层（`aside[data-rest-tutorial]` & `[data-rest-region-pointer]`）、教学 HUD 浮动标签（`[data-teaching-hud-label]`）、往事检索栏（`.journey-history__filters`）以及选关面板「独立练习 · 教学关」卡片（`button[data-title-teaching]`）。
12. 手机竖屏（Portrait）全界面布局规范统一与全量中英双语补齐（已全部包含在 `ui-skin.css`、`i18n/ui-i18n.js`、`i18n/i18n-en.json`、`js/reliquary-grid.js` 中，无需改业务源码）：
   - **竖屏行囊、商店、仓库与全 9 个菜单子页面规范统一**：
     1. 顶栏右侧操作钮（`[售卖]`、`[EN/中]`、`[菜单/Menu]`、`[×]`）统一为 `30px` 高方章体系；修复战斗态或剧情态隐藏售卖区时顶栏中间出现 `46px` 空洞的问题；
     2. 保护 `.spirit-menu [hidden], .reliquary [hidden] { display: none !important }`，并将菜单下拉框 `.spirit-menu__picker-layer:not([hidden])` 提升至 `z-index: 120 !important` 不透底墨玉金边面板；
     3. 消除非行囊子页面（音频 `Audio`、画面 `Graphics`、AI 设置 `AI Settings`）顶栏 `h1` 与内容区首行标题的重复显示；当打开非行囊菜单页或处于 `[data-menu-suspended="true"]` 时自动收起底部的 `.journey-caption` 浮层；修复底部 `[Restart Run]` 与 `[End Run, Return to Sect Gate]` 按钮文字水平/垂直居中。
   - **竖屏局内 HUD、往事弹窗与后台加载条融合防冲突**：
     1. 底部武位盘 `.play-hud .play-hud-dock--lite` 中令 `.play-hud-progression { display: contents !important }`，使 `.play-hud-dock__xp`（修为槽）与 `.play-hud-talents`（天赋眼睛图标）严格居中对齐在同一水平中轴线上；左上角 `.play-hud-wave` 动态跟随 `calc(var(--play-tl-bottom, 98px) + 8px)`；
     2. 竖屏「往事 / Memories」与「教学 / Tutorials」弹窗中，将 `[已读往事 / 新手教程]` 与右侧 `[重新回顾 / Revisit Chapter]` 排在第一行，`章节 / Chapter` 与 `.journey-chapter-select` 通栏排在第二行，消除重叠与截断；
     3. 非阻塞后台预载提示（`.game-loading-indicator`）改为无框透明悬浮的御剑小人 + 柔光描边小字，并在打开任何菜单、往事、结算、确认框或剧情遮罩时自动隐藏，彻底杜绝与其他界面重叠。
   - **全量中英双语 100% 覆盖**：
     1. 补齐局内点击 HP/SP 球详情浮层（`#play-hud-detail-hint`）、第 2～18 境战败/重试/通关台词、同行特殊事件、新剑引见、秘境遗迹调查卡（`.journey-investigation`）、`确认初始修行信息` 弹窗、`准备修行` 加载态等全部动态模板与静态词条；
     2. `ui-i18n.js` 增强多段落自动折行文本（`\n\n` 分段 + 剥离行内硬折行 `\n`）的组合匹配，并将语言切换章统一为显示当前语言状态（英文显示 `EN`，中文显示 `中`）。
13. 山门「轮回记录与奖杯」与「器灵对话」东方金石水墨同源重塑（已全部包含在 `ui-skin.css`、`title-menu.css`、`fullscreen.css`、`js/reliquary-grid.js`、`i18n/i18n-en.json` 中，无需改业务源码）：
   - **轮回宝印录（`.title-menu__trophies`）**：废弃西式勋章/方盒报表与花哨底纹单字印；奖杯区置顶，注入「天命玉牒 · 功勋宝印 / 轮回宝印录」卷首。横排卡对齐天赋技能板：左 **45° 玄玉菱印 + 宣白拓片**，右品阶辅字 + 泥金标题 + 说明；未结用 `fs-slot-card` 墨玉槽框 + 进度条，已结用 `fs-btn-main` 金主匾。状态标注「◆ 结印 / ◇ 未结印」为**同一套小切角章**（已结 `fs-btn-main`、未结 `fs-btn`，同位置同尺寸只换色阶），勿再做成占满侧栏的大竖匾或与未结完全不同构的组件。层次只留外框 / 主文案 / 状态小章，勿叠内框角饰与多重光晕。
   - **轮回历练 · 命途碑刻（`.title-menu__records`）**：复刻「本局战况」同源的无框游丝金线分栏（上下渐隐金丝 + 左右淡金垂线 + 泥金衬线功绩大字），摒弃生硬现代方盒。
   - **器灵对话（`.spirit-chat`）**：快捷话术四钮、中央「器灵璇玑心印」、底部铭牌全部统一为同一套 **45° 旋转菱形底座 + 宣白实心拓片**，消除 Emoji / 粗块铁锤 / 空心骷髅混杂。
   - **防场景透底（可读性）**：`.title-menu__panel` 与 `.journey-history__window` 底板中段不得再低于约 97% 不透明度（此前中段约 40% 会导致山门 3D 场景透出、文案看不清）；外圈用 `box-shadow: 0 0 0 100vmax` 暗幕隔绝场景。
   - 中英词条已补齐（「天命玉牒 · 功勋宝印」「轮回宝印录」「已结宝印」「◆ 结印」「◇ 未结印」「壹品 · 破阵初鸣」等）；桌面宽屏与手机竖屏（Portrait）排版均已验证。
   - **合入时务必整包替换** `ui-skin.css`、`js/reliquary-grid.js`、`i18n/i18n-en.json` 与本包 `png/`（含 `fs-slot-card.svg` / `fs-btn.svg` / `fs-btn-main.svg`）；入口 HTML 的 `reliquary-grid.js` / `ui-i18n.js` 查询参数 `?v=` 升到本包 `VERSION`。

## 验证清单

- 标题页（横屏/竖屏）：标题、章节标签位置、菜单项悬停与键盘选中无方框。
- 开局 HUD：顶栏、波次横匾、命/灵球、武位 dock、触屏摇杆与跳跃/翻滚按钮。
- 伤害飘字：普通伤害为毛笔字 + 五行传统色，暴击为泥金大字压朱砂墨痕，削甲为灰色小字。
- 打完一波的结算页：水墨远山底纹、无卡片框，「进入整备」为金色墨痕按钮，选中时无方框。
- 行囊（横屏/竖屏）：进货为鎏金切角匾、次要按钮为墨玉切角牌、售卖为朱砂印章；物品模型与角色正常显示；底部无横杠；货架上多格物品内部无格线，未鉴定「?」样式一致。
- 天赋（竖屏，菜单 → 天赋）：页签、技能树、节点卡、草案栏同屏；点节点、切技能板都不跳页，手柄返回键直接退出面板；无草案时底栏只剩状态 + 小号「重置」，投入后底栏亮起显示撤销/放弃/重置/应用；「重置」第一次变「确认重置」，第二次才清空，中途点撤销会取消确认。
- 中 / 英切换：开始界面右上、局内 HUD 右上、菜单顶栏都有「EN」按钮；点后标题页、HUD、结算、菜单各页（含图鉴/词条/天赋/画面/AI 设置）全部变英文，无中文残留（控制台 `__uiI18n.misses.size` 为 0），按钮文字不溢出；再点「中」恢复中文；刷新后保持上次选择。
- 声音（菜单 → 声音）：勾「全部静音」三条滑杆归零并变暗、显示 0%；取消静音恢复原音量；静音时拖任一滑杆自动解除静音。
