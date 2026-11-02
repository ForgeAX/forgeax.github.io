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
    core: vec4<f32>,
    coreColor: vec3<f32>,
    hiltGlow: vec4<f32>,
}

struct SegmentInput {
    @location(0) start: vec3<f32>,
    @location(1) endpoint: vec3<f32>,
    @location(2) color: vec4<f32>,
    @location(3) properties: vec2<f32>,
}

struct RibbonOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) color: vec4<f32>,
    @location(1) uv: vec2<f32>,
    @location(2) metres: f32,
}

@group(0) @binding(0) 
var<uniform> viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(0) @binding(16) 
var cloudShadowMapX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX: texture_2d<f32>;
@group(0) @binding(17) 
var cloudShadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX: sampler;
@group(1) @binding(0) 
var<uniform> materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: MaterialParametersX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX;
@group(1) @binding(1) 
var pattern_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: sampler;
@group(1) @binding(2) 
var patternX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: texture_2d<f32>;

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

@vertex 
fn vs_main(i: SegmentInput, @builtin(vertex_index) vertex: u32, @builtin(instance_index) segment: u32) -> RibbonOutput {
    var o: RibbonOutput;

    let corners = array<vec2<f32>, 6>(vec2<f32>(0f, -1f), vec2<f32>(1f, -1f), vec2<f32>(1f, 1f), vec2<f32>(0f, -1f), vec2<f32>(1f, 1f), vec2<f32>(0f, 1f));
    let c = corners[vertex];
    let _e25 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj[0][0];
    let _e30 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj[1][0];
    let _e35 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj[2][0];
    let _e42 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj[0][1];
    let _e47 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj[1][1];
    let _e52 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj[2][1];
    let projectionScale = vec2<f32>(length(vec3<f32>(_e25, _e30, _e35)), length(vec3<f32>(_e42, _e47, _e52)));
    let delta = ((i.endpoint.xy - i.start.xy) / max(projectionScale, vec2(0.000001f)));
    let normal = (vec2<f32>(-(delta.y), delta.x) / vec2(max(length(delta), 0.000001f)));
    let point = mix(i.start, i.endpoint, c.x);
    let u = (i.color.y + (c.x / 31f));
    let taper = mix(1f, 0.1f, smoothstep(0.15f, 1f, u));
    let _e93 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    let _e95 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
    let _e96 = ndc_worldX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(_e95, point);
    let clip = (_e93 * vec4<f32>(_e96, 1f));
    let offset_1 = ((((((normal * c.y) * i.properties.x) * 0.5f) * projectionScale) * taper) / vec2(max(abs(clip.w), 0.001f)));
    o.position = vec4<f32>((point.xy + offset_1), point.z, 1f);
    o.color = i.color;
    o.uv = vec2<f32>(u, ((c.y * 0.5f) + 0.5f));
    let _e136 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
    let _e138 = ndc_worldX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(_e136, i.endpoint);
    let _e140 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
    let _e142 = ndc_worldX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(_e140, i.start);
    o.metres = (i.color.x + (c.x * length((_e138 - _e142))));
    let _e147 = o;
    return _e147;
}

@fragment 
fn fs_main(i_1: RibbonOutput) -> @location(0) vec4<f32> {
    var coverage: f32;
    var highlight: f32;

    let v_4 = ((i_1.uv.y * 2f) - 1f);
    let d = i_1.metres;
    let _e11 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.style.y;
    let _e19 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.atlas;
    let _e24 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.atlas;
    let sampleUV = ((vec2<f32>(fract((d * _e11)), i_1.uv.y) * _e19.xy) + _e24.zw);
    let _e29 = textureSample(patternX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, pattern_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, sampleUV);
    let flow = _e29.x;
    let edge = (1f - smoothstep(0.76f, 1f, abs(v_4)));
    let _e40 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.style.x;
    if (_e40 < 0.5f) {
        let bend = (sin((d * 12f)) * 0.2f);
        let fibers = (exp(-(pow((((v_4 - bend) - 0.32f) * 9f), 2f))) + exp(-(pow((((v_4 + bend) + 0.32f) * 9f), 2f))));
        let center = exp(-(pow((v_4 * 9f), 2f)));
        coverage = (edge * (((0.4f + (flow * 0.3f)) + (fibers * 0.5f)) + (center * 0.3f)));
        highlight = clamp(((fibers * 0.6f) + (center * 0.8f)), 0f, 1f);
    } else {
        let _e97 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.style.x;
        if (_e97 < 1.5f) {
            let saw = ((abs(((fract((d * 7f)) * 2f) - 1f)) - 0.5f) * 0.7f);
            let arc = exp(-(pow(((v_4 - saw) * 14f), 2f)));
            let tooth = (pow(max(0f, (1f - abs(v_4))), 2f) * (1f - smoothstep(0.1f, 0.4f, abs((fract((d * 5f)) - 0.5f)))));
            coverage = (edge * (((0.28f + (flow * 0.22f)) + (arc * 0.85f)) + (tooth * 0.25f)));
            highlight = clamp((arc + (tooth * 0.25f)), 0f, 1f);
        } else {
            let dash = (1f - smoothstep(0.3f, 0.47f, abs((fract((d * 4.4f)) - 0.5f))));
            let borders = exp(-(pow(((abs(v_4) - 0.6f) * 18f), 2f)));
            let vein = exp(-(pow((v_4 * 13f), 2f)));
            coverage = (edge * (((0.25f + (flow * 0.2f)) + (dash * (0.4f + (borders * 0.6f)))) + (vein * 0.4f)));
            highlight = clamp(((borders * dash) + (vein * 0.3f)), 0f, 1f);
        }
    }
    let _e202 = fwidth(v_4);
    let aa = max(_e202, 0.015f);
    let _e208 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.core.x;
    let _e215 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.core.x;
    let core = (1f - smoothstep(max(0f, (_e208 - aa)), (_e215 + aa), abs(v_4)));
    let _e224 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.core.x;
    let halo = exp(-(pow((v_4 / (_e224 * 2.8f)), 2f)));
    let longitudinal = mix(1f, 0.22f, smoothstep(0f, 1f, i_1.uv.x));
    let _e245 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.core.w;
    let bands = (0.5f + (0.5f * cos(((d * 6.2831855f) * _e245))));
    let _e255 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.core.y;
    let _e260 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.core.z;
    let intensity = ((_e255 * longitudinal) * mix((1f - _e260), 1f, bands));
    let _e268 = coverage;
    let alpha = clamp((i_1.color.w * max(_e268, (core * 0.92f))), 0f, 0.96f);
    let _e278 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.body;
    let _e281 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.highlight;
    let _e282 = highlight;
    let rgb = (mix(_e278, _e281, _e282) * 1.35f);
    let _e289 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.hiltGlow.y;
    let hilt = exp(-(pow((d / _e289), 2f)));
    let _e298 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.hiltGlow.z;
    let hiltHalo = (exp(-(pow((v_4 / _e298), 2f))) * edge);
    let _e308 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.hiltGlow.x;
    let hiltLight = ((_e308 * hilt) * ((core * 0.7f) + (hiltHalo * 0.45f)));
    let _e318 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.coreColor;
    let emission = ((_e318 * ((((core * 0.9f) + (halo * 0.28f)) * intensity) + hiltLight)) * i_1.color.w);
    return vec4<f32>(((rgb * alpha) + emission), alpha);
}
