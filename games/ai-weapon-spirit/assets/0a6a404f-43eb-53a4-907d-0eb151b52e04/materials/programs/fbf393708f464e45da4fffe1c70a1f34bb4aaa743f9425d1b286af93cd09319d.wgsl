struct MaterialParametersX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX {
    baseColor: vec4<f32>,
    shadowColor: vec4<f32>,
    rimColor: vec4<f32>,
    rimStrength: f32,
    specularStrength: f32,
    emissionStrength: f32,
    sideShade: f32,
    surfaceRoughness: f32,
    surfaceMetallic: f32,
    pigmentStrength: f32,
    pigmentScale: f32,
    meadowCanopy: f32,
    meadowMiddle: vec4<f32>,
    meadowDeep: vec4<f32>,
    meadowLight: vec4<f32>,
    mossPileCoordinatesTransform: vec4<f32>,
    mossPileCoordinatesMetadata: vec4<f32>,
    mossPileCoordinatesRotation: vec4<f32>,
    floraTimeSeconds: f32,
    floraWindStrength: f32,
    floraGrowth: f32,
    floraBurn: f32,
    floraCut: f32,
    floraImpact: f32,
    floraFreeze: f32,
    floraPadding: f32,
    floraWither: f32,
    floraStump: f32,
    floraPadA: f32,
    floraPadB: f32,
    clearanceEnabled: f32,
    grassContactBounds: vec4<f32>,
    grassContactTextureCoordinatesTransform: vec4<f32>,
    grassContactTextureCoordinatesMetadata: vec4<f32>,
    grassContactTextureCoordinatesRotation: vec4<f32>,
    floraContactEnabled: f32,
    floraContactBend: f32,
    floraContactFlatten: f32,
}

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

struct ShadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX {
    index: u32,
    isSpot: u32,
    shadowCasterPadB: u32,
    shadowCasterPadC: u32,
    spotLightViewProj: mat4x4<f32>,
}

struct InputX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX {
    @location(0) position: vec3<f32>,
    @location(2) wind: vec2<f32>,
    @location(6) pivotXY: vec2<f32>,
    @location(7) pivotZFlex: vec2<f32>,
    @location(8) pigmentRG: vec2<f32>,
    @location(9) pigmentBRole: vec2<f32>,
}

struct OutputX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX {
    @builtin(position) clip: vec4<f32>,
    @location(0) world: vec3<f32>,
    @location(1) color: vec4<f32>,
    @location(2) height: f32,
    @location(3) viewZ: f32,
    @location(4) @interpolate(flat) shade: vec4<f32>,
    @location(5) @interpolate(flat) state: vec4<f32>,
    @location(6) @interpolate(flat) shadow: vec3<f32>,
    @location(7) @interpolate(flat) rim: vec3<f32>,
}

struct MeshX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX {
    worldFromLocal: mat4x4<f32>,
    previousWorldFromLocal: mat4x4<f32>,
    temporal: vec4<f32>,
    surface: vec4<u32>,
    spriteRegion: vec4<f32>,
}

struct InstanceDataX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX {
    localFromInstance: mat4x4<f32>,
    previousLocalFromInstance: mat4x4<f32>,
}

struct CanopyInput {
    @location(0) position: vec3<f32>,
    @location(1) crownNormal: vec3<f32>,
    @location(2) wind: vec2<f32>,
    @location(6) pivotXY: vec2<f32>,
    @location(7) pivotZFlex: vec2<f32>,
    @location(8) pigmentRG: vec2<f32>,
    @location(9) pigmentBRole: vec2<f32>,
}

const SHADOW_VOGEL_OFFSETSX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX: array<vec2<f32>, 5> = array<vec2<f32>, 5>(vec2<f32>(0.31622776f, 0f), vec2<f32>(-0.40387356f, 0.36998126f), vec2<f32>(0.061819322f, -0.7043993f), vec2<f32>(0.50905645f, 0.66397405f), vec2<f32>(-0.9341812f, -0.1652435f));

@group(1) @binding(1) 
var mossPile_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: sampler;
@group(1) @binding(2) 
var mossPileX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: texture_2d<f32>;
@group(1) @binding(4) 
var grassContactTextureX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: texture_2d<f32>;
@group(0) @binding(0) 
var<uniform> viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(0) @binding(7) 
var<uniform> shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ShadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(0) @binding(3) 
var shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: texture_depth_2d_array;
@group(0) @binding(4) 
var shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: sampler_comparison;
@group(0) @binding(24) 
var shadowMomentsX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: texture_2d_array<f32>;
@group(0) @binding(9) 
var spotModifierSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: sampler;
@group(2) @binding(0) 
var<storage> meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<MeshX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX>;
@group(3) @binding(0) 
var<storage> instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<InstanceDataX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX>;
@group(1) @binding(0) 
var<uniform> materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: MaterialParametersX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX;

