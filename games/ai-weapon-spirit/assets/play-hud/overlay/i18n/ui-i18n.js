/*
 * 上古器灵 UI 中 / 英切换与教学文案精简润色层（运行时翻译层，不改游戏源码）。
 * 字典 i18n-en.json 与本脚本同目录：exact = 整句对照，patterns = 带 {n} 占位的模板句。
 * 选择存 localStorage，<html data-ui-lang="en" lang="en"> 供样式切换英文排版。
 */
(() => {
  if (window.__uiI18n) return;
  const testPreview = /^\/ai-weapon-spirit\/tutorial-test(?:\/|$)/.test(location.pathname) || new URLSearchParams(location.search).get('tutorialTest') === '1';
  const STORE = (testPreview ? 'qingzhu-onboarding-test::' : '') + "ai-weapon-spirit:ui-lang";
  const HAN = /[\u3400-\u9fff]/;
  const HAN_RUN = /[\u3400-\u9fff\u3000-\u303f\uff00-\uffef·]+/g;
  const SPACED = /([\u3400-\u9fff]) (?=[\u3400-\u9fff])/g;
  const SEP = /(\s*·\s*|：|；|，|\s+\/\s+|\s+→\s+)/;
  const ATTRS = ["title", "aria-label", "aria-description", "placeholder", "alt", "data-wk-tip"];
  const SKIP = "script,style,textarea,input,code,pre,.chat-log,[data-i18n-skip],[contenteditable]";
  const PUNCT = { "，": ", ", "。": ". ", "：": ": ", "；": "; ", "（": " (", "）": ") ", "、": ", ", "！": "! ", "？": "? ", "“": "\"", "”": "\"", "‘": "'", "’": "'", "《": "", "》": "", "【": "[", "】": "]", "　": " ", "～": "~" };
  const self = document.currentScript && document.currentScript.src;
  const dictUrl = new URL("i18n-en.json" + (self ? new URL(self).search : ""), self || location.href).href;

  /* 刚进入秘境与行囊时的死板教学文案 -> 凝练自然的仙侠引导（中英双语同步生效） */
  const ZH_POLISH = new Map([
    ["操作教学 · P0 · 歇息整备：先看这里", "行囊整备"],
    ["操作教学 · P0 · 换装与穿戴：放对位置才生效", "披挂上阵"],
    ["操作教学 · P1 · 薪玉蕴养：拖拽强化旧剑", "薪玉蕴养"],
    ["歇息整备：先看这里", "行囊整备"],
    ["换装与穿戴：放对位置才生效", "披挂上阵"],
    ["薪玉蕴养：拖拽强化旧剑", "薪玉蕴养"],
    ["继续教学 →", "继续 →"],
    ["继续教学", "继续"],
    [
      "移动并改变方向。键盘使用 WASD／方向键；手柄使用左摇杆；触屏拖动移动区。",
      "循路前行，留意四周动静。（方向键 / 摇杆 / 拖动移动）",
    ],
    [
      "在可落脚的地方尝试跳跃。键盘空格／手柄跳跃键／触屏跳跃；观察敌人起手，移动避开攻击，不必故意受伤。",
      "看准地形跃过障碍，留意敌方起手、灵活避让。（空格 / 跳跃键）",
    ],
    [
      "查看武器栏的自动攻击开关，尝试关闭再开启；保持距离，观察真实武器出击与返回。",
      "武器栏可开关【自动御剑】；与敌保持距离，观飞剑出击与归匣。",
    ],
    [
      "主人气血、主人灵力与武器器命、器灵力分别显示。未提供的器身数值不视为零；自动攻击是否可用以实际状态为准。",
      "兼顾自身气血灵力与飞剑器命，留有余力方能久战。",
    ],
    [
      "靠近实际掉落收取；封存器物回到安全处再鉴定。本关存活至计时结束即通关，不要求清空敌人或寻找出口。",
      "靠近即可拾取战利；撑过本境时限即为过关，无需清剿全敌。",
    ],
    [
      "选中这把旧剑，从交谈入口回应。称呼和后续命名使用同一实物身份；自由交流不要求认主、亲密度或固定次数。",
      "点选旧剑即可与器灵交谈，随时倾听它的回应。",
    ],
    [
      "出征前先整备行装。\n点【行囊】看随身物品，点【属性】看自身状态。\n左侧可切换【渡灵商人】与【征途仓库】；右侧看上阵槽位与全身护具。",
      "入境前先整顿行装：左侧切换【渡灵商人】与【征途仓库】，右侧配置上阵飞剑、护具与背包。",
    ],
    [
      "有问号器物时，双击鉴定并安置；查看旧剑的五行、用途、属性。查看提示不等于鉴定成功。",
      "双击带问号的器物即可鉴定并收入囊中，亦可点选旧剑查看五行与属性。",
    ],
    [
      "选中旧剑，查看五行、出手方式、器命和灵力；已鉴定物品按实际类别查看。有同部位装备时再作比较。",
      "点选器物可细看五行、路数与词条，与同部位装备比对择优。",
    ],
    [
      "查看当前货架、灵石余额与空位。需要薪玉时双击真实商品购买；已拥有则不重复购买，条件不足可留待以后。",
      "双击货架商品即可消耗灵石购入；量力而行，随时可留待日后添置。",
    ],
    [
      "把武器拖入上方【阵位】，出战时才会出手。\n双击防具即可穿戴到对应部位。\n放进行囊不等于已装备；护具按需添置即可。",
      "将武器拖入上方【阵位】方可出战，双击防具即可穿戴上身。",
    ],
    [
      "若有【薪玉】，拖到旧剑上可预览强化效果，松手即可蕴养。\n没有材料也不妨事，后续随时都能强化。",
      "将【薪玉】拖至飞剑上即可预览并蕴养强化。",
    ],
    [
      "复查实际武器、防具、资源和自动攻击状态；放下手持物，沿用原有出征检查。提示已读与实操成功分别记录。",
      "出征前复查上阵飞剑与护具状态，妥当后即可启程。",
    ],
    [
      "可以继续与这把剑自由交流，后续养成以真实操作和关系记录为准。额外闲聊、认主、命名与亲密度不是出征门槛。",
      "闲暇时可随时与剑灵交谈，在征途中慢慢培养默契。",
    ],
    [
      "检查实际行装并放下手持物。可以继续自由交流，也可以在准备好后出征；后续主线随新关卡通关解锁，前两关不触发支线。",
      "行装整备妥当后，随时可前往下一境出征。",
    ],
  ]);

  /* 属性面板数值后的冗余单位（英文下不重复显示 points / Spirit Power） */
  const STAT_UNIT_EN = {
    "点": "",
    "灵": "",
    "灵/秒": "/s",
    "点/秒": "/s",
    "米/秒": "m/s",
    "伤害/秒": "dmg/s",
    "承伤点": "EHP",
  };

  function polishZhText(raw, parentEl) {
    if (!raw || !parentEl) return raw;
    if (!parentEl.closest || !parentEl.closest(".journey-caption")) return raw;
    const m = /^(\s*)([\s\S]*?)(\s*)$/.exec(raw);
    if (!m) return raw;
    let body = m[2];
    if (ZH_POLISH.has(body)) {
      return m[1] + ZH_POLISH.get(body) + m[3];
    }
    /* 剧情载入倒计时精简：「已等待 3 秒，7秒后可跳过」->「7 秒后可跳过」 */
    const waitMatch = /^已等待\s*\d+\s*秒[，,]\s*(\d+)\s*秒后可跳过$/.exec(body);
    if (waitMatch) {
      return m[1] + `${waitMatch[1]} 秒后可跳过` + m[3];
    }
    if (/^操作教学\s*·\s*P\d+\s*·\s*/.test(body)) {
      body = body.replace(/^操作教学\s*·\s*P\d+\s*·\s*/, "");
      if (ZH_POLISH.has(body)) body = ZH_POLISH.get(body);
      return m[1] + body + m[3];
    }
    return raw;
  }

  let lang = localStorage.getItem(STORE) === "en" ? "en" : "zh";
  let exact = new Map();
  let patterns = [];
  let sourceZh = new Map();
  let longPhrases = new Map();
  let zhTerms = [];
  let ready = false;
  const cache = new Map();
  const misses = new Set();
  const textState = new WeakMap(); // Text -> { raw, zh, en }
  const attrState = new WeakMap(); // Element -> { [attr]: { raw, zh, en } }
  const compactNumber = new Intl.NumberFormat("en", { notation: "compact", maximumSignificantDigits: 6 });

  const escapeRe = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");

  function compile(dict) {
    cache.clear();
    exact = new Map(Object.entries(dict.exact || {}));
    sourceZh = new Map(Object.entries(dict.sourceZh || {}));
    longPhrases = new Map();
    for (const [zh, en] of exact) {
      if (zh.length < 32 || !HAN.test(zh)) continue;
      const first = zh[0];
      if (!longPhrases.has(first)) longPhrases.set(first, []);
      longPhrases.get(first).push([zh, en]);
    }
    for (const candidates of longPhrases.values()) candidates.sort((a, b) => b[0].length - a[0].length);
    zhTerms = Object.entries(dict.zhTerms || {}).sort((a, b) => b[0].length - a[0].length)
      .map(([word, zh]) => [new RegExp("(?<![A-Za-z0-9_])" + escapeRe(word) + "(?![A-Za-z0-9_])", "g"), zh]);
    patterns = (dict.patterns || []).map(([zh, en]) => {
      const parts = zh.split(/(\{\d+\})/);
      const order = [];
      const src = parts.map((p) => {
        const m = /^\{(\d+)\}$/.exec(p);
        if (m) { order.push(+m[1]); return "([\\s\\S]+?)"; }
        return escapeRe(p);
      }).join("");
      const statics = parts.filter((p) => !/^\{\d+\}$/.test(p));
      const key = statics.map((p) => (p.match(HAN_RUN) || []).sort((a, b) => b.length - a.length)[0] || "").sort((a, b) => b.length - a.length)[0] || "";
      return { re: new RegExp("^" + src + "$"), en, order, key, weight: statics.join("").length };
    }).filter((p) => p.key).sort((a, b) => b.weight - a.weight);
  }

  function punct(s) {
    return s.replace(/[，。：；（）、！？“”‘’《》【】　～]/g, (c) => PUNCT[c]).replace(/ {2,}/g, " ").replace(/ ([,.;:)!?])/g, "$1").trim();
  }

  function fragments(core) {
    return punct(core.replace(HAN_RUN, (run) => {
      const hit = exact.get(run) || exact.get(run.replace(/[·\s]/g, ""));
      if (hit) return " " + hit + " ";
      const pieces = run.split(/([·、，。：；（）\s]+)/).map((p) => (HAN.test(p) ? (exact.get(p) || p) : p));
      return " " + pieces.join("") + " ";
    }));
  }

  function known(text, depth) {
    const hit = exact.get(text);
    if (hit !== undefined) return hit;
    const unwrapped = text.replace(/\s*\n\s*/g, "");
    if (unwrapped !== text && exact.has(unwrapped)) return exact.get(unwrapped);
    const amount = /^([+-]?\d+(?:\.\d+)?)\s*([万亿])(\+?)$/.exec(text);
    if (amount) return compactNumber.format(Number(amount[1]) * (amount[2] === "万" ? 1e4 : 1e8)) + amount[3];
    const tight = text.replace(SPACED, "$1");
    if (tight !== text && exact.has(tight)) return exact.get(tight);
    for (const p of patterns) {
      if (!text.includes(p.key)) continue;
      const m = p.re.exec(text);
      if (!m) continue;
      const translated = p.en.replace(/\{(\d+)\}/g, (_, i) => {
        const v = m[p.order.indexOf(+i) + 1] ?? "";
        return HAN.test(v) && depth < 6 ? core(v, depth + 1) : v;
      });
      // A broad numeric template can also match a complete multi-paragraph
      // tooltip. Let composition handle it if any captured prose is unknown.
      if (!HAN.test(translated)) return translated;
    }
    return undefined;
  }

  /* 运行时拼接的「A · B · C」「标签：值」等：逐段命中字典才采用，并规范化 · 两侧空格 */
  function segments(text, depth) {
    const parts = text.split(SEP);
    if (parts.length < 3) return undefined;
    let ok = true;
    const out = parts.map((p, i) => {
      if (i % 2) {
        if (p === "：") return ": ";
        if (p === "；") return "; ";
        if (p === "，") return ", ";
        if (/^\s*·\s*$/.test(p)) return " · ";
        return p;
      }
      if (!HAN.test(p)) return p;
      const m = /^(\s*)([\s\S]*?)(\s*)$/.exec(p);
      const t = known(m[2], depth + 1);
      if (t === undefined) ok = false;
      return m[1] + (t ?? m[2]) + m[3];
    });
    return ok ? out.join("") : undefined;
  }

  // Detail hints combine a live numeric heading, shared explanations and
  // conditional notes. Keep their original paragraphs and translate complete
  // known blocks before considering shorter label fragments.
  function composed(text, depth) {
    const paras = text.split(/(\n{2,})/);
    if (paras.length > 1) {
      const translatedParas = paras.map((p, i) => i % 2 ? p : core(p.replace(/\s*\n\s*/g, ""), depth + 1)).join("");
      if (!HAN.test(translatedParas)) return translatedParas;
    }
    const lines = text.split(/(\n+)/);
    if (lines.length > 1) {
      const translated = lines.map((line, i) => i % 2 ? line : core(line, depth + 1)).join("");
      if (!HAN.test(translated)) return translated;
    }
    const pieces = [];
    let cursor = 0, pending = 0;
    while (cursor < text.length) {
      const candidates = longPhrases.get(text[cursor]);
      const match = candidates && candidates.find(([zh]) => text.startsWith(zh, cursor));
      if (!match) { cursor++; continue; }
      if (cursor > pending) pieces.push(core(text.slice(pending, cursor), depth + 1));
      pieces.push(match[1]);
      cursor += match[0].length;
      pending = cursor;
    }
    if (!pieces.length) return undefined;
    if (pending < text.length) pieces.push(core(text.slice(pending), depth + 1));
    return punct(pieces.join(" "));
  }

  function core(text, depth) {
    const hit = known(text, depth);
    if (hit !== undefined) return hit;
    if (depth < 6) {
      const combined = composed(text, depth);
      if (combined !== undefined && !HAN.test(combined)) return combined;
      const seg = segments(text, depth);
      if (seg !== undefined) return seg;
    }
    return fragments(text);
  }

  function tr(s) {
    if (!s) return s;
    if (!HAN.test(s)) return exact.get(s) ?? s;
    let out = cache.get(s);
    if (out !== undefined) return out;
    const m = /^(\s*)([\s\S]*?)(\s*)$/.exec(s);
    out = m[1] + core(m[2], 0) + m[3];
    // Report partial template matches as misses too. Never display a sentence
    // with fragment translations while keeping its Chinese words.
    if (HAN.test(out)) { misses.add(m[2]); out = s; }
    cache.set(s, out);
    return out;
  }

  function chineseText(raw) {
    const m = /^(\s*)([\s\S]*?)(\s*)$/.exec(raw);
    const label = sourceZh.get(m[2]);
    if (label !== undefined) return m[1] + label + m[3];
    let text = raw;
    for (const [re, zh] of zhTerms) text = text.replace(re, zh);
    return text;
  }

  const skipped = (el) => {
    if (!el) return true;
    // Empty-state chrome is UI; actual user/Agent messages remain verbatim.
    const ancestor = el.closest?.(SKIP);
    return !!ancestor && !(ancestor.matches(".chat-log") && el.closest(".chat-empty"));
  };

  function sourceText(node) {
    const st = textState.get(node);
    return st && (node.data === st.en || node.data === st.zh) ? st.raw : node.data;
  }

  const churn = new WeakMap();
  const loops = [];
  function hot(node) {
    const now = performance.now();
    let c = churn.get(node);
    if (!c || now - c.t > 2000) churn.set(node, (c = { t: now, n: 0 }));
    if (++c.n === 30) loops.push((node.parentElement && node.parentElement.className) || node.data.slice(0, 20));
    return c.n >= 30;
  }

  function doText(node) {
    const parent = node.parentElement;
    if (skipped(parent)) return;
    const st = textState.get(node);
    const data = node.data;

    /* 识别原始中文基准（若组件更新了文本，则以新文本为基准） */
    let raw = data;
    if (st) {
      if (data === st.en || data === st.zh) raw = st.raw;
    }
    const zh = polishZhText(chineseText(raw), parent);

    if (lang === "en") {
      if (!ready) {
        if (zh !== raw) {
          textState.set(node, { raw, zh, en: "" });
          if (data !== zh) node.data = zh;
        }
        return;
      }
      if (st && st.en && data === st.en && zh === st.zh) return;
      if (!HAN.test(zh) && !exact.has(zh.trim())) return;
      if (hot(node)) return;
      let en;
      const trimmed = zh.trim();
      if (parent && parent.classList && parent.classList.contains("preparation-character__unit") && Object.prototype.hasOwnProperty.call(STAT_UNIT_EN, trimmed)) {
        en = STAT_UNIT_EN[trimmed];
      } else {
        en = tr(zh);
      }
      if (parent.closest(".journey-caption__card > p,.journey-history__log article p") && HAN.test(en)) en = raw;
      textState.set(node, { raw, zh, en });
      if (en !== data) node.data = en;
    } else {
      if (zh !== raw) {
        textState.set(node, { raw, zh, en: st ? st.en : "" });
        if (data !== zh) node.data = zh;
      } else if (st && data === st.en) {
        node.data = st.zh;
        textState.delete(node);
      }
    }
  }

  function doAttrs(el) {
    if (!ready) return;
    // Chat messages and editable values remain verbatim; their controls and
    // accessible labels still belong to the selected interface language.
    if (el.closest("script,style,code,pre,[data-i18n-skip]")) return;
    let st = attrState.get(el);
    for (const a of ATTRS) {
      const v = el.getAttribute(a);
      if (v == null) continue;
      // The skin moves an already translated title into data-wk-tip. Keep
      // the original title's source when the new attribute first appears.
      const cur = st && (st[a] || (a === "data-wk-tip" ? st.title : undefined));
      const raw = cur && (v === cur.en || v === cur.zh) ? cur.raw : v;
      const zh = chineseText(raw);
      const en = tr(zh);
      if (!st) attrState.set(el, (st = {}));
      st[a] = { raw, zh, en };
      const next = lang === "en" ? en : zh;
      if (next !== v) el.setAttribute(a, next);
    }
  }

  function walk(root) {
    if (!root) return;
    if (root.nodeType === 3) { doText(root); return; }
    if (root.nodeType !== 1 && root.nodeType !== 9 && root.nodeType !== 11) return;
    if (root.nodeType === 1) {
      doAttrs(root);
      if (root.matches(SKIP) && !root.matches("input,textarea")) return;
    }
    const tw = document.createTreeWalker(root, NodeFilter.SHOW_ELEMENT | NodeFilter.SHOW_TEXT, {
      acceptNode: (n) => (n.nodeType === 1 && n.matches(SKIP) && !n.matches("input,textarea,.chat-log") ? NodeFilter.FILTER_REJECT : NodeFilter.FILTER_ACCEPT),
    });
    let n;
    while ((n = tw.nextNode())) n.nodeType === 3 ? doText(n) : doAttrs(n);
  }

  let titleZh = null;
  function doTitle() {
    if (lang === "en") {
      if (HAN.test(document.title)) {
        titleZh = document.title;
        const nextTitle = tr(titleZh);
        if (nextTitle !== document.title) document.title = nextTitle;
      }
    } else if (titleZh && document.title !== titleZh) {
      document.title = titleZh;
      titleZh = null;
    }
  }

  const mo = new MutationObserver((records) => {
    mountToggles();
    if (!ready && lang === "en") return;
    for (const r of records) {
      if (r.type === "characterData") doText(r.target);
      else if (r.type === "attributes") doAttrs(r.target);
      else for (const n of r.addedNodes) walk(n);
    }
  });

  /* 切换按钮：顶部工具栏（开始界面 / 局内 HUD）与菜单顶栏各一枚 */
  function makeToggle(where) {
    const b = document.createElement("button");
    b.type = "button";
    b.className = "ui-lang-toggle";
    b.dataset.uiLangToggle = where;
    b.setAttribute("data-i18n-skip", "");
    b.addEventListener("click", (e) => { e.stopPropagation(); setLang(lang === "en" ? "zh" : "en"); });
    paintToggle(b);
    return b;
  }
  function paintToggle(b) {
    b.textContent = lang === "en" ? "EN" : "中";
    b.title = lang === "en" ? "Language: EN (Tap to switch to 中文)" : "当前语言：中文（点击切换为 English）";
    if (b.hasAttribute("data-wk-tip")) b.setAttribute("data-wk-tip", b.title);
    b.setAttribute("aria-label", b.title);
    b.lang = lang === "en" ? "en" : "zh-CN";
  }
  function mountToggles() {
    for (const bar of document.querySelectorAll(".spirit-menu__toolbar")) {
      if (bar.querySelector(":scope > .ui-lang-toggle")) continue;
      bar.insertBefore(makeToggle("toolbar"), bar.firstElementChild);
    }
    for (const head of document.querySelectorAll(".spirit-menu__header")) {
      if (head.querySelector(".ui-lang-toggle")) continue;
      const anchor = head.querySelector("[data-gamepad-status-toggle]");
      if (anchor) anchor.before(makeToggle("menu"));
    }
  }

  /* 英文模式：现有中文衬线 / 黑体字体栈里的拉丁字母改用西文字体（unicode-range 只接管拉丁区） */
  const LATIN = "U+0000-024F, U+2000-206F, U+20A0-20CF, U+2100-214F";
  const SERIF = ["Noto Serif CJK SC", "Noto Serif SC", "Source Han Serif SC", "Songti SC", "STSong", "SimSun"];
  const SANS = ["PingFang SC", "Microsoft YaHei", "Noto Sans CJK SC", "Noto Sans SC", "Hiragino Sans GB", "Inter"];
  const face = (fam, locals) => `@font-face{font-family:"${fam}";src:${locals.map((l) => `local("${l}")`).join(",")};unicode-range:${LATIN};}`;
  const fontCss = SERIF.map((f) => face(f, ["Palatino Linotype", "Palatino", "Book Antiqua", "Georgia", "Noto Serif", "Times New Roman"])).join("")
    + SANS.map((f) => face(f, ["Avenir Next", "Helvetica Neue", "Segoe UI", "Roboto", "Arial"])).join("");
  function applyFonts() {
    let el = document.getElementById("ui-i18n-latin");
    if (lang === "en" && !el) {
      el = document.createElement("style");
      el.id = "ui-i18n-latin";
      el.textContent = fontCss;
      document.head.appendChild(el);
    } else if (lang !== "en" && el) el.remove();
  }

  function setLang(next) {
    lang = next;
    localStorage.setItem(STORE, lang);
    const html = document.documentElement;
    if (html.dataset.uiLang !== lang) html.dataset.uiLang = lang;
    const targetLang = lang === "en" ? "en" : "zh-CN";
    if (html.lang !== targetLang) html.lang = targetLang;
    document.querySelectorAll(".ui-lang-toggle").forEach(paintToggle);
    applyFonts();
    if (!ready && lang === "en") return load();
    walk(document.body);
    doTitle();
    document.dispatchEvent(new CustomEvent('ui-languagechange', { detail: { lang } }));
  }

  let loading = null;
  function load() {
    loading = loading || fetch(dictUrl).then((r) => r.json()).then((dict) => {
      compile(dict);
      ready = true;
      walk(document.body);
      if (lang === "en") doTitle();
      document.dispatchEvent(new CustomEvent('ui-languagechange', { detail: { lang } }));
    }).catch((e) => console.warn("[ui-i18n] dictionary load failed", e));
    return loading;
  }

  function start() {
    if (document.documentElement.dataset.uiLang !== lang) document.documentElement.dataset.uiLang = lang;
    if (lang === "en" && document.documentElement.lang !== "en") document.documentElement.lang = "en";
    applyFonts();
    mo.observe(document.documentElement, { subtree: true, childList: true, characterData: true, attributes: true, attributeFilter: ATTRS });
    mountToggles();
    ready = false;
    walk(document.body);
    load();
    new MutationObserver(doTitle).observe(document.querySelector("title") || document.head, { childList: true, characterData: true });
  }
  if (document.body) start();
  else document.addEventListener("DOMContentLoaded", start, { once: true });

  window.__uiI18n = { setLang, tr, sourceText, misses, loops, get lang() { return lang; } };
})();
