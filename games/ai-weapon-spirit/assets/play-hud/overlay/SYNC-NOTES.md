# UI overlay 20261022-1629

Archive SHA-256: `66890da03a925010504dca7820195cbba7fcfb7c0760fed57108bec8884a5d64`.
The supplied `ui-skin.css`, `src/*.css`, SVG artwork, and fonts are copied
verbatim. Runtime loads the skin after game styles. Authoring `src/*.css`
remains unmounted; the existing classic deferred i18n/grid scripts retain their
order. Entry URLs and the late-mounted skin use `VERSION` for cache invalidation.

The seven slot icons and 34 Wukong icons have matching self-contained SVG and
TypeScript representations. Old `fs-slot-*.png` and `ic-*.png` icons are removed.
The five supplied PNG backgrounds/title artwork remain; they are not icons.
`js/wukong-icons.ts` is published as an optional source registry, not executed
as a browser script. The dock retains `play-hud-dock--lite`.

Compatibility exceptions preserve previously verified game behavior:

- Omit the package's global `window.setTimeout` replacement, which would set
  unrelated narrative timeout values to zero. All visual/grid/icon injection
  code remains.
- Preserve raw Chinese text across translation and visual button rebuilding,
  so switching languages cannot permanently replace the source labels. Unknown
  generated prose stays whole rather than mixing fragment translations.
- Keep missing entries/patterns from the installed English dictionary. New
  package values take priority. Retain the package's Chinese wording polish,
  compact-number translation, chapter picker and arrow-free story buttons.

Game component DOM, gameplay, input, chapter data and narrative state remain
unchanged. Validation reports distinguish vector/DOM checks from native runtime
acceptance; software-GPU interruption evidence does not count as a passed game
interaction check.

## Locale corrections · 0.60.5

The archive remains 20261022-1110; the installed cache token gains `-l10n1`.
Text-only CSS overrides localize decorative initials and the Enter caption.
The English title replaces Chinese letter artwork with text inside the same
reserved rectangle, retaining the original SVG decoration.
English coverage includes updated narrative controls, searches, confirmations,
trial readouts and accessible labels. Chinese display labels replace internal
category IDs and untranslated UI terms; option values and gameplay data retain
original identifiers. Source text survives language changes and component updates.
Chat message content, editable values, service names and keyboard identifiers
retain their original meaning. Only chat controls and accessible labels are
localized. Unknown generated prose stays whole and is recorded as a translation
miss; fragment translation does not invent or replace narrative content.

## Dynamic locale corrections · 0.60.6

The archive remains 20261022-1110; the installed cache token is `-l10n2`.
Translate skin `data-wk-tip` attributes with the same source-preserving path as
native titles. Keep the language toggle tooltip in sync when native titles have
been consumed. Add templates for current DPS assumptions, low-health survival,
elemental resistance and multiline talent unlock hints. The character life orb
reads Health in English; weapon Blade HP wording remains.

## Cold-start locale corrections · 0.60.7

Cache token `-l10n3` adds the current fixed opening paragraph and preserves
the source when the skin moves a translated title into its tooltip attribute.
Rebuilt fullscreen captions also restore the complete Chinese source phrase.

## World presentation · 0.60.8

Cache token is `20261022-1629`. Preserve the existing locale fixes above;
new dictionary translations take precedence (including updated chat labels).
The new sealed-item SVG and 24px material/processing glyph injection are included.

Both delivered world atlas bodies are imported as straight-alpha sRGB TextureAssets
by their original single-asset leaves. The supplied SVG and RGBA8 files are pinned
and fingerprinted raw inputs under `assets/raw/ui-overlay/20261022-1629`.
Native Cook writes Pack/receipt/catalog/artifact metadata consistently; do not
post-edit dist or copy a foreign receipt. Body hashes exactly match HANDOFF.
No ordinary GUID consumers need Cook merely for referencing the same textures.

Keep the explicitly requested, idempotent GPUDevice shader hook. It changes only
the identified native sprite fragment output: fog is omitted for these symbols,
and sRGB encoding precedes alpha multiplication. It leaves unrelated modules
and shader descriptors intact. Installed cooked shader text is checked against
the patch; full physical GPU acceptance remains separate.

Unidentified drops retain their existing 3D crystal. The two resident sprite
carriers keep the 88-instance loot capacity: one orb per live drop is reserved
before up to twenty drops receive a ground halo and two smoke layers. Smoke
uses rows 0–6; ground uses row 7; orb uses row 8, with native upward V inversion.
Reduced motion holds orb size/height and smoke frames stable. Pickup logic,
rarity, collision, collection, menus and inputs are unchanged.

The initial 0.60.8 candidate was not activated: fixed narrative 0.61.0 reached
the live game during verification. Final 0.61.1 merges that exact live source
and reuses its assets, retaining the two already verified UI atlas outputs.

## Language toggle · 0.61.2