fn grassContactAtX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZ3SN52W4ZC7OBWGC3TUL5RW63TUMFRXIX(root: vec3<f32>, m: MaterialParametersX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX) -> vec3<f32> {
    var local: bool;
    var local_1: bool;
    var result: vec3<f32> = vec3(0f);
    var z: i32 = 0i;
    var x: i32;

    let uv_4 = ((root.xz - m.grassContactBounds.xy) / m.grassContactBounds.zw);
    if !((m.clearanceEnabled < 0.5f)) {
        local = any((uv_4 < vec2(0f)));
    } else {
        local = true;
    }
    let _e23 = local;
    if !(_e23) {
        local_1 = any((uv_4 > vec2(1f)));
    } else {
        local_1 = true;
    }
    let _e32 = local_1;
    if _e32 {
        return vec3(0f);
    }
    let _e36 = textureDimensions(grassContactTextureX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX);
    let dimensions = vec2<i32>(_e36);
    let q = ((uv_4 * vec2<f32>(dimensions)) - vec2(0.5f));
    let base_1 = vec2<i32>(floor(q));
    let f = fract(q);
    loop {
        let _e47 = z;
        if (_e47 < 2i) {
        } else {
            break;
        }
        {
            x = 0i;
            loop {
                let _e52 = x;
                if (_e52 < 2i) {
                } else {
                    break;
                }
                {
                    let _e55 = x;
                    let _e56 = z;
                    let v_6 = textureLoad(grassContactTextureX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, clamp((base_1 + vec2<i32>(_e55, _e56)), vec2(0i), (dimensions - vec2(1i))), 0i);
                    let _e72 = x;
                    let _e80 = z;
                    let weight = (select((1f - f.x), f.x, (_e72 == 1i)) * select((1f - f.y), f.y, (_e80 == 1i)));
                    let _e86 = result;
                    result = (_e86 + ((v_6.xyz * weight) * (1f - smoothstep(0.16f, 0.38f, abs((v_6.w - root.y))))));
                }
                continuing {
                    let _e101 = x;
                    x = (_e101 + 1i);
                }
            }
        }
        continuing {
            let _e104 = z;
            z = (_e104 + 1i);
        }
    }
    let _e106 = result;
    return _e106;
}

fn groundPlantContactPositionX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZ3SN52W4ZC7OBWGC3TUL5RW63TUMFRXIX(world: vec3<f32>, root_1: vec3<f32>, m_1: MaterialParametersX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, response: vec2<f32>) -> vec3<f32> {
    let _e2 = grassContactAtX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZ3SN52W4ZC7OBWGC3TUL5RW63TUMFRXIX(root_1, m_1);
    let h = max(0f, (world.y - root_1.y));
    let bent = (world.xz + ((_e2.xy * h) * response.x));
    return vec3<f32>(bent.x, (root_1.y + ((world.y - root_1.y) * (1f - (_e2.z * response.y)))), bent.y);
}

fn meadowHashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX(p: vec2<f32>) -> f32 {
    var v_2: vec3<f32>;

    v_2 = fract((vec3<f32>(p.x, p.y, p.x) * 0.1031f));
    let _e9 = v_2;
    let _e10 = v_2;
    let _e11 = v_2;
    v_2 = (_e9 + vec3(dot(_e10, (_e11.yzx + vec3(33.33f)))));
    let _e20 = v_2.x;
    let _e22 = v_2.y;
    let _e25 = v_2.z;
    return fract(((_e20 + _e22) * _e25));
}

fn meadowNoiseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX(p_1: vec2<f32>) -> f32 {
    let q_1 = floor(p_1);
    let f_1 = fract(p_1);
    let u = ((f_1 * f_1) * (vec2(3f) - (2f * f_1)));
    let _e10 = meadowHashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX(q_1);
    let _e15 = meadowHashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX((q_1 + vec2<f32>(1f, 0f)));
    let _e22 = meadowHashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX((q_1 + vec2<f32>(0f, 1f)));
    let _e27 = meadowHashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX((q_1 + vec2<f32>(1f, 1f)));
    return mix(mix(_e10, _e15, u.x), mix(_e22, _e27, u.x), u.y);
}

fn meadowPaletteX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX(p_2: vec2<f32>, middle: vec3<f32>, deep: vec3<f32>, light: vec3<f32>) -> vec3<f32> {
    let _e4 = meadowNoiseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX((p_2 / vec2(13f)));
    let _e13 = meadowNoiseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX(((p_2 + vec2(19f)) / vec2(5.5f)));
    let field = ((0.68f * _e4) + (0.32f * _e13));
    return mix(mix(deep, middle, smoothstep(0.12f, 0.58f, field)), light, (smoothstep(0.48f, 0.92f, field) * 0.8f));
}

fn shadow_vogel_rotationX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(pixel: vec2<f32>) -> vec2<f32> {
    let noise = fract((52.982918f * fract(dot(pixel, vec2<f32>(0.06711056f, 0.00583715f)))));
    let angle = (noise * 6.2831855f);
    return vec2<f32>(cos(angle), sin(angle));
}

fn sample_shadow_2d_vogelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMap: texture_depth_2d_array, shadowSampler: sampler_comparison, uv: vec2<f32>, layer: i32, texel: vec2<f32>, depthRef: f32, planeGradient: vec2<f32>, pixel_1: vec2<f32>, extent: vec2<f32>) -> f32 {
    var lit: f32 = 0f;
    var i: u32 = 0u;

    if any((texel <= vec2(0f))) {
        let _e10 = textureDimensions(shadowMap);
        let edge = (vec2(0.5f) / vec2<f32>(_e10));
        let _e20 = textureSampleCompareLevel(shadowMap, shadowSampler, clamp(uv, edge, (extent - edge)), layer, depthRef);
        return _e20;
    }
    let _e22 = shadow_vogel_rotationX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(pixel_1);
    loop {
        let _e24 = i;
        if (_e24 < 5u) {
        } else {
            break;
        }
        {
            let _e28 = i;
            let point = SHADOW_VOGEL_OFFSETSX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX[_e28];
            let offset = vec2<f32>(((point.x * _e22.x) - (point.y * _e22.y)), ((point.x * _e22.y) + (point.y * _e22.x)));
            let _e47 = textureDimensions(shadowMap);
            let physicalTexel = (vec2(1f) / vec2<f32>(_e47));
            let sampleUv = clamp((uv + (offset * texel)), (physicalTexel * 0.5f), (extent - (physicalTexel * 0.5f)));
            let receiverUv = clamp(sampleUv, (0.5f * texel), (vec2(1f) - (0.5f * texel)));
            let sampleDepth = (depthRef + dot(planeGradient, ((receiverUv - uv) / texel)));
            let _e72 = lit;
            let _e73 = textureSampleCompareLevel(shadowMap, shadowSampler, sampleUv, layer, sampleDepth);
            lit = (_e72 + _e73);
        }
        continuing {
            let _e76 = i;
            i = (_e76 + 1u);
        }
    }
    let _e78 = lit;
    return (_e78 * 0.2f);
}

