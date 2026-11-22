// WebGL2 viewer for the exported yintai mesh (x1-export.ts). No libraries, no external requests.
// const v = await YinViewer(canvas, 'yin-gong2');  v.s = state;  v.draw();  v.project([x, y, z]);  v.jointPos(j, u);  v.partCentre(name, u)
(function () {
  const VS = `#version 300 es
precision highp float; precision highp int;
layout(location=0) in vec3 aPos;
layout(location=1) in vec4 aNrm;
layout(location=2) in vec4 aAux;
layout(location=3) in vec2 aUv;
layout(location=4) in vec4 aTan;
uniform sampler2D uSkin; uniform float uU; uniform int uNU;
uniform mat4 uVP; uniform float uPart[30]; uniform vec2 uRange[30]; uniform vec3 uDir[30]; uniform float uFly;
out vec3 vN; out vec3 vT; out vec3 vW; out vec3 vBary; out vec2 vUv; out vec4 vInfo; out vec2 vP; out float vSag; flat out int vTri;
mat4 skin(int j, int k) { int x = j * 4; return mat4(texelFetch(uSkin, ivec2(x, k), 0), texelFetch(uSkin, ivec2(x + 1, k), 0), texelFetch(uSkin, ivec2(x + 2, k), 0), texelFetch(uSkin, ivec2(x + 3, k), 0)); }
void main() {
  int j = int(aAux.x + 0.5);
  int k0 = int(floor(uU)); int k1 = min(k0 + 1, uNU - 1); float f = uU - float(k0);
  mat4 M = skin(j, k0) * (1.0 - f) + skin(j, k1) * f;
  vec4 w = M * vec4(aPos, 1.0);
  float p = uPart[j];
  float tri = float(gl_VertexID / 3);
  float frac = (tri - uRange[j].x) / max(uRange[j].y, 1.0);
  float slide = smoothstep(0.4, 1.0, p);
  w.xyz += uDir[j] * (1.0 - slide) * (1.0 - slide) * uFly;
  vW = w.xyz;
  vN = normalize(mat3(M) * aNrm.xyz);
  vT = mat3(M) * aTan.xyz;
  int b = gl_VertexID % 3;
  vBary = vec3(b == 0 ? 1.0 : 0.0, b == 1 ? 1.0 : 0.0, b == 2 ? 1.0 : 0.0);
  vUv = aUv;
  vInfo = vec4(aNrm.w * 127.0, aAux.y, aAux.z, aTan.w);
  vP = vec2(p, float(j)); vSag = aAux.w; vTri = gl_VertexID / 3 + 1;
  gl_Position = uVP * w;
  if (frac > p * 2.6 || p <= 0.0) gl_Position = vec4(2.0, 2.0, 2.0, 0.0);
}`;
  const FS = `#version 300 es
precision highp float; precision highp int;
in vec3 vN; in vec3 vT; in vec3 vW; in vec3 vBary; in vec2 vUv; in vec4 vInfo; in vec2 vP; in float vSag; flat in int vTri;
uniform vec3 uEye; uniform vec3 uSlotCol[9]; uniform vec3 uSlotMR[9];
uniform sampler2D uAtlas; uniform int uMode; uniform float uWire; uniform vec3 uWireCol; uniform float uBake; uniform int uFlagMask;
uniform float uSolid; uniform vec3 uHolo; uniform float uExpo; uniform float uHi; uniform float uEnvYaw; uniform float uLight;
out vec4 o;
float box(vec2 p, vec2 c, vec2 h, float s) { vec2 d = abs(p - c) - h; return 1.0 - smoothstep(-s, s, max(d.x, d.y)); }
vec3 envD(vec3 r0, float rough) {
  float cy = cos(uEnvYaw), sy = sin(uEnvYaw);
  vec3 r = vec3(r0.x * cy - r0.z * sy, r0.y, r0.x * sy + r0.z * cy);
  float s = 0.03 + rough * 0.9;
  vec3 c = mix(vec3(0.012, 0.018, 0.022), vec3(0.085, 0.11, 0.125), smoothstep(-0.35 - s, 0.25 + s, r.y));
  c = mix(c, vec3(0.2, 0.25, 0.28), smoothstep(0.05, 1.0, r.y));
  if (r.y > 0.02) {
    vec2 p = r.xz / r.y;
    c += vec3(1.0, 0.98, 0.94) * 5.2 * box(p, vec2(0.75, 0.2), vec2(0.34, 2.6), s);
    c += vec3(0.82, 0.92, 1.0) * 2.6 * box(p, vec2(-1.25, -0.3), vec2(0.22, 2.2), s);
    c += vec3(1.0, 1.0, 1.0) * 1.6 * box(p, vec2(-0.1, 2.9), vec2(1.6, 0.3), s * 1.5);
  }
  float side = max(0.0, dot(r, normalize(vec3(-0.75, 0.12, 0.65))));
  c += vec3(0.9, 0.62, 0.36) * 0.9 * pow(side, mix(90.0, 6.0, rough));
  float rim = max(0.0, dot(r, normalize(vec3(0.6, 0.25, -0.75))));
  c += vec3(0.5, 0.75, 0.9) * 1.2 * pow(rim, mix(60.0, 5.0, rough));
  return c;
}
// light studio: pale floor, bright horizon band, soft ceiling with three softboxes (silver reads as bright metal with a darker floor reflection)
vec3 envL(vec3 r0, float rough) {
  float cy = cos(uEnvYaw), sy = sin(uEnvYaw);
  vec3 r = vec3(r0.x * cy - r0.z * sy, r0.y, r0.x * sy + r0.z * cy);
  float s = 0.03 + rough * 0.9;
  float soft = smoothstep(0.25, 0.85, rough);
  vec3 c = mix(vec3(0.3, 0.31, 0.33), vec3(0.6, 0.62, 0.64), smoothstep(-0.9, -0.05, r.y));
  vec3 sky = mix(mix(vec3(0.15, 0.17, 0.19), vec3(0.72, 0.74, 0.76), soft), vec3(1.05, 1.08, 1.12), smoothstep(0.02, 0.24 + s * 0.6, r.y));
  sky = mix(sky, vec3(0.8, 0.84, 0.9), smoothstep(0.5, 1.0, r.y));
  c = mix(c, sky, smoothstep(-0.03 - s, s * 0.3, r.y));
  if (r.y > 0.02) {
    vec2 p = r.xz / r.y;
    c += vec3(1.0, 0.985, 0.96) * 3.2 * box(p, vec2(0.75, 0.2), vec2(0.36, 2.6), s);
    c += vec3(0.9, 0.95, 1.0) * 1.8 * box(p, vec2(-1.25, -0.3), vec2(0.24, 2.2), s);
    c += vec3(1.0) * 1.3 * box(p, vec2(-0.1, 2.9), vec2(1.6, 0.32), s * 1.5);
  }
  float side = max(0.0, dot(r, normalize(vec3(-0.75, 0.12, 0.65))));
  c += vec3(1.0, 0.86, 0.7) * 0.5 * pow(side, mix(90.0, 6.0, rough));
  return c;
}
vec3 env(vec3 r, float rough) { return uLight > 0.5 ? envL(r, rough) : envD(r, rough); }
vec3 hue(float h) { return clamp(abs(fract(h + vec3(0.0, 0.667, 0.333)) * 6.0 - 3.0) - 1.0, 0.0, 1.0); }
void main() {
  int slot = int(vInfo.x + 0.5); bool patch_ = vInfo.y > 0.5; int fl = int(vInfo.z + 0.5);
  vec3 N = normalize(vN); vec3 V = normalize(uEye - vW);
  if (!gl_FrontFacing) N = -N;
  float mask = 1.0, ao = 1.0;
  if ((fl & 8) != 0) mask = clamp(vUv.x, 0.0, 1.0);
  if (patch_ && uBake > 0.0) {
    vec4 m = texture(uAtlas, vUv);
    vec3 T = normalize(vT - N * dot(vT, N)); vec3 B = cross(N, T) * (vInfo.w >= 0.0 ? 1.0 : -1.0);
    vec2 xy = (m.rg * 255.0 - 128.0) / 127.0 * uBake;
    N = normalize(T * xy.x + B * xy.y + N * sqrt(max(1.0 - dot(xy, xy), 0.0)));
    mask = mix(1.0, m.b, uBake); ao = mix(1.0, m.a, uBake);
  }
  vec3 base = uSlotCol[slot]; float metal = uSlotMR[slot].x, rough = uSlotMR[slot].y, coat = uSlotMR[slot].z;
  vec3 emis = slot == 7 ? base * 3.0 : vec3(0.0);
  if (uMode == 1 || uMode == 2 || uMode == 4 || uMode == 6) { base = vec3(0.5, 0.52, 0.54); metal = 0.0; rough = 0.62; coat = 0.0; emis = vec3(0.0); }
  if (uMode == 3) { base = mix(vec3(0.5), hue(vP.y * 0.381966), 0.6); metal = 0.0; rough = 0.6; coat = 0.0; emis = vec3(0.0); }
  if (uMode == 2) {
    int f = fl & uFlagMask;
    if ((f & 4) != 0) base = vec3(0.1, 0.45, 1.0);
    if ((f & 1) != 0) base = vec3(1.0, 0.5, 0.05);
    if ((f & 2) != 0) base = vec3(1.0, 0.08, 0.08);
    if (f != 0) emis = base * 0.35;
  }
  if (uMode == 6) { float mm = vSag * 0.25; if (mm > 5.0) base = vec3(0.95, 0.85, 0.2); if (mm > 10.0) base = vec3(1.0, 0.5, 0.05); if (mm > 20.0) base = vec3(1.0, 0.08, 0.08); if (mm > 5.0) emis = base * 0.3; }
  if (uMode == 4) { if (patch_) { base = vec3(0.95, 0.6, 0.12); emis = base * 0.25 * uHi; } else base *= 0.55; }
  base *= mix(0.45, 1.0, mask);
  float nv = max(dot(N, V), 0.0);
  vec3 R = reflect(-V, N);
  vec3 F0 = mix(vec3(0.04), base, metal);
  vec3 F = F0 + (1.0 - F0) * pow(1.0 - nv, 5.0);
  vec3 dif = base * (1.0 - metal) * (env(N, 1.0) * 1.6 + 0.9 * max(dot(N, normalize(vec3(0.45, 0.8, 0.4))), 0.0));
  vec3 spec = env(R, rough) * F;
  float fc = 0.04 + 0.96 * pow(1.0 - nv, 5.0);
  vec3 col = (dif + spec) * (1.0 - fc * coat) + env(R, 0.02) * fc * coat;
  col *= ao; col += emis;
  if (uMode == 5) col = N * 0.5 + 0.5;
  col *= uExpo;
  col = col / (1.0 + col * 0.7); col = pow(col, vec3(1.0 / 2.2));
  if (uMode == 5) col = N * 0.5 + 0.5;
  vec3 d = fwidth(vBary); vec3 e = smoothstep(vec3(0.0), d * 1.25, vBary);
  float line = 1.0 - min(min(e.x, e.y), e.z);
  float solid = uSolid * smoothstep(0.5, 0.95, vP.x);
  vec3 holo = uLight > 0.5 ? mix(uHolo * (0.93 + 0.07 * N.y), uWireCol, line * uWire) : uHolo * (0.1 + 0.9 * line) + uHolo * 0.08 * (0.5 + 0.5 * N.y);
  vec3 lit = mix(col, uWireCol, line * uWire);
  o = vec4(mix(holo, lit, solid), 1.0);
  if (uMode == 7) o = vec4(float(vTri & 255) / 255.0, float((vTri >> 8) & 255) / 255.0, float((vTri >> 16) & 255) / 255.0, 1.0);
}`;
  const GVS = `#version 300 es
precision highp float; layout(location=0) in vec2 aP; uniform mat4 uVP; uniform float uSize; out vec3 vW;
void main() { vW = vec3(aP.x * uSize, 0.0, aP.y * uSize); gl_Position = uVP * vec4(vW, 1.0); }`;
  const GFS = `#version 300 es
precision highp float; in vec3 vW; uniform vec3 uGridCol; uniform float uGrid; uniform float uShadow; uniform vec3 uCen; out vec4 o;
void main() {
  vec2 g = vW.xz; vec2 f = fwidth(g);
  vec2 a = abs(fract(g - 0.5) - 0.5) / f; float l1 = 1.0 - min(min(a.x, a.y), 1.0);
  vec2 g5 = g / 5.0; vec2 f5 = fwidth(g5); vec2 b = abs(fract(g5 - 0.5) - 0.5) / f5; float l5 = 1.0 - min(min(b.x, b.y), 1.0);
  float r = length(vW.xz - uCen.xz);
  float fade = 1.0 - smoothstep(8.0, 34.0, r);
  float al = (l1 * 0.16 + l5 * 0.34) * fade * uGrid;
  float sh = (1.0 - smoothstep(0.5, 6.5, r)) * 0.62 * uShadow;
  vec3 c = uGridCol * al;
  float A = al + sh * (1.0 - al);
  o = vec4(c, A);
}`;
  function sh(gl, t, s) { const x = gl.createShader(t); gl.shaderSource(x, s); gl.compileShader(x); if (!gl.getShaderParameter(x, gl.COMPILE_STATUS)) throw new Error(gl.getShaderInfoLog(x)); return x; }
  function prog(gl, v, f) { const p = gl.createProgram(); gl.attachShader(p, sh(gl, gl.VERTEX_SHADER, v)); gl.attachShader(p, sh(gl, gl.FRAGMENT_SHADER, f)); gl.linkProgram(p); if (!gl.getProgramParameter(p, gl.LINK_STATUS)) throw new Error(gl.getProgramInfoLog(p)); return p; }
  function persp(fovy, asp, n, f) { const t = 1 / Math.tan(fovy / 2), m = new Float32Array(16); m[0] = t / asp; m[5] = t; m[10] = (f + n) / (n - f); m[11] = -1; m[14] = 2 * f * n / (n - f); return m; }
  function look(e, c, u) { let z = [e[0] - c[0], e[1] - c[1], e[2] - c[2]]; const zl = Math.hypot(...z); z = z.map((x) => x / zl); let x = [u[1] * z[2] - u[2] * z[1], u[2] * z[0] - u[0] * z[2], u[0] * z[1] - u[1] * z[0]]; const xl = Math.hypot(...x); x = x.map((q) => q / xl); const y = [z[1] * x[2] - z[2] * x[1], z[2] * x[0] - z[0] * x[2], z[0] * x[1] - z[1] * x[0]];
    return new Float32Array([x[0], y[0], z[0], 0, x[1], y[1], z[1], 0, x[2], y[2], z[2], 0, -(x[0] * e[0] + x[1] * e[1] + x[2] * e[2]), -(y[0] * e[0] + y[1] * e[1] + y[2] * e[2]), -(z[0] * e[0] + z[1] * e[1] + z[2] * e[2]), 1]); }
  function mul(a, b) { const o = new Float32Array(16); for (let c = 0; c < 4; c++) for (let r = 0; r < 4; r++) o[c * 4 + r] = a[r] * b[c * 4] + a[4 + r] * b[c * 4 + 1] + a[8 + r] * b[c * 4 + 2] + a[12 + r] * b[c * 4 + 3]; return o; }

  window.YinViewer = async function (canvas, prefix) {
    const meta = await (await fetch(prefix + '.json')).json();
    const bin = await (await fetch(prefix + '.bin')).arrayBuffer();
    const gl = canvas.getContext('webgl2', { antialias: true, alpha: true, premultipliedAlpha: true, preserveDrawingBuffer: true });
    if (!gl) throw new Error('no webgl2');
    const V = meta.verts, O = meta.offs, NU = meta.nu, NJ = meta.nj;
    const pos = new Float32Array(bin, O.pos, V * 3), skin = new Float32Array(bin, O.skin, NU * NJ * 16), aux = new Uint8Array(bin, O.aux, V * 4);
    const nq = new Int8Array(bin, O.nrm, V * 4);
    for (let t = 0; t < V / 3; t++) { let sg = 0; if (!aux[t * 12 + 1]) for (let k = 0; k < 3; k++) { const a = t * 3 + k, b = t * 3 + (k + 1) % 3; const e = [pos[b * 3] - pos[a * 3], pos[b * 3 + 1] - pos[a * 3 + 1], pos[b * 3 + 2] - pos[a * 3 + 2]], L = Math.hypot(e[0], e[1], e[2]) || 1e-9;
        const la = Math.hypot(nq[a * 4], nq[a * 4 + 1], nq[a * 4 + 2]) || 1, lb = Math.hypot(nq[b * 4], nq[b * 4 + 1], nq[b * 4 + 2]) || 1;
        const da = (nq[a * 4] * e[0] + nq[a * 4 + 1] * e[1] + nq[a * 4 + 2] * e[2]) / (la * L), db = (nq[b * 4] * e[0] + nq[b * 4 + 1] * e[1] + nq[b * 4 + 2] * e[2]) / (lb * L);
        const th = Math.abs(Math.asin(Math.max(-1, Math.min(1, da))) - Math.asin(Math.max(-1, Math.min(1, db)))); sg = Math.max(sg, L / 2 * Math.tan(Math.min(th, 3) / 4)); }
      const q = Math.min(255, Math.round(sg * 4000)); aux[t * 12 + 3] = q; aux[t * 12 + 7] = q; aux[t * 12 + 11] = q; }
    const P = prog(gl, VS, FS), G = prog(gl, GVS, GFS);
    const vao = gl.createVertexArray(); gl.bindVertexArray(vao);
    const buf = (loc, data, n, type, norm) => { const b = gl.createBuffer(); gl.bindBuffer(gl.ARRAY_BUFFER, b); gl.bufferData(gl.ARRAY_BUFFER, data, gl.STATIC_DRAW); gl.enableVertexAttribArray(loc); gl.vertexAttribPointer(loc, n, type, norm, 0, 0); };
    buf(0, pos, 3, gl.FLOAT, false);
    buf(1, new Int8Array(bin, O.nrm, V * 4), 4, gl.BYTE, true);
    buf(2, aux, 4, gl.UNSIGNED_BYTE, false);
    buf(3, new Float32Array(bin, O.uv, V * 2), 2, gl.FLOAT, false);
    buf(4, new Int8Array(bin, O.tan, V * 4), 4, gl.BYTE, true);
    const gvao = gl.createVertexArray(); gl.bindVertexArray(gvao);
    buf(0, new Float32Array([-1, -1, 1, -1, -1, 1, 1, -1, 1, 1, -1, 1]), 2, gl.FLOAT, false);
    gl.bindVertexArray(null);
    const tSkin = gl.createTexture(); gl.activeTexture(gl.TEXTURE0); gl.bindTexture(gl.TEXTURE_2D, tSkin);
    gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA32F, NJ * 4, NU, 0, gl.RGBA, gl.FLOAT, skin);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST); gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST);
    const tAtlas = gl.createTexture(); gl.activeTexture(gl.TEXTURE1); gl.bindTexture(gl.TEXTURE_2D, tAtlas);
    const bmp = await createImageBitmap(await (await fetch(prefix + '-atlas.png')).blob(), { premultiplyAlpha: 'none', colorSpaceConversion: 'none' });
    gl.pixelStorei(gl.UNPACK_PREMULTIPLY_ALPHA_WEBGL, false); gl.pixelStorei(gl.UNPACK_COLORSPACE_CONVERSION_WEBGL, gl.NONE);
    gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, bmp);
    gl.generateMipmap(gl.TEXTURE_2D);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_LINEAR); gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE); gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
    const U = (p, n) => gl.getUniformLocation(p, n);
    // per-joint triangle ranges, bind-space centres and fly-in directions
    const range = new Float32Array(60), dir = new Float32Array(90), cen = [], partOf = {};
    const C0 = [0, 5.2, 0.3];
    for (const p of meta.parts) {
      range[p.joint * 2] = p.first; range[p.joint * 2 + 1] = p.count; partOf[p.name] = p;
      let mn = [1e9, 1e9, 1e9], mx = [-1e9, -1e9, -1e9];
      for (let i = p.first * 3; i < (p.first + p.count) * 3; i++) for (let k = 0; k < 3; k++) { const x = pos[i * 3 + k]; if (x < mn[k]) mn[k] = x; if (x > mx[k]) mx[k] = x; }
      const c = [(mn[0] + mx[0]) / 2, (mn[1] + mx[1]) / 2, (mn[2] + mx[2]) / 2]; cen[p.joint] = c; p.centre = c; p.size = [mx[0] - mn[0], mx[1] - mn[1], mx[2] - mn[2]];
      let d = [c[0] - C0[0], (c[1] - C0[1]) * 0.6, c[2] - C0[2]]; const l = Math.hypot(...d) || 1; d = d.map((x) => x / l);
      if (l < 0.8) d = [0, 0.3, 1];
      dir.set(d, p.joint * 3);
    }
    const SLOT_COL = new Float32Array(27), SLOT_MR = new Float32Array(27);
    const sc = { 0: [0.62, 0.63, 0.65], 1: [0.1, 0.1, 0.11], 2: [0.86, 0.43, 0.16], 4: [0.6, 0.075, 0.035], 6: [0.62, 0.63, 0.65], 7: [1, 0.2, 0.035], 8: [0.62, 0.63, 0.65] };
    const mr = { 0: [1, 0.3, 0.9], 1: [0.7, 0.5, 0.15], 2: [1, 0.33, 0.3], 4: [0.1, 0.4, 1], 6: [1, 0.3, 0.9], 7: [0, 0.5, 0], 8: [1, 0.3, 0.9] };
    for (let i = 0; i < 9; i++) { SLOT_COL.set(sc[i] ?? [0.5, 0.5, 0.5], i * 3); SLOT_MR.set(mr[i] ?? [0, 0.6, 0], i * 3); }
    const s = { yaw: 0.6, pitch: 0.12, dist: 26, target: [0, 4.9, 0.2], fov: 30, u: 0, parts: new Float32Array(30).fill(1), mode: 0, wire: 0, wireCol: [0.02, 0.03, 0.04], bake: 1, flagMask: 7, solid: 1, holo: [0.25, 0.9, 1.0], fly: 2.4, grid: 1, shadow: 1, gridCol: [0.45, 0.8, 0.85], expo: 1.0, hi: 1, envYaw: 0, roll: 0, light: 0, vp: null, sc: null };
    let VP = null, W = 1, H = 1, eye = [0, 0, 0];
    function cam() {
      const vp0 = s.vp || [0, 0, canvas.width, canvas.height]; W = vp0[2]; H = vp0[3];
      const cp = Math.cos(s.pitch); eye = [s.target[0] + s.dist * Math.sin(s.yaw) * cp, s.target[1] + s.dist * Math.sin(s.pitch), s.target[2] + s.dist * Math.cos(s.yaw) * cp];
      VP = mul(persp(s.fov * Math.PI / 180, W / H, 0.3, 400), look(eye, s.target, [Math.sin(s.roll), Math.cos(s.roll), 0]));
    }
    function draw(keep) {
      cam();
      const vp = s.vp || [0, 0, canvas.width, canvas.height];
      gl.disable(gl.SCISSOR_TEST); gl.clearColor(0, 0, 0, 0);
      if (!keep) { gl.viewport(0, 0, canvas.width, canvas.height); gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT); }
      const sc = s.sc || vp;
      gl.viewport(vp[0], vp[1], vp[2], vp[3]); gl.enable(gl.SCISSOR_TEST); gl.scissor(sc[0], sc[1], sc[2], sc[3]);
      if (keep) gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
      if (s.grid > 0 || s.shadow > 0) {
        gl.useProgram(G); gl.bindVertexArray(gvao); gl.disable(gl.DEPTH_TEST); gl.enable(gl.BLEND); gl.blendFunc(gl.ONE, gl.ONE_MINUS_SRC_ALPHA);
        gl.uniformMatrix4fv(U(G, 'uVP'), false, VP); gl.uniform1f(U(G, 'uSize'), 60); gl.uniform3fv(U(G, 'uGridCol'), s.gridCol); gl.uniform1f(U(G, 'uGrid'), s.grid); gl.uniform1f(U(G, 'uShadow'), s.shadow); gl.uniform3f(U(G, 'uCen'), 0, 0, 0.4);
        if (eye[1] > 0.05) gl.drawArrays(gl.TRIANGLES, 0, 6);
        gl.disable(gl.BLEND);
      }
      gl.useProgram(P); gl.bindVertexArray(vao); gl.enable(gl.DEPTH_TEST); gl.depthFunc(gl.LEQUAL); gl.disable(gl.CULL_FACE);
      gl.activeTexture(gl.TEXTURE0); gl.bindTexture(gl.TEXTURE_2D, tSkin); gl.uniform1i(U(P, 'uSkin'), 0);
      gl.activeTexture(gl.TEXTURE1); gl.bindTexture(gl.TEXTURE_2D, tAtlas); gl.uniform1i(U(P, 'uAtlas'), 1);
      gl.uniformMatrix4fv(U(P, 'uVP'), false, VP); gl.uniform1f(U(P, 'uU'), Math.max(0, Math.min(1, s.u)) * (NU - 1)); gl.uniform1i(U(P, 'uNU'), NU);
      gl.uniform1fv(U(P, 'uPart'), s.parts); gl.uniform2fv(U(P, 'uRange'), range); gl.uniform3fv(U(P, 'uDir'), dir); gl.uniform1f(U(P, 'uFly'), s.fly);
      gl.uniform3fv(U(P, 'uEye'), eye); gl.uniform3fv(U(P, 'uSlotCol'), SLOT_COL); gl.uniform3fv(U(P, 'uSlotMR'), SLOT_MR);
      gl.uniform1i(U(P, 'uMode'), s.mode); gl.uniform1f(U(P, 'uWire'), s.wire); gl.uniform3fv(U(P, 'uWireCol'), s.wireCol); gl.uniform1f(U(P, 'uBake'), s.bake); gl.uniform1i(U(P, 'uFlagMask'), s.flagMask);
      gl.uniform1f(U(P, 'uSolid'), s.solid); gl.uniform3fv(U(P, 'uHolo'), s.holo); gl.uniform1f(U(P, 'uExpo'), s.expo); gl.uniform1f(U(P, 'uHi'), s.hi); gl.uniform1f(U(P, 'uEnvYaw'), s.envYaw); gl.uniform1f(U(P, 'uLight'), s.light);
      gl.drawArrays(gl.TRIANGLES, 0, V);
      gl.disable(gl.SCISSOR_TEST);
    }
    function skinAt(j, u) { const x = Math.max(0, Math.min(1, u)) * (NU - 1), k0 = Math.floor(x), k1 = Math.min(k0 + 1, NU - 1), f = x - k0, m = new Float32Array(16); for (let i = 0; i < 16; i++) m[i] = skin[(k0 * NJ + j) * 16 + i] * (1 - f) + skin[(k1 * NJ + j) * 16 + i] * f; return m; }
    function xf(m, p) { return [m[0] * p[0] + m[4] * p[1] + m[8] * p[2] + m[12], m[1] * p[0] + m[5] * p[1] + m[9] * p[2] + m[13], m[2] * p[0] + m[6] * p[1] + m[10] * p[2] + m[14]]; }
    function jointPos(j, u) { return xf(skinAt(j, u ?? s.u), meta.joints[j].bind); }
    function xfPoint(j, p, u) { return xf(skinAt(j, u ?? s.u), p); }
    function partCentre(name, u) { const p = partOf[name]; return xf(skinAt(p.joint, u ?? s.u), p.centre); }
    function project(p) { if (!VP) cam(); const x = VP[0] * p[0] + VP[4] * p[1] + VP[8] * p[2] + VP[12], y = VP[1] * p[0] + VP[5] * p[1] + VP[9] * p[2] + VP[13], w = VP[3] * p[0] + VP[7] * p[1] + VP[11] * p[2] + VP[15]; return [(x / w * 0.5 + 0.5), (0.5 - y / w * 0.5), w]; }
    return { gl, meta, s, draw, cam, project, jointPos, xfPoint, partCentre, partOf, slotCol: SLOT_COL, slotMR: SLOT_MR };
  };
})();
