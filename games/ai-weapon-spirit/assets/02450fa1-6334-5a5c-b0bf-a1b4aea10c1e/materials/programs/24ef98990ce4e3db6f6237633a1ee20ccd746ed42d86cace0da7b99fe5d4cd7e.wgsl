struct AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX {
    originRadius: vec4<f32>,
    rayleigh: vec4<f32>,
    mie: vec4<f32>,
    absorption: vec4<f32>,
    ground: vec4<f32>,
    geometry: vec4<f32>,
}

struct ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX {
    worldViewProj: mat4x4<f32>,
    lightDir: vec3<f32>,
    lightingChannels: u32,
    lightColor: vec3<f32>,
    viewportWidth: f32,
    cameraPos: vec3<f32>,
    viewportHeight: f32,
    lightViewProj_A: mat4x4<f32>,
    inverseViewProj: mat4x4<f32>,
    lightViewProj_B: mat4x4<f32>,
    lightViewProj_C: mat4x4<f32>,
    lightViewProj_D: mat4x4<f32>,
    splitPlanes: array<vec4<f32>, 4>,
    cascadeCount: f32,
    cascadeBlend: f32,
    depthBias: f32,
    normalBias: f32,
    directionalShadowFilter: vec4<f32>,
    spotLightViewProj: array<mat4x4<f32>, 4>,
    temporalCurrentViewProj: mat4x4<f32>,
    temporalPreviousViewProj: mat4x4<f32>,
    temporalProjection: vec4<f32>,
    temporalPreviousCameraPos: vec4<f32>,
    ssrParams: vec4<f32>,
    cloudShadowOrigin: vec4<f32>,
    cloudShadowRight: vec4<f32>,
    cloudShadowUp: vec4<f32>,
    cloudShadowProjection: vec4<f32>,
    clippingPlanes: array<vec4<f32>, 6>,
    clippingControl: vec4<f32>,
    fogColorDensity: vec4<f32>,
    fogHeightOpacity: vec4<f32>,
    atmosphere: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX,
    atmosphereControl: vec4<f32>,
}

struct AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    luminance: vec3<f32>,
    transmittance: vec3<f32>,
}

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

@group(0) @binding(16) 
var cloudShadowMapX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX: texture_2d<f32>;
@group(0) @binding(17) 
var cloudShadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX: sampler;
@group(0) @binding(0) 
var<uniform> viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(1) @binding(0) 
var<uniform> materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: MaterialParametersX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX;

fn atmosphere_scene_visibilityX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2OZUXG2LCNFWGS5DZX(m: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, p: vec3<f32>) -> f32 {
    return 1f;
}

fn cloud_direct_solar_factorX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX(worldPosition: vec3<f32>, shadowOrigin: vec3<f32>, shadowRight: vec3<f32>, shadowUp: vec3<f32>, shadowProjection: vec4<f32>) -> f32 {
    var local: bool;
    var local_1: bool;
    var local_2: bool;
    var local_3: bool;
    var local_4: bool;
    var local_5: bool;
    var local_6: bool;
    var local_7: bool;

    if (worldPosition.x == worldPosition.x) {
        local = (worldPosition.y == worldPosition.y);
    } else {
        local = false;
    }
    let _e10 = local;
    if _e10 {
        local_1 = (worldPosition.z == worldPosition.z);
    } else {
        local_1 = false;
    }
    let _e17 = local_1;
    if _e17 {
        local_2 = all((abs(worldPosition) < vec3(3.402823e38f)));
    } else {
        local_2 = false;
    }
    let validReceiver = local_2;
    let offset = (worldPosition - shadowOrigin);
    let uv = ((vec2<f32>(dot(offset, shadowRight), dot(offset, shadowUp)) / vec2(max(shadowProjection.x, 0.000001f))) + vec2(0.5f));
    if all((uv >= vec2(0f))) {
        local_3 = all((uv <= vec2(1f)));
    } else {
        local_3 = false;
    }
    let inRange = local_3;
    if (shadowProjection.y > 0.5f) {
        local_4 = (shadowProjection.z < 0.5f);
    } else {
        local_4 = false;
    }
    let _e64 = local_4;
    if _e64 {
        local_5 = (shadowProjection.x > 0f);
    } else {
        local_5 = false;
    }
    let available = local_5;
    let _e80 = textureSampleLevel(cloudShadowMapX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX, cloudShadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX, clamp(uv, vec2(0f), vec2(1f)), 0f);
    let sampled = _e80.x;
    if validReceiver {
        local_6 = inRange;
    } else {
        local_6 = false;
    }
    let _e88 = local_6;
    if _e88 {
        local_7 = available;
    } else {
        local_7 = false;
    }
    let _e92 = local_7;
    return select(1f, clamp(sampled, 0f, 1f), _e92);
}