fn sample_shadow_2d_nearestX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMap_1: texture_depth_2d_array, shadowSampler_1: sampler_comparison, uv_1: vec2<f32>, layer_1: i32, depthRef_1: f32, extent_1: vec2<f32>) -> f32 {
    let _e1 = textureDimensions(shadowMap_1);
    let dimensions_1 = vec2<f32>(_e1);
    let pixel_4 = clamp(floor((uv_1 * dimensions_1)), vec2(0f), ((dimensions_1 * extent_1) - vec2(1f)));
    let _e21 = textureSampleCompareLevel(shadowMap_1, shadowSampler_1, ((pixel_4 + vec2(0.5f)) / dimensions_1), layer_1, depthRef_1);
    return _e21;
}

fn sample_shadow_2d_softX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMap_2: texture_depth_2d_array, shadowSampler_2: sampler_comparison, uv_2: vec2<f32>, layer_2: i32, texel_1: vec2<f32>, depthRef_2: f32, extent_2: vec2<f32>) -> f32 {
    var sum: f32 = 0f;
    var y: u32 = 0u;
    var x_1: u32;

    let phase = fract(((uv_2 / texel_1) + vec2(0.5f)));
    let base_2 = (uv_2 - (phase * texel_1));
    let wx = vec4<f32>((1f - phase.x), 1f, 1f, phase.x);
    let wy = vec4<f32>((1f - phase.y), 1f, 1f, phase.y);
    loop {
        let _e26 = y;
        if (_e26 < 4u) {
        } else {
            break;
        }
        {
            x_1 = 0u;
            loop {
                let _e31 = x_1;
                if (_e31 < 4u) {
                } else {
                    break;
                }
                {
                    let _e35 = sum;
                    let _e36 = x_1;
                    let _e38 = y;
                    let _e57 = textureSampleCompareLevel(shadowMap_2, shadowSampler_2, clamp((base_2 + ((vec2<f32>(f32(_e36), f32(_e38)) - vec2(1f)) * texel_1)), (texel_1 * 0.5f), (extent_2 - (texel_1 * 0.5f))), layer_2, depthRef_2);
                    let _e58 = x_1;
                    let _e61 = y;
                    sum = (_e35 + ((_e57 * wx[_e58]) * wy[_e61]));
                }
                continuing {
                    let _e66 = x_1;
                    x_1 = (_e66 + 1u);
                }
            }
        }
        continuing {
            let _e69 = y;
            y = (_e69 + 1u);
        }
    }
    let _e71 = sum;
    return (_e71 / 9f);
}

fn sample_shadow_varianceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(uv_3: vec2<f32>, layer_3: i32, reversedDepth: f32, extent_3: vec2<f32>) -> f32 {
    let _e3 = textureDimensions(shadowMomentsX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX);
    let edge_1 = (vec2(0.5f) / vec2<f32>(_e3));
    let _e14 = textureSampleLevel(shadowMomentsX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, spotModifierSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, clamp(uv_3, edge_1, (extent_3 - edge_1)), layer_3, 0f);
    let distribution = _e14.xy;
    let depth = (1f - reversedDepth);
    if (depth <= distribution.x) {
        return 1f;
    }
    let variance = max(0.0000001f, (distribution.y * distribution.y));
    let delta = (depth - distribution.x);
    return clamp((((variance / (variance + (delta * delta))) - 0.3f) / 0.65f), 0f, 1f);
}

fn d_ggxX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(nDotH: f32, a: f32) -> f32 {
    let a2_ = (a * a);
    let f_2 = ((((nDotH * a2_) - nDotH) * nDotH) + 1f);
    return (a2_ / ((3.1415927f * f_2) * f_2));
}

fn v_smithX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(nDotV: f32, nDotL: f32, a_1: f32) -> f32 {
    let a2_1 = (a_1 * a_1);
    let gv = (nDotL * sqrt((((nDotV * nDotV) * (1f - a2_1)) + a2_1)));
    let gl = (nDotV * sqrt((((nDotL * nDotL) * (1f - a2_1)) + a2_1)));
    return (0.5f / max((gv + gl), 0.00001f));
}

fn specularF90X_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(f0_: vec3<f32>) -> f32 {
    return saturate((50f * max(f0_.x, max(f0_.y, f0_.z))));
}

fn f_schlickX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(vDotH: f32, f0_1: vec3<f32>) -> vec3<f32> {
    let fresnel = exp2((((-5.55473f * vDotH) - 6.98316f) * vDotH));
    let _e8 = specularF90X_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(f0_1);
    return (f0_1 + ((vec3(_e8) - f0_1) * fresnel));
}

fn approximateDirectDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness: f32, nDotV_1: f32) -> vec2<f32> {
    let uv_5 = clamp(vec2<f32>(roughness, nDotV_1), vec2(0f), vec2(1f));
    let r = ((uv_5.x * vec4<f32>(-1f, -0.0275f, -0.572f, 0.022f)) + vec4<f32>(1f, 0.0425f, 1.04f, -0.04f));
    let a004_ = ((min((r.x * r.x), exp2((-9.28f * uv_5.y))) * r.x) + r.y);
    let energy = (1f - (0.55f * uv_5.x));
    let bias = clamp(((1.04f * a004_) + r.w), 0f, energy);
    return vec2<f32>((energy - bias), bias);
}