The archive stays 20261022-1629; installed cache token is
`20261022-1629-l10n1`. Buttons show the destination language: EN in Chinese,
and 中 in English. The label language follows the destination font, while
the action tooltip and stored selection keep their existing behavior.

## 20261026-1030 同步

包体 SHA-256：`47b114f5af5187cdae093cec90efd3ec260efea02522e604e072974bebe56950`。
同步 ui-skin.css、src、png、font、js、i18n，沿 VERSION 更新入口三资源缓存参数；原 locale-only 修复与中/EN 切换保留。未改动世界图集和资产作者源。
器灵打开由源码 881f70a33 管理；移除包内全局叙事 timeout 替换与 N05 存档补写，仅按真实 hidden 状态撤回陈旧布局。保留对话与首次体验全部装饰 DOM；装饰重建保留中文源，静态 chat-empty 可翻译，聊天消息不翻译。
首次体验容器补安全居中与滚动，避免矮横屏英文内容顶部被裁切；不更改包内视觉尺寸与装饰节点。
实机整备/器灵页补齐彩虹品质、带上限标记的钱包数量、耗灵单位与新对话伪元素的英文；数量采用现有 compactNumber 显示，原存储不变。

## English content boundaries · 0.63.3

Archive stays 20261026-1030; installed cache token is `20261026-1030-layout1`.
Locale-scoped CSS separates inspection labels and values, wraps English catalog names,
and reserves real toolbar space. Portrait inventory tabs/summary keep a separate offset,
respect the native mobile-view state, and use one equipment column. Small weapon-slot
labels carry a DOM-only index for compact English captions. Inline affix SVGs keep an
18px footprint. Portrait chat has a full-width title row, two action buttons and an
accessible scroll region. Existing artwork, scripts, input and numerical logic remain.

## 0.63.4 — public viewport follow-up

Installed token: `20261026-1030-layout2`. The supplied package remains `20261026-1030`.

A 390×844 public screenshot showed that actual 50px weapon slots did not enter the previous 42px compact-caption query. Apply the existing numeric caption through 60px and align it left of the refinement badge. Translate the existing-save restart explanation. Reuse the 0.63.3 checks outside these two affected paths; no gameplay or asset-source changes.

## Locale completeness · 0.63.5

The supplied archive remains `20261026-1030`; the installed cache token is
`20261026-1030-locale1`. Preserve all existing skin assets, DOM and script order.
Add fixed narrative/personality/tutorial translations and current title, inventory,
resistance and roll templates. Translate composed detail hints by complete paragraphs
and known shared blocks, without altering internal `data-detail` sources or numerical
values. Accessible descriptions follow the same source-preserving path. The native
onboarding-reset confirmation reads the current locale; its action is unchanged.
Incomplete translations remain whole and are reported as misses. Player/Agent chat
messages and editable values remain verbatim. No asset sources or Cook dependencies change.

## Shared descriptions and locale layout · 0.63.6

The supplied archive stays `20261026-1030`; installed cache token is
`20261026-1030-description1`. Both languages now share the responsive inspection,
topbar, inventory and portrait layout corrections. Restore the existing dark jade
nav background independently of the toolbar column. No new artwork or asset sources.

A shared description renderer separates survival scope from optional calculation
rules, retaining the original numerical source and live thresholds. Other long
attribute hints arrange the existing text behind a native disclosure. Locale changes
and dictionary readiness notify open hints; live refresh preserves disclosure and
summary focus. Touch-held hints allow interaction inside their own panel.

Mobile body rows stretch the native portrait instead of collapsing to zero height.
Small landscape panels reserve the existing tabs/summary offset; equipment and
bag keep their existing columns below it, with both weapon rows bounded by the rack.

Large-wallet normalization retains a Chinese presentation source so the shared
translator can restore its currency unit and compact notation on language changes.
Stored amounts and exact accessible balances stay unchanged.

## Content navigation caption · 0.63.7

Navigation and the compact page picker show `内容 / Content`; the authored page
heading remains `本体 / DLC` with its existing full bilingual display. The content
tab retains the common skin metrics and stays on one line. Cache token:
`20261026-1030-tabs1`. No asset authoring or content-system behavior changes.

## Shared desktop topbar · 0.63.8

Installed token: `20261026-1030-topbar2`; supplied archive stays `20261026-1030`.
Navigation and utility actions share one dark jade surface and fading gold baseline.
Utility buttons share 32px height, understated edges and retained native icons.
Narrow desktop tabs allocate space to complete captions without breaking words.
Keyboard and gamepad focus keep a thin gold outline. Changes apply only above
900px width and 500px height; DOM, input, mobile rules and asset sources are unchanged.
The desktop compact-picker suppression excludes the existing gamepad status layer;
its native disclosure is visible above the topbar and retains the original close action.

## Mobile intermission skin · 0.63.9