fn view_atmosphereX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, position: vec3<f32>) -> AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    return AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(vec3(0f), vec3(1f));
}

fn view_solar_transmittanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_1: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, position_1: vec3<f32>) -> vec3<f32> {
    return vec3(1f);
}

fn view_distant_sky_lightX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_2: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX) -> vec3<f32> {
    return vec3(0f);
}

fn ndc_worldX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_3: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, ndc: vec3<f32>) -> vec3<f32> {
    let world = (v_3.inverseViewProj * vec4<f32>(ndc, 1f));
    return (world.xyz / vec3(world.w));
}

fn accent_vertex(i_2: AccentInput, vertex_1: u32, right: vec2<f32>, up: vec2<f32>) -> AccentOutput {
    var o: AccentOutput;

    let corners = array<vec2<f32>, 6>(vec2<f32>(-1f, -1f), vec2<f32>(1f, -1f), vec2<f32>(1f, 1f), vec2<f32>(-1f, -1f), vec2<f32>(1f, 1f), vec2<f32>(-1f, 1f));
    let c = corners[vertex_1];
    o.position = vec4<f32>(((i_2.position.xy + (right * c.x)) + (up * c.y)), i_2.position.z, 1f);
    o.uv = c;
    o.color = i_2.color;
    o.shape = i_2.trailShape;
    let _e43 = o;
    return _e43;
}

fn flame_hash(p_1: vec2<f32>) -> f32 {
    return fract((sin(dot(p_1, vec2<f32>(127.1f, 311.7f))) * 43758.547f));
}

fn flame_noise(p_2: vec2<f32>) -> f32 {
    let i_3 = floor(p_2);
    let f = fract(p_2);
    let u = ((f * f) * (vec2(3f) - (2f * f)));
    let _e10 = flame_hash(i_3);
    let _e15 = flame_hash((i_3 + vec2<f32>(1f, 0f)));
    let _e22 = flame_hash((i_3 + vec2<f32>(0f, 1f)));
    let _e27 = flame_hash((i_3 + vec2<f32>(1f, 1f)));
    return mix(mix(_e10, _e15, u.x), mix(_e22, _e27, u.x), u.y);
}

@vertex 
fn vs_main(i: AccentInput, @builtin(vertex_index) vertex: u32, @location(10) flow: vec4<f32>) -> AccentOutput {
    var direction: vec2<f32> = vec2<f32>(0f, 1f);

    if (flow.w < 0.5f) {
        let _e11 = accent_vertex(i, vertex, i.right, i.up);
        return _e11;
    }
    let _e13 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
    let _e15 = ndc_worldX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(_e13, i.position);
    let _e18 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    let tip = (_e18 * vec4<f32>((_e15 + flow.xyz), 1f));
    let _e28 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj[0][0];
    let _e33 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj[1][0];
    let _e38 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj[2][0];
    let _e45 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj[0][1];
    let _e50 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj[1][1];
    let _e55 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj[2][1];
    let scale = vec2<f32>(length(vec3<f32>(_e28, _e33, _e38)), length(vec3<f32>(_e45, _e50, _e55)));
    let projectionScale = max(scale, vec2(0.000001f));
    let delta = (((tip.xy / vec2(max(abs(tip.w), 0.001f))) - i.position.xy) / projectionScale);
    if (length(delta) > 0.00001f) {
        direction = normalize(delta);
    }
    let _e79 = direction.y;
    let _e81 = direction.x;
    let right_1 = ((vec2<f32>(_e79, -(_e81)) * length((i.right / projectionScale))) * projectionScale);
    let _e89 = direction;
    let up_1 = ((_e89 * length((i.up / projectionScale))) * projectionScale);
    let _e95 = accent_vertex(i, vertex, right_1, up_1);
    return _e95;
}