fn sampleDirectDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_1: f32, nDotV_2: f32, useLut: bool) -> vec2<f32> {
    let _e2 = approximateDirectDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_1, nDotV_2);
    return _e2;
}

fn directMultiScatterX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_2: f32, nDotV_3: f32, nDotL_1: f32, F0_: vec3<f32>, useLut_1: bool) -> vec3<f32> {
    var emsV: f32;
    var emsL: f32;

    let _e3 = sampleDirectDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_2, nDotV_3, useLut_1);
    let _e5 = sampleDirectDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_2, nDotL_1, useLut_1);
    let _e7 = specularF90X_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(F0_);
    let fssEssV = ((F0_ * _e3.x) + vec3((_e3.y * _e7)));
    let fssEssL = ((F0_ * _e5.x) + vec3((_e5.y * _e7)));
    emsV = (0.55f * clamp(roughness_2, 0f, 1f));
    let _e26 = emsV;
    emsL = _e26;
    let favg = (F0_ + ((vec3(_e7) - F0_) * 0.047619f));
    let _e33 = emsV;
    let _e34 = emsL;
    let energyLoss = (_e33 * _e34);
    let fms = (((fssEssV * fssEssL) * favg) / ((vec3(1f) - ((energyLoss * favg) * favg)) + vec3(0.000001f)));
    return (fms * energyLoss);
}

fn standardOpaqueBrdfX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(baseColor: vec3<f32>, metallic: f32, alpha: f32, f0_2: vec3<f32>, nDotV_4: f32, nDotL_2: f32, nDotH_1: f32, vDotH_1: f32, useLut_2: bool) -> vec3<f32> {
    let _e2 = d_ggxX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(nDotH_1, alpha);
    let _e5 = v_smithX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(nDotV_4, nDotL_2, alpha);
    let _e9 = f_schlickX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(vDotH_1, f0_2);
    let _e15 = directMultiScatterX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(sqrt(max(alpha, 0f)), nDotV_4, nDotL_2, f0_2, useLut_2);
    let specular = (((_e2 * _e5) * _e9) + _e15);
    return ((((1f - metallic) * baseColor) / vec3(3.1415927f)) + specular);
}

fn _pickCascadeLayerX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(viewDepth: f32, count: u32) -> u32 {
    var layer_4: u32;
    var i_1: u32 = 0u;

    layer_4 = (count - 1u);
    loop {
        let _e6 = i_1;
        if (_e6 < (count - 1u)) {
        } else {
            break;
        }
        {
            let _e12 = i_1;
            let sp = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[_e12].x;
            if (viewDepth < sp) {
                let _e18 = i_1;
                layer_4 = _e18;
                break;
            }
        }
        continuing {
            let _e19 = i_1;
            i_1 = (_e19 + 1u);
        }
    }
    let _e22 = layer_4;
    return _e22;
}

fn _cascadeLightViewProjX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_5: u32) -> mat4x4<f32> {
    switch layer_5 {
        case 0u: {
            let _e3 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightViewProj_A;
            return _e3;
        }
        case 1u: {
            let _e6 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightViewProj_B;
            return _e6;
        }
        case 2u: {
            let _e9 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightViewProj_C;
            return _e9;
        }
        default: {
            let _e12 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightViewProj_D;
            return _e12;
        }
    }
}

fn _directionalReceiverDepthBiasX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_6: u32, normal: vec3<f32>, l: vec3<f32>, radius: f32) -> f32 {
    var local_2: bool;

    let _e4 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[0].w;
    if (_e4 > 0.5f) {
        let _e9 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
        return _e9;
    }
    let nDotL_3 = dot(normal, l);
    let depthSpan = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[layer_6].z;
    if (nDotL_3 > 0f) {
        local_2 = (depthSpan > 0f);
    } else {
        local_2 = false;
    }
    let _e26 = local_2;
    if !(_e26) {
        let _e30 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
        return _e30;
    }
    let _e31 = _cascadeLightViewProjX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_6);
    let right = normalize(vec3<f32>(_e31[0].x, _e31[1].x, _e31[2].x));
    let up = normalize(vec3<f32>(_e31[0].y, _e31[1].y, _e31[2].y));
    let _e53 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[layer_6].y;
    let footprint = ((_e53 * radius) * (abs(dot(normal, right)) + abs(dot(normal, up))));
    let _e63 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.normalBias;
    let missingCoverage = max(0f, (footprint - _e63));
    if !((missingCoverage > 0f)) {
        let _e72 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
        return _e72;
    }
    let _e75 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
    return min(1.0000001f, (_e75 + ((missingCoverage / nDotL_3) / depthSpan)));
}

fn _directionalReceiverPlaneGradientX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_7: u32, normal_1: vec3<f32>, l_1: vec3<f32>) -> vec2<f32> {
    var local_3: bool;
    var local_4: bool;

    let _e4 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[0].w;
    if (_e4 > 0.5f) {
        return vec2(0f);
    }
    if !((dot(normal_1, l_1) > 0.01f)) {
        return vec2(0f);
    }
    let _e18 = _cascadeLightViewProjX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_7);
    let row0_ = vec3<f32>(_e18[0].x, _e18[1].x, _e18[2].x);
    let row1_ = vec3<f32>(_e18[0].y, _e18[1].y, _e18[2].y);
    let row2_ = vec3<f32>(_e18[0].z, _e18[1].z, _e18[2].z);
    let sx = length(row0_);
    let sy = length(row1_);
    let sz = length(row2_);
    let nz = (dot(row2_, normal_1) / sz);
    if (abs(nz) > 0.01f) {
        local_3 = (sx > 0f);
    } else {
        local_3 = false;
    }
    let _e53 = local_3;
    if _e53 {
        local_4 = (sy > 0f);
    } else {
        local_4 = false;
    }
    let _e59 = local_4;
    if !(_e59) {
        return vec2(0f);
    }
    let _e65 = textureDimensions(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, 0i);
    let texels = vec2<f32>(_e65);
    let dzdx = ((-((dot(row0_, normal_1) / sx)) * sz) / (nz * sx));
    let dzdy = ((-((dot(row1_, normal_1) / sy)) * sz) / (nz * sy));
    return vec2<f32>(((dzdx * 2f) / texels.x), ((-(dzdy) * 2f) / texels.y));
}