Supplied and installed version: `20261026-2120`. Sync the combined skin and its
unmounted fullscreen source without changing selectors or visual values. Scripts,
translations, fonts and vectors match the installed files byte for byte; the two
compiled world atlases also match the existing dist and remain untouched.

Portrait equipment uses a quiet capacity readout instead of a duplicate bag action;
shop and stash keep the native expansion. Menu-close hides the long intermission
caption behind its existing vector close mark. Sell, language and menu/close use
the supplied cinnabar, warm gold and dark jade hierarchy with common dimensions.
Original dock class, source integrations, DOM and business scripts are retained.

## 20261027-1728 同步 · 0.63.12

包体 SHA-256：`5ff7a9ed678df2350dd74c28fdb3e84b8d028c1a65d984daa36877ded439b407`。完整同步 ui-skin.css、src、png、font、js、i18n 与 VERSION；CSS 仅规范化行尾空白与末尾空行，其余包文件逐字节保持。保留选择器前缀、视觉数值和原加载顺序，参考 src/*.css 不额外挂载。
本轮统一区分竖屏顶栏与菜单标题、修为槽和天赋按钮中轴、往事回顾两行布局及后台加载提示遮挡；扩展双语词条与分段匹配。语言按钮按用户本轮明确要求显示当前语言（中文「中」、英文「EN」），取代早先显示目标语言的偏好。
world-assets 中两份图集的 Pack JSON 与 body.bin 均与当前线上、原生发行物相同，保持原资产作者链和构建元数据，不手改 Pack 或清单。目标 png/ 无 fs-slot-*.png 与 ic-*.png 图标残留。未改业务 DOM、输入、数值或叙事状态。

原生竖屏复查补充：保留包内全部双语词条和脚本逻辑，仅追加「澄明」「出发前」及当前标准秒伤木桩说明模板的英文，修复实际图鉴与属性提示的剩余漏译。属性菜单沿用包内脚本与行囊属性面板合流，不另开独立页。

正式页面复查补充 · 0.63.13：追加词条名称、掷值、物品等级与多份完整纪录的组合英文模板；保留「百炼」「藏灵」的完整既有译名、数字及中文往返恢复。入口版本仍为 `20261027-1728`，皮肤、运行脚本和资产保持不变。
单条纪录使用独立的完整模板，避免递归上限将「藏灵」拆译；与多份纪录一并验证实际数值、词条名称及语言往返。
原生 HUD 样式仅在 HP/SP 详情可见时提升其父层，解决高层详情仍被父层限制、遭伤害飘字盖住的问题；不修改包内视觉参数、DOM 或业务脚本。

## Spirit dialogue layout correction · 0.63.14

The upstream archive remains `20261027-1728`; the installed cache token is
`20261027-1728-chat1`. Portrait status and phase now occupy separate rows.
Expanded context and the conversation container retain touch scrolling when
space is constrained. Raise the containing menu above the sibling intermission
dock only while a native spirit dialogue is open; restore its original layer on
close. No new DOM, decorative assets, gameplay, input or dialogue service changes.

Add the two complete dynamic distance readouts in the spirit weapon pane to the
English dictionary, preserving numbers and the original Chinese sources.

## Native trajectory and save management locale · 0.65.1

The supplied archive remains `20261027-1728`; the installed cache token is
`20261027-1728-trace1`. The game passes its initial language and subsequent
language changes through the existing read-only trajectory MessagePort. The
unchanged official LocaleRuntime translates controls, event labels and inspectors.
A locale subscription updates memoized native labels without remounting the view,
re-reading the session, resetting search or losing expansion state. The game-owned
iframe chrome and failure notices follow the same language. Hide conversation
prompt cards in the trajectory pane to retain its reading area.

Complete the new save management UI dictionary, including default slot labels,
progress summaries, confirmations and failure notices. Split player-authored
names from UI text in the native title and panel markup; preserve editable values,
custom names and raw conversation/technical content. Save actions, persistence,
input, official Harness bundles and asset authorship remain unchanged.

Language toggle tooltips and accessible descriptions also use the selected UI language
throughout; the visible current-language labels remain 中 / EN. Include the new
current-slot import explanation and save transition notices in the dictionary.

Title subpages add an opaque recessed-color backing beneath the supplied grain
and gradient artwork. Hide sibling title chrome while the native panel is open
and restore it on close; retain native scroll, focus, actions and scene rendering.

## Native trajectory locale ownership · 0.65.2

Cache token: `20261027-1728-trace2`. The bridge-localized iframe title,
read status and retry controls explicitly skip the host DOM translator.
Its locale events and source labels remain authoritative, so the host's
Chinese Harness aliases cannot rewrite already-English chrome. Native
iframe controls still use the unchanged official LocaleRuntime.

## Native iframe titles · 0.65.3

Cache token: `20261027-1728-trace3`. Keep iframe title attributes outside
the skin native-title-to-tooltip conversion: they are accessible browsing
context names with their own locale owner. The combined skin/host/bridge
test covers pointer entry and Chinese/English round trips.