@fragment 
fn fs_main(i_1: AccentOutput) -> @location(0) vec4<f32> {
    let p_3 = i_1.uv;
    let _e2 = fwidth(p_3);
    let aa = max((length(_e2) * 0.7f), 0.015f);
    if (i_1.shape.x > 0.5f) {
        let radius = length(p_3);
        let body = (max(0f, ((exp(((-(radius) * radius) * 3.2f)) - 0.040762205f) / 0.9592378f)) * (1f - smoothstep((1f - aa), 1f, radius)));
        let alpha = (body * i_1.color.w);
        let core = exp(((-(radius) * radius) * 28f));
        return vec4<f32>(((i_1.color.xyz * (0.78f + (core * 2.1f))) * alpha), alpha);
    }
    let phase = vec2<f32>(sin((i_1.shape.y * 6.28f)), cos((i_1.shape.y * 6.28f)));
    let time = (i_1.shape.z * 0.52f);
    let height = clamp(((p_3.y * 0.5f) + 0.5f), 0f, 1f);
    let _e82 = flame_noise((((p_3 * 2.15f) + (phase * 3.1f)) + vec2<f32>(0f, (-(time) * 2.4f))));
    let _e99 = flame_noise(((vec2<f32>((p_3.x * 7.3f), (p_3.y * 4.1f)) - (phase * 4.3f)) + vec2<f32>(0f, (-(time) * 4.2f))));
    let bend = ((sin((((height * 5.5f) - (time * 6f)) + (phase.x * 3f))) * height) * 0.25f);
    let width = max(0.015f, (pow((1f - height), 0.85f) * (0.42f + (sin((height * 3.14159f)) * 0.32f))));
    let across = abs(((p_3.x - bend) + (((_e82 - 0.5f) * height) * 0.18f)));
    let edgeWidth = (width * (0.82f + (_e99 * 0.3f)));
    let body_1 = (1f - smoothstep((edgeWidth - aa), (edgeWidth + aa), across));
    let base = smoothstep(0f, 0.14f, height);
    let tip_1 = (1f - smoothstep(0.93f, 1f, height));
    let inner = ((1f - smoothstep(0.16f, 0.72f, (across / max(width, 0.04f)))) * (1f - smoothstep(0.42f, 0.9f, height)));
    let core_1 = ((1f - smoothstep(0.02f, 0.25f, (across / max(width, 0.04f)))) * (1f - smoothstep(0.28f, 0.6f, height)));
    let cooling = smoothstep(0.25f, 1f, i_1.shape.z);
    let _e191 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.body;
    let orange = mix(i_1.color.xyz, _e191, (cooling * 0.42f));
    let _e197 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.body;
    let _e205 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.highlight;
    let rgb = (mix(_e197, orange, (0.25f + (inner * 0.75f))) + ((_e205 * ((inner * 0.8f) + (core_1 * 1.35f))) * (1f - (cooling * 0.45f))));
    let alpha_1 = ((((i_1.color.w * body_1) * base) * tip_1) * (0.68f + (inner * 0.32f)));
    return vec4<f32>((rgb * alpha_1), alpha_1);
}
