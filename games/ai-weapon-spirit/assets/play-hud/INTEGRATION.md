# Play HUD 接入说明（hud-orb v1.8.0）

## 包内有什么

- **样式**：`hud-orb.css`、`hud-bar.css`、`hud-touch.css`（与 `png/` 同级）
- **图**：`png/*`（球、境界、波次 SVG、武位底版、触控 SVG 等）
- **几何**：`orb-gem.json`、`png/hud-wpn-dock.json`
- **规范**：`SPEC.md`（DOM + 变量）；布局见仓库 `docs/ai-weapon-spirit-ui-play-hud-layout-spec.md`

**不要**接入已删除 ID：`HUD-RUN-STRIP-01`、`HUD-HINT-KEYS-01`、`HUD-AI-FAB-01`。

## 游戏仓落盘（示例）

```text
public/assets/play-hud/
  hud-orb.css
  hud-bar.css
  hud-touch.css
  orb-gem.json
  png/
```

构建后保证 CSS 里 `url("./png/...")` 能访问。在 Host 或 `game-ui-theme` 提供 `--ui-font-title`、`--ui-font-number`、`--ui-text`、`--ui-muted`、`--ui-jade`、`--ui-gold-2` 等 token（见 `hud-bar.css` 开头）。

## 替换映射（只换皮，逻辑沿用 playable-hud）

| 包 | 游戏模块（参考） |
|----|------------------|
| hud-orb.css | `resource-orb-styles` |
| hud-bar.css | `combat-hud-styles`、`playable-hud`（境界/波次/本局/菜单/武位/辅读） |
| hud-touch.css | 移动端触控（`activeDevice=touch`） |

## 尺寸要点

- 命/灵：`--hud-orb-size` 竖屏 **72px**、横屏 **96px**；数值在球内
- 武位：`--dock-w` 竖屏 **374**、横屏 **520**
- 触控：摇杆 **112**、跳 **64**、滚 **60**；仅触屏显示

## 验收

- 打开本目录 `demo.html` 与 `SPEC.md` §9.7
- 对照 `ai-weapon-spirit-ui-play-hud-layout-spec.md` 显隐矩阵 §8
