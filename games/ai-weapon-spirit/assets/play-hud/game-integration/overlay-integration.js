/* Game-owned UI integration. The supplied overlay files stay byte-for-byte intact. */
(() => {
  if (window.__playHudOverlayIntegration) return;
  window.__playHudOverlayIntegration = true;
  const owner = document;
  const scriptUrl = new URL(owner.currentScript?.src || './assets/play-hud/game-integration/overlay-integration.js', location.href);
  const dictionaryUrl = new URL('../overlay/i18n/i18n-en.json', scriptUrl);
  const additionsUrl = new URL('./i18n-additions.json', scriptUrl);
  additionsUrl.search = scriptUrl.search;
  const originalFetch = window.fetch.bind(window);
  let additions;
  // Extend only the overlay dictionary's json() result; preserve its actual bytes,
  // metadata and other requests. Package translations always take precedence.
  window.fetch = async (...args) => {
    const response = await originalFetch(...args);
    const input = args[0], requestUrl = new URL(typeof input === 'string' || input instanceof URL ? input : input.url, location.href);
    if (requestUrl.origin !== dictionaryUrl.origin || requestUrl.pathname !== dictionaryUrl.pathname || !response.ok) return response;
    additions ??= originalFetch(additionsUrl).then(r => {
      if (!r.ok) throw Error('Cannot load game UI dictionary additions: ' + r.status);
      return r.json();
    });
    return new Proxy(response, { get(target, key) {
      if (key === 'json') return async () => {
        const [dict, extra] = await Promise.all([target.json(), additions]);
        for (const group of ['exact', 'terms', 'zhTerms', 'sourceZh']) dict[group] = { ...extra[group], ...dict[group] };
        const supplied = new Set(dict.patterns.map(row => row[0]));
        dict.patterns = [...dict.patterns, ...extra.patterns.filter(row => !supplied.has(row[0]))];
        return dict;
      };
      const value = Reflect.get(target, key, target);
      return typeof value === 'function' ? value.bind(target) : value;
    } });
  };

  const title = () => owner.documentElement.dataset.uiLang === 'en'
    ? 'DeepSeek Harness Native Trajectory' : 'DeepSeek Harness 原生轨迹';
  const setAttribute = (element, name, value) => {
    if (element.getAttribute(name) !== value) element.setAttribute(name, value);
  };
  const installed = new WeakSet();
  const sealLayouts = new WeakMap();
  const teachingTargets = new Set();
  let teachingFrame = 0;
  const teachingResize = typeof ResizeObserver === 'function'
    ? new ResizeObserver(() => queueTeachingLayout()) : undefined;
  const queueTeachingLayout = () => {
    if (teachingFrame || (!teachingTargets.size && !owner.querySelector('section[data-teaching-completion]:not([hidden])'))) return;
    teachingFrame = requestAnimationFrame(() => {
      teachingFrame = 0;
      const panels = [...owner.querySelectorAll('section[data-teaching-completion]:not([hidden])')];
      const hud = panels.length ? [...owner.querySelectorAll('.play-hud-bottom-group,.play-hud-dock,.play-hud-dock__xp,.play-hud-talents,.play-hud-joystick,.play-hud-touch-btn')] : [];
      const targets = new Set([...panels, ...hud]);
      for (const element of teachingTargets) if (!targets.has(element)) {
        teachingResize?.unobserve(element);
        teachingTargets.delete(element);
      }
      for (const element of targets) if (!teachingTargets.has(element)) {
        teachingResize?.observe(element);
        teachingTargets.add(element);
      }
      let occupiedTop = window.innerHeight;
      for (const element of hud) {
        const rect = element.getBoundingClientRect(), style = getComputedStyle(element);
        if (!rect.width || !rect.height || style.visibility === 'hidden' || style.display === 'none'
          || rect.top < window.innerHeight / 3 || rect.top >= window.innerHeight) continue;
        occupiedTop = Math.min(occupiedTop, rect.top);
      }
      if (occupiedTop === window.innerHeight) return;
      for (const panel of panels) {
        const gap = parseFloat(getComputedStyle(panel).getPropertyValue('--ui-space-lg')) || 16;
        const bottom = Math.ceil(window.innerHeight - occupiedTop + gap) + 'px';
        if (panel.style.getPropertyValue('--teaching-action-bottom') !== bottom) panel.style.setProperty('--teaching-action-bottom', bottom);
      }
    });
  };
  const alignSeals = grid => {
    const seals = [...grid.querySelectorAll('.wk-trophy-seal')];
    if (!seals.length || !grid.getClientRects().length) return;
    const signature = owner.documentElement.dataset.uiLang + ':' + grid.clientWidth + ':'
      + seals.map(seal => seal.textContent + ':' + getComputedStyle(seal).font).join('|');
    if (sealLayouts.get(grid) === signature) return;
    // Retain the skin's height/padding/borders. Both states use the widest
    // intrinsic label in this locale, with no new visual size constants.
    for (const seal of seals) seal.style.setProperty('width', 'max-content', 'important');
    const width = Math.max(...seals.map(seal => seal.getBoundingClientRect().width));
    for (const seal of seals) seal.style.setProperty('width', width + 'px', 'important');
    sealLayouts.set(grid, signature);
  };
  const sync = () => {
    if (!owner.documentElement) return;
    queueTeachingLayout();
    for (const caption of owner.querySelectorAll('.journey-caption[data-presentation="prologue"]:not([hidden])')) {
      for (const prose of caption.querySelectorAll('.journey-caption__card > p')) {
        if (prose.querySelector('.journey-caption__paragraph')) continue;
        // The author text keeps its paragraphs. Remove only generated single
        // CJK hard breaks so the viewport can balance the displayed lines.
        const text = [...prose.childNodes].map(node => node.nodeType === 3
          ? window.__uiI18n?.sourceText?.(node) ?? node.textContent : node.textContent).join('');
        const flowing = /[\u3400-\u9fff]/.test(text) ? text.replace(/(?<!\n)\n(?!\n)/g, '') : text;
        if (!flowing) continue;
        const paragraphs = flowing.split(/\n{2,}/), nodes = [];
        for (const paragraph of paragraphs) {
          if (nodes.length) nodes.push(owner.createTextNode('\n\n'));
          const line = owner.createElement('span');
          line.className = 'journey-caption__paragraph';
          line.textContent = paragraph;
          nodes.push(line);
        }
        prose.replaceChildren(...nodes);
      }
      if (!caption.hasAttribute('data-first-play-opening')) continue;
      // This title-owned prompt used inline !important right anchoring. Let
      // the responsive presentation own placement without touching handlers.
      for (const actions of caption.querySelectorAll('.journey-caption__actions')) {
        for (const key of ['position', 'top', 'left', 'right', 'bottom', 'width', 'margin']) {
          if (actions.style.getPropertyPriority(key) === 'important') actions.style.removeProperty(key);
        }
      }
    }
    const en = owner.documentElement.dataset.uiLang === 'en';
    for (const button of owner.querySelectorAll('.ui-lang-toggle')) {
      const target = en ? '中' : 'EN';
      const label = en ? 'Switch to Chinese' : '切换为英文';
      if (button.textContent !== target) button.textContent = target;
      setAttribute(button, 'title', label);
      setAttribute(button, 'aria-label', label);
      if (button.hasAttribute('data-wk-tip')) setAttribute(button, 'data-wk-tip', label);
    }
    for (const frame of owner.querySelectorAll('iframe.chat-trajectory-frame[data-i18n-skip]')) {
      setAttribute(frame, 'title', title());
      setAttribute(frame, 'aria-label', title());
      frame.removeAttribute('data-wk-tip');
    }
    for (const tip of owner.querySelectorAll('.wukong-custom-tooltip')) {
      if (!/^DeepSeek (?:Harness|运行框架) (?:Native Trajectory|原生轨迹)$/.test(tip.textContent || '')) continue;
      setAttribute(tip, 'data-i18n-skip', '');
      if (tip.textContent !== title()) tip.textContent = title();
    }
    for (const grid of owner.querySelectorAll('.title-menu__trophies')) {
      alignSeals(grid);
      if (installed.has(grid)) continue;
      installed.add(grid);
      const append = grid.appendChild.bind(grid);
      // The skin sorts earned cards first on each update. Avoid producing a new
      // childList mutation when that exact order is already satisfied.
      grid.appendChild = node => {
        if (node.parentNode === grid && node instanceof Element && node.matches('.title-menu__trophy')) {
          const cards = [...grid.children].filter(child => child.matches('.title-menu__trophy'));
          if (cards.every((card, index) => !index || Number(cards[index - 1].classList.contains('is-earned')) >= Number(card.classList.contains('is-earned')))) return node;
        }
        return append(node);
      };
    }
  };
  const observer = new MutationObserver(sync);
  observer.observe(owner.documentElement, { subtree: true, childList: true, characterData: true, attributes: true, attributeFilter: ['title', 'aria-label', 'data-wk-tip', 'data-ui-lang', 'hidden', 'data-input-device'] });
  owner.addEventListener('ui-languagechange', sync);
  window.addEventListener('resize', sync);
  owner.fonts?.ready.then(() => { for (const grid of owner.querySelectorAll('.title-menu__trophies')) sealLayouts.delete(grid); sync(); });
  sync();
})();
