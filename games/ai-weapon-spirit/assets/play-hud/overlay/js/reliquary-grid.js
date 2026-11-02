/* 行囊 / 货架 / 仓库：多格物品下方不画格子。
 * 按每个网格内多格物品的位置生成一张遮罩（evenodd 挖洞），写到网格的 --occ-mask；
 * 格子底纹由 ui-skin.css 画在 .reliquary__grid::before 上并套用该遮罩。 */
(() => {
  if (window.__reliquaryGrid) return;
  window.__reliquaryGrid = true;

  const originalText = (el) => {
    if (!el) return "";
    const tree = document.createTreeWalker(el, NodeFilter.SHOW_TEXT);
    const text = [];
    for (let node; (node = tree.nextNode());) {
      if (!node.parentElement?.closest("svg")) text.push(window.__uiI18n?.sourceText?.(node) ?? node.data);
    }
    return text.join("");
  };


  // 修复 WebGPU 精灵材质 (sprite.wgsl) 的两处着色器失真：
  // 1) translucent_fog 将白天大气雾 inscatter (~0.18 linear) 叠加到场景掉落与头顶符印上，导致深色/阴影变成水泥灰 rgb(118,124,122)；
  // 2) linear_to_srgb(premult) 对已乘 alpha 的线性值做伽马编码，使边缘 alpha 被放大为 alpha^0.4545，导致柔光外缘出现生硬外壳。
  if (typeof GPUDevice !== "undefined" && GPUDevice.prototype && !GPUDevice.prototype.createShaderModule.__wukongPatched) {
    const origCreateShaderModule = GPUDevice.prototype.createShaderModule;
    const patchedCreateShaderModule = function ( descriptor ) {
      if (descriptor && typeof descriptor.code === "string" && descriptor.code.includes("resolveSpriteVertex") && descriptor.code.includes("translucent_fog")) {
        let code = descriptor.code
          .replace(
            "let premult = vec4<f32>(_e27, rgba.w);\n    let _e31 = linear_to_srgb(premult.x);\n    let _e33 = linear_to_srgb(premult.y);\n    let _e35 = linear_to_srgb(premult.z);",
            "let premult = vec4<f32>((rgba.xyz * rgba.w), rgba.w);\n    let _e31 = (linear_to_srgb(rgba.x) * rgba.w);\n    let _e33 = (linear_to_srgb(rgba.y) * rgba.w);\n    let _e35 = (linear_to_srgb(rgba.z) * rgba.w);"
          )
          .replace(
            "return vec4<f32>(_e27, rgba_1.w);",
            "return vec4<f32>((rgba_1.xyz * rgba_1.w), rgba_1.w);"
          );
        descriptor = { ...descriptor, code };
      }
      return origCreateShaderModule.call(this, descriptor);
    };
    patchedCreateShaderModule.__wukongPatched = true;
    GPUDevice.prototype.createShaderModule = patchedCreateShaderModule;
  }

  // 行囊与属性合流：放宽行囊右侧属性面板 (.preparation-character-panel) 的桌面端断点，使 >=860px 横屏始终实时渲染完整角色属性
  const mqlDesc = typeof MediaQueryList !== "undefined" && Object.getOwnPropertyDescriptor(MediaQueryList.prototype, "matches");
  if (mqlDesc && typeof mqlDesc.get === "function" && !mqlDesc.get.__patched) {
    const origGet = mqlDesc.get;
    const get = function () {
      const media = this.media || "";
      if (media.includes("1400px") && media.includes("901px")) {
        return window.innerWidth >= 860 && window.innerHeight >= 450;
      }
      return origGet.call(this);
    };
    get.__patched = true;
    Object.defineProperty(MediaQueryList.prototype, "matches", { ...mqlDesc, get });
  }
  const origMatchMedia = window.matchMedia;
  if (typeof origMatchMedia === "function" && !origMatchMedia.__patched) {
    const patched = function (query) {
      if (typeof query === "string" && query.includes("1400px") && query.includes("901px")) {
        query = "(min-width: 860px) and (min-height: 450px)";
      }
      return origMatchMedia.call(this, query);
    };
    patched.__patched = true;
    window.matchMedia = patched;
  }

  // The game-owned select remains the value/change authority. Only its visible
  // picker is replaced, so platform-native blue menus cannot cover the skin.
  const chapterPickers = new WeakMap();
  let chapterPopup = null;
  let chapterPickerId = 0;
  const closeChapterPicker = (restoreFocus = false) => {
    const picker = chapterPopup;
    if (!picker) return;
    chapterPopup = null;
    picker.menu.hidden = true;
    picker.trigger.setAttribute("aria-expanded", "false");
    if (restoreFocus && picker.trigger.isConnected && !picker.root.hidden) picker.trigger.focus({ preventScroll: true });
  };
  const chooseChapter = (picker, index) => {
    const option = picker.select.options[index];
    if (!option || option.disabled || picker.select.disabled) return;
    closeChapterPicker(true);
    if (picker.select.selectedIndex === index) return;
    picker.select.selectedIndex = index;
    picker.select.dispatchEvent(new Event("input", { bubbles: true }));
    picker.select.dispatchEvent(new Event("change", { bubbles: true }));
    syncChapterPickers();
  };
  const focusChapter = (picker, index) => {
    const rows = [...picker.menu.children];
    const row = rows[index];
    if (!row || row.disabled) return;
    row.focus({ preventScroll: true });
    row.scrollIntoView({ block: "nearest" });
  };
  const openChapterPicker = (picker) => {
    if (picker.select.disabled || !picker.select.options.length) return;
    if (chapterPopup === picker) { closeChapterPicker(true); return; }
    closeChapterPicker();
    chapterPopup = picker;
    picker.trigger.setAttribute("aria-expanded", "true");
    picker.menu.hidden = false;
    const rect = picker.trigger.getBoundingClientRect();
    const edge = 12, width = Math.min(Math.max(rect.width, 232), innerWidth - edge * 2);
    const below = innerHeight - rect.bottom - edge - 6;
    const above = rect.top - edge - 6;
    const upwards = below < Math.min(180, picker.menu.scrollHeight) && above > below;
    picker.menu.style.width = width + "px";
    picker.menu.style.maxHeight = Math.max(40, Math.min(300, upwards ? above : below)) + "px";
    picker.menu.style.left = Math.max(edge, Math.min(rect.left, innerWidth - width - edge)) + "px";
    picker.menu.style.top = (upwards ? Math.max(edge, rect.top - picker.menu.offsetHeight - 6) : rect.bottom + 6) + "px";
    const selected = picker.select.selectedIndex;
    focusChapter(picker, selected >= 0 ? selected : 0);
  };
  const syncChapterPickers = () => {
    const original = document.documentElement.dataset.uiReviewSkin === "original";
    if (chapterPopup && (!chapterPopup.select.isConnected || chapterPopup.root.hidden || chapterPopup.select.disabled)) closeChapterPicker();
    for (const select of document.querySelectorAll(".journey-history select[data-history-chapter]")) {
      let picker = chapterPickers.get(select);
      if (!picker && original) continue;
      if (!picker) {
        const root = select.closest(".journey-history");
        const trigger = document.createElement("button");
        trigger.type = "button";
        trigger.className = "journey-chapter-select";
        trigger.setAttribute("aria-haspopup", "listbox");
        trigger.setAttribute("aria-expanded", "false");
        trigger.setAttribute("data-i18n-skip", "");
        const label = document.createElement("span");
        label.className = "journey-chapter-select__value";
        trigger.append(label);
        const menu = document.createElement("div");
        menu.id = "journey-chapter-options-" + ++chapterPickerId;
        menu.className = "journey-chapter-options";
        menu.hidden = true;
        menu.setAttribute("role", "listbox");
        menu.setAttribute("data-i18n-skip", "");
        trigger.setAttribute("aria-controls", menu.id);
        select.hidden = true;
        select.after(trigger);
        root.append(menu);
        picker = { select, root, trigger, label, menu, key: "" };
        chapterPickers.set(select, picker);
        trigger.addEventListener("click", () => openChapterPicker(picker));
        select.addEventListener("change", syncChapterPickers);
      }
      if (select.hidden !== !original) select.hidden = !original;
      if (picker.trigger.hidden !== original) picker.trigger.hidden = original;
      if (original) {
        if (chapterPopup === picker) closeChapterPicker();
        continue;
      }
      if (picker.root.hidden) continue;
      if (picker.trigger.disabled !== select.disabled) picker.trigger.disabled = select.disabled;
      const name = select.getAttribute("aria-label") || "选择回顾章节";
      for (const control of [picker.trigger, picker.menu]) {
        if (control.getAttribute("aria-label") !== name) control.setAttribute("aria-label", name);
      }
      const title = select.options[select.selectedIndex]?.textContent || "—";
      if (picker.label.textContent !== title) picker.label.textContent = title;
      const key = JSON.stringify([...select.options].map(option => [option.value, option.textContent, option.disabled, option.selected]));
      if (key === picker.key) continue;
      const wasOpen = chapterPopup === picker;
      if (wasOpen) closeChapterPicker(true);
      picker.key = key;
      picker.menu.replaceChildren(...[...select.options].map((option, index) => {
        const row = document.createElement("button");
        row.type = "button"; row.tabIndex = -1;
        row.className = "journey-chapter-options__item";
        row.setAttribute("role", "option");
        row.setAttribute("aria-selected", String(option.selected));
        row.disabled = option.disabled;
        row.textContent = option.textContent;
        row.addEventListener("click", () => chooseChapter(picker, index));
        return row;
      }));
      if (wasOpen) openChapterPicker(picker);
    }
  };
  window.addEventListener("keydown", event => {
    let picker = chapterPopup;
    if (!picker && ["ArrowDown", "ArrowUp"].includes(event.key) && event.target.matches?.(".journey-chapter-select")) {
      picker = chapterPickers.get(event.target.previousElementSibling);
      if (picker) {
        event.preventDefault(); event.stopImmediatePropagation();
        openChapterPicker(picker);
      }
      return;
    }
    if (!picker) return;
    if (event.key === "Tab") { closeChapterPicker(true); return; }
    if (!["Escape", "ArrowDown", "ArrowUp", "Home", "End", "Enter", " "].includes(event.key)) return;
    event.preventDefault(); event.stopImmediatePropagation();
    if (event.key === "Escape") { closeChapterPicker(true); return; }
    const rows = [...picker.menu.children];
    const index = rows.indexOf(document.activeElement);
    if (event.key === "Enter" || event.key === " ") { chooseChapter(picker, index); return; }
    const available = rows.map((row, i) => row.disabled ? -1 : i).filter(i => i >= 0);
    const current = available.indexOf(index);
    const next = event.key === "Home" ? 0 : event.key === "End" ? available.length - 1
      : Math.max(0, Math.min(available.length - 1, current + (event.key === "ArrowDown" ? 1 : -1)));
    focusChapter(picker, available[next]);
  }, true);
  window.addEventListener("pointerdown", event => {
    if (chapterPopup && !chapterPopup.menu.contains(event.target) && !chapterPopup.trigger.contains(event.target)) closeChapterPicker();
  }, true);
  window.addEventListener("resize", () => closeChapterPicker());

  const maskFor = (grid) => {
    const cs = getComputedStyle(grid);
    const cols = parseInt(cs.getPropertyValue("--columns"), 10);
    const rows = parseInt(cs.getPropertyValue("--rows"), 10);
    if (!(cols > 0 && rows > 0)) return "";
    let holes = "";
    for (const it of grid.children) {
      if (!it.classList.contains("reliquary__item")) continue;
      const w = parseInt(it.dataset.itemWidth, 10) || 1;
      const h = parseInt(it.dataset.itemHeight, 10) || 1;
      const c = parseInt(it.style.gridColumnStart, 10);
      const r = parseInt(it.style.gridRowStart, 10);
      if (!(c > 0 && r > 0)) continue;
      holes += `M${c - 1} ${r - 1}h${w}v${h}h${-w}z`;
    }
    if (!holes) return "";
    const svg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${cols} ${rows}" preserveAspectRatio="none">`
      + `<path fill-rule="evenodd" d="M0 0h${cols}v${rows}h${-cols}z${holes}"/></svg>`;
    return `url("data:image/svg+xml,${encodeURIComponent(svg)}")`;
  };

  const within = (scope, selector) => scope instanceof Element && scope.matches(selector)
    ? [scope, ...scope.querySelectorAll(selector)] : scope.querySelectorAll(selector);
  const dirtyGrids = new Set(), dirtyOrbs = new Set(), dirtyDecoration = new Set(), dirtyWallets = new Set();
  let journeyDirty = false, menuDirty = false, uiDirty = false, chaptersDirty = false;
  const gridSourceKey = grid => [grid.style.getPropertyValue("--columns"), grid.style.getPropertyValue("--rows"),
    ...[...grid.children].filter(item => item.classList.contains("reliquary__item"))
      .map(item => [item.dataset.itemWidth, item.dataset.itemHeight, item.style.gridColumnStart, item.style.gridRowStart].join(":"))].join("|");
  const update = () => {
    for (const grid of dirtyGrids) {
      if (!grid.isConnected) { dirtyGrids.delete(grid); continue; }
      // Keep hidden inventory dirty until its real owner opens it.
      if (grid.closest("[hidden]")) continue;
      dirtyGrids.delete(grid);
      const key = gridSourceKey(grid);
      if (grid.__occSourceKey === key) continue;
      grid.__occSourceKey = key;
      const mask = maskFor(grid);
      if (grid.__occMask === mask) continue;
      grid.__occMask = mask;
      if (mask) grid.style.setProperty("--occ-mask", mask);
      else grid.style.removeProperty("--occ-mask");
    }
    for (const value of dirtyOrbs) if (value.isConnected) fitOrbValues(value);
    dirtyOrbs.clear();
    const decoration = [...dirtyDecoration]; dirtyDecoration.clear();
    for (const scope of decoration) if (scope.isConnected) { upgradeSigilSvgs(scope); stripNativeTitles(scope); }
    for (const wallet of dirtyWallets) if (wallet.isConnected) syncWalletDisplay(wallet);
    dirtyWallets.clear();
    if (menuDirty) { menuDirty = false; syncMenuCloseEntry(); }
    if (uiDirty) { uiDirty = false; syncUiState(); }
    if (journeyDirty) { journeyDirty = false; syncJourneyCaption(); }
    if (chaptersDirty) { chaptersDirty = false; syncChapterPickers(); }
  };

  // 确保局内进入菜单（含战斗暂停态与波间整装态全部 9 个页签）始终在顶栏右上角提供清晰可见的「返回战场 / 返回营地 / 继续出征」入口
  const syncMenuCloseEntry = () => {
    const isEn = document.documentElement.dataset.uiLang === "en";
    const isTitle = document.documentElement.dataset.forgeaxTitle === "true";
    for (const menu of document.querySelectorAll(".spirit-menu")) {
      const closeBtn = menu.querySelector("[data-menu-close]");
      const dialog = menu.querySelector(".spirit-menu__dialog");
      if (!closeBtn || !dialog) continue;
      const isSettings = menu.classList.contains("spirit-menu--settings");
      const page = menu.dataset.page || "";
      const phase = menu.dataset.phase || "";
      const arsenalTab = menu.querySelector('[data-menu-page="arsenal"]');
      const shopAvailable = !!(arsenalTab && !arsenalTab.disabled && !arsenalTab.hidden);
      const inPrep = !isSettings && !isTitle && phase === "preparation" && shopAvailable;

      if (closeBtn.hidden) {
        closeBtn.hidden = false;
      }

      const textNode = closeBtn.firstChild && closeBtn.firstChild.nodeType === Node.TEXT_NODE
        ? closeBtn.firstChild
        : closeBtn.insertBefore(document.createTextNode(""), closeBtn.firstChild);

      if (inPrep) {
        if (page === "arsenal") {
          if (closeBtn.dataset.prepAction !== "next-wave") closeBtn.dataset.prepAction = "next-wave";
          const targetLabel = isEn ? "Set Out " : "继续出征 ";
          if (textNode.nodeValue !== targetLabel) textNode.nodeValue = targetLabel;
        } else {
          if (closeBtn.dataset.prepAction !== "return-camp") closeBtn.dataset.prepAction = "return-camp";
          const targetLabel = isEn ? "Back to Camp " : "返回营地 ";
          if (textNode.nodeValue !== targetLabel) textNode.nodeValue = targetLabel;
        }
        // 波间整装切换到非行囊页签（本局/天赋/图鉴/词条/设置）时，同步保持底部征途操作栏可见，随时可点「下一关」
        const dock = document.getElementById("expedition-primary-actions");
        if (dock && !dialog.hidden && dock.hidden) {
          dock.hidden = false;
        }
      } else {
        if (closeBtn.dataset.prepAction) delete closeBtn.dataset.prepAction;
      }
    }
  };

  window.addEventListener("click", (e) => {
    const btn = e.target instanceof Element ? e.target.closest(".spirit-menu [data-menu-close]") : null;
    if (!btn) return;
    if (btn.dataset.prepAction === "next-wave") {
      e.preventDefault();
      e.stopImmediatePropagation();
      const nextBtn = document.querySelector(".expedition-dock [data-next-wave]");
      if (nextBtn && !nextBtn.disabled) {
        nextBtn.click();
      } else if (nextBtn) {
        const msgEl = document.querySelector(".reliquary__message[data-arsenal-message]");
        const reason = nextBtn.getAttribute("data-wk-tip") || nextBtn.getAttribute("title") || (nextBtn.textContent || "").trim();
        if (msgEl && reason) msgEl.textContent = reason;
      }
    }
  }, true);

  // 灵石余额与大容量数值显示规范化：将测试存档下 9007199254740991 灵石等超长位数精炼为「999.9万 灵石」或万位计数，防止挤压左栏「渡灵商人 / 征途仓库」标题
  const syncWalletDisplay = (scope = document) => {
    for (const el of within(scope, ".reliquary [data-wallet]")) {
      const raw = (el.textContent || "").trim();
      const m = raw.match(/^(\d{6,})\s*(.*)$/);
      if (!m) continue;
      const num = Number(m[1]);
      // Keep the display source Chinese; the shared i18n observer owns its translation.
      const unit = "灵石";
      if (!Number.isFinite(num)) continue;
      const formatted = num >= 100000000
        ? `9999万+ ${unit}`
        : num >= 100000
          ? `${(num / 10000).toFixed(1)}万 ${unit}`
          : raw;
      if (formatted !== raw) {
        el.setAttribute("title", raw);
        el.textContent = formatted;
      }
    }
  };

  // 剧情主按钮（下一页 / 继续 / 跳过该剧情）：剥离尾随箭头，保持纯文案在对称八角玉牌内严格几何与视觉居中；同时隐藏剧情条内与右上角重复的「往事」按钮
  const syncJourneyCaption = () => {
    const isEn = document.documentElement.dataset.uiLang === "en";
    for (const dup of document.querySelectorAll(".journey-caption [data-narrative-history-open]")) {
      if (!dup.hidden) dup.hidden = true;
    }
    // 序章居中诗句：补偿中文全角句末标点（。！？；，）右侧留白，使墨迹视觉中心与下方「继续」按钮中轴严格对齐
    for (const p of document.querySelectorAll('.journey-caption[data-presentation="prologue"] .journey-caption__card p')) {
      const txt = (p.textContent || "").trim();
      const hasTrailingFullwidthPunct = /[。！？；，、》」』】）]$/.test(txt);
      const targetPad = hasTrailingFullwidthPunct ? "0.66em" : "0px";
      if (p.style.paddingLeft !== targetPad) p.style.setProperty("padding-left", targetPad, "important");
    }
    // 剧情等待读秒：将冗长的「已等待 3 秒，7秒后可跳过」精简为温润简洁的古风读秒「7 秒后可跳过」
    for (const waitEl of document.querySelectorAll(".journey-caption [data-narrative-wait-elapsed]")) {
      const raw = (waitEl.textContent || "").trim();
      const m = raw.match(/(\d+)\s*秒后可跳过/);
      if (m) {
        const cleanWait = `${m[1]} 秒后可跳过`;
        if (raw !== cleanWait) waitEl.textContent = cleanWait;
      }
    }
    for (const btn of document.querySelectorAll(".journey-caption button:not([data-narrative-exit]):not([data-narrative-history-open])")) {
      const existingIcon = btn.querySelector(".journey-caption__btn-icon");
      if (existingIcon) existingIcon.remove();
      if (btn.querySelector(".journey-caption__btn-label")) continue;
      const raw = [...btn.childNodes].map(node => node.nodeType === 3 ? (window.__uiI18n?.sourceText?.(node) ?? node.data) : node.textContent).join("").trim();
      if (!raw) continue;
      const clean = raw.replace(/\s*→\s*$/, "").trim();
      btn.textContent = "";
      const label = document.createElement("span");
      label.className = "journey-caption__btn-label";
      label.textContent = !isEn && (clean === "Next" || clean === "Next Page")
        ? "下一页"
        : !isEn && clean === "继续教学"
          ? "继续"
          : clean;
      btn.appendChild(label);
    }

    // 局内 #play-hud-detail-hint（如飞剑/资源详情框）与 .journey-caption（教学/对话浮层）防重叠：
    // 当 #play-hud-detail-hint 展开且处于局内 HUD 状态时，主动将教学/对话浮层抬高至详情框正上方（间距 12px），彻底杜绝两者叠压遮挡。
    const root = document.documentElement;
    const isMenuOpen = root.hasAttribute("data-fs-ui") || (root.dataset.forgeaxGameMenu && root.dataset.forgeaxGameMenu !== "closed");
    const hudHint = document.getElementById("play-hud-detail-hint");
    const activeCaption = [...document.querySelectorAll('.journey-caption:not([hidden]):not([data-presentation="prologue"])')]
      .find((el) => el.getBoundingClientRect().height > 0);
    if (activeCaption && !isMenuOpen) {
      if (hudHint && !hudHint.hidden && hudHint.getBoundingClientRect().height > 4) {
        const hintRect = hudHint.getBoundingClientRect();
        const capRect = activeCaption.getBoundingClientRect();
        const horizOverlap = hintRect.left < capRect.right + 8 && hintRect.right > capRect.left - 8;
        if (horizOverlap && hintRect.top > 0) {
          const minBottom = Math.max(198, Math.ceil(window.innerHeight - hintRect.top + 12));
          if (activeCaption.style.bottom !== `${minBottom}px`) activeCaption.style.setProperty("bottom", `${minBottom}px`, "important");
        }
      } else if (activeCaption.style.getPropertyPriority("bottom") === "important") {
        activeCaption.style.removeProperty("bottom");
      }
    }
  };

  const isShown = (el) => {
    if (!el || el.hidden || el.closest("[hidden]")) return false;
    const r = el.getBoundingClientRect();
    if (r.width < 8 || r.height < 8) return false;
    const c = getComputedStyle(el);
    return c.display !== "none" && c.visibility !== "hidden" && Number(c.opacity) > 0.05;
  };
  let lastState = "";
  const syncUiState = () => {
    const root = document.documentElement;
    const menu = document.querySelector(".spirit-menu");
    const dialog = document.querySelector(".spirit-menu__dialog");
    const settle = document.querySelector(".wave-settlement");
    const menuAttr = root.dataset.forgeaxGameMenu;
    const fsOn = (menuAttr && menuAttr !== "closed") || isShown(dialog) || isShown(settle);
    if (fsOn) {
      if (!root.hasAttribute("data-fs-ui")) root.setAttribute("data-fs-ui", "");
    } else if (root.hasAttribute("data-fs-ui")) {
      root.removeAttribute("data-fs-ui");
    }

    // 属性与行囊合流：若快捷键等触发了独立的 character 页，自动切回行囊页（行囊右侧已内嵌完整角色属性栏）
    if (menu && menu.dataset.page === "character" && isShown(dialog)) {
      const arsenalTab = menu.querySelector('[data-menu-page="arsenal"]');
      if (arsenalTab && !arsenalTab.disabled) arsenalTab.click();
    }

    const narrative = [...document.querySelectorAll(".journey-caption")]
      .find((caption) => isShown(caption));
    if (narrative) {
      const targetPres = narrative.dataset.presentation || "dialogue";
      if (root.getAttribute("data-narrative-open") !== targetPres) root.setAttribute("data-narrative-open", targetPres);
    } else if (root.hasAttribute("data-narrative-open")) {
      root.removeAttribute("data-narrative-open");
    }

    const hud = document.querySelector(".play-hud");
    const dock = document.querySelector(".play-hud-dock");
    const hudOn = !fsOn && root.dataset.forgeaxTitle !== "true" && (isShown(hud) || (isShown(dock) && dock.getBoundingClientRect().height > 40));
    if (hudOn) {
      if (!root.hasAttribute("data-play-hud")) root.setAttribute("data-play-hud", "");
    } else if (root.hasAttribute("data-play-hud")) {
      root.removeAttribute("data-play-hud");
    }

    const cap = document.querySelector(".journey-caption:not([hidden])");
    const capH = cap ? Math.round(cap.getBoundingClientRect().height) : 0;
    const bagGrid = document.querySelector('.reliquary__grid[data-grid="backpack"]');
    const bagW = bagGrid ? Math.round(bagGrid.getBoundingClientRect().width) : 0;
    const nextState = `${fsOn ? 1 : 0}:${hudOn ? 1 : 0}:${narrative ? 1 : 0}:${menuAttr || ""}:${capH}:${bagW}`;
    if (nextState !== lastState) {
      lastState = nextState;
      window.dispatchEvent(new Event("resize"));
      setTimeout(() => window.dispatchEvent(new Event("resize")), 60);
      setTimeout(() => window.dispatchEvent(new Event("resize")), 220);
    }
  };

  // 命/灵球数值位数变多时按比例缩字，保持在内圈里
  const fitOrbValues = (changedValue) => {
    for (const value of [changedValue]) {
      const orb = value.closest(".play-hud-orb");
      if (!orb) continue;
      const key = `${value.textContent}|${orb.clientWidth}|${document.documentElement.dataset.uiLang || ""}`;
      if (value.__fitKey === key) continue;
      value.__fitKey = key;
      value.style.removeProperty("font-size");
      const limit = orb.clientWidth * 0.78;
      if (value.scrollWidth > limit) {
        const size = parseFloat(getComputedStyle(value).fontSize) * (limit / value.scrollWidth);
        value.style.setProperty("font-size", `${size.toFixed(2)}px`, "important");
      }
    }
  };

  // 《黑神话：悟空》全界面图标统一管线（100% 统一为图 1 角色属性栏的「极简宣白金石水墨拓片实心器物」风格）：
  // 将百物图鉴 (.effect-compendium__icon)、词条池 (.affix-settings__sigil)、境界天赋树 (.talent-panel__node)、
  // 器物检视卡 (.icon-stat__icon)、本局总览等所有界面内的程序化折线 <svg viewBox="0 0 32 32">，
  // 全部映射为与属性栏同源的 27 枚宣白水墨拓片器物图标 (data-wukong-icon)。
  const WUKONG_POOL = [
    "atk", "def", "hp", "mp", "pact", "fly", "dew", "longevity",
    "spell", "curse", "res", "move", "qiregen", "fortune", "crit", "haste",
    "fire", "water", "earth", "metal", "lightning", "ice",
    "orb", "wings", "forge", "ward", "reap", "sprout",
    "slash", "cyclone", "drop", "heart", "gate", "crown",
  ];

  const STAT_KEY_MAP = {
    "current-dps": "atk",
    "item-dps": "atk",
    physicalPower: "atk",
    "physical-power": "atk",
    survival: "def",
    "item-survival": "def",
    armor: "def",
    "physical-reduction": "def",
    damageTakenMultiplier: "def",
    staggerGuard: "def",
    "impact-guard": "def",
    "blade-integrity": "def",
    weaponHealthCapacity: "def",
    maxHealth: "hp",
    "max-health": "hp",
    regeneration: "hp",
    healthRegen: "hp",
    "repair-reception": "hp",
    weaponRepairReceived: "hp",
    maxQi: "mp",
    "owner-qi-capacity": "mp",
    "qi-capacity": "mp",
    weaponQiCapacity: "mp",
    weaponQiRechargeRate: "mp",
    "qi-recharge": "longevity",
    weaponQiEfficiency: "longevity",
    "qi-efficiency": "longevity",
    "bond-recognition": "pact",
    pattern: "fly",
    "material-points": "forge",
    "forge-progress": "forge",
    "inscription-toggle": "forge",
    "material-level": "orb",
    spellPower: "spell",
    "spell-power": "spell",
    cursePower: "curse",
    spiritResistance: "res",
    "spirit-resistance": "res",
    "spell-reduction": "res",
    areaScale: "res",
    area: "res",
    auraStrength: "res",
    rangeScale: "fly",
    range: "fly",
    projectileSpeedScale: "fly",
    "projectile-speed": "fly",
    moveSpeed: "move",
    "move-speed": "move",
    rollRecoveryRate: "move",
    "quick-withdrawal": "move",
    spellMovePenaltyReduction: "move",
    spellMovementPenaltyReduction: "move",
    "mobile-casting": "move",
    waterSlowResistance: "drop",
    "frost-ward": "drop",
    "qi-recovery": "qiregen",
    qiRecoveryBonus: "qiregen",
    "owner-qi-recovery": "qiregen",
    weaponTurningEfficiency: "qiregen",
    "turning-efficiency": "qiregen",
    fortune: "fortune",
    critChance: "crit",
    "critical-chance": "crit",
    critMultiplier: "crit",
    "critical-power": "crit",
    staggerPower: "forge",
    stagger: "forge",
    actionRate: "haste",
    "action-haste": "haste",
    physicalAttackSpeed: "haste",
    spellCastSpeed: "haste",
    artifactDriveSpeed: "haste",
    durationScale: "haste",
    duration: "haste",
    hitRecoverySpeed: "heart",
    "hit-recovery": "heart",
  };

  const pickWukongIconKey = (svg) => {
    // 1) 优先匹配精确的 stat 属性键
    const statHost = svg.closest("[data-character-stat], [data-detail-key], [data-numerical], [data-preparation-metric]");
    if (statHost) {
      const k =
        statHost.getAttribute("data-character-stat") ||
        statHost.getAttribute("data-detail-key") ||
        statHost.getAttribute("data-numerical") ||
        statHost.getAttribute("data-preparation-metric") ||
        "";
      if (STAT_KEY_MAP[k]) return STAT_KEY_MAP[k];
      if (/fire/i.test(k)) return /resist/i.test(k) ? "ward" : "fire";
      if (/water/i.test(k)) return /resist/i.test(k) ? "ward" : "water";
      if (/wood/i.test(k)) return /resist/i.test(k) ? "ward" : "sprout";
      if (/metal/i.test(k)) return /resist/i.test(k) ? "ward" : "metal";
      if (/earth/i.test(k)) return /resist/i.test(k) ? "ward" : "earth";
    }

    // 2) 提取所在卡片 / 单元格 / 按钮的语义文本
    const card =
      svg.closest(
        ".effect-compendium__item, .gameplay-compendium__item, .affix-settings__card, .affix-settings__modal, .talent-panel__detail-title, .talent-panel__effect, .icon-stat, .preparation-character__row, button, li, article, div"
      ) || svg.parentElement;
    const text = (
      (card && (card.getAttribute("aria-label") || card.getAttribute("data-detail") || card.textContent)) ||
      ""
    ).trim();

    if (text) {
      if (/濒死|斩杀|收割|血刃|泣血/.test(text)) return "reap";
      if (/之翼|双翼|羽|展斩|飞羽/.test(text)) return "wings";
      if (/旋风|龙卷|风暴|狂风|气旋|借流/.test(text)) return "cyclone";
      if (/波斩|弧|月牙|弯刀|索敌|形收/.test(text)) return "slash";
      if (/导电|避雷|雷|电|霆/.test(text)) return "lightning";
      if (/沧冰|寒|冰|霜|雪|冻/.test(text)) return "ice";
      if (/避水珠|精魄|灵珠|水珠|垂露|凝露|饮露/.test(text)) return "drop";
      if (/避火|避金|避水|绝相|抵抗|抗性|减伤|护盾|障/.test(text)) return "ward";
      if (/百炼|锻造|铸|锤|铁砧|冲击|击退/.test(text)) return "forge";
      if (/法球|暗核|聚能|玄珠|星核|宝珠/.test(text)) return "orb";
      if (/暗能充能|回灵|抱元|吞吐|气海|充能/.test(text)) return "qiregen";
      if (/消散|蚀|咒|骨|煞|鬼|魔|毒/.test(text)) return "curse";
      if (/百川归海|运|金蟾|拾珍|财|禄|赐/.test(text)) return "fortune";
      if (/八风不动|镇岳|坤|矿砂|土|山|岩|石|坠/.test(text)) return "earth";
      if (/烛心|火|焰|焚|炎|灼|烈|丹阳/.test(text)) return "fire";
      if (/沧溟法域|星海|八卦|太极|法域|阵盘/.test(text)) return "res";
      if (/碧水|沧涌|潮|水|浪|流|渊|海|渠/.test(text)) return "water";
      if (/藏灵|载灵|蕴灵|灵力|纳气|聚气|葫芦/.test(text)) return "mp";
      if (/气血|回血|生命|归元|净瓶|愈|疗/.test(text)) return "hp";
      if (/竹|木|青|藤|林|叶/.test(text)) return "dew";
      if (/萌|生机|春|草|植|根/.test(text)) return "sprout";
      if (/贯穿|会心|暴击|破绽|穿刺|破甲/.test(text)) return "crit";
      if (/御剑|飞剑|齐射|剑阵|远御|疾射|返航/.test(text)) return "fly";
      if (/刃芯|节刃|金行|锐|锋|金/.test(text)) return "metal";
      if (/出鞘|沉刃|物理|剑|斩|攻|刃/.test(text)) return "atk";
      if (/固本|护心|定魄|心御|受击/.test(text)) return "heart";
      if (/护甲|守御|卸势|防|盾|甲/.test(text)) return "def";
      if (/术法|法威|钟|音|鸣|吟/.test(text)) return "spell";
      if (/身法|移动|轻撤|行咒|翻滚|步|履/.test(text)) return "move";
      if (/行动|速度|持续|绵延|冷却|瞬|疾/.test(text)) return "haste";
      if (/概念机制|契|卷|简|书|律/.test(text)) return "pact";
      if (/长生|寿|仙|松/.test(text)) return "longevity";
      if (/首领|精英|王|冠|统御|宗/.test(text)) return "crown";
      if (/门|阙|城|庭|台/.test(text)) return "gate";
    }

    // 3) 针对无文字的节点（如境界天赋树菱形节点 .talent-panel__node），根据 SVG 折线几何特征精准还原器物
    const ptsAll = Array.from(svg.querySelectorAll("polyline, path"))
      .map((el) => el.getAttribute("points") || el.getAttribute("d") || "")
      .join(";");

    if (/10,9 22,9 22,20 16,25 10,20|M4 4 L12 2 L20 4 V12/.test(ptsAll)) return "def"; // 护甲盾牌
    if (/M9 2 L15 6 L12 10 L6 6/.test(ptsAll)) return "forge"; // 百炼锻造铁砧
    if (/M5 20 L9 16 M6 13 L12 19/.test(ptsAll)) return "atk"; // 标准攻击飞剑
    if (/M12 19 V11 M5 7 V11 H19 V7/.test(ptsAll)) return "orb"; // 形态/天赋分支树
    if (/16,23 16,12 11,10 10,14 16,18|16,21 16,11/.test(ptsAll)) return "sprout"; // 灵植幼苗
    if (/12,10 20,10 19,14 23,19 21,24/.test(ptsAll)) return "mp"; // 灵瓶/葫芦
    if (/16,24 16,12 12,9/.test(ptsAll)) return "dew"; // 竹木
    if (/11,23 9,18 14,13 15,8/.test(ptsAll)) return "fire"; // 火焰
    if (/10,13 13,10 17,14 21,11/.test(ptsAll)) return "water"; // 水波
    if (/9,22 23,22.*11,18 21,18/.test(ptsAll)) return "earth"; // 土山
    if (/9,11 15,16 9,21/.test(ptsAll)) return "haste"; // 迅捷
    if (/8,13 8,7 13,14 16,6 19,14 24,7/.test(ptsAll)) return "crown"; // 王冠

    // 天赋树节点特定图案识别
    if (svg.closest(".talent-panel__node")) {
      const node = svg.closest(".talent-panel__node");
      const allNodes = Array.from(document.querySelectorAll(".talent-panel__node"));
      const idx = allNodes.indexOf(node);
      const talentPalette = [
        "crown", "def", "move", "heart", "sprout",
        "gate", "dew", "res", "orb", "sprout", "earth",
        "fly", "atk", "spell", "longevity", "crit"
      ];
      if (idx >= 0) return talentPalette[idx % talentPalette.length];
    }

    // 4) 哈希兜底：确保任何未知自定义折线也稳定映射为宣白水墨拓片器物
    let hash = 0;
    const seed = ptsAll + "|" + text;
    for (let i = 0; i < seed.length; i++) {
      hash = (hash * 31 + seed.charCodeAt(i)) >>> 0;
    }
    return WUKONG_POOL[hash % WUKONG_POOL.length];
  };

  const WUKONG_SVG_INNER = {"atk": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M56 8 C56.5 14 53.5 20.5 48.5 25.5 L28.5 45.5 L34 51 L29.5 55.5 L22.5 48.5 L14 57 C12 58.8 9 58.8 7.2 57 C5.4 55.2 5.4 52.2 7.2 50.4 L15.5 42 L8.5 35 L13 30.5 L18.5 36 L38.5 16 C43.5 11 50 7.5 56 8 Z\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M48 32 C43.5 44 33 52 21 54.5 C29.5 49 37 41 41.5 30 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.8\" d=\"M50 14 L24.5 39.5\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"20.5\" cy=\"43.5\" r=\"2.4\"/>", "def": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M27 7 L47 12 C52 13.5 55 18.5 53.5 24 L45 50 C43 55.5 37.5 58.5 31.5 57 L15.5 52 C10 50.2 7.5 44.5 9.5 39 L18 13 C19.8 8.2 23.2 6 27 7 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M27.5 12.5 L44.5 17 C47.5 18 49 21 48 24.5 L40.5 47 C39.2 50.5 35.8 52.2 32 51 L18.5 46.8 C15.2 45.6 13.8 42.2 15 38.8 L22.5 16.5 C23.5 13.5 25.5 12 27.5 12.5 Z\"/>\n  <path fill=\"#171512\" stroke=\"none\" d=\"M31 23 C25.5 24 22.5 29.5 24 35 C25.5 40.5 31 43.5 36.5 42 C40.5 40.8 42.5 36.8 41 33 C39.8 29.8 36.2 28.5 33.5 29.8 C31.5 30.8 30.8 33.2 32 34.8 C29.5 34.5 28.2 31.8 29.5 29.2 C31 26.2 35 25.2 38.5 27 C36.5 23.8 33.8 22.5 31 23 Z\"/>", "hp": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M34 11 C40 6 48 6 53 10 C47 14 40 15 34 13 Z\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M29 12 C24 8 18 8 14 11 C19 14 24 14.5 29 13.5 Z\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M25 12 L39 12 C40 14 39.5 16.5 37.5 18 C36 20 36 25 38 28.5 C46 33.5 50 41.5 48.5 49.5 C47 55.5 41 58.5 32 58.5 C23 58.5 17 55.5 15.5 49.5 C14 41.5 18 33.5 26 28.5 C28 25 28 20 26.5 18 C24.5 16.5 24 14 25 12 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M26.5 16.5 L37.5 16.5 M27 24.5 L37 24.5\"/>\n  <path fill=\"#171512\" stroke=\"none\" d=\"M19.5 43.5 C23.5 40.5 28 41.5 32 43.8 C36 46 40.5 46 44.5 43.5 C45 48.5 42.5 53.2 37.5 54.5 C34 55.4 30 55.4 26.5 54.5 C21.5 53.2 19 48.5 19.5 43.5 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.2\" d=\"M22 37.5 C25.5 35.5 29 36.2 32.5 38\"/>", "mp": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M31 6 C33 6 35 8 34 12 L30 12 C29.5 9 30 6 31 6 Z\"/>\n  <path fill=\"none\" stroke=\"#e2dac7\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M34 10 C40 8 45 11 44 16 C43 19 39 19 38 16\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 11.5 C38.5 11.5 43 16 42.5 21.5 C42 25.5 39 28.5 36.5 30 C44.5 33 49.5 40 48.5 48 C47.5 54.8 41 58.5 32 58.5 C23 58.5 16.5 54.8 15.5 48 C14.5 40 19.5 33 27.5 30 C25 28.5 22 25.5 21.5 21.5 C21 16 25.5 11.5 32 11.5 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"3\" d=\"M26 29.8 Q32 32 38 29.8\"/>\n  <path fill=\"#171512\" stroke=\"none\" d=\"M20 45 C23 41 29 41.5 33.5 44 C37.5 46.2 41.5 45.2 44.5 42.5 C45 48.5 41.5 53.5 35.5 54.5 C33 55 31 55 28.5 54.5 C22.5 53.5 19.2 49.5 20 45 Z\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"21\" r=\"2.8\"/>", "pact": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 6 C39 6 45 9.5 47 14 L51 17 L48 22 L48 43 L51 47 L46 53 C41 56.5 36.5 58 32 58 C27.5 58 23 56.5 18 53 L13 47 L16 43 L16 22 L13 17 L17 14 C19 9.5 25 6 32 6 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.5\" d=\"M21 15.5 Q32 12.5 43 15.5 M21 48.5 Q32 51.5 43 48.5 M20 20 L20 44 M44 20 L44 44\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"32\" r=\"8.5\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M34.5 26 C30.2 26 27.2 28.8 27.2 32 C27.2 35.2 30.2 38 34.5 38 C31.8 36.5 30.5 34.5 30.5 32 C30.5 29.5 31.8 27.5 34.5 26 Z\"/>\n  <circle fill=\"#e2dac7\" stroke=\"none\" cx=\"35.5\" cy=\"32\" r=\"2.2\"/>", "fly": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M56 8 C56 13 53 18 49 22 L27 44 L31 48 L28 51 L22 45 L15 52 L12 49 L19 42 L13 36 L16 33 L20 37 L42 15 C46 11 51 8 56 8 Z\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M39 10 C39 13.5 37 17 34 20 L18 36 L14 32 L30 16 C33 13 36 10.5 39 10 Z\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M54 25 C54 28.5 52 32 49 35 L33 51 L29 47 L45 31 C48 28 51 25.5 54 25 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" d=\"M49 15 L25 39\"/>", "dew": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M24 8 L32 8 L30 23 L31 25 L29 40 L30 42 L28 56 L20 56 L22 42 L21 40 L23 25 L22 23 Z\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M31 18 C39 15 48 17 55 23 C46 25 38 24 31 20 Z\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M30 29 C38 28 46 31 52 37 C44 37.5 36 35 30 31 Z\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M47 41 C47 41 53 48 51 53 C49.5 56.5 44.5 56.5 43 53 C41 48 47 41 47 41 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.8\" d=\"M20 24 L32 24 M19 41 L31 41\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"47\" cy=\"51.5\" r=\"2.2\"/>", "longevity": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 7 C39 7 44 11 44 16 C48 16.5 51 19.5 50 23.5 C49 27 44.5 28.5 39 28.5 L35 28.5 L35 32 L29 32 L29 28.5 L25 28.5 C19.5 28.5 15 27 14 23.5 C13 19.5 16 16.5 20 16 C20 11 25 7 32 7 Z\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M12 31 L18 31 L19 34 L45 34 L46 31 L52 31 L50 42 C48.5 47 44 50 38 51 L41 58 L36 58 L33.5 51.5 L30.5 51.5 L28 58 L23 58 L26 51 C20 50 15.5 47 14 42 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.5\" d=\"M24 19 C27 15 37 15 40 19\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"22\" r=\"2.5\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.8\" d=\"M21 41 Q32 46 43 41\"/>", "spell": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 7 C36.5 7 39.5 10 39.5 14 L42 16 C45.5 21 47.5 31 49.5 45 L53 49 L52 53 L35.5 53 C35.5 55.8 34 57.5 32 57.5 C30 57.5 28.5 55.8 28.5 53 L12 53 L11 49 L14.5 45 C16.5 31 18.5 21 22 16 L24.5 14 C24.5 10 27.5 7 32 7 Z\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"12.5\" r=\"2.4\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.5\" d=\"M21 20.5 Q32 22.5 43 20.5\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"34\" r=\"8.2\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M34.5 28.5 C30.5 28.5 27.8 31.2 27.8 34.5 C27.8 37.8 30.5 40.5 34.5 40.5 C32 39 30.8 37 30.8 34.5 C30.8 32 32 30 34.5 28.5 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M15.5 47.5 L48.5 47.5\"/>", "curse": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M16 7 L48 7 L53 14 L49 52 L32 58 L15 52 L11 14 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" d=\"M19 12 L45 12 L44 48 L32 53 L20 48 Z\"/>\n  <polygon fill=\"#171512\" stroke=\"none\" points=\"32,16 39,25 32,34 25,25\"/>\n  <circle fill=\"#e2dac7\" stroke=\"none\" cx=\"32\" cy=\"25\" r=\"2.4\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M23 39 L41 39 M26 44.5 L38 44.5 M32 34 L32 47\"/>", "res": "<polygon fill=\"#e2dac7\" stroke=\"none\" points=\"22,7 42,7 57,22 57,42 42,57 22,57 7,42 7,22\"/>\n  <polygon fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.2\" points=\"24,12 40,12 52,24 52,40 40,52 24,52 12,40 12,24\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" d=\"M28 9.5 L36 9.5 M28 54.5 L36 54.5 M9.5 28 L9.5 36 M54.5 28 L54.5 36\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"32\" r=\"13\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 21 A11 11 0 0 1 32 43 A5.5 5.5 0 0 1 32 32 A5.5 5.5 0 0 0 32 21 Z\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"26.5\" r=\"2.2\"/>\n  <circle fill=\"#e2dac7\" stroke=\"none\" cx=\"32\" cy=\"37.5\" r=\"2.2\"/>", "move": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M36 24 C41 15 49 10 57 9 C55 15 51 20 46 23 C51 21 55 20 58 21 C54 26 48 29 42 31 L38 41 C33 46 25 51 15 53 C10 54 6.5 51.5 7 47.5 C7.5 44 12 41.5 18 39.5 L28 31 L27 22 C31 20 34 21 36 24 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.5\" d=\"M34 29 C39 22 45 17 51 14 M36 33 C41 28 46 25 51 23\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M10.5 49.5 C19 48.5 28 44 35.5 38.5\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"28\" cy=\"37\" r=\"2.2\"/>", "qiregen": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 7 C46 7 57 18 57 32 C57 46 46 57 32 57 C18 57 7 46 7 32 C7 18 18 7 32 7 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"3.2\" d=\"M32 13 C42.5 13 51 21.5 51 32 C51 39.5 45.5 45 38.5 45 C33 45 29 41 29 36 C29 32 32 29.5 35 29.5\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"3.2\" d=\"M32 51 C21.5 51 13 42.5 13 32 C13 24.5 18.5 19 25.5 19 C31 19 35 23 35 28\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"32\" r=\"5\"/>\n  <circle fill=\"#e2dac7\" stroke=\"none\" cx=\"32\" cy=\"32\" r=\"2\"/>", "fortune": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M23 11 C26 11 28.5 13 29.5 15 C31 14.5 33 14.5 34.5 15 C35.5 13 38 11 41 11 C44.5 11 47 14 46.5 17.5 C51.5 21.5 54.5 28 53.5 35.5 C56.5 38.5 57 44 54 48 L56 52 L45 53 L42 49 C38.5 51 25.5 51 22 49 L19 53 L8 52 L10 48 C7 44 7.5 38.5 10.5 35.5 C9.5 28 12.5 21.5 17.5 17.5 C17 14 19.5 11 23 11 Z\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"23.5\" cy=\"16\" r=\"2.3\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"40.5\" cy=\"16\" r=\"2.3\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" d=\"M22 23.5 Q32 20.5 42 23.5\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"38.5\" r=\"9.5\"/>\n  <rect fill=\"#e2dac7\" stroke=\"none\" x=\"28.5\" y=\"35\" width=\"7\" height=\"7\" rx=\"1\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M15 35 C18 37 20 40 21 44 M49 35 C46 37 44 40 43 44\"/>", "crit": "<circle fill=\"#e2dac7\" stroke=\"none\" cx=\"32\" cy=\"32\" r=\"23\"/>\n  <path fill=\"#171512\" stroke=\"none\" d=\"M32 13 C23 13 16 19.5 16 28 C16 22.5 22 18.5 28.5 19.5 C34.5 20.5 38 25.5 36.5 31 C39.5 25.5 38 13 32 13 Z\"/>\n  <path fill=\"#171512\" stroke=\"none\" d=\"M48.5 41.5 C53 33.5 51 24 43.5 19.8 C48.2 22.5 48.8 29.8 44.5 34.8 C40.5 39.5 34.5 40 30.5 36 C33.8 41.5 44 46.5 48.5 41.5 Z\"/>\n  <path fill=\"#171512\" stroke=\"none\" d=\"M15.5 41.5 C20 49.5 29.5 52.5 37 48.2 C31.5 50.2 25.5 46.8 23.5 40.5 C21.5 34.5 24 29 29 27.5 C22.5 27.5 12.5 36 15.5 41.5 Z\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"32\" r=\"4.8\"/>", "haste": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M16 9 L48 9 C50 9 51 11 50 13 L46 15 C45 22 40.5 28 35.5 32 C40.5 36 45 42 46 49 L50 51 C51 53 50 55 48 55 L16 55 C14 55 13 53 14 51 L18 49 C19 42 23.5 36 28.5 32 C23.5 28 19 22 18 15 L14 13 C13 11 14 9 16 9 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M19 14 L45 14 M19 50 L45 50\"/>\n  <path fill=\"#171512\" stroke=\"none\" d=\"M24 19 L40 19 C38.5 24 35 27.5 32 29.5 C29 27.5 25.5 24 24 19 Z\"/>\n  <path fill=\"#171512\" stroke=\"none\" d=\"M32 35.5 C34.5 39 38.5 43.5 40.5 46.5 L23.5 46.5 C25.5 43.5 29.5 39 32 35.5 Z\"/>", "fire": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M33 6 C37 15 44 21 43 31 C47 28 50 23 50 18 C56 26 57 38 50 47 C45 53.5 38.5 57 32 57 C25.5 57 19 53.5 14 47 C8 39 9 27 16 19 C15.5 24 18 28.5 22 31 C20 20 26 12 33 6 Z\"/>\n  <path fill=\"#171512\" stroke=\"none\" d=\"M32 27 C36 33 39 38 37.5 44 C36.5 48 34.5 50.5 32 50.5 C29.5 50.5 27.5 48 26.5 44 C25 38 28 33 32 27 Z\"/>", "water": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M36 9 C22 10 10 21 10 35 C10 48 20 57 33 57 C46 57 55 48 55 36 C55 27 48 21 40 21 C33 21 28 26 28 32 C28 37 32 40 36 39 C33 42 27 41 25 36 C23 30 27 22 35 20 C41 18.5 46 21 49 25 C47 15 42 10 36 9 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.8\" d=\"M16 41 C20 49 28 52 37 50 C44 48.5 49 43 49 36\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"35.5\" cy=\"32\" r=\"3.2\"/>", "earth": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 8 L44 30 L50 22 L58 51 L6 51 L14 22 L20 30 Z\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M10 53 L54 53 L51 58 L13 58 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.8\" d=\"M32 16 L27 34 L33 43 M20 34 L16 46 M44 34 L48 46\"/>", "metal": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 5 L41 23 L59 32 L41 41 L32 59 L23 41 L5 32 L23 23 Z\"/>\n  <polygon fill=\"#171512\" stroke=\"none\" points=\"32,19 39,32 32,45 25,32\"/>\n  <circle fill=\"#e2dac7\" stroke=\"none\" cx=\"32\" cy=\"32\" r=\"3\"/>", "lightning": "<polygon fill=\"#e2dac7\" stroke=\"none\" points=\"38,6 15,34 31,34 23,58 50,27 33,27\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" d=\"M33 15 L22 31 L33 31 L28 47\"/>", "ice": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 6 L37 19 L50 14 L45 27 L58 32 L45 37 L50 50 L37 45 L32 58 L27 45 L14 50 L19 37 L6 32 L19 27 L14 14 L27 19 Z\"/>\n  <polygon fill=\"#171512\" stroke=\"none\" points=\"32,20 40,32 32,44 24,32\"/>\n  <circle fill=\"#e2dac7\" stroke=\"none\" cx=\"32\" cy=\"32\" r=\"3.2\"/>", "orb": "<circle fill=\"#e2dac7\" stroke=\"none\" cx=\"32\" cy=\"32\" r=\"22\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.8\" d=\"M16 26 C24 18 40 18 48 26 M16 38 C24 46 40 46 48 38\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"32\" r=\"6\"/>\n  <circle fill=\"#e2dac7\" stroke=\"none\" cx=\"30\" cy=\"30\" r=\"2\"/>", "wings": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M30 34 C24 20 14 12 6 10 C7 20 12 28 20 33 C13 32 8 34 7 38 C13 42 21 43 28 41 L26 50 L32 46 L38 50 L36 41 C43 43 51 42 57 38 C56 34 51 32 44 33 C52 28 57 20 58 10 C50 12 40 20 34 34 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" d=\"M27 35 C20 27 14 21 10 16 M37 35 C44 27 50 21 54 16\"/>", "forge": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M24 8 L40 8 L42 13 L49 13 C53 13 55 16 54 20 L51 25 L47 24 C49 30 49 38 45 44 L49 52 L43 56 L38 48 C34 49.5 30 49.5 26 48 L21 56 L15 52 L19 44 C15 38 15 30 17 24 L13 25 L10 20 C9 16 11 13 15 13 L22 13 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M19 18.5 Q32 21 45 18.5 M21 44.5 Q32 47 43 44.5\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"32\" r=\"8.5\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 25.5 C35.5 28.5 37 32 35.5 35.5 C34.5 37.5 33.2 38.5 32 38.5 C30.8 38.5 29.5 37.5 28.5 35.5 C27 32 28.5 28.5 32 25.5 Z\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"34\" r=\"2\"/>", "ward": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 7 L53 15 L51 36 C49 47 41 54 32 58 C23 54 15 47 13 36 L11 15 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M32 13 L47 19 L45.5 35 C44 43 38.5 48.5 32 52 C25.5 48.5 20 43 18.5 35 L17 19 Z\"/>\n  <polygon fill=\"#171512\" stroke=\"none\" points=\"32,21 38,32 32,43 26,32\"/>", "reap": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M48 10 C30 8 12 18 10 36 C17 24 31 19 43 22 L18 54 L24 58 L50 24 C53 20 53 13 48 10 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" d=\"M40 16 C28 15 18 21 14 31\"/>", "sprout": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 56 L32 28 C32 17 42 10 54 12 C52 24 43 31 32 31 M32 36 C22 36 13 29 11 18 C22 16 32 23 32 34\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M29 26 L35 26 L35 56 L29 56 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" d=\"M34 26 C40 22 45 19 49 16 M30 30 C25 26 20 23 16 21\"/>", "slash": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M52 10 C32 12 14 28 10 50 C22 44 38 28 52 10 Z\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M56 22 C42 25 28 37 24 54 C34 48 46 36 56 22 Z\"/>", "cyclone": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M10 16 C24 10 44 10 54 18 C48 23 36 24 22 23 C36 25 50 28 52 34 C46 39 34 40 20 39 C32 41 44 43 44 48 C40 53 30 55 20 55 C26 51 32 49 34 46 C22 46 14 43 13 37 C18 33 28 32 38 32 C24 31 12 27 10 16 Z\"/>", "drop": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 7 C32 7 51 28 51 41 C51 51.5 42.5 58 32 58 C21.5 58 13 51.5 13 41 C13 28 32 7 32 7 Z\"/>\n  <path fill=\"#171512\" stroke=\"none\" d=\"M24 36 C21 43 25 50 33 50 C39 50 43 46 43 41 C40 45 33 46 28 43 C25 41 24 38.5 24 36 Z\"/>", "heart": "<polygon fill=\"#e2dac7\" stroke=\"none\" points=\"23,6 41,6 56,21 56,43 41,58 23,58 8,43 8,21\"/>\n  <polygon fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" points=\"25,11 39,11 51,23 51,41 39,53 25,53 13,41 13,23\"/>\n  <path fill=\"#171512\" stroke=\"none\" d=\"M32 45 C32 45 19 35.5 19 26 C19 21 22.8 17.5 27 17.5 C29.8 17.5 32 19.5 32 22 C32 19.5 34.2 17.5 37 17.5 C41.2 17.5 45 21 45 26 C45 35.5 32 45 32 45 Z\"/>\n  <polygon fill=\"#e2dac7\" stroke=\"none\" points=\"32,24 36.5,29.5 32,35 27.5,29.5\"/>", "gate": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M6 18 C18 14 46 14 58 18 L54 25 L49 25 L49 54 L41 54 L41 25 L23 25 L23 54 L15 54 L15 25 L10 25 Z\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M12 33 L52 33 L52 38 L12 38 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" d=\"M14 21 L50 21\"/>", "crown": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M10 46 L8 20 L21 30 L32 12 L43 30 L56 20 L54 46 Z M12 49 L52 49 L50 55 L14 55 Z\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"34\" r=\"3.8\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M15 42 L49 42\"/>", "tease": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 7 C36.5 7 39.5 10 39.5 14 L42 16 C45.5 21 47.5 30 49.5 43 L53 47 L51.5 51 L36.5 51 C36 55 34.2 57.5 32 57.5 C29.8 57.5 28 55 27.5 51 L12.5 51 L11 47 L14.5 43 C16.5 30 18.5 21 22 16 L24.5 14 C24.5 10 27.5 7 32 7 Z\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"12.5\" r=\"2.3\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.5\" d=\"M21 20 Q32 22.5 43 20 M16 46 L48 46\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"33\" r=\"8.2\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M27.5 31.5 C29.5 28.5 34.5 28.5 36.5 31.5 C34.5 30.2 29.5 30.2 27.5 31.5 Z M28 35 C30 37.8 34 37.8 36 35 C34 36.2 30 36.2 28 35 Z\"/>\n  <circle fill=\"#e2dac7\" stroke=\"none\" cx=\"32\" cy=\"33\" r=\"2.1\"/>", "spar": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 8 C37 8 41.5 10.5 44 14 L53 10 L49 19 C51.5 23 52.5 28 52 33.5 C51 43 44 51 35 55.5 L32 57.5 L29 55.5 C20 51 13 43 12 33.5 C11.5 28 12.5 23 15 19 L11 10 L20 14 C22.5 10.5 27 8 32 8 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.5\" d=\"M21 17.5 Q32 14.5 43 17.5 M20 45.5 Q32 49.5 44 45.5\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"32\" r=\"8.5\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M27 27 L37 37 M37 27 L27 37\"/>\n  <polygon fill=\"#e2dac7\" stroke=\"none\" points=\"32,25.5 34.5,29.5 38.5,32 34.5,34.5 32,38.5 29.5,34.5 25.5,32 29.5,29.5\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"32\" r=\"2.2\"/>", "mind": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 7 C37 7 41 9.5 43 13 C47 13.5 50.5 16.5 51 20.5 C54.5 23 57 27 57 32 C57 37 54.5 41 51 43.5 C50.5 47.5 47 50.5 43 51 C41 54.5 37 57 32 57 C27 57 23 54.5 21 51 C17 50.5 13.5 47.5 13 43.5 C9.5 41 7 37 7 32 C7 27 9.5 23 13 20.5 C13.5 16.5 17 13.5 21 13 C23 9.5 27 7 32 7 Z\"/>\n  <circle fill=\"none\" stroke=\"#171512\" stroke-width=\"2.4\" cx=\"32\" cy=\"32\" r=\"15.5\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"32\" r=\"8.5\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M34.5 26 C30.2 26 27.2 28.8 27.2 32 C27.2 35.2 30.2 38 34.5 38 C31.8 36.5 30.5 34.5 30.5 32 C30.5 29.5 31.8 27.5 34.5 26 Z\"/>\n  <circle fill=\"#e2dac7\" stroke=\"none\" cx=\"35.5\" cy=\"32\" r=\"2.2\"/>"};
  const SLOT_SVG_INNER = {"0": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M14 39 L6 35 L8 31 L15 34 Z M50 39 L58 35 L56 31 L49 34 Z\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M16 49 C14 44 13 36 14 27 C14.5 21 17.5 17 20.5 18 C22.5 18.8 23.5 23 25 25 C26.2 15 28.8 8 32 8 C35.2 8 37.8 15 39 25 C40.5 23 41.5 18.8 43.5 18 C46.5 17 49.5 21 50 27 C51 36 50 44 48 49 C49.5 50.5 50 53.5 48 55 C39 52.5 25 52.5 16 55 C14 53.5 14.5 50.5 16 49 Z\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"24\" r=\"3.4\"/>\n  <path fill=\"#171512\" stroke=\"none\" d=\"M24.5 28.5 C26.8 34.5 37.2 34.5 39.5 28.5 C37 31.5 27 31.5 24.5 28.5 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" d=\"M21 24 L22.5 37 M43 24 L41.5 37\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"3.2\" d=\"M17.5 43.5 Q32 40.5 46.5 43.5\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" d=\"M18 49.5 Q32 47 46 49.5\"/>", "1": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M22 10 C25 13.5 39 13.5 42 10 L55 16 C57 21 55 28 50 30 L46 27 L45 41 L49 52 C42 56.5 22 56.5 15 52 L19 41 L18 27 L14 30 C9 28 7 21 9 16 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.8\" d=\"M21 13.5 Q32 19.5 43 13.5\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" d=\"M18 26 L21 15 M46 26 L43 15\"/>\n  <path fill=\"#171512\" stroke=\"none\" d=\"M32 23 C26.5 23 22.5 27 22.5 32 C22.5 37 26.5 40.5 31.5 40.5 C35.5 40.5 38.5 38 38.5 34.5 C38.5 31.5 36.2 29.5 33.5 29.5 C31.2 29.5 29.8 31 29.8 32.8 C29.8 34.2 31 35 32.2 34.8 C30.5 36.2 27.8 35 27.8 32.2 C27.8 29 30.5 26.8 34 26.8 C37.8 26.8 40.8 29.8 40.8 33.8 C40.8 39 36.5 42.5 31.5 42.5 C25 42.5 20 37.8 20 32 C20 26.2 25.2 21.5 32 21.5 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.8\" d=\"M19.5 46 Q32 49.5 44.5 46\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.2\" d=\"M32 47.5 L32 54\"/>", "2": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M8 22 C18 16 46 16 56 22 L54 36 C49 34 45 33.5 42 34 L45 53 L36 56 L34 39 L30 39 L28 56 L19 53 L22 34 C19 33.5 15 34 10 36 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" d=\"M11 25 C20 20.5 44 20.5 53 25\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" d=\"M12 32.5 C20 29 44 29 52 32.5\"/>\n  <circle fill=\"#e2dac7\" stroke=\"none\" cx=\"32\" cy=\"28.5\" r=\"9.5\"/>\n  <circle fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.8\" cx=\"32\" cy=\"28.5\" r=\"7.5\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"32\" cy=\"28.5\" r=\"3.4\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.2\" d=\"M24 38 L22.5 50 M40 38 L41.5 50\"/>", "3": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M13 13 L28 11 L30 48 L22 54 L11 49 Z\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M36 11 L51 13 L53 49 L42 54 L34 48 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M15 19 L27 17.5 M14.5 29 L27.5 27.5 M14 39 L28 37.5\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.2\" d=\"M21 18 L20.5 46\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M37 17.5 L49 19 M36.5 27.5 L49.5 29 M36 37.5 L50 39\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.2\" d=\"M43 18 L43.5 46\"/>", "4": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M20 10 C27 12 36 12 42 10 L40 35 C44 38 50 40 54 39 C57 38.2 58.5 41 57 45 C54.5 51 47 54 36 54 L16 54 C13.5 54 12.5 51 13 47 L16 34 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.8\" d=\"M21.5 16.5 Q31 18.5 39.5 16.5\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M32 18 L30.5 37\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.4\" d=\"M18.5 36 Q28 40 39 36.5\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.8\" d=\"M15 48.5 L48 48.5 C51.5 48.5 53.5 46.5 54.5 43.5\"/>\n  <path fill=\"#171512\" stroke=\"none\" d=\"M25 42.5 C25 39.8 28 38.2 31.5 39.2 C34 40 35 42.5 33 44 C31.5 45 29.2 44.2 29.5 42.5 C28 43.2 26.2 44.2 25 42.5 Z\"/>", "5": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M32 9 C36.5 9 40 12 40 15.5 C43.5 16.2 46 19 45.5 22.5 C45 25.5 42.2 27.2 39.5 27.8 L41 32 L49 32 L54 40 L54 53 C54 54.5 52.8 55.5 51 55.5 L13 55.5 C11.2 55.5 10 54.5 10 53 L10 40 L15 32 L23 32 L24.5 27.8 C21.8 27.2 19 25.5 18.5 22.5 C18 19 20.5 16.2 24 15.5 C24 12 27.5 9 32 9 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M26.5 21.5 Q32 17.5 37.5 21.5\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M24 32 L40 32\"/>\n  <path fill=\"#171512\" stroke=\"none\" d=\"M32 35.5 C27.2 35.5 23.5 38.8 23.5 43 C23.5 47.2 27.2 50.2 31.8 50.2 C35.5 50.2 38.2 48 38.2 45 C38.2 42.4 36.1 40.6 33.6 40.6 C31.5 40.6 30.2 41.9 30.2 43.4 C30.2 44.6 31.2 45.3 32.3 45.1 C30.8 46.3 28.4 45.3 28.4 42.9 C28.4 40.2 30.8 38.3 34 38.3 C37.4 38.3 40.2 40.9 40.2 44.4 C40.2 48.8 36.2 51.8 31.8 51.8 C25.8 51.8 21.2 47.8 21.2 43 C21.2 38 26 34.2 32 34.2 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M13.5 51.8 L50.5 51.8\"/>", "weapon": "<path fill=\"#e2dac7\" stroke=\"none\" d=\"M55 9 C55.5 14 53 20 48 25 L29 44 L34 49 L30 53 L23 46 L15 54 C13.5 55.5 10.5 55.5 9 54 C7.5 52.5 7.5 49.5 9 48 L17 40 L10 33 L14 29 L19 34 L38 15 C43 10 49 7.5 55 9 Z\"/>\n  <path fill=\"#e2dac7\" stroke=\"none\" d=\"M46 33 C42 43 32 50 22 52 C29 47 36 40 40 31 Z\"/>\n  <path fill=\"none\" stroke=\"#171512\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2.6\" d=\"M49 14 L25 38\"/>\n  <circle fill=\"#171512\" stroke=\"none\" cx=\"21.5\" cy=\"41.5\" r=\"2.2\"/>"};

  const upgradeSigilSvgs = (scope = document) => {
    if (document.documentElement.dataset.uiReviewSkin === "original") return;
    // 1) 全界面 32x32 图标与 24x24 (game-ui-ornaments) 属性面板/检视卡/强化材料/天赋面板图标：直接将无 <defs> 的纯矢量 <path> 注入真实 DOM <svg>
    const svgs = within(scope,
      'svg[viewBox="0 0 32 32"]:not([data-wukong-inline]), .chat-assist-icon > svg:not([data-wukong-inline]), .icon-stat__icon > svg:not(.icon-stat__condition):not([data-wukong-inline]), .weapon-inscription__toggle > svg:not([data-wukong-inline]), .weapon-inscription__chip > svg:not([data-wukong-inline]), .character-panel__legend > svg:not([data-wukong-inline]), .gameplay-compendium__icon > svg:not([data-wukong-inline]), .effect-compendium__icon > svg:not([data-wukong-inline]), .preparation-character__icon > svg:not([data-wukong-inline]), .reliquary__vitals .weapon-stat-icon > svg:not([data-wukong-inline]), .talent-panel [data-talent-icon-guid] > svg:not([data-wukong-inline]), .talent-panel [data-talent-effect-icon-guid] > svg:not([data-wukong-inline]), [data-open-talents] > svg:not([data-wukong-inline])'
    );
    for (const svg of svgs) {
      if (svg.classList.contains("icon-stat__condition")) continue;
      let key = svg.getAttribute("data-wukong-icon") || "";
      if (!key) {
        const assistCard = svg.closest(".chat-assist-card");
        if (assistCard) {
          const aid = assistCard.getAttribute("data-assist-card") || assistCard.textContent || "";
          key = /insight|洞察|五行/.test(aid) ? "orb" : /rearrange|重排|灵识/.test(aid) ? "fly" : /sacrifice|救主|生死/.test(aid) ? "heart" : pickWukongIconKey(svg);
        } else {
          const boardBtn = svg.closest("button[data-talent-board]");
          if (boardBtn) {
            const b = boardBtn.getAttribute("data-talent-board") || "";
            key = b === "survival" ? "longevity" : b === "returning-sword" ? "fly" : "spell";
          } else {
            const wStat = svg.closest(".weapon-stat");
            if (wStat) {
              const ds = wStat.getAttribute("data-stat") || "";
              key = /qi/i.test(ds) || wStat.matches(":nth-child(2)") ? "mp" : "hp";
            } else {
              key = pickWukongIconKey(svg);
            }
          }
        }
      }
      svg.setAttribute("data-wukong-icon", key);
      svg.setAttribute("data-wukong-inline", "1");
      svg.setAttribute("viewBox", "0 0 64 64");
      svg.innerHTML = WUKONG_SVG_INNER[key] || WUKONG_SVG_INNER.res;
    }

    // 2) 行囊 7 枚装备空槽（6 防具 + 6 阵位兵刃）：注入真实内联 <svg class="wukong-slot-svg">
    const emptySlots = within(scope, ".reliquary .reliquary__empty");
    for (const empty of emptySlots) {
      if (empty.querySelector(":scope > svg.wukong-slot-svg")) continue;
      const gearHost = empty.closest("[data-equip-gear]");
      const slotKey = gearHost ? (gearHost.getAttribute("data-equip-gear") || "weapon") : "weapon";
      const inner = SLOT_SVG_INNER[slotKey] || SLOT_SVG_INNER.weapon;
      const svgEl = document.createElementNS("http://www.w3.org/2000/svg", "svg");
      svgEl.setAttribute("class", "wukong-slot-svg");
      svgEl.setAttribute("data-wukong-inline", "1");
      svgEl.setAttribute("viewBox", "0 0 64 64");
      svgEl.setAttribute("aria-hidden", "true");
      svgEl.innerHTML = inner;
      empty.prepend(svgEl);
    }

    // Recover stale layout using the real chat state; source open() owns subject/history.
    for (const insp of within(scope, '.reliquary__inspect[data-dialogue="true"]')) {
      const chat = insp.querySelector(":scope > .spirit-chat");
      if (!chat?.hidden) continue;
      const content = insp.querySelector(".reliquary__inspect-content");
      if (content && content.parentElement !== insp) insp.insertBefore(content, chat);
      delete insp.dataset.dialogue;
      insp.setAttribute("role", "tooltip");
      insp.style.transform = "";
    }

    // 4) 器灵对话（.spirit-chat）心相仪与权能图标注入：
    // 100% 复用全界面《黑神话》宣白石刻拓片实心器物（WUKONG_SVG_INNER）+ 45度旋转菱形法印底座，与天赋页/属性栏严丝合缝
    for (const chat of within(scope, ".spirit-chat")) {
      const emptyP = chat.querySelector(".chat-log > .chat-empty");
      if (emptyP && !emptyP.querySelector(".wk-spirit-avatar")) {
        const rawText = originalText(emptyP);
        emptyP.textContent = "";
        const avatar = document.createElement("div");
        avatar.className = "wk-spirit-avatar";
        avatar.innerHTML = `<svg viewBox="0 0 64 64" data-wukong-inline="1" aria-hidden="true">${WUKONG_SVG_INNER.fly}</svg>`;
        const titleB = document.createElement("strong");
        titleB.className = "wk-spirit-empty-title";
        const subj = originalText(chat.querySelector("[data-subject-name]")) || "器灵";
        titleB.textContent = `「${subj}」剑魄初醒 · 识海待语`;
        const descSpan = document.createElement("span");
        descSpan.className = "wk-spirit-empty-desc";
        descSpan.textContent = rawText.trim() || "这件器物，还在等你开口。你们说过的话会留在它自己的记忆里。";
        const ribbon = document.createElement("div");
        ribbon.className = "wk-spirit-ribbon";
        ribbon.innerHTML = `<span>◆ 识海留忆</span><i>·</i><span>◆ 易筋调校</span><i>·</i><span>◆ 结契认主</span>`;
        emptyP.append(avatar, titleB, descSpan, ribbon);
      }

      const promptBtns = chat.querySelectorAll(".chat-prompts > button");
      const promptMeta = [
        { icon: "forge", tag: "核心权能 · 商议属性取舍与折算", kind: "power-tune", re: /调校|Tune|Tuning/i },
        { icon: "pact",  tag: "核心权能 · 缔结契约解锁神通",   kind: "power-pact", re: /认主|Bond|Pact/i },
        { icon: "spell", tag: "日常闲叙", kind: "social-1", re: /逗|Tease/i },
        { icon: "fly",   tag: "试探心意", kind: "social-2", re: /拌|Banter|Bicker/i },
      ];
      promptBtns.forEach((btn, idx) => {
        const label = (btn.getAttribute("data-orig-label") || originalText(btn)).trim();
        btn.setAttribute("data-orig-label", label);
        const meta = promptMeta.find(m => m.re.test(label)) || promptMeta[idx] || promptMeta[2];
        if (btn.getAttribute("data-wk-prompt") === meta.kind) return;
        btn.setAttribute("data-wk-prompt", meta.kind);
        btn.innerHTML = `<span class="wk-prompt-icon"><svg viewBox="0 0 64 64" data-wukong-inline="1" aria-hidden="true">${WUKONG_SVG_INNER[meta.icon]}</svg></span><span class="wk-prompt-body"><small>${meta.tag}</small><b>${label}</b></span>`;
      });
    }

    // 5) 首次体验抉择弹窗（[data-first-play-prompt]）：注入「初入山门 · 问心择途」礼匣眉章、三段流程玉签与主次双卡内嵌结构
    for (const fp of within(scope, "[data-first-play-prompt]")) {
      const h2 = fp.querySelector("h2");
      const pDesc = fp.querySelector("p:not([data-first-play-error])");
      const btnExp = fp.querySelector("button[data-first-play-experience]");
      const btnSkip = fp.querySelector("button[data-first-play-skip]");
      if (h2 && !fp.querySelector(".wk-first-play-eyebrow")) {
        const eye = document.createElement("div");
        eye.className = "wk-first-play-eyebrow";
        eye.innerHTML = `<span class="wk-fp-seal"><svg viewBox="0 0 64 64" aria-hidden="true">${WUKONG_SVG_INNER.fly}</svg></span><small>❖ 初 入 灵 境 · 问 心 择 途 ❖</small>`;
        fp.insertBefore(eye, h2);
      }
      if (pDesc && !fp.querySelector(".wk-first-play-steps")) {
        const steps = document.createElement("div");
        steps.className = "wk-first-play-steps";
        steps.innerHTML = `
          <span><i>壹</i><b>旧剑初醒</b><small>序章同行叙事</small></span>
          <em>→</em>
          <span><i>贰</i><b>青竹试剑</b><small>独立御剑教学</small></span>
          <em>→</em>
          <span><i>叁</i><b>首境整备</b><small>行囊与立契指引</small></span>
        `;
        pDesc.after(steps);
      }
      if (btnExp && !btnExp.getAttribute("data-wk-fp-card")) {
        const origExp = (btnExp.getAttribute("data-orig-label") || originalText(btnExp) || "体验教学与剧情").trim();
        btnExp.setAttribute("data-orig-label", origExp);
        btnExp.setAttribute("data-wk-fp-card", "experience");
        btnExp.innerHTML = `
          <span class="wk-fp-btn-icon"><svg viewBox="0 0 64 64" aria-hidden="true">${WUKONG_SVG_INNER.pact}</svg></span>
          <span class="wk-fp-btn-body">
            <small class="wk-fp-badge">推荐 · 完整序章与御剑试炼</small>
            <strong>${origExp}</strong>
            <span>亲历旧剑苏醒、青竹独立教学与战后整备介绍，循序踏入正式第一境</span>
          </span>
          <span class="wk-fp-btn-cta">启程 <i>⚔</i></span>
        `;
      }
      if (btnSkip && !btnSkip.getAttribute("data-wk-fp-card")) {
        const origSkip = (btnSkip.getAttribute("data-orig-label") || originalText(btnSkip) || "跳过，直接开始").trim();
        btnSkip.setAttribute("data-orig-label", origSkip);
        btnSkip.setAttribute("data-wk-fp-card", "skip");
        btnSkip.innerHTML = `
          <span class="wk-fp-btn-icon"><svg viewBox="0 0 64 64" aria-hidden="true">${WUKONG_SVG_INNER.gate}</svg></span>
          <span class="wk-fp-btn-body">
            <small class="wk-fp-badge">熟手 · 略过引导直入首境</small>
            <strong>${origSkip}</strong>
            <span>略过序章剧情与独立教学关，直接携初始飞剑开启正式第一关</span>
          </span>
          <span class="wk-fp-btn-cta">直入 <i>→</i></span>
        `;
      }
    }

    // 6) 山门「轮回记录与奖杯 / 无尽劫境」(.title-menu__panel)：
    //    - 清理「查看 调试 记录」因 zhTerms 替换产生的生硬空格，还原为「查看 GM 记录」；
    //    - 将奖杯区前置到最上方并注入「天命功勋 · 轮回宝印录」，100% 沿用《黑神话》天赋页/本局页同源的「无框渐隐金丝 + 45°旋转菱形法印底座 + 宣白石刻拓片」古风语言！
    for (const modeBtn of within(scope, ".title-menu__tools button[data-title-record-mode]")) {
      if (document.documentElement.dataset.uiLang !== "en" && /查看\s*调试\s*记录/.test(modeBtn.textContent || "")) {
        modeBtn.setAttribute("data-i18n-skip", "");
        modeBtn.textContent = "查看 GM 记录";
      } else if (document.documentElement.dataset.uiLang === "en" && modeBtn.hasAttribute("data-i18n-skip")) {
        modeBtn.removeAttribute("data-i18n-skip");
        if (modeBtn.textContent !== "View GM Records") modeBtn.textContent = "View GM Records";
      }
    }

    const TROPHY_MEDAL_RULES = [
      { re: /初试锋芒|First Edge|First Kill/i, icon: "atk", rank: "壹品 · 破阵初鸣", rankEn: "RANK I · FIRST EDGE" },
      { re: /百斩|Hundred|100/i, icon: "slash", rank: "贰品 · 百刃摧锋", rankEn: "RANK II · HUNDRED CUTS" },
      { re: /千敌|Thousand|1000.*敌|1,000.*enem/i, icon: "reap", rank: "叁品 · 万夫莫敌", rankEn: "RANK III · UNSTOPPABLE" },
      { re: /一剑惊鸿|Single.*1000|Single.*1,000|Strike/i, icon: "crit", rank: "叁品 · 惊鸿绝响", rankEn: "RANK III · SKY SUNDER" },
      { re: /灵石满袖|Wealth|100000|100,000/i, icon: "fortune", rank: "贰品 · 聚宝归藏", rankEn: "RANK II · TREASURY" },
      { re: /向死而生|轮回|Rebirth|Death/i, icon: "heart", rank: "壹品 · 涅槃问心", rankEn: "RANK I · REBIRTH" },
      { re: /十二境归来|12.*关|Twelve/i, icon: "crown", rank: "极品 · 荡平诸境", rankEn: "APEX · REALM CONQUEROR" },
      { re: /破阵者|300|Breaker/i, icon: "fly", rank: "贰品 · 剑荡千军", rankEn: "RANK II · VANGUARD" },
    ];

    for (const trophiesGrid of within(scope, ".title-menu__trophies")) {
      const scrollHost = trophiesGrid.parentElement;
      const recordsGrid = scrollHost?.querySelector(":scope > .title-menu__records");
      if (scrollHost && recordsGrid && trophiesGrid.compareDocumentPosition(recordsGrid) & Node.DOCUMENT_POSITION_PRECEDING) {
        scrollHost.insertBefore(trophiesGrid, recordsGrid);
      }
      const allTrophies = trophiesGrid.querySelectorAll(":scope > .title-menu__trophy");
      const earnedCount = trophiesGrid.querySelectorAll(":scope > .title-menu__trophy.is-earned").length;
      let showcaseHeader = scrollHost?.querySelector(":scope > .wk-trophy-showcase-header");
      if (scrollHost && !showcaseHeader && allTrophies.length) {
        showcaseHeader = document.createElement("div");
        showcaseHeader.className = "wk-trophy-showcase-header";
        showcaseHeader.innerHTML = `
          <div class="wk-trophy-showcase-title">
            <span class="wk-trophy-showcase-emblem"><svg viewBox="0 0 64 64" data-wukong-inline="1" aria-hidden="true">${WUKONG_SVG_INNER.crown}</svg></span>
            <div>
              <small>天 命 玉 牒 · 功 勋 宝 印</small>
              <strong>轮回宝印录</strong>
            </div>
          </div>
          <div class="wk-trophy-showcase-counter">
            <small>已结宝印</small>
            <b>${earnedCount} <span>/ ${allTrophies.length}</span></b>
          </div>
        `;
        scrollHost.insertBefore(showcaseHeader, trophiesGrid);
      }
      let recordsHeader = scrollHost?.querySelector(":scope > .wk-records-section-header");
      if (scrollHost && recordsGrid && !recordsHeader) {
        recordsHeader = document.createElement("h3");
        recordsHeader.className = "wk-records-section-header";
        recordsHeader.textContent = "轮回历练 · 命途碑刻";
        scrollHost.insertBefore(recordsHeader, recordsGrid);
      }
    }

    const isEnLang = document.documentElement.dataset.uiLang === "en";
    for (const trophiesGrid of within(scope, ".title-menu__trophies")) {
      // 已结印神牌前置，未结印后置，成就感一眼落在亮金法印上
      const cards = [...trophiesGrid.querySelectorAll(":scope > .title-menu__trophy")];
      cards
        .sort((a, b) => Number(b.classList.contains("is-earned")) - Number(a.classList.contains("is-earned")))
        .forEach((card, index) => {
          if (trophiesGrid.children[index] !== card) trophiesGrid.insertBefore(card, trophiesGrid.children[index] || null);
        });
    }
    for (const trophy of within(scope, ".title-menu__trophies > .title-menu__trophy")) {
      if (trophy.querySelector(":scope > .wk-trophy-medal")) continue;
      const bEl = trophy.querySelector("b");
      if (bEl) {
        const cleanTitle = (bEl.textContent || "").replace(/^[✧◇✦◆\s]+/, "").trim();
        if (cleanTitle && bEl.textContent !== cleanTitle) bEl.textContent = cleanTitle;
      }
      const fullText = (trophy.textContent || "").trim();
      const matched = TROPHY_MEDAL_RULES.find(r => r.re.test(fullText)) || { icon: "crown", rank: "玄品 · 灵境试炼", rankEn: "MYSTIC · REALM TRIAL" };
      const isEarned = trophy.classList.contains("is-earned");

      const originalKids = [...trophy.childNodes];

      const medal = document.createElement("div");
      medal.className = "wk-trophy-medal";
      medal.setAttribute("aria-hidden", "true");
      medal.innerHTML = `<svg viewBox="0 0 64 64" data-wukong-inline="1">${WUKONG_SVG_INNER[matched.icon] || WUKONG_SVG_INNER.crown}</svg>`;

      const rankTag = document.createElement("small");
      rankTag.className = "wk-trophy-rank";
      rankTag.textContent = isEnLang ? matched.rankEn : matched.rank;

      const body = document.createElement("div");
      body.className = "wk-trophy-body";
      body.appendChild(rankTag);
      for (const node of originalKids) body.appendChild(node);

      // 已结印只隐藏进度数字，保留说明（与天赋技能板一致）
      if (isEarned) {
        const progress = body.querySelector(":scope > progress");
        if (progress) progress.setAttribute("hidden", "");
        const nums = [...body.querySelectorAll(":scope > p")].at(-1);
        if (nums && /\/|\d/.test(nums.textContent || "")) nums.setAttribute("hidden", "");
      }
      const badge = document.createElement("em");
      badge.className = "wk-trophy-seal";
      badge.textContent = isEarned
        ? (isEnLang ? "◆ Sealed" : "◆ 结印")
        : (isEnLang ? "◇ Open" : "◇ 未结印");
      body.appendChild(badge);
      trophy.replaceChildren(medal, body);
    }
  };

  // 接管词条池、天赋树、属性面板上的原生 title 属性，防止弹出与古风界面格格不入的白底黑字系统提示框
  let customTip = null;
  let activeTipTarget = null;
  const ensureCustomTip = () => {
    if (customTip) return customTip;
    customTip = document.createElement("div");
    customTip.className = "wukong-custom-tooltip";
    customTip.hidden = true;
    (document.body || document.documentElement).appendChild(customTip);
    return customTip;
  };
  const hideCustomTip = () => {
    activeTipTarget = null;
    if (customTip) customTip.hidden = true;
  };
  const stripNativeTitles = (scope = document) => {
    if (document.documentElement.dataset.uiReviewSkin === "original") return;
    for (const el of within(scope, ".spirit-menu [title], .reliquary [title], .affix-settings [title], .talent-panel [title], .gameplay-compendium [title]")) {
      const t = el.getAttribute("title");
      if (t) {
        el.setAttribute("data-wk-tip", t);
        el.removeAttribute("title");
      }
    }
  };
  window.addEventListener("pointerover", (e) => {
    if (document.documentElement.dataset.uiReviewSkin === "original") return;
    if (e.target instanceof Element) stripNativeTitles(e.target.closest("[title], [data-wk-tip]") || e.target);
    const target = e.target instanceof Element ? e.target.closest("[data-wk-tip]") : null;
    if (!target) {
      hideCustomTip();
      return;
    }
    const text = target.getAttribute("data-wk-tip");
    if (!text) {
      hideCustomTip();
      return;
    }
    activeTipTarget = target;
    const tip = ensureCustomTip();
    tip.textContent = text;
    tip.hidden = false;
    const r = target.getBoundingClientRect();
    const tw = Math.min(340, window.innerWidth - 24);
    tip.style.maxWidth = `${tw}px`;
    const left = Math.max(12, Math.min(r.left, window.innerWidth - tip.offsetWidth - 12));
    const below = r.bottom + 8 + tip.offsetHeight < window.innerHeight - 12;
    const top = below ? r.bottom + 8 : Math.max(12, r.top - tip.offsetHeight - 8);
    tip.style.left = `${left}px`;
    tip.style.top = `${top}px`;
  }, true);
  window.addEventListener("pointerdown", hideCustomTip, true);
  window.addEventListener("scroll", hideCustomTip, true);

  let queued = false;
  const schedule = () => {
    if (queued) return;
    queued = true;
    requestAnimationFrame(() => { queued = false; update(); });
  };
  const relevantDecoration = ".spirit-menu, .title-menu, .title-menu__trophies, .reliquary, .affix-settings, .talent-panel, .gameplay-compendium, .spirit-chat, [data-first-play-prompt], .play-hud-dock";
  const markElement = (el, record) => {
    if (!(el instanceof Element)) return;
    const structural = !record || record.type === "childList";
    const attr = record?.attributeName;
    const grid = el.closest(".reliquary__grid");
    if (grid && (structural || ["style", "class", "data-item-width", "data-item-height"].includes(attr))) dirtyGrids.add(grid);
    const orb = el.closest(".play-hud-orb-value");
    if (orb && (structural || record.type === "characterData")) dirtyOrbs.add(orb);
    const wallet = el.closest(".reliquary [data-wallet]");
    if (wallet && (structural || record.type === "characterData")) dirtyWallets.add(wallet);
    if (el.closest(".journey-caption, #play-hud-detail-hint")) journeyDirty = true;
    if (el.closest(".journey-history")) chaptersDirty = true;
    if ((structural && el.matches(".spirit-menu, .spirit-menu__dialog"))
      || (["hidden", "class", "data-page", "data-phase"].includes(attr) && el.matches(".spirit-menu, .spirit-menu__dialog"))
      || (attr === "disabled" && el.matches('[data-menu-page="arsenal"]'))) menuDirty = true;
    if ((structural || ["hidden", "class", "style", "data-presentation"].includes(attr))
      && el.matches(".spirit-menu, .spirit-menu__dialog, .wave-settlement, .journey-caption, .play-hud, .play-hud-dock, .reliquary__grid")) uiDirty = true;
    if (structural) {
      for (const value of within(el, ".play-hud-orb-value")) dirtyOrbs.add(value);
      for (const value of within(el, ".reliquary__grid")) dirtyGrids.add(value);
      for (const value of within(el, ".reliquary [data-wallet]")) dirtyWallets.add(value);
      // SVG decoration and one-time card assembly only follow added/changed UI
      // subtrees. Floating combat labels never enter this path.
      if (!orb && el !== document.body && (el.closest(relevantDecoration) || el.querySelector(relevantDecoration))) {
        const owner = el.closest('.title-menu__trophies, .reliquary__inspect, .spirit-chat, [data-first-play-prompt]') || el;
        dirtyDecoration.add(owner);
      }
    } else if (attr === "title") dirtyDecoration.add(el);
  };
  const markAll = () => {
    for (const grid of document.querySelectorAll(".reliquary__grid")) { delete grid.__occSourceKey; dirtyGrids.add(grid); }
    for (const value of document.querySelectorAll(".play-hud-orb-value")) dirtyOrbs.add(value);
    for (const wallet of document.querySelectorAll(".reliquary [data-wallet]")) dirtyWallets.add(wallet);
    dirtyDecoration.add(document.body);
    journeyDirty = menuDirty = uiDirty = chaptersDirty = true;
  };
  const onMutate = records => {
    for (const record of records) {
      if (record.target === document.documentElement) { markAll(); continue; }
      const el = record.target instanceof Element ? record.target : record.target.parentElement;
      markElement(el, record);
      if (record.type === "childList") for (const node of record.addedNodes) markElement(node, undefined);
    }
    // Caption text needs decoration before the locale owner sees rebuilt buttons.
    // This runs only for caption/hint changes, never combat label mutations.
    if (journeyDirty) { journeyDirty = false; syncJourneyCaption(); }
    if (dirtyOrbs.size || dirtyDecoration.size || dirtyWallets.size || journeyDirty || menuDirty || uiDirty || chaptersDirty
      || [...dirtyGrids].some(grid => !grid.closest("[hidden]"))) schedule();
  };
  const start = () => {
    new MutationObserver(onMutate).observe(document.body, {
      childList: true, subtree: true, characterData: true,
      attributes: true, attributeFilter: ["style", "hidden", "class", "title", "disabled", "selected", "data-page", "data-phase", "data-dialogue", "data-presentation", "data-item-width", "data-item-height", "data-ui-lang"],
    });
    new MutationObserver(onMutate).observe(document.documentElement, {
      attributes: true,
      attributeFilter: ["data-forgeax-game-menu", "data-forgeax-title", "data-forgeax-wave-settlement-open", "data-ui-lang", "data-ui-review-skin"],
    });
    window.addEventListener("resize", () => {
      for (const grid of document.querySelectorAll(".reliquary__grid")) { delete grid.__occSourceKey; dirtyGrids.add(grid); }
      for (const value of document.querySelectorAll(".play-hud-orb-value")) dirtyOrbs.add(value);
      journeyDirty = uiDirty = true; schedule();
    });
    markAll(); update();
  };
  if (document.body) start();
  else addEventListener("DOMContentLoaded", start, { once: true });
})();