fn _sampleShadowForCascadeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(worldPos: vec3<f32>, layer_8: u32, normal_2: vec3<f32>, l_2: vec3<f32>, layerBase: u32, pixel_2: vec2<f32>) -> f32 {
    var local_5: bool;
    var local_6: bool;
    var local_7: bool;
    var local_8: bool;
    var local_9: bool;
    var blocked: f32 = 0f;
    var x_2: i32 = -1i;
    var y_1: i32;
    var x_3: i32 = -2i;
    var y_2: i32;

    let _e4 = _cascadeLightViewProjX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_8);
    let lightClip = (_e4 * vec4<f32>(worldPos, 1f));
    let projCoords = (lightClip.xyz / vec3(lightClip.w));
    let tileUv = vec2<f32>(((projCoords.x * 0.5f) + 0.5f), ((-(projCoords.y) * 0.5f) + 0.5f));
    let _e29 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[3].w;
    let _e34 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[3].w;
    let aspect = select(1f, _e29, (_e34 > 0f));
    let viewportScale = vec2<f32>(min(1f, aspect), min(1f, (1f / aspect)));
    let uv_6 = (tileUv * viewportScale);
    let shadowLayer = i32((layer_8 + layerBase));
    let currentDepth = projCoords.z;
    if (tileUv.x >= 0f) {
        local_5 = (tileUv.x <= 1f);
    } else {
        local_5 = false;
    }
    let _e60 = local_5;
    if _e60 {
        local_6 = (tileUv.y >= 0f);
    } else {
        local_6 = false;
    }
    let _e67 = local_6;
    if _e67 {
        local_7 = (tileUv.y <= 1f);
    } else {
        local_7 = false;
    }
    let _e74 = local_7;
    if _e74 {
        local_8 = (currentDepth >= 0f);
    } else {
        local_8 = false;
    }
    let _e80 = local_8;
    if _e80 {
        local_9 = (currentDepth <= 1f);
    } else {
        local_9 = false;
    }
    let _e86 = local_9;
    if !(_e86) {
        return 1f;
    }
    let _e91 = textureDimensions(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, 0i);
    let texelDims = vec2<f32>(_e91);
    let tileLo = vec2<f32>((1f / texelDims.x), (1f / texelDims.y));
    let tileHi = (vec2(1f) - tileLo);
    let _e106 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.directionalShadowFilter.x;
    let filterProfile = clamp(u32(round(_e106)), 1u, 8u);
    let kernel = select(select(3u, 5u, (filterProfile == 3u)), 1u, (filterProfile == 1u));
    let phase_1 = fract(((uv_6 * texelDims) - vec2(0.5f)));
    let reach = max(phase_1, (vec2(1f) - phase_1));
    let footprintRadius = select(max(reach.x, reach.y), 1f, (filterProfile == 6u));
    let _e139 = _directionalReceiverDepthBiasX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_8, normal_2, l_2, footprintRadius);
    let adjustedDepth = (currentDepth + _e139);
    let _e141 = _directionalReceiverPlaneGradientX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_8, normal_2, l_2);
    if (filterProfile == 8u) {
        let _e144 = sample_shadow_varianceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(uv_6, shadowLayer, adjustedDepth, viewportScale);
        return _e144;
    }
    if (filterProfile == 7u) {
        let _e149 = sample_shadow_2d_softX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, uv_6, shadowLayer, tileLo, adjustedDepth, viewportScale);
        return _e149;
    }
    if (filterProfile == 6u) {
        let _e161 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[2].w;
        let _e170 = sample_shadow_2d_vogelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, uv_6, shadowLayer, ((tileLo * vec2<f32>(1f, (1f / aspect))) * max((1f + _e161), 0f)), adjustedDepth, _e141, pixel_2, viewportScale);
        return _e170;
    }
    if (kernel == 1u) {
        let _e177 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[0].w;
        if (_e177 > 0.5f) {
            let _e182 = sample_shadow_2d_nearestX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, uv_6, shadowLayer, adjustedDepth, viewportScale);
            return _e182;
        }
        let lit_1 = textureSampleCompareLevel(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, clamp(uv_6, tileLo, tileHi), shadowLayer, adjustedDepth);
        return lit_1;
    }
    if (kernel == 3u) {
        loop {
            let _e190 = x_2;
            if (_e190 <= 1i) {
            } else {
                break;
            }
            {
                y_1 = -1i;
                loop {
                    let _e195 = y_1;
                    if (_e195 <= 1i) {
                    } else {
                        break;
                    }
                    {
                        let _e198 = x_2;
                        let _e200 = y_1;
                        let offsetUv = clamp((uv_6 + (vec2<f32>(f32(_e198), f32(_e200)) * tileLo)), tileLo, tileHi);
                        let tapDepth = (adjustedDepth + dot(_e141, ((offsetUv - uv_6) / tileLo)));
                        let lit_2 = textureSampleCompareLevel(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, offsetUv, shadowLayer, tapDepth);
                        let _e214 = blocked;
                        blocked = (_e214 + (1f - lit_2));
                    }
                    continuing {
                        let _e219 = y_1;
                        y_1 = (_e219 + 1i);
                    }
                }
            }
            continuing {
                let _e222 = x_2;
                x_2 = (_e222 + 1i);
            }
        }
        let _e224 = blocked;
        return (1f - (_e224 / 9f));
    }
    loop {
        let _e230 = x_3;
        if (_e230 <= 2i) {
        } else {
            break;
        }
        {
            y_2 = -2i;
            loop {
                let _e235 = y_2;
                if (_e235 <= 2i) {
                } else {
                    break;
                }
                {
                    let _e238 = x_3;
                    let _e240 = y_2;
                    let offsetUv_1 = clamp((uv_6 + (vec2<f32>(f32(_e238), f32(_e240)) * tileLo)), tileLo, tileHi);
                    let tapDepth_1 = (adjustedDepth + dot(_e141, ((offsetUv_1 - uv_6) / tileLo)));
                    let lit_3 = textureSampleCompareLevel(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, offsetUv_1, shadowLayer, tapDepth_1);
                    let _e253 = blocked;
                    blocked = (_e253 + (1f - lit_3));
                }
                continuing {
                    let _e258 = y_2;
                    y_2 = (_e258 + 1i);
                }
            }
        }
        continuing {
            let _e261 = x_3;
            x_3 = (_e261 + 1i);
        }
    }
    let _e263 = blocked;
    return (1f - (_e263 / 25f));
}

fn evalDirectionalShadowFactorAtPixelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(normal_3: vec3<f32>, worldPos_1: vec3<f32>, viewZ: f32, layerBase_1: u32, pixel_3: vec2<f32>) -> f32 {
    var shadow: f32;
    var local_10: bool;

    let _e2 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cascadeCount;
    if (_e2 < 1f) {
        return 1f;
    }
    let _e8 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let l_3 = normalize(-(_e8));
    let _e13 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cascadeCount;
    let count_1 = u32(max(_e13, 1f));
    let viewDepth_1 = -(viewZ);
    let _e25 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[(count_1 - 1u)].x;
    if (viewDepth_1 > _e25) {
        return 1f;
    }
    let _e28 = _pickCascadeLayerX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(viewDepth_1, count_1);
    let _e33 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.normalBias;
    let receiverPosition = (worldPos_1 + (normal_3 * _e33));
    let _e38 = _sampleShadowForCascadeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(receiverPosition, _e28, normal_3, l_3, layerBase_1, pixel_3);
    shadow = _e38;
    let _e42 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cascadeBlend;
    if (_e42 > 0f) {
        local_10 = ((_e28 + 1u) < count_1);
    } else {
        local_10 = false;
    }
    let _e51 = local_10;
    if _e51 {
        let spCurr = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[_e28].x;
        let _e59 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cascadeBlend;
        let blendWidth = (spCurr * _e59);
        if (blendWidth > 0f) {
            let dist = (spCurr - viewDepth_1);
            let t = clamp((1f - (dist / blendWidth)), 0f, 1f);
            if (t > 0f) {
                let _e74 = _sampleShadowForCascadeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(receiverPosition, (_e28 + 1u), normal_3, l_3, layerBase_1, pixel_3);
                shadow = mix(_e38, _e74, t);
            }
        }
    }
    let _e76 = shadow;
    let _e81 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[1].w;
    return mix(1f, _e76, (1f - _e81));
}

fn evalDirectionalShadowFactorX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(normal_4: vec3<f32>, worldPos_2: vec3<f32>, viewZ_1: f32, layerBase_2: u32) -> f32 {
    let _e5 = evalDirectionalShadowFactorAtPixelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(normal_4, worldPos_2, viewZ_1, layerBase_2, worldPos_2.xy);
    return _e5;
}

fn illustratedDiffuseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU2LMNR2XG5DSMF2GKZC7NRUWO2DUNFXGOX(surface: vec3<f32>, shadowPigment: vec3<f32>, normal_5: vec3<f32>, visibility: f32, sideShade: f32, continuous: bool) -> vec3<f32> {
    var diffuse: f32;

    let _e3 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let nDotL_4 = dot(normal_5, normalize(-(_e3)));
    let up_1 = clamp(normal_5.y, 0f, 1f);
    diffuse = ((0.52f * smoothstep(0f, 0.14f, nDotL_4)) + (0.48f * smoothstep(0.6f, 0.78f, nDotL_4)));
    if continuous {
        diffuse = max(0f, nDotL_4);
    }
    let fill = (mix(shadowPigment, surface, 0.16f) * vec3<f32>(0.88f, 1.02f, 1.12f));
    let ambient = (fill * mix(0.82f, 1f, up_1));
    let _e41 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightColor;
    let _e43 = diffuse;
    let direct = ((surface * _e41) * ((0.54f * _e43) * visibility));
    let plane = mix(sideShade, 1f, (0.65f + (0.35f * up_1)));
    return ((ambient + direct) * plane);
}

fn paintedSpecularX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(base: vec3<f32>, normal_6: vec3<f32>, light_1: vec3<f32>, camera: vec3<f32>, roughness_3: f32, metallic_1: f32, strength: f32, visibility_1: f32) -> vec3<f32> {
    let halfVector = normalize((light_1 + camera));
    let smoothness = (1f - clamp(roughness_3, 0.04f, 1f));
    let lobe = pow(max(dot(normal_6, halfVector), 0f), mix(12f, 112f, smoothness));
    let reflection = (((((strength * smoothness) * smoothness) * lobe) * max(dot(normal_6, light_1), 0f)) * visibility_1);
    return (mix(vec3<f32>(0.88f, 0.86f, 0.81f), base, metallic_1) * reflection);
}

fn paintedRimX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(normal_7: vec3<f32>, camera_1: vec3<f32>, roughness_4: f32, strength_1: f32, visibility_2: f32) -> f32 {
    let fresnel_1 = pow((1f - clamp(dot(normal_7, camera_1), 0f, 1f)), 4f);
    return (((fresnel_1 * strength_1) * mix(1f, 0.18f, roughness_4)) * mix(0.35f, 1f, visibility_2));
}

