struct MaterialParametersX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX {
    patternCoordinatesTransform: vec4<f32>,
    patternCoordinatesMetadata: vec4<f32>,
    patternCoordinatesRotation: vec4<f32>,
    accentCoordinatesTransform: vec4<f32>,
    accentCoordinatesMetadata: vec4<f32>,
    accentCoordinatesRotation: vec4<f32>,
    style: vec4<f32>,
    atlas: vec4<f32>,
    body: vec3<f32>,
    highlight: vec3<f32>,
}

struct AccentInput {
    @location(0) position: vec3<f32>,
    @location(1) right: vec2<f32>,
    @location(2) up: vec2<f32>,
    @location(3) color: vec4<f32>,
    @location(9) trailShape: vec4<f32>,
}

struct AccentOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
    @location(1) color: vec4<f32>,
    @location(2) @interpolate(flat) shape: vec4<f32>,
}

@group(1) @binding(0) 
var<uniform> materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: MaterialParametersX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX;

fn flame_hash(p: vec2<f32>) -> f32 {
    return fract((sin(dot(p, vec2<f32>(127.1f, 311.7f))) * 43758.547f));
}

fn flame_noise(p_1: vec2<f32>) -> f32 {
    let i_2 = floor(p_1);
    let f = fract(p_1);
    let u = ((f * f) * (vec2(3f) - (2f * f)));
    let _e10 = flame_hash(i_2);
    let _e15 = flame_hash((i_2 + vec2<f32>(1f, 0f)));
    let _e22 = flame_hash((i_2 + vec2<f32>(0f, 1f)));
    let _e27 = flame_hash((i_2 + vec2<f32>(1f, 1f)));
    return mix(mix(_e10, _e15, u.x), mix(_e22, _e27, u.x), u.y);
}

@vertex 
fn vs_main(i: AccentInput, @builtin(vertex_index) vertex: u32) -> AccentOutput {
    var o: AccentOutput;

    let corners = array<vec2<f32>, 6>(vec2<f32>(-1f, -1f), vec2<f32>(1f, -1f), vec2<f32>(1f, 1f), vec2<f32>(-1f, -1f), vec2<f32>(1f, 1f), vec2<f32>(-1f, 1f));
    let c = corners[vertex];
    o.position = vec4<f32>(((i.position.xy + (i.right * c.x)) + (i.up * c.y)), i.position.z, 1f);
    o.uv = c;
    o.color = i.color;
    o.shape = i.trailShape;
    let _e43 = o;
    return _e43;
}

@fragment 
fn fs_main(i_1: AccentOutput) -> @location(0) vec4<f32> {
    let p_2 = i_1.uv;
    let _e2 = fwidth(p_2);
    let aa = max((length(_e2) * 0.7f), 0.015f);
    if (i_1.shape.x > 0.5f) {
        let radius = length(p_2);
        let body = (max(0f, ((exp(((-(radius) * radius) * 3.2f)) - 0.040762205f) / 0.9592378f)) * (1f - smoothstep((1f - aa), 1f, radius)));
        let alpha = (body * i_1.color.w);
        let core = exp(((-(radius) * radius) * 28f));
        return vec4<f32>(((i_1.color.xyz * (0.78f + (core * 2.1f))) * alpha), alpha);
    }
    let _e51 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.style.x;
    if (_e51 < 3.5f) {
        let phase = vec2<f32>(sin((i_1.shape.y * 6.28f)), cos((i_1.shape.y * 6.28f)));
        let time = (i_1.shape.z * 0.52f);
        let height = clamp(((p_2.y * 0.5f) + 0.5f), 0f, 1f);
        let _e88 = flame_noise((((p_2 * 2.15f) + (phase * 3.1f)) + vec2<f32>(0f, (-(time) * 2.4f))));
        let _e105 = flame_noise(((vec2<f32>((p_2.x * 7.3f), (p_2.y * 4.1f)) - (phase * 4.3f)) + vec2<f32>(0f, (-(time) * 4.2f))));
        let bend = ((sin((((height * 5.5f) - (time * 6f)) + (phase.x * 3f))) * height) * 0.25f);
        let width = max(0.015f, (pow((1f - height), 0.85f) * (0.42f + (sin((height * 3.14159f)) * 0.32f))));
        let across = abs(((p_2.x - bend) + (((_e88 - 0.5f) * height) * 0.18f)));
        let edgeWidth = (width * (0.82f + (_e105 * 0.3f)));
        let body_1 = (1f - smoothstep((edgeWidth - aa), (edgeWidth + aa), across));
        let base = smoothstep(0f, 0.14f, height);
        let tip = (1f - smoothstep(0.93f, 1f, height));
        let inner = ((1f - smoothstep(0.16f, 0.72f, (across / max(width, 0.04f)))) * (1f - smoothstep(0.42f, 0.9f, height)));
        let core_1 = ((1f - smoothstep(0.02f, 0.25f, (across / max(width, 0.04f)))) * (1f - smoothstep(0.28f, 0.6f, height)));
        let cooling = smoothstep(0.25f, 1f, i_1.shape.z);
        let _e197 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.body;
        let orange = mix(i_1.color.xyz, _e197, (cooling * 0.42f));
        let _e203 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.body;
        let _e211 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.highlight;
        let rgb = (mix(_e203, orange, (0.25f + (inner * 0.75f))) + ((_e211 * ((inner * 0.8f) + (core_1 * 1.35f))) * (1f - (cooling * 0.45f))));
        let alpha_1 = ((((i_1.color.w * body_1) * base) * tip) * (0.68f + (inner * 0.32f)));
        return vec4<f32>((rgb * alpha_1), alpha_1);
    }
    let skew = ((i_1.shape.y - 0.5f) * 0.23f);
    let plane = max(max((abs((p_2.x + (skew * p_2.y))) * 0.94f), (abs(p_2.y) * 1.12f)), (abs(((p_2.x * 0.75f) + (p_2.y * 0.64f))) * 1.12f));
    let mask = (1f - smoothstep((0.76f - aa), (0.76f + aa), plane));
    let top = step(0.14f, (p_2.y + (p_2.x * 0.32f)));
    let side = step((p_2.x - 0.18f), (p_2.y * 0.25f));
    let shade = ((0.58f + (side * 0.3f)) + (top * 0.36f));
    let rim = ((1f - smoothstep(0.035f, 0.08f, abs(((p_2.y + (p_2.x * 0.32f)) - 0.14f)))) * 0.18f);
    let _e312 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.highlight;
    let rgb_1 = (mix(i_1.color.xyz, _e312, ((top * 0.32f) + rim)) * shade);
    let alpha_2 = (mask * i_1.color.w);
    return vec4<f32>((rgb_1 * alpha_2), alpha_2);
}
