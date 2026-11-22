// /showcase/yintai/ — drives the YINTAI model viewer (YinViewer from /assets/showcase/yintai/viewer.js?v=76ddc28a).
// Static copy comes from the site dictionaries; the strings that change at runtime live here.
(async () => {
  const cv = document.getElementById('yin-cv');
  if (!cv || typeof window.YinViewer !== 'function') return;
  const $ = (id) => document.getElementById('yin-' + id);
  const zh = /^zh/i.test(document.documentElement.lang || '');
  const nf = (n) => String(Math.round(n)).replace(/\B(?=(\d{3})+(?!\d))/g, ',');
  const TOTAL = 72157;

  const COPY = zh ? {
    names: { Pelvis: '骨盆', Spine: '腰轴', Chest: '胸甲', Head: '头', Nose: '机鼻', Pack: '背包 / 背罐', 'Wing.L': '翼 左', 'Wing.R': '翼 右',
      'WingTip.L': '翼尖 左', 'WingTip.R': '翼尖 右', 'Shoulder.L': '肩甲 左', 'Shoulder.R': '肩甲 右', 'Forearm.L': '前臂 左', 'Forearm.R': '前臂 右',
      'Hand.L': '手 左', 'Hand.R': '手 右', 'Thigh.L': '大腿 左', 'Thigh.R': '大腿 右', 'Shin.L': '小腿 左', 'Shin.R': '小腿 右', 'Foot.L': '脚 左', 'Foot.R': '脚 右',
      'Fin.L': '尾鳍 左', 'Fin.R': '尾鳍 右', Vent: '背部进气', Keel: '龙骨', Tail: '尾喷', PlateL: '胸侧盖板 左', PlateR: '胸侧盖板 右', Hatch: '舱盖' },
    legend: {
      final: '游戏里的样子：四个材质槽，加上图集里的小细节。',
      clay: '只看形：同一个灰，去掉材质和贴图。',
      wire: '低模的三角边，画在素模上。装甲件是规则的四边形网格，放大可以看细部。',
      sag: '每个三角离曲面多远：黄 > 5 mm，橙 > 10 mm，红 > 20 mm。',
      bake: '高亮的是贴了烘焙图集的三角，共 2,574 个。',
      joint: '一种颜色 = 挂在同一个关节上的零件，共 30 个关节。',
    },
    mech: '机甲', jet: '战机', empty: '空', emptyHint: '把滑杆往右拖，零件按关节顺序一件一件出来。',
    part: (n, j) => nf(n) + ' 三角 · 关节 ' + j,
    fail: '模型没有载入。这个页面需要支持 WebGL 2 的浏览器。',
  } : {
    names: { Pelvis: 'Pelvis', Spine: 'Waist', Chest: 'Chest armour', Head: 'Head', Nose: 'Nose', Pack: 'Pack / back tanks', 'Wing.L': 'Wing L', 'Wing.R': 'Wing R',
      'WingTip.L': 'Wingtip L', 'WingTip.R': 'Wingtip R', 'Shoulder.L': 'Shoulder L', 'Shoulder.R': 'Shoulder R', 'Forearm.L': 'Forearm L', 'Forearm.R': 'Forearm R',
      'Hand.L': 'Hand L', 'Hand.R': 'Hand R', 'Thigh.L': 'Thigh L', 'Thigh.R': 'Thigh R', 'Shin.L': 'Shin L', 'Shin.R': 'Shin R', 'Foot.L': 'Foot L', 'Foot.R': 'Foot R',
      'Fin.L': 'Tail fin L', 'Fin.R': 'Tail fin R', Vent: 'Dorsal intake', Keel: 'Keel', Tail: 'Tail nozzle', PlateL: 'Chest side cover L', PlateR: 'Chest side cover R', Hatch: 'Canopy' },
    legend: {
      final: 'As seen in the game: four material slots plus the small details from the atlas.',
      clay: 'Form only: one grey, no materials or textures.',
      wire: 'The triangle edges of the game mesh, drawn on the clay model. Armour parts are regular quad grids; zoom in for detail.',
      sag: 'How far each triangle sits from the true surface: yellow > 5 mm, orange > 10 mm, red > 20 mm.',
      bake: 'Highlighted: the 2,574 triangles that carry the baked normal / AO atlas.',
      joint: 'One colour = the parts hanging off one joint; 30 joints in total.',
    },
    mech: 'Mech', jet: 'Fighter', empty: 'Empty', emptyHint: 'Drag the slider to the right; parts appear one by one in joint order.',
    part: (n, j) => nf(n) + ' triangles · joint ' + j,
    fail: 'The model could not be loaded. This page needs a browser with WebGL 2.',
  };
  const MODE = { final: [0, 0], clay: [1, 0], wire: [1, 0.62], sag: [6, 0], bake: [4, 0], joint: [3, 0] };

  let v;
  try { v = await window.YinViewer(cv, '/assets/showcase/yintai/yin-gong3'); }
  catch (e) { $('load').textContent = COPY.fail; window.__yinErr = String(e); return; }
  $('load').hidden = true; $('read').hidden = false;

  const s = v.s;
  const FRONT = 3.578;
  Object.assign(s, { yaw: FRONT + 0.35, pitch: 0.1, dist: 25, fov: 30, target: [0, 4.9, 0.2], grid: 0.55, shadow: 0.55, fly: 1.0,
    light: 1, expo: 1.15, holo: [0.8, 0.815, 0.825], wireCol: [0.1, 0.13, 0.15], gridCol: [0.3, 0.34, 0.37] });
  let spin = true, dirty = true, last = performance.now();
  const setSpin = (on) => { spin = on; $('spin').setAttribute('aria-pressed', String(on)); };
  const fit = () => {
    const r = cv.getBoundingClientRect(), d = Math.min(2, window.devicePixelRatio || 1);
    const w = Math.max(2, Math.round(r.width * d)), h = Math.max(2, Math.round(r.height * d));
    if (cv.width !== w || cv.height !== h) { cv.width = w; cv.height = h; dirty = true; }
  };
  const setMode = (m) => {
    if (!MODE[m]) return;
    s.mode = MODE[m][0]; s.wire = MODE[m][1];
    for (const b of $('modes').children) b.setAttribute('aria-pressed', String(b.dataset.m === m));
    $('legend').textContent = COPY.legend[m]; dirty = true;
  };
  $('modes').addEventListener('click', (e) => { const b = e.target.closest('button'); if (b) setMode(b.dataset.m); });

  const J = v.meta.joints;
  const count = (name) => (v.partOf[name] && v.partOf[name].count) || 0;
  const setBuild = (g) => {
    let cum = 0, cur = -1;
    for (let j = 0; j < 30; j++) {
      const p = Math.min(1, Math.max(0, g - j)); s.parts[j] = p;
      cum += count(J[j].name) * Math.min(1, p * 2.6);
      if (p > 0 && p < 1) cur = j;
    }
    if (cur < 0) cur = Math.min(29, Math.max(0, Math.ceil(g) - 1));
    $('bval').textContent = Math.min(30, Math.floor(g)) + ' / 30';
    $('tri').textContent = nf(g >= 30 ? TOTAL : cum);
    const now = $('now'), head = document.createElement('b'), nm = J[cur].name;
    head.textContent = g <= 0 ? COPY.empty : (COPY.names[nm] || nm);
    now.replaceChildren(head, document.createTextNode(g <= 0 ? COPY.emptyHint : COPY.part(count(nm), nm)));
    dirty = true;
  };
  $('build').addEventListener('input', (e) => setBuild(+e.target.value));
  $('xf').addEventListener('input', (e) => {
    s.u = +e.target.value;
    $('uval').textContent = s.u < 0.02 ? COPY.mech : s.u > 0.98 ? COPY.jet : Math.round(s.u * 100) + ' %';
    dirty = true;
  });
  $('spin').addEventListener('click', () => setSpin(!spin));

  // Orbit with one pointer, pinch with two, wheel to zoom (the page scrolls again at either limit).
  const zoom = (k) => { const d = Math.min(44, Math.max(5, s.dist * k)); const moved = d !== s.dist; s.dist = d; dirty = dirty || moved; return moved; };
  const pts = new Map();
  let drag = null, pinch = 0;
  const gap = () => { const [a, b] = [...pts.values()]; return Math.hypot(a[0] - b[0], a[1] - b[1]); };
  cv.addEventListener('pointerdown', (e) => {
    pts.set(e.pointerId, [e.clientX, e.clientY]); cv.setPointerCapture(e.pointerId); setSpin(false);
    if (pts.size === 1) drag = [e.clientX, e.clientY, s.yaw, s.pitch]; else { drag = null; pinch = gap(); }
  });
  cv.addEventListener('pointermove', (e) => {
    if (!pts.has(e.pointerId)) return;
    pts.set(e.pointerId, [e.clientX, e.clientY]);
    if (pts.size >= 2) { const g = gap(); if (pinch > 0 && g > 0) zoom(pinch / g); pinch = g; return; }
    if (!drag) return;
    s.yaw = drag[2] - (e.clientX - drag[0]) * 0.008;
    s.pitch = Math.min(1.2, Math.max(-0.5, drag[3] + (e.clientY - drag[1]) * 0.006));
    dirty = true;
  });
  const end = (e) => { pts.delete(e.pointerId); drag = null; pinch = 0; };
  cv.addEventListener('pointerup', end); cv.addEventListener('pointercancel', end);
  cv.addEventListener('wheel', (e) => { if (zoom(Math.exp(e.deltaY * 0.0012))) e.preventDefault(); }, { passive: false });
  cv.addEventListener('dblclick', () => { s.yaw = FRONT; s.pitch = 0.1; s.dist = 25; dirty = true; });
  addEventListener('resize', fit);

  setMode('final'); setBuild(30); fit();
  let seen = true;
  if ('IntersectionObserver' in window) new IntersectionObserver((es) => { seen = es[0].isIntersecting; }).observe(cv);
  if (matchMedia('(prefers-reduced-motion: reduce)').matches) setSpin(false);
  const tick = (t) => {
    const dt = Math.min(0.05, (t - last) / 1000); last = t;
    if (seen) { fit(); if (spin) { s.yaw += dt * 0.22; dirty = true; } if (dirty) { v.draw(); dirty = false; } }
    requestAnimationFrame(tick);
  };
  requestAnimationFrame(tick);
  window.__yin = v; window.__yinReady = true;
})();