fn plantPositionX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX(v_3: InputX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX, model: mat4x4<f32>, material: MaterialParametersX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX) -> vec4<f32> {
    var world_1: vec4<f32>;
    var p_3: vec3<f32>;
    var world_2: vec4<f32>;

    let encodedRole = v_3.pigmentBRole.y;
    let role = select(encodedRole, (-(encodedRole) - 1f), (encodedRole < 0f));
    let moss = (role >= 4f);
    let pivot = vec3<f32>(v_3.pivotXY, v_3.pivotZFlex.x);
    let root_2 = model[3].xyz;
    let phase_2 = ((root_2.x * 0.37f) + (root_2.z * 0.29f));
    let t_1 = material.floraTimeSeconds;
    let wind = (material.floraWindStrength * (1f - material.floraFreeze));
    let flutter = (((sin((((t_1 * 2.4f) + phase_2) + (pivot.y * 1.7f))) * 0.065f) * wind) * v_3.pivotZFlex.y);
    if moss {
        if (role < 5.5f) {
            return (model * vec4<f32>(v_3.position, 1f));
        }
        let growth = mix(0.08f, 1f, smoothstep(0f, 0.95f, material.floraGrowth));
        let scale = ((growth * (1f - (material.floraWither * 0.16f))) * (1f - (material.floraCut * 0.8f)));
        let delta_1 = ((v_3.position - pivot) * scale);
        let angle_1 = (flutter + ((material.floraImpact * 0.045f) * v_3.pivotZFlex.y));
        let p_4 = (pivot + vec3<f32>(delta_1.x, ((delta_1.y * cos(angle_1)) - (delta_1.z * sin(angle_1))), ((delta_1.y * sin(angle_1)) + (delta_1.z * cos(angle_1)))));
        world_1 = (model * vec4<f32>(p_4, 1f));
        if (material.floraContactEnabled > 0.5f) {
            let attachment = (model * vec4<f32>(pivot, 1f)).xyz;
            let _e109 = world_1;
            let _e114 = groundPlantContactPositionX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZ3SN52W4ZC7OBWGC3TUL5RW63TUMFRXIX(_e109.xyz, attachment, material, vec2<f32>(material.floraContactBend, material.floraContactFlatten));
            world_1 = vec4<f32>(_e114, 1f);
        }
        let _e117 = world_1;
        return _e117;
    }
    let leafScale = select(1f, (mix(0.12f, 1f, smoothstep(0.12f, 0.9f, material.floraGrowth)) * (1f - (material.floraWither * 0.18f))), (role > 0.5f));
    let delta_2 = ((v_3.position - pivot) * leafScale);
    p_3 = (pivot + vec3<f32>(delta_2.x, ((delta_2.y * cos(flutter)) - (delta_2.z * sin(flutter))), ((delta_2.y * sin(flutter)) + (delta_2.z * cos(flutter)))));
    let _e157 = p_3.y;
    let h_1 = (max(0f, _e157) / max(v_3.wind.y, 0.01f));
    let bend = (((h_1 * h_1) * v_3.wind.x) * v_3.wind.y);
    let wave = ((sin(((t_1 * 0.85f) + phase_2)) * 0.045f) + (sin(((t_1 * 1.47f) + (phase_2 * 0.61f))) * 0.017f));
    let _e187 = p_3;
    p_3 = (_e187 + ((vec3<f32>(0.84f, 0f, 0.54f) * bend) * ((wave * wind) + (material.floraImpact * 0.12f))));
    let growth_1 = clamp(material.floraGrowth, 0.001f, 1f);
    let _e205 = p_3.x;
    let _e208 = p_3.y;
    let _e211 = p_3.z;
    p_3 = vec3<f32>((_e205 * growth_1), (_e208 * growth_1), (_e211 * growth_1));
    if (material.floraStump > 0.5f) {
        let _e219 = p_3.y;
        p_3.y = min(_e219, max(0.08f, (v_3.wind.y * 0.12f)));
    }
    let _e227 = p_3;
    world_2 = (model * vec4<f32>(_e227, 1f));
    if (material.floraContactEnabled > 0.5f) {
        let _e235 = world_2;
        let _e240 = groundPlantContactPositionX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZ3SN52W4ZC7OBWGC3TUL5RW63TUMFRXIX(_e235.xyz, root_2, material, vec2<f32>(material.floraContactBend, material.floraContactFlatten));
        world_2 = vec4<f32>(_e240, 1f);
    }
    let _e243 = world_2;
    return _e243;
}

fn plantVertexX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX(v_4: InputX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX, model_1: mat4x4<f32>, material_1: MaterialParametersX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, clipMatrix: mat4x4<f32>) -> OutputX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX {
    var o_1: OutputX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX;
    var color_1: vec3<f32>;

    let _e3 = plantPositionX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX(v_4, model_1, material_1);
    o_1.clip = (clipMatrix * _e3);
    o_1.world = _e3.xyz;
    o_1.color = vec4<f32>(v_4.pigmentRG, v_4.pigmentBRole);
    o_1.height = (v_4.position.y / max(v_4.wind.y, 0.01f));
    let _e25 = o_1.clip.w;
    o_1.viewZ = -(_e25);
    o_1.shade = vec4<f32>(material_1.sideShade, material_1.specularStrength, material_1.rimStrength, 0f);
    if (material_1.meadowCanopy > 0f) {
        let _e44 = meadowPaletteX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX(model_1[3].xz, material_1.meadowMiddle.xyz, material_1.meadowDeep.xyz, material_1.meadowLight.xyz);
        let volume = material_1.floraPadA;
        let _e47 = o_1.height;
        let h_2 = clamp(_e47, 0f, 1f);
        let _e52 = o_1.color;
        let lamina = clamp((dot(_e52.xyz, vec3<f32>(0.21f, 0.72f, 0.07f)) / 0.28f), mix(0.94f, 0.82f, volume), mix(1.06f, 1.16f, volume));
        color_1 = (mix((_e44 * mix(0.84f, 0.58f, volume)), (_e44 * mix(1.08f, 1.05f, volume)), smoothstep(0.03f, mix(0.92f, 0.7f, volume), h_2)) * lamina);
        let _e84 = color_1;
        color_1 = mix(_e84, material_1.meadowLight.xyz, (smoothstep(0.64f, 0.98f, h_2) * mix(0.05f, 0.2f, volume)));
        let _e96 = color_1;
        let _e99 = o_1.color.w;
        o_1.color = vec4<f32>(_e96, _e99);
        o_1.shade.w = material_1.meadowCanopy;
    }
    o_1.state = vec4<f32>(material_1.floraBurn, material_1.floraWither, material_1.floraFreeze, material_1.floraStump);
    o_1.shadow = material_1.shadowColor.xyz;
    o_1.rim = material_1.rimColor.xyz;
    let _e116 = o_1;
    return _e116;
}

fn pruneSurfaceX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX(v_5: OutputX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX) {
    var local_11: bool;
    var local_12: bool;
    var local_13: bool;
    var local_14: bool;
    var local_15: bool;

    if (v_5.state.w > 0.5f) {
        local_11 = (v_5.color.w >= 0f);
    } else {
        local_11 = false;
    }
    let _e12 = local_11;
    if _e12 {
        local_12 = (v_5.color.w < 4f);
    } else {
        local_12 = false;
    }
    let _e20 = local_12;
    if _e20 {
        discard;
    }
    if (v_5.color.w > 0.5f) {
        local_13 = (v_5.color.w < 4f);
    } else {
        local_13 = false;
    }
    let _e32 = local_13;
    if !(_e32) {
        local_14 = (v_5.color.w >= 6f);
    } else {
        local_14 = true;
    }
    let _e41 = local_14;
    if _e41 {
        local_15 = (v_5.state.x > (0.68f + (v_5.height * 0.3f)));
    } else {
        local_15 = false;
    }
    let _e53 = local_15;
    if _e53 {
        discard;
    } else {
        return;
    }
}

@vertex 
fn vs_main(v: CanopyInput, @builtin(instance_index) idx: u32) -> OutputX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX {
    var o: OutputX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX;

    let _e3 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].worldFromLocal;
    let _e8 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx].localFromInstance;
    let model_2 = (_e3 * _e8);
    let input = InputX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX(v.position, v.wind, v.pivotXY, v.pivotZFlex, v.pigmentRG, v.pigmentBRole);
    let _e19 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX;
    let _e22 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    let _e23 = plantVertexX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX(input, model_2, _e19, _e22);
    o = _e23;
    o.rim = normalize(((((model_2[0].xyz * v.crownNormal.x) / vec3(max(dot(model_2[0].xyz, model_2[0].xyz), 0.0001f))) + ((model_2[1].xyz * v.crownNormal.y) / vec3(max(dot(model_2[1].xyz, model_2[1].xyz), 0.0001f)))) + ((model_2[2].xyz * v.crownNormal.z) / vec3(max(dot(model_2[2].xyz, model_2[2].xyz), 0.0001f)))));
    let _e71 = o;
    return _e71;
}

@fragment 
fn fs_main(v_1: OutputX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX) -> @location(0) vec4<f32> {
    var geometric: vec3<f32>;
    var color: vec3<f32>;

    pruneSurfaceX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DUZTMN5ZGCX3DN5WW233OX(v_1);
    let _e2 = dpdy(v_1.world);
    let _e4 = dpdx(v_1.world);
    geometric = normalize(cross(_e2, _e4));
    let _e8 = geometric;
    let _e10 = geometric;
    let _e11 = geometric;
    let _e14 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    geometric = select(-(_e8), _e10, (dot(_e11, (_e14 - v_1.world)) > 0f));
    let leaf = (v_1.color.w > 0.5f);
    let crown = normalize(v_1.rim);
    let _e27 = geometric;
    let _e28 = geometric;
    let n = select(_e27, normalize(((crown + (_e28 * 0.06f)) + vec3<f32>(0f, 0.2f, 0f))), leaf);
    let _e39 = geometric;
    let _e43 = evalDirectionalShadowFactorX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(_e39, v_1.world, v_1.viewZ, 0u);
    let base_3 = v_1.color.xyz;
    let canopyVisibility = select(_e43, (0.38f + (0.62f * _e43)), leaf);
    let _e53 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.shadowColor;
    let _e57 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.sideShade;
    let _e59 = illustratedDiffuseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU2LMNR2XG5DSMF2GKZC7NRUWO2DUNFXGOX(base_3, _e53.xyz, n, canopyVisibility, _e57, true);
    color = _e59;
    let _e63 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightColor;
    let _e67 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightColor.x;
    let _e71 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightColor.y;
    let _e76 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightColor.z;
    let lightTint = (_e63 / vec3(max(max(_e67, _e71), max(_e76, 0.001f))));
    let _e82 = color;
    color = (_e82 * mix(vec3(1f), lightTint, 0.35f));
    let _e88 = color;
    let _e89 = geometric;
    let _e92 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let _e97 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    let _e103 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.specularStrength;
    let _e106 = paintedSpecularX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(base_3, _e89, normalize(-(_e92)), normalize((_e97 - v_1.world)), 0.92f, 0f, _e103, _e43);
    color = (_e88 + _e106);
    let _e108 = color;
    return vec4<f32>(_e108, 1f);
}
