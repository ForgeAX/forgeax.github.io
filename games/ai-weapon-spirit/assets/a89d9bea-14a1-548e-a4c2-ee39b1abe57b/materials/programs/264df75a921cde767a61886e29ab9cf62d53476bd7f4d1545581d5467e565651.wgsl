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

struct Material {
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
    surfaceAccentA: vec4<f32>,
    surfaceAccentB: vec4<f32>,
    surfaceDetailMode: f32,
    surfaceDetailStrength: f32,
    surfacePatchSize: f32,
    surfaceMarginColor: vec4<f32>,
    surfaceClusterCoverage: f32,
    surfaceMarginWidth: f32,
    surfaceReliefContrast: f32,
    sedimentColor: vec4<f32>,
    sedimentShadowColor: vec4<f32>,
}

struct VsIn {
    @location(0) pos: vec3<f32>,
    @location(1) normal: vec3<f32>,
    @location(2) uv: vec2<f32>,
}

struct VsOut {
    @builtin(position) clip: vec4<f32>,
    @location(0) worldPos: vec3<f32>,
    @location(1) worldNormal: vec3<f32>,
    @location(2) viewZ: f32,
    @location(3) @interpolate(flat) sediment: u32,
    @location(4) grassSurface: vec2<f32>,
    @location(5) @interpolate(flat) hasGrassSurface: u32,
    @location(6) sandWeight: f32,
}

const SHADOW_VOGEL_OFFSETSX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX: array<vec2<f32>, 5> = array<vec2<f32>, 5>(vec2<f32>(0.31622776f, 0f), vec2<f32>(-0.40387356f, 0.36998126f), vec2<f32>(0.061819322f, -0.7043993f), vec2<f32>(0.50905645f, 0.66397405f), vec2<f32>(-0.9341812f, -0.1652435f));

@group(0) @binding(0) 
var<uniform> viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(2) @binding(0) 
var<storage> meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<MeshX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX>;
@group(3) @binding(0) 
var<storage> instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<InstanceDataX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX>;
@group(0) @binding(3) 
var shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: texture_depth_2d_array;
@group(0) @binding(4) 
var shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: sampler_comparison;
@group(1) @binding(0) 
var<uniform> material: Material;

fn meadowHashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX(p: vec2<f32>) -> f32 {
    var v: vec3<f32>;

    v = fract((vec3<f32>(p.x, p.y, p.x) * 0.1031f));
    let _e9 = v;
    let _e10 = v;
    let _e11 = v;
    v = (_e9 + vec3(dot(_e10, (_e11.yzx + vec3(33.33f)))));
    let _e20 = v.x;
    let _e22 = v.y;
    let _e25 = v.z;
    return fract(((_e20 + _e22) * _e25));
}

fn meadowNoiseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX(p_1: vec2<f32>) -> f32 {
    let q = floor(p_1);
    let f = fract(p_1);
    let u = ((f * f) * (vec2(3f) - (2f * f)));
    let _e10 = meadowHashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX(q);
    let _e15 = meadowHashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX((q + vec2<f32>(1f, 0f)));
    let _e22 = meadowHashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX((q + vec2<f32>(0f, 1f)));
    let _e27 = meadowHashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX((q + vec2<f32>(1f, 1f)));
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
            let point_8 = SHADOW_VOGEL_OFFSETSX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX[_e28];
            let offset = vec2<f32>(((point_8.x * _e22.x) - (point_8.y * _e22.y)), ((point_8.x * _e22.y) + (point_8.y * _e22.x)));
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
    let dimensions = vec2<f32>(_e1);
    let pixel_14 = clamp(floor((uv_1 * dimensions)), vec2(0f), ((dimensions * extent_1) - vec2(1f)));
    let _e21 = textureSampleCompareLevel(shadowMap_1, shadowSampler_1, ((pixel_14 + vec2(0.5f)) / dimensions), layer_1, depthRef_1);
    return _e21;
}

fn sample_shadow_2d_softX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMap_2: texture_depth_2d_array, shadowSampler_2: sampler_comparison, uv_2: vec2<f32>, layer_2: i32, texel_1: vec2<f32>, depthRef_2: f32, extent_2: vec2<f32>) -> f32 {
    var sum: f32 = 0f;
    var y: u32 = 0u;
    var x: u32;

    let phase = fract(((uv_2 / texel_1) + vec2(0.5f)));
    let base_1 = (uv_2 - (phase * texel_1));
    let wx = vec4<f32>((1f - phase.x), 1f, 1f, phase.x);
    let wy = vec4<f32>((1f - phase.y), 1f, 1f, phase.y);
    loop {
        let _e26 = y;
        if (_e26 < 4u) {
        } else {
            break;
        }
        {
            x = 0u;
            loop {
                let _e31 = x;
                if (_e31 < 4u) {
                } else {
                    break;
                }
                {
                    let _e35 = sum;
                    let _e36 = x;
                    let _e38 = y;
                    let _e57 = textureSampleCompareLevel(shadowMap_2, shadowSampler_2, clamp((base_1 + ((vec2<f32>(f32(_e36), f32(_e38)) - vec2(1f)) * texel_1)), (texel_1 * 0.5f), (extent_2 - (texel_1 * 0.5f))), layer_2, depthRef_2);
                    let _e58 = x;
                    let _e61 = y;
                    sum = (_e35 + ((_e57 * wx[_e58]) * wy[_e61]));
                }
                continuing {
                    let _e66 = x;
                    x = (_e66 + 1u);
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
    return 1f;
}

fn d_ggxX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(nDotH: f32, a: f32) -> f32 {
    let a2_ = (a * a);
    let f_1 = ((((nDotH * a2_) - nDotH) * nDotH) + 1f);
    return (a2_ / ((3.1415927f * f_1) * f_1));
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
    let uv_4 = clamp(vec2<f32>(roughness, nDotV_1), vec2(0f), vec2(1f));
    let r = ((uv_4.x * vec4<f32>(-1f, -0.0275f, -0.572f, 0.022f)) + vec4<f32>(1f, 0.0425f, 1.04f, -0.04f));
    let a004_ = ((min((r.x * r.x), exp2((-9.28f * uv_4.y))) * r.x) + r.y);
    let energy = (1f - (0.55f * uv_4.x));
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

fn _directionalReceiverDepthBiasX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_6: u32, normal_2: vec3<f32>, l: vec3<f32>, radius: f32) -> f32 {
    var local_15: bool;

    let _e4 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[0].w;
    if (_e4 > 0.5f) {
        let _e9 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
        return _e9;
    }
    let nDotL_3 = dot(normal_2, l);
    let depthSpan = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[layer_6].z;
    if (nDotL_3 > 0f) {
        local_15 = (depthSpan > 0f);
    } else {
        local_15 = false;
    }
    let _e26 = local_15;
    if !(_e26) {
        let _e30 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
        return _e30;
    }
    let _e31 = _cascadeLightViewProjX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_6);
    let right = normalize(vec3<f32>(_e31[0].x, _e31[1].x, _e31[2].x));
    let up = normalize(vec3<f32>(_e31[0].y, _e31[1].y, _e31[2].y));
    let _e53 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[layer_6].y;
    let footprint = ((_e53 * radius) * (abs(dot(normal_2, right)) + abs(dot(normal_2, up))));
    let _e63 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.normalBias;
    let missingCoverage = max(0f, (footprint - _e63));
    if !((missingCoverage > 0f)) {
        let _e72 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
        return _e72;
    }
    let _e75 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
    return min(1.0000001f, (_e75 + ((missingCoverage / nDotL_3) / depthSpan)));
}

fn _directionalReceiverPlaneGradientX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_7: u32, normal_3: vec3<f32>, l_1: vec3<f32>) -> vec2<f32> {
    var local_16: bool;
    var local_17: bool;

    let _e4 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[0].w;
    if (_e4 > 0.5f) {
        return vec2(0f);
    }
    if !((dot(normal_3, l_1) > 0.01f)) {
        return vec2(0f);
    }
    let _e18 = _cascadeLightViewProjX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_7);
    let row0_ = vec3<f32>(_e18[0].x, _e18[1].x, _e18[2].x);
    let row1_ = vec3<f32>(_e18[0].y, _e18[1].y, _e18[2].y);
    let row2_ = vec3<f32>(_e18[0].z, _e18[1].z, _e18[2].z);
    let sx = length(row0_);
    let sy = length(row1_);
    let sz = length(row2_);
    let nz = (dot(row2_, normal_3) / sz);
    if (abs(nz) > 0.01f) {
        local_16 = (sx > 0f);
    } else {
        local_16 = false;
    }
    let _e53 = local_16;
    if _e53 {
        local_17 = (sy > 0f);
    } else {
        local_17 = false;
    }
    let _e59 = local_17;
    if !(_e59) {
        return vec2(0f);
    }
    let _e65 = textureDimensions(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, 0i);
    let texels = vec2<f32>(_e65);
    let dzdx = ((-((dot(row0_, normal_3) / sx)) * sz) / (nz * sx));
    let dzdy = ((-((dot(row1_, normal_3) / sy)) * sz) / (nz * sy));
    return vec2<f32>(((dzdx * 2f) / texels.x), ((-(dzdy) * 2f) / texels.y));
}

fn _sampleShadowForCascadeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(worldPos: vec3<f32>, layer_8: u32, normal_4: vec3<f32>, l_2: vec3<f32>, layerBase: u32, pixel_2: vec2<f32>) -> f32 {
    var local_18: bool;
    var local_19: bool;
    var local_20: bool;
    var local_21: bool;
    var local_22: bool;
    var blocked: f32 = 0f;
    var x_1: i32 = -1i;
    var y_1: i32;
    var x_2: i32 = -2i;
    var y_2: i32;

    let _e4 = _cascadeLightViewProjX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_8);
    let lightClip = (_e4 * vec4<f32>(worldPos, 1f));
    let projCoords = (lightClip.xyz / vec3(lightClip.w));
    let tileUv = vec2<f32>(((projCoords.x * 0.5f) + 0.5f), ((-(projCoords.y) * 0.5f) + 0.5f));
    let _e29 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[3].w;
    let _e34 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[3].w;
    let aspect = select(1f, _e29, (_e34 > 0f));
    let viewportScale = vec2<f32>(min(1f, aspect), min(1f, (1f / aspect)));
    let uv_5 = (tileUv * viewportScale);
    let shadowLayer = i32((layer_8 + layerBase));
    let currentDepth = projCoords.z;
    if (tileUv.x >= 0f) {
        local_18 = (tileUv.x <= 1f);
    } else {
        local_18 = false;
    }
    let _e60 = local_18;
    if _e60 {
        local_19 = (tileUv.y >= 0f);
    } else {
        local_19 = false;
    }
    let _e67 = local_19;
    if _e67 {
        local_20 = (tileUv.y <= 1f);
    } else {
        local_20 = false;
    }
    let _e74 = local_20;
    if _e74 {
        local_21 = (currentDepth >= 0f);
    } else {
        local_21 = false;
    }
    let _e80 = local_21;
    if _e80 {
        local_22 = (currentDepth <= 1f);
    } else {
        local_22 = false;
    }
    let _e86 = local_22;
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
    let phase_1 = fract(((uv_5 * texelDims) - vec2(0.5f)));
    let reach = max(phase_1, (vec2(1f) - phase_1));
    let footprintRadius = select(max(reach.x, reach.y), 1f, (filterProfile == 6u));
    let _e139 = _directionalReceiverDepthBiasX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_8, normal_4, l_2, footprintRadius);
    let adjustedDepth = (currentDepth + _e139);
    let _e141 = _directionalReceiverPlaneGradientX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_8, normal_4, l_2);
    if (filterProfile == 8u) {
        let _e144 = sample_shadow_varianceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(uv_5, shadowLayer, adjustedDepth, viewportScale);
        return _e144;
    }
    if (filterProfile == 7u) {
        let _e149 = sample_shadow_2d_softX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, uv_5, shadowLayer, tileLo, adjustedDepth, viewportScale);
        return _e149;
    }
    if (filterProfile == 6u) {
        let _e161 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[2].w;
        let _e170 = sample_shadow_2d_vogelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, uv_5, shadowLayer, ((tileLo * vec2<f32>(1f, (1f / aspect))) * max((1f + _e161), 0f)), adjustedDepth, _e141, pixel_2, viewportScale);
        return _e170;
    }
    if (kernel == 1u) {
        let _e177 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[0].w;
        if (_e177 > 0.5f) {
            let _e182 = sample_shadow_2d_nearestX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, uv_5, shadowLayer, adjustedDepth, viewportScale);
            return _e182;
        }
        let lit_1 = textureSampleCompareLevel(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, clamp(uv_5, tileLo, tileHi), shadowLayer, adjustedDepth);
        return lit_1;
    }
    if (kernel == 3u) {
        loop {
            let _e190 = x_1;
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
                        let _e198 = x_1;
                        let _e200 = y_1;
                        let offsetUv = clamp((uv_5 + (vec2<f32>(f32(_e198), f32(_e200)) * tileLo)), tileLo, tileHi);
                        let tapDepth = (adjustedDepth + dot(_e141, ((offsetUv - uv_5) / tileLo)));
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
                let _e222 = x_1;
                x_1 = (_e222 + 1i);
            }
        }
        let _e224 = blocked;
        return (1f - (_e224 / 9f));
    }
    loop {
        let _e230 = x_2;
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
                    let _e238 = x_2;
                    let _e240 = y_2;
                    let offsetUv_1 = clamp((uv_5 + (vec2<f32>(f32(_e238), f32(_e240)) * tileLo)), tileLo, tileHi);
                    let tapDepth_1 = (adjustedDepth + dot(_e141, ((offsetUv_1 - uv_5) / tileLo)));
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
            let _e261 = x_2;
            x_2 = (_e261 + 1i);
        }
    }
    let _e263 = blocked;
    return (1f - (_e263 / 25f));
}

fn evalDirectionalShadowFactorAtPixelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(normal_5: vec3<f32>, worldPos_1: vec3<f32>, viewZ: f32, layerBase_1: u32, pixel_3: vec2<f32>) -> f32 {
    var shadow: f32;
    var local_23: bool;

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
    let receiverPosition = (worldPos_1 + (normal_5 * _e33));
    let _e38 = _sampleShadowForCascadeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(receiverPosition, _e28, normal_5, l_3, layerBase_1, pixel_3);
    shadow = _e38;
    let _e42 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cascadeBlend;
    if (_e42 > 0f) {
        local_23 = ((_e28 + 1u) < count_1);
    } else {
        local_23 = false;
    }
    let _e51 = local_23;
    if _e51 {
        let spCurr = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[_e28].x;
        let _e59 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cascadeBlend;
        let blendWidth = (spCurr * _e59);
        if (blendWidth > 0f) {
            let dist = (spCurr - viewDepth_1);
            let t = clamp((1f - (dist / blendWidth)), 0f, 1f);
            if (t > 0f) {
                let _e74 = _sampleShadowForCascadeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(receiverPosition, (_e28 + 1u), normal_5, l_3, layerBase_1, pixel_3);
                shadow = mix(_e38, _e74, t);
            }
        }
    }
    let _e76 = shadow;
    let _e81 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[1].w;
    return mix(1f, _e76, (1f - _e81));
}

fn evalDirectionalShadowFactorX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(normal_6: vec3<f32>, worldPos_2: vec3<f32>, viewZ_1: f32, layerBase_2: u32) -> f32 {
    let _e5 = evalDirectionalShadowFactorAtPixelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(normal_6, worldPos_2, viewZ_1, layerBase_2, worldPos_2.xy);
    return _e5;
}

fn illustratedDiffuseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU2LMNR2XG5DSMF2GKZC7NRUWO2DUNFXGOX(surface: vec3<f32>, shadowPigment_1: vec3<f32>, normal_7: vec3<f32>, visibility: f32, sideShade: f32, continuous: bool) -> vec3<f32> {
    var diffuse: f32;

    let _e3 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let nDotL_4 = dot(normal_7, normalize(-(_e3)));
    let up_1 = clamp(normal_7.y, 0f, 1f);
    diffuse = ((0.52f * smoothstep(0f, 0.14f, nDotL_4)) + (0.48f * smoothstep(0.6f, 0.78f, nDotL_4)));
    if continuous {
        diffuse = max(0f, nDotL_4);
    }
    let fill = (mix(shadowPigment_1, surface, 0.16f) * vec3<f32>(0.88f, 1.02f, 1.12f));
    let ambient = (fill * mix(0.82f, 1f, up_1));
    let _e41 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightColor;
    let _e43 = diffuse;
    let direct = ((surface * _e41) * ((0.54f * _e43) * visibility));
    let plane = mix(sideShade, 1f, (0.65f + (0.35f * up_1)));
    return ((ambient + direct) * plane);
}

fn paintedSpecularX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(base: vec3<f32>, normal_8: vec3<f32>, light_1: vec3<f32>, camera: vec3<f32>, roughness_3: f32, metallic_1: f32, strength: f32, visibility_1: f32) -> vec3<f32> {
    let halfVector = normalize((light_1 + camera));
    let smoothness = (1f - clamp(roughness_3, 0.04f, 1f));
    let lobe = pow(max(dot(normal_8, halfVector), 0f), mix(12f, 112f, smoothness));
    let reflection = (((((strength * smoothness) * smoothness) * lobe) * max(dot(normal_8, light_1), 0f)) * visibility_1);
    return (mix(vec3<f32>(0.88f, 0.86f, 0.81f), base, metallic_1) * reflection);
}

fn paintedRimX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(normal_9: vec3<f32>, camera_1: vec3<f32>, roughness_4: f32, strength_1: f32, visibility_2: f32) -> f32 {
    let fresnel_1 = pow((1f - clamp(dot(normal_9, camera_1), 0f, 1f)), 4f);
    return (((fresnel_1 * strength_1) * mix(1f, 0.18f, roughness_4)) * mix(0.35f, 1f, visibility_2));
}

fn surfaceHash21_(cell: vec2<f32>) -> f32 {
    var p_3: vec3<f32>;

    p_3 = fract((vec3<f32>(cell.x, cell.y, cell.x) * 0.1031f));
    let _e9 = p_3;
    let _e10 = p_3;
    let _e11 = p_3;
    p_3 = (_e9 + vec3(dot(_e10, (_e11.yzx + vec3(33.33f)))));
    let _e20 = p_3.x;
    let _e22 = p_3.y;
    let _e25 = p_3.z;
    return fract(((_e20 + _e22) * _e25));
}

fn surfaceValueNoise(point: vec2<f32>) -> f32 {
    let cell_1 = floor(point);
    let local_40 = fract(point);
    let blend = (((local_40 * local_40) * local_40) * ((local_40 * ((local_40 * 6f) - vec2(15f))) + vec2(10f)));
    let _e15 = surfaceHash21_(cell_1);
    let _e20 = surfaceHash21_((cell_1 + vec2<f32>(1f, 0f)));
    let _e27 = surfaceHash21_((cell_1 + vec2<f32>(0f, 1f)));
    let _e32 = surfaceHash21_((cell_1 + vec2<f32>(1f, 1f)));
    return mix(mix(_e15, _e20, blend.x), mix(_e27, _e32, blend.x), blend.y);
}

fn surfaceFilteredNoise(point_1: vec2<f32>) -> f32 {
    let _e1 = dpdx(point_1);
    let _e3 = dpdy(point_1);
    let footprint_1 = max(length(_e1), length(_e3));
    let resolved_1 = (1f - smoothstep(0.18f, 0.65f, footprint_1));
    if (resolved_1 == 0f) {
        return 0.5f;
    }
    let _e14 = surfaceValueNoise(point_1);
    return (0.5f + ((_e14 - 0.5f) * resolved_1));
}

fn grassPaintStroke(point_2: vec2<f32>, bladeLength: f32, width: f32, lean: f32, seed: f32, pixel_4: f32) -> f32 {
    let t_1 = clamp((point_2.y / bladeLength), 0f, 1f);
    let centre = ((lean * t_1) * t_1);
    let _e14 = surfaceValueNoise(vec2<f32>((t_1 * 8f), seed));
    let shoulder = mix(0.24f, 1f, smoothstep(0f, 0.22f, t_1));
    let halfWidth = (((width * shoulder) * pow((1f - t_1), 0.78f)) * (0.78f + (_e14 * 0.34f)));
    let _e41 = surfaceValueNoise(vec2<f32>((((point_2.x - centre) * 65f) + seed), (t_1 * 3f)));
    let dry = (smoothstep(0.54f, 0.76f, _e41) * (1f - smoothstep(0.01f, 0.038f, pixel_4)));
    let edge_1 = max(((abs((point_2.x - centre)) - halfWidth) + ((dry * width) * 0.18f)), max(-(point_2.y), (point_2.y - bladeLength)));
    return ((1f - smoothstep((-(pixel_4) * 0.65f), (pixel_4 * 0.65f), edge_1)) * (1f - (dry * 0.38f)));
}

fn grassBrushCluster(point_3: vec2<f32>, seed_1: f32, pixel_5: f32) -> f32 {
    var paint: f32 = 0f;
    var i_2: i32 = 0i;

    let count_2 = (2i + i32(floor((fract((seed_1 * 0.731f)) * 4f))));
    let broad = (fract((seed_1 * 0.317f)) < 0.35f);
    loop {
        let _e18 = i_2;
        if (_e18 < 5i) {
        } else {
            break;
        }
        {
            let _e21 = i_2;
            if (_e21 >= count_2) {
                break;
            }
            let _e23 = i_2;
            let f_2 = f32(_e23);
            let _e31 = surfaceHash21_(vec2<f32>((seed_1 + (f_2 * 17.3f)), (f_2 + 4.7f)));
            let fan = (((f_2 / max(1f, f32((count_2 - 1i)))) - 0.5f) * 1.8f);
            let direction = normalize(vec2<f32>((fan + ((_e31 - 0.5f) * 0.5f)), 0.85f));
            let delta = (point_3 - vec2<f32>((fan * 0.032f), ((_e31 - 0.5f) * 0.08f)));
            let p_6 = vec2<f32>(dot(delta, vec2<f32>(direction.y, -(direction.x))), dot(delta, direction));
            let length_2 = (0.16f + (_e31 * 0.36f));
            let width_5 = select((0.032f + (_e31 * 0.04f)), (0.08f + (_e31 * 0.075f)), broad);
            let _e80 = paint;
            let _e89 = grassPaintStroke(p_6, length_2, width_5, ((_e31 - 0.5f) * 0.14f), (seed_1 + (f_2 * 11.2f)), pixel_5);
            paint = max(_e80, _e89);
        }
        continuing {
            let _e92 = i_2;
            i_2 = (_e92 + 1i);
        }
    }
    let _e94 = paint;
    return _e94;
}

fn grassSoilTongue(point_4: vec2<f32>, depth: f32, width_1: f32, lean_1: f32, seed_2: f32, pixel_6: f32) -> f32 {
    let t_2 = clamp((point_4.y / depth), 0f, 1f);
    let centre_1 = ((lean_1 * t_2) * t_2);
    let _e14 = surfaceValueNoise(vec2<f32>((t_2 * 5f), seed_2));
    let edgeInk = (_e14 - 0.5f);
    let taper = pow((1f - t_2), 0.72f);
    let halfWidth_1 = ((width_1 * taper) * (1f + (edgeInk * 0.18f)));
    let edge_2 = max((abs((point_4.x - centre_1)) - halfWidth_1), (point_4.y - depth));
    return (1f - smoothstep((-(pixel_6) * 0.7f), (pixel_6 * 0.7f), edge_2));
}

fn grassSoilNotch(point_5: vec2<f32>, depth_1: f32, width_2: f32, seed_3: f32, pixel_7: f32) -> f32 {
    var cut: f32;

    let lean_2 = (((fract((seed_3 * 0.713f)) - 0.5f) * depth_1) * 0.7f);
    let _e13 = grassSoilTongue(point_5, depth_1, width_2, lean_2, seed_3, pixel_7);
    cut = _e13;
    if (depth_1 > 0.23f) {
        let side = select(-1f, 1f, (lean_2 < 0f));
        let branch = (point_5 - vec2<f32>(((side * width_2) * 0.55f), 0f));
        let _e28 = cut;
        let _e44 = grassSoilTongue(branch, (depth_1 * (0.48f + (fract((seed_3 * 0.173f)) * 0.24f))), (width_2 * 0.52f), ((side * depth_1) * 0.38f), (seed_3 + 19f), pixel_7);
        cut = max(_e28, _e44);
    }
    let _e46 = cut;
    return _e46;
}

fn grassPigmentStroke(point_6: vec2<f32>, length_: f32, width_3: f32, seed_4: f32, pixel_8: f32) -> f32 {
    var local_24: bool;
    var local_25: bool;

    let _e2 = material.surfaceDetailMode;
    let meadow = (_e2 > 10.5f);
    let softness = (pixel_8 * select(1f, 0.7f, meadow));
    let feather = (softness + (width_3 * select(0.18f, 0.12f, meadow)));
    if !((abs(point_6.x) > ((width_3 * 1.6f) + feather))) {
        local_24 = (point_6.y < -(feather));
    } else {
        local_24 = true;
    }
    let _e30 = local_24;
    if !(_e30) {
        local_25 = (point_6.y > (length_ + feather));
    } else {
        local_25 = true;
    }
    let _e39 = local_25;
    if _e39 {
        return 0f;
    }
    let t_3 = clamp((point_6.y / length_), 0f, 1f);
    let bend = (((((fract((seed_4 * 0.317f)) - 0.5f) * width_3) * 1.2f) * t_3) * t_3);
    let across = (point_6.x - bend);
    let loaded = select(pow(max(0f, sin((t_3 * 3.1415927f))), 0.6f), pow(max(0f, sin((t_3 * 3.1415927f))), 0.82f), meadow);
    let edge_3 = max((abs(across) - (width_3 * loaded)), max(-(point_6.y), (point_6.y - length_)));
    let _e90 = surfaceValueNoise(vec2<f32>((((across / width_3) * 5f) + seed_4), (t_3 * 1.7f)));
    let pigment_1 = (0.7f + (_e90 * 0.3f));
    return ((1f - smoothstep(-(softness), (softness + (width_3 * select(0.18f, 0.12f, meadow))), edge_3)) * pigment_1);
}

fn applyGrassPigmentGroups(world: vec2<f32>, baseColor_1: vec3<f32>, pixel_9: f32, resolved: f32) -> vec3<f32> {
    var paint_1: f32 = 0f;
    var z: i32 = -1i;
    var x_3: i32;
    var i_3: i32;

    let _e4 = material.surfaceDetailMode;
    let meadow_1 = (_e4 > 10.5f);
    let _e9 = material.surfacePatchSize;
    let spacing = (_e9 * select(2.6f, 2.25f, meadow_1));
    let base_2 = floor((world / vec2(spacing)));
    loop {
        let _e19 = z;
        if (_e19 <= 1i) {
        } else {
            break;
        }
        {
            x_3 = -1i;
            loop {
                let _e24 = x_3;
                if (_e24 <= 1i) {
                } else {
                    break;
                }
                {
                    let _e27 = x_3;
                    let _e29 = z;
                    let cell_2 = (base_2 + vec2<f32>(f32(_e27), f32(_e29)));
                    let _e37 = surfaceHash21_((cell_2 + vec2<f32>(52.7f, 19.3f)));
                    let _e40 = material.surfaceClusterCoverage;
                    if (_e37 > (0.4f + _e40)) {
                        continue;
                    }
                    let _e47 = surfaceHash21_((cell_2 + vec2(8.3f)));
                    let _e51 = surfaceHash21_((cell_2 - vec2(2.7f)));
                    let jitter = (vec2<f32>(_e47, _e51) - vec2(0.5f));
                    let root = (((cell_2 + vec2(0.5f)) + (jitter * 0.32f)) * spacing);
                    let delta_1 = (world - root);
                    let _e70 = surfaceHash21_((cell_2 + vec2(42.1f)));
                    let radius_1 = (select(0.7f, 0.55f, meadow_1) + (_e70 * select(0.38f, 0.55f, meadow_1)));
                    if (length(delta_1) > (radius_1 + select(0.75f, 0.95f, meadow_1))) {
                        continue;
                    }
                    let _e85 = surfaceHash21_((cell_2 + vec2(17.9f)));
                    let count_3 = (3i + i32(floor((_e85 * 5f))));
                    let _e95 = surfaceHash21_((cell_2 - vec2(61.3f)));
                    let darkCount = (1i + i32((_e95 > 0.55f)));
                    i_3 = 0i;
                    loop {
                        let _e103 = i_3;
                        if (_e103 < 7i) {
                        } else {
                            break;
                        }
                        {
                            let _e106 = i_3;
                            if (_e106 >= count_3) {
                                break;
                            }
                            let _e110 = i_3;
                            let _e115 = i_3;
                            let id = vec2<f32>(((_e37 * 211f) + (f32(_e110) * 13.7f)), (f32(_e115) + 47.2f));
                            let _e120 = surfaceHash21_(id);
                            let _e124 = surfaceHash21_((id + vec2(11.3f)));
                            let angle_1 = (_e124 * 6.2831855f);
                            let _e133 = surfaceHash21_((id - vec2(9.7f)));
                            let offset_1 = ((vec2<f32>(cos(angle_1), sin(angle_1)) * sqrt(_e133)) * radius_1);
                            let _e140 = surfaceHash21_((id + vec2(4.2f)));
                            let direction_1 = normalize(vec2<f32>((-0.25f + ((_e140 - 0.5f) * 1.2f)), -1f));
                            let q_1 = vec2<f32>(dot((delta_1 - offset_1), vec2<f32>(-(direction_1.y), direction_1.x)), dot((delta_1 - offset_1), direction_1));
                            let _e184 = surfaceHash21_((id + vec2(31f)));
                            let size = (select(select(select(0.22f, 0.39f, (_e120 > 0.48f)), 0.64f, (_e120 > 0.85f)), select(select(0.3f, 0.5f, (_e120 > 0.48f)), 0.76f, (_e120 > 0.85f)), meadow_1) * (select(0.85f, 0.82f, meadow_1) + (_e184 * select(0.3f, 0.36f, meadow_1))));
                            let _e204 = grassPigmentStroke(q_1, size, (size * select((0.11f + (_e120 * 0.08f)), (0.19f + (_e120 * 0.13f)), meadow_1)), (_e120 * 101f), pixel_9);
                            let _e211 = i_3;
                            let _e220 = i_3;
                            let value = select(select(mix(-0.045f, 0.055f, _e120), mix(-0.15f, -0.105f, _e120), (_e211 < darkCount)), select(mix(0.065f, 0.145f, _e120), mix(-0.2f, -0.145f, _e120), (_e220 < darkCount)), meadow_1);
                            let _e225 = paint_1;
                            paint_1 = (_e225 + (_e204 * value));
                        }
                        continuing {
                            let _e229 = i_3;
                            i_3 = (_e229 + 1i);
                        }
                    }
                }
                continuing {
                    let _e232 = x_3;
                    x_3 = (_e232 + 1i);
                }
            }
        }
        continuing {
            let _e235 = z;
            z = (_e235 + 1i);
        }
    }
    let _e237 = paint_1;
    let _e248 = material.surfaceDetailStrength;
    return (baseColor_1 * (1f + ((clamp(_e237, select(-0.2f, -0.24f, meadow_1), select(0.08f, 0.18f, meadow_1)) * _e248) * resolved)));
}

fn meadowLoadedBrush(point_7: vec2<f32>, length_1: f32, width_4: f32, seed_5: f32, pixel_10: f32) -> f32 {
    var local_26: bool;
    var local_27: bool;

    let feather_1 = (pixel_10 + 0.035f);
    if !((abs(point_7.x) > ((width_4 * 1.06f) + feather_1))) {
        local_26 = (point_7.y < ((-(length_1) * 0.44f) - feather_1));
    } else {
        local_26 = true;
    }
    let _e22 = local_26;
    if !(_e22) {
        local_27 = (point_7.y > ((length_1 * 0.6f) + feather_1));
    } else {
        local_27 = true;
    }
    let _e32 = local_27;
    if _e32 {
        return 0f;
    }
    let _e43 = surfaceValueNoise(vec2<f32>((((point_7.x / width_4) * 5.5f) + seed_5), (seed_5 + 9.7f)));
    let t_4 = clamp(((point_7.y + (length_1 * 0.44f)) / (length_1 * (0.86f + (_e43 * 0.18f)))), 0f, 1f);
    let shoulder_1 = pow(max(0f, sin((t_4 * 3.1415927f))), 0.38f);
    let _e69 = surfaceValueNoise(vec2<f32>((t_4 * 7f), (seed_5 + 21f)));
    let halfWidth_2 = ((width_4 * shoulder_1) * (0.84f + (_e69 * 0.22f)));
    let edge_4 = max((abs(point_7.x) - halfWidth_2), max((-(point_7.y) - (length_1 * 0.44f)), (point_7.y - (length_1 * (0.42f + (_e43 * 0.18f))))));
    let _e101 = surfaceValueNoise(vec2<f32>((((point_7.x / width_4) * 18f) + seed_5), (t_4 * 2.8f)));
    let bristleResolved = (1f - smoothstep(0.014f, 0.055f, pixel_10));
    let coverage = (1f - smoothstep((-(pixel_10) - 0.025f), (pixel_10 + 0.035f), edge_4));
    return (coverage * (0.86f + (((_e101 - 0.5f) * 0.24f) * bristleResolved)));
}

fn applyMeadowBrushwork(world_1: vec2<f32>, color_2: vec3<f32>, pixel_11: f32) -> vec3<f32> {
    var local_28: bool;
    var pigment: f32 = 0f;
    var z_1: i32 = -1i;
    var x_4: i32;
    var local_29: bool;
    var i_4: i32;

    let spacing_1 = material.surfacePatchSize;
    let base_3 = floor((world_1 / vec2(spacing_1)));
    let leafResolved = (1f - smoothstep(0.055f, 0.14f, pixel_11));
    let brushResolved = (1f - smoothstep(0.09f, 0.23f, pixel_11));
    if (leafResolved == 0f) {
        local_28 = (brushResolved == 0f);
    } else {
        local_28 = false;
    }
    let _e27 = local_28;
    if _e27 {
        return color_2;
    }
    loop {
        let _e30 = z_1;
        if (_e30 <= 1i) {
        } else {
            break;
        }
        {
            x_4 = -1i;
            loop {
                let _e35 = x_4;
                if (_e35 <= 1i) {
                } else {
                    break;
                }
                {
                    let _e38 = x_4;
                    let _e40 = z_1;
                    let cell_3 = (base_3 + vec2<f32>(f32(_e38), f32(_e40)));
                    let _e47 = surfaceHash21_((cell_3 + vec2(8.4f)));
                    let _e51 = surfaceHash21_((cell_3 - vec2(37.5f)));
                    let jitter_1 = (vec2<f32>(_e47, _e51) - vec2(0.5f));
                    let root_1 = (((cell_3 + vec2(0.5f)) + (jitter_1 * 0.8f)) * spacing_1);
                    let delta_2 = (world_1 - root_1);
                    if (dot(delta_2, delta_2) > 0.37f) {
                        continue;
                    }
                    let _e71 = surfaceHash21_((cell_3 + vec2<f32>(81.9f, 29.7f)));
                    let _e78 = surfaceValueNoise(((cell_3 * 0.13f) + vec2<f32>(13.8f, 4.1f)));
                    let _e81 = material.surfaceClusterCoverage;
                    if (_e71 > ((0.3f + (_e81 * 0.55f)) + (_e78 * 0.3f))) {
                        continue;
                    }
                    let _e92 = surfaceValueNoise((root_1 * 0.7f));
                    let _e102 = surfaceHash21_((cell_3 + vec2(72.6f)));
                    let angle_2 = ((3.35f + ((_e92 - 0.5f) * 1.2f)) + ((_e102 - 0.5f) * 0.65f));
                    let direction_2 = vec2<f32>(sin(angle_2), cos(angle_2));
                    let q_2 = vec2<f32>(dot(delta_2, vec2<f32>(-(direction_2.y), direction_2.x)), dot(delta_2, direction_2));
                    let _e121 = surfaceHash21_((cell_3 - vec2(13.1f)));
                    let size_1 = (0.17f + (_e121 * 0.12f));
                    if !((abs(q_2.x) > 0.36f)) {
                        local_29 = (abs(q_2.y) > 0.49f);
                    } else {
                        local_29 = true;
                    }
                    let _e138 = local_29;
                    if _e138 {
                        continue;
                    }
                    let _e145 = meadowLoadedBrush(q_2, (size_1 * 1.72f), (size_1 * 0.61f), (_e71 * 109f), pixel_11);
                    let _e147 = pigment;
                    let _e151 = surfaceHash21_((cell_3 + vec2(17.2f)));
                    pigment = (_e147 + ((_e145 * mix(-0.055f, 0.05f, _e151)) * brushResolved));
                    if (leafResolved == 0f) {
                        continue;
                    }
                    let _e163 = surfaceHash21_((cell_3 + vec2(49.1f)));
                    let count_4 = (6i + i32(floor((_e163 * 7f))));
                    let _e173 = surfaceHash21_((cell_3 + vec2(16.7f)));
                    let darkCount_1 = (1i + i32((_e173 > 0.68f)));
                    i_4 = 0i;
                    loop {
                        let _e181 = i_4;
                        if (_e181 < 12i) {
                        } else {
                            break;
                        }
                        {
                            let _e184 = i_4;
                            if (_e184 >= count_4) {
                                break;
                            }
                            let _e188 = i_4;
                            let _e193 = i_4;
                            let id_1 = vec2<f32>(((_e71 * 197f) + (f32(_e188) * 17.1f)), (f32(_e193) + 63.2f));
                            let _e198 = surfaceHash21_(id_1);
                            let _e199 = i_4;
                            let fan_1 = ((f32(_e199) / max(1f, f32((count_4 - 1i)))) - 0.5f);
                            let leafDirection = normalize(vec2<f32>(((fan_1 * 0.72f) + ((_e198 - 0.5f) * 0.38f)), 1f));
                            let _e225 = surfaceHash21_((id_1 + vec2(5.3f)));
                            let offset_2 = vec2<f32>(((fan_1 * size_1) * 1.3f), (((_e225 - 0.5f) * size_1) * 1.45f));
                            let d = (q_2 - offset_2);
                            let leafPoint = vec2<f32>(dot(d, vec2<f32>(leafDirection.y, -(leafDirection.x))), dot(d, leafDirection));
                            let _e252 = surfaceHash21_((id_1 + vec2(7.9f)));
                            let bladeLength_1 = (select(select(0.115f, 0.18f, (_e198 > 0.42f)), 0.255f, (_e198 > 0.88f)) * (0.82f + (_e252 * 0.34f)));
                            let _e267 = grassPigmentStroke(leafPoint, bladeLength_1, (bladeLength_1 * (0.075f + (_e198 * 0.055f))), (_e198 * 101f), (pixel_11 * 0.65f));
                            let _e276 = i_4;
                            let value_1 = select((0.13f + (_e198 * 0.12f)), (-0.145f - (_e198 * 0.05f)), (_e276 < darkCount_1));
                            let _e279 = pigment;
                            pigment = (_e279 + ((_e267 * value_1) * leafResolved));
                        }
                        continuing {
                            let _e284 = i_4;
                            i_4 = (_e284 + 1i);
                        }
                    }
                }
                continuing {
                    let _e287 = x_4;
                    x_4 = (_e287 + 1i);
                }
            }
        }
        continuing {
            let _e290 = z_1;
            z_1 = (_e290 + 1i);
        }
    }
    let _e292 = pigment;
    let _e298 = material.surfaceDetailStrength;
    return (color_2 * (1f + (clamp(_e292, -0.2f, 0.25f) * _e298)));
}

fn meadowCliffPlane(p_4: vec2<f32>, pixel_12: f32, sunInPlane: vec2<f32>) -> f32 {
    var fine: f32 = 0.5f;
    var detail: f32;
    var y_3: i32 = -1i;
    var x_5: i32;
    var i_5: i32;
    var local_30: bool;
    var local_31: bool;

    let _e7 = surfaceValueNoise((p_4 * vec2<f32>(0.78f, 1.3f)));
    let _e16 = surfaceValueNoise(((p_4 * vec2<f32>(3.7f, 4.9f)) + vec2<f32>(5.7f, 19.1f)));
    let grainResolved = (1f - smoothstep(0.035f, 0.14f, pixel_12));
    let fineResolved = (1f - smoothstep(0.008f, 0.038f, pixel_12));
    if (fineResolved > 0f) {
        let _e36 = surfaceValueNoise(((p_4 * 24f) + vec2<f32>(13.1f, 7.3f)));
        fine = _e36;
    }
    let _e47 = fine;
    detail = ((((_e7 - 0.5f) * 0.25f) + ((_e16 - 0.5f) * 0.085f)) + (((_e47 - 0.5f) * 0.028f) * fineResolved));
    if (grainResolved == 0f) {
        let _e57 = detail;
        return clamp(_e57, -0.22f, 0.72f);
    }
    let base_4 = floor((p_4 / vec2(0.86f)));
    loop {
        let _e66 = y_3;
        if (_e66 <= 1i) {
        } else {
            break;
        }
        {
            x_5 = -1i;
            loop {
                let _e71 = x_5;
                if (_e71 <= 1i) {
                } else {
                    break;
                }
                {
                    let _e74 = x_5;
                    let _e76 = y_3;
                    let cell_4 = (base_4 + vec2<f32>(f32(_e74), f32(_e76)));
                    let _e84 = surfaceHash21_((cell_4 + vec2<f32>(91.2f, 43.5f)));
                    let _e95 = surfaceValueNoise((vec2<f32>((cell_4.x * 0.17f), (cell_4.y * 0.71f)) + vec2(7.9f)));
                    if (_e84 > (0.38f + (_e95 * 0.5f))) {
                        continue;
                    }
                    let _e107 = surfaceHash21_((cell_4 + vec2(3.2f)));
                    let _e111 = surfaceHash21_((cell_4 + vec2(9.1f)));
                    let centre_2 = (((cell_4 + vec2(0.2f)) + (vec2<f32>(_e107, _e111) * 0.6f)) * 0.86f);
                    if (length((p_4 - centre_2)) > 0.64f) {
                        continue;
                    }
                    let _e124 = surfaceHash21_((cell_4 + vec2(52.1f)));
                    let count_5 = (3i + i32(floor((_e124 * 5f))));
                    i_5 = 0i;
                    loop {
                        let _e133 = i_5;
                        if (_e133 < 7i) {
                        } else {
                            break;
                        }
                        {
                            let _e136 = i_5;
                            if (_e136 >= count_5) {
                                break;
                            }
                            let _e138 = i_5;
                            let _e142 = i_5;
                            let id_2 = (cell_4 + vec2<f32>((f32(_e138) * 17.7f), (f32(_e142) * 23.1f)));
                            let _e151 = surfaceHash21_((id_2 + vec2(7.3f)));
                            let _e155 = surfaceHash21_((id_2 + vec2(27.1f)));
                            let _e159 = surfaceHash21_((id_2 + vec2(49.9f)));
                            let offset_3 = ((vec2<f32>(_e155, _e159) - vec2(0.5f)) * vec2<f32>(0.76f, 0.42f));
                            let _e176 = i_5;
                            if !((_e176 == 0i)) {
                                local_30 = (_e151 > 0.87f);
                            } else {
                                local_30 = true;
                            }
                            let _e185 = local_30;
                            let radius_2 = select((0.024f + (_e151 * 0.039f)), (0.072f + (_e151 * 0.083f)), _e185);
                            let q_3 = (((p_4 - centre_2) - offset_3) / vec2<f32>((radius_2 * (1.02f + (_e151 * 0.45f))), (radius_2 * (0.77f + (_e84 * 0.35f)))));
                            let octagon = max(max(abs(q_3.x), abs(q_3.y)), ((abs(q_3.x) + abs(q_3.y)) * 0.73f));
                            let aa = max(0.14f, ((pixel_12 / radius_2) * 0.7f));
                            if (octagon > ((1.25f + aa) + 0.08f)) {
                                continue;
                            }
                            let _e230 = surfaceValueNoise(((q_3 * 2.2f) + vec2((_e84 * 29f))));
                            let irregular = ((_e230 - 0.5f) * 0.16f);
                            let shape = (octagon + irregular);
                            let grain = (1f - smoothstep((0.53f - aa), (1.04f + aa), shape));
                            let insetRim = ((1f - smoothstep((0.9f - aa), (1.25f + aa), shape)) - grain);
                            let facet = clamp(dot((q_3 * 0.24f), sunInPlane), -0.14f, 0.14f);
                            let _e262 = i_5;
                            if (_e262 > 1i) {
                                local_31 = (_e151 < 0.12f);
                            } else {
                                local_31 = false;
                            }
                            let _e270 = local_31;
                            let body = select((0.32f + (_e151 * 0.28f)), -0.13f, _e270);
                            let _e273 = detail;
                            detail = (_e273 + (((grain * (body + facet)) - (insetRim * 0.13f)) * grainResolved));
                        }
                        continuing {
                            let _e282 = i_5;
                            i_5 = (_e282 + 1i);
                        }
                    }
                }
                continuing {
                    let _e285 = x_5;
                    x_5 = (_e285 + 1i);
                }
            }
        }
        continuing {
            let _e288 = y_3;
            y_3 = (_e288 + 1i);
        }
    }
    let _e290 = detail;
    return clamp(_e290, -0.22f, 0.72f);
}

fn meadowStonePlane(p_5: vec2<f32>, pixel_13: f32, strata: f32) -> f32 {
    var detail_1: f32;
    var y_4: i32 = -1i;
    var x_6: i32;

    let _e6 = surfaceValueNoise((p_5 * vec2<f32>(1.35f, 2.4f)));
    let _e15 = surfaceValueNoise(((p_5 * vec2<f32>(6.5f, 0.82f)) + vec2<f32>(31.7f, 5.2f)));
    let grainResolved_1 = (1f - smoothstep(0.028f, 0.105f, pixel_13));
    let brushResolved_1 = (1f - smoothstep(0.15f, 0.4f, pixel_13));
    let _e35 = surfaceValueNoise(vec2<f32>((p_5.x * 0.43f), 17.1f));
    let course = ((p_5.y * 1.7f) + (_e35 * 0.65f));
    let _e52 = surfaceValueNoise((p_5 * vec2<f32>(0.8f, 1.8f)));
    let stripe = ((1f - smoothstep(0.025f, 0.08f, abs((fract(course) - 0.48f)))) * smoothstep(0.48f, 0.7f, _e52));
    detail_1 = (((((_e6 - 0.5f) * 0.28f) + ((_e15 - 0.5f) * 0.09f)) - ((stripe * 0.17f) * strata)) * brushResolved_1);
    if (grainResolved_1 == 0f) {
        let _e75 = detail_1;
        return _e75;
    }
    let base_5 = floor((p_5 / vec2(0.47f)));
    loop {
        let _e81 = y_4;
        if (_e81 <= 1i) {
        } else {
            break;
        }
        {
            x_6 = -1i;
            loop {
                let _e86 = x_6;
                if (_e86 <= 1i) {
                } else {
                    break;
                }
                {
                    let _e89 = x_6;
                    let _e91 = y_4;
                    let cell_5 = (base_5 + vec2<f32>(f32(_e89), f32(_e91)));
                    let _e99 = surfaceHash21_((cell_5 + vec2<f32>(71.2f, 3.5f)));
                    if (_e99 > 0.34f) {
                        continue;
                    }
                    let _e108 = surfaceHash21_((cell_5 + vec2(3.2f)));
                    let _e112 = surfaceHash21_((cell_5 + vec2(9.1f)));
                    let root_2 = (((cell_5 + vec2(0.2f)) + (vec2<f32>(_e108, _e112) * 0.6f)) * 0.47f);
                    let _e121 = surfaceHash21_((cell_5 - vec2(7.7f)));
                    let radius_3 = (0.026f + (_e121 * 0.065f));
                    let q_4 = ((p_5 - root_2) / vec2<f32>((radius_3 * (1.2f + _e99)), (radius_3 * 0.67f)));
                    let shape_1 = max(((abs(q_4.x) * 0.78f) + (abs(q_4.y) * 0.42f)), abs(q_4.y));
                    let aa_1 = max(0.12f, (pixel_13 / radius_3));
                    let pit = (1f - smoothstep((0.7f - aa_1), (1f + aa_1), shape_1));
                    let upper = smoothstep(-0.25f, 0.2f, q_4.y);
                    let _e160 = detail_1;
                    detail_1 = (_e160 + ((pit * mix(-0.24f, 0.16f, upper)) * grainResolved_1));
                }
                continuing {
                    let _e168 = x_6;
                    x_6 = (_e168 + 1i);
                }
            }
        }
        continuing {
            let _e171 = y_4;
            y_4 = (_e171 + 1i);
        }
    }
    let _e173 = detail_1;
    return _e173;
}

fn applyMeadowStone(world_2: vec3<f32>, color_3: vec3<f32>, normal_10: vec3<f32>) -> vec3<f32> {
    var gx: f32 = 0f;
    var gy: f32 = 0f;
    var gz: f32 = 0f;
    var dxDetail: f32 = 0f;
    var dyDetail: f32 = 0f;
    var dzDetail: f32 = 0f;

    let dx = dpdx(world_2);
    let dy = dpdy(world_2);
    let pixelXY = max(length(dx.xy), length(dy.xy));
    let pixelZY = max(length(dx.zy), length(dy.zy));
    let pixelXZ = max(length(dx.xz), length(dy.xz));
    let weights = pow(abs(normal_10), vec3(4f));
    let w = (weights / vec3(max(dot(weights, vec3(1f)), 0.001f)));
    let _e33 = material.surfaceDetailMode;
    if (_e33 < 12.5f) {
        let _e38 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
        let sun = normalize(-(_e38));
        if (w.x > 0f) {
            let _e46 = meadowCliffPlane(world_2.zy, pixelZY, sun.zy);
            gx = (_e46 * w.x);
        }
        if (w.y > 0f) {
            let _e55 = meadowCliffPlane(world_2.xz, pixelXZ, sun.xz);
            gy = (_e55 * w.y);
        }
        if (w.z > 0f) {
            let _e64 = meadowCliffPlane(world_2.xy, pixelXY, sun.xy);
            gz = (_e64 * w.z);
        }
        let _e68 = gx;
        let _e69 = gy;
        let _e71 = gz;
        let grains = ((_e68 + _e69) + _e71);
        let _e75 = material.surfaceDetailStrength;
        return (color_3 * (1f + (grains * _e75)));
    }
    if (w.x > 0f) {
        let _e86 = meadowStonePlane(world_2.zy, pixelZY, 0.35f);
        dxDetail = (_e86 * w.x);
    }
    if (w.y > 0f) {
        let _e95 = meadowStonePlane(world_2.xz, pixelXZ, 0f);
        dyDetail = (_e95 * w.y);
    }
    if (w.z > 0f) {
        let _e103 = meadowStonePlane(world_2.xy, pixelXY, 0.35f);
        dzDetail = (_e103 * w.z);
    }
    let _e107 = dxDetail;
    let _e108 = dyDetail;
    let _e110 = dzDetail;
    let detail_2 = ((_e107 + _e108) + _e110);
    let _e114 = material.surfaceDetailStrength;
    return (color_3 * (1f + (detail_2 * _e114)));
}

fn applyPaintedGrass(worldPos_3: vec3<f32>, baseColor_2: vec3<f32>, normal_11: vec3<f32>, surface_1: vec2<f32>, hasSurface: bool) -> vec3<f32> {
    var local_32: bool;
    var color_4: vec3<f32>;
    var local_33: bool;
    var local_34: bool;
    var leaves: f32 = 0f;
    var gaps: f32 = 0f;
    var z_2: i32 = -1i;
    var x_7: i32;
    var local_35: bool;
    var local_36: bool;

    let _e4 = material.surfaceDetailMode;
    if (_e4 > 9.5f) {
        let _e9 = material.surfaceDetailMode;
        local_32 = (_e9 < 10.5f);
    } else {
        local_32 = false;
    }
    let isEarth = local_32;
    let _e18 = material.surfaceDetailMode;
    let meadow_2 = (_e18 > 10.5f);
    let edgeDistance = select(6f, abs(surface_1.x), hasSurface);
    let relativeHeight = select(0f, surface_1.y, hasSurface);
    let _e32 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let toLight = normalize(-(_e32));
    let exposure = (dot(normal_11, toLight) - toLight.y);
    let relief = (exposure + (clamp((relativeHeight / 0.3f), -1f, 1f) * 0.018f));
    let middle_1 = smoothstep(select(-0.13f, -0.105f, meadow_2), select(-0.035f, -0.065f, meadow_2), relief);
    let crown = smoothstep(select(0.028f, 0.04f, meadow_2), select(0.12f, 0.085f, meadow_2), relief);
    let _e63 = material.surfaceAccentA;
    let _e67 = material.surfaceAccentB;
    let midColor = mix(_e63.xyz, _e67.xyz, 0.5f);
    let _e73 = material.surfaceAccentA;
    let _e78 = material.surfaceAccentB;
    let grassColor = mix(mix(_e73.xyz, midColor, middle_1), _e78.xyz, crown);
    let _e84 = material.surfaceReliefContrast;
    color_4 = select(mix(baseColor_2, grassColor, _e84), baseColor_2, isEarth);
    let _e90 = dpdx(worldPos_3.xz);
    let _e93 = dpdy(worldPos_3.xz);
    let pixel_15 = max(0.003f, max(length(_e90), length(_e93)));
    let resolved_2 = (1f - smoothstep(0.045f, 0.13f, pixel_15));
    let brushDirection = vec2<f32>(-0.24253564f, -0.97014254f);
    let brushPlane = vec2<f32>(dot(worldPos_3.xz, vec2<f32>(-(brushDirection.y), brushDirection.x)), dot(worldPos_3.xz, brushDirection));
    if !(isEarth) {
        let crossPlane = vec2<f32>(((brushPlane.x * 0.8f) + (brushPlane.y * 0.6f)), ((brushPlane.y * 0.8f) - (brushPlane.x * 0.6f)));
        let _e139 = surfaceFilteredNoise((brushPlane * select(vec2<f32>(22f, 17f), vec2<f32>(38f, 7f), meadow_2)));
        let nap = (_e139 - 0.5f);
        let _e150 = surfaceFilteredNoise(((crossPlane * select(63f, 34f, meadow_2)) + vec2<f32>(17.3f, 9.1f)));
        let fineNap = (_e150 - 0.5f);
        let _e161 = surfaceFilteredNoise(((crossPlane * select(8.5f, 5.8f, meadow_2)) + vec2<f32>(4.7f, 31.2f)));
        let softTufts = (_e161 - 0.5f);
        let _e164 = color_4;
        let _e181 = material.surfaceDetailStrength;
        color_4 = (_e164 * (1f + ((((nap * select(0.06f, 0.135f, meadow_2)) + (fineNap * select(0.032f, 0.038f, meadow_2))) + (softTufts * select(0.07f, 0.045f, meadow_2))) * _e181)));
    }
    let leafResolved_1 = select(resolved_2, (1f - smoothstep(0.075f, 0.19f, pixel_15)), meadow_2);
    if meadow_2 {
        let _e193 = color_4;
        let _e194 = applyMeadowBrushwork(worldPos_3.xz, _e193, pixel_15);
        color_4 = _e194;
    } else {
        if !(isEarth) {
            let _e197 = color_4;
            let _e198 = applyGrassPigmentGroups(worldPos_3.xz, _e197, pixel_15, leafResolved_1);
            color_4 = _e198;
        }
    }
    let worldDx = dpdx(worldPos_3.xz);
    let worldDy = dpdy(worldPos_3.xz);
    let distanceDx = dpdx(surface_1.x);
    let distanceDy = dpdy(surface_1.x);
    let determinant_ = ((worldDx.x * worldDy.y) - (worldDx.y * worldDy.x));
    let inverseDeterminant = (sign(determinant_) / max(abs(determinant_), 0.00000001f));
    let gradient = (vec2<f32>(((distanceDx * worldDy.y) - (distanceDy * worldDx.y)), ((distanceDy * worldDx.x) - (distanceDx * worldDy.x))) * inverseDeterminant);
    let inward = normalize((gradient + vec2<f32>(0.000001f, 0f)));
    let tangent = vec2<f32>(-(inward.y), inward.x);
    let _e243 = surfaceFilteredNoise((worldPos_3.xz * 2.5f));
    let meander = ((_e243 - 0.5f) * 0.16f);
    if !(!(hasSurface)) {
        let _e252 = material.surfaceMarginWidth;
        local_33 = (edgeDistance > _e252);
    } else {
        local_33 = true;
    }
    let _e257 = local_33;
    if !(_e257) {
        local_34 = (resolved_2 <= 0f);
    } else {
        local_34 = true;
    }
    let _e264 = local_34;
    if _e264 {
        let _e265 = color_4;
        return _e265;
    }
    let base_6 = floor((worldPos_3.xz / vec2(0.64f)));
    let distance_ = (surface_1.x + meander);
    loop {
        let _e274 = z_2;
        if (_e274 <= 1i) {
        } else {
            break;
        }
        {
            x_7 = -1i;
            loop {
                let _e279 = x_7;
                if (_e279 <= 1i) {
                } else {
                    break;
                }
                {
                    let _e282 = x_7;
                    let _e284 = z_2;
                    let clusterCell = (base_6 + vec2<f32>(f32(_e282), f32(_e284)));
                    let _e292 = surfaceHash21_((clusterCell + vec2<f32>(7.2f, 91.4f)));
                    let _e296 = surfaceHash21_((clusterCell + vec2(3.3f)));
                    let _e300 = surfaceHash21_((clusterCell - vec2(7.9f)));
                    let offset_4 = ((vec2<f32>(_e296, _e300) - vec2(0.5f)) * 0.46f);
                    let root_3 = (((clusterCell + vec2(0.5f)) * 0.64f) + offset_4);
                    let _e319 = surfaceValueNoise(((root_3 / vec2(2.8f)) + vec2<f32>(13.1f, 8.7f)));
                    let broadGroup = smoothstep(0.2f, 0.72f, _e319);
                    let _e330 = surfaceValueNoise(((root_3 / vec2(1.15f)) + vec2<f32>(47.3f, 21.9f)));
                    let smallGroup = smoothstep(0.26f, 0.7f, _e330);
                    let group = ((broadGroup * 0.65f) + (smallGroup * 0.35f));
                    let _e343 = surfaceHash21_((clusterCell + vec2<f32>(17.4f, 71.8f)));
                    let clusterScale = select(select(0.55f, 0.9f, (_e343 > 0.48f)), 1.35f, (_e343 > 0.86f));
                    let rootDistance = (surface_1.x + dot((root_3 - worldPos_3.xz), inward));
                    let p_7 = (vec2<f32>(dot((worldPos_3.xz - root_3), tangent), (-(distance_) + 0.1f)) / vec2(clusterScale));
                    if (_e292 < mix(0.3f, 0.86f, group)) {
                        local_35 = (abs(rootDistance) < (0.64f * 0.55f));
                    } else {
                        local_35 = false;
                    }
                    let _e378 = local_35;
                    if _e378 {
                        let _e382 = grassBrushCluster(p_7, (_e292 * 211f), (pixel_15 / clusterScale));
                        let _e384 = leaves;
                        leaves = max(_e384, _e382);
                    }
                    let _e390 = surfaceHash21_((clusterCell + vec2<f32>(127.4f, 59.2f)));
                    if (_e390 < mix(0.18f, 0.9f, group)) {
                        local_36 = (abs(rootDistance) < (0.64f * 0.55f));
                    } else {
                        local_36 = false;
                    }
                    let _e402 = local_36;
                    if _e402 {
                        let _e407 = surfaceHash21_((clusterCell + vec2<f32>(4.8f, 207.3f)));
                        let depth_2 = select(select((0.1f + (_e407 * 0.09f)), (0.24f + (_e407 * 0.12f)), (_e343 > 0.52f)), (0.43f + (_e407 * 0.17f)), (_e343 > 0.85f));
                        let width_6 = select(select((0.028f + (_e407 * 0.022f)), (0.06f + (_e407 * 0.035f)), (_e343 > 0.52f)), (0.12f + (_e407 * 0.07f)), (_e343 > 0.85f));
                        let gapPoint = vec2<f32>(dot((worldPos_3.xz - root_3), tangent), distance_);
                        let _e449 = gaps;
                        let _e452 = grassSoilNotch(gapPoint, depth_2, width_6, (_e390 * 193f), pixel_15);
                        gaps = max(_e449, _e452);
                    }
                }
                continuing {
                    let _e455 = x_7;
                    x_7 = (_e455 + 1i);
                }
            }
        }
        continuing {
            let _e458 = z_2;
            z_2 = (_e458 + 1i);
        }
    }
    let body_1 = smoothstep((-0.025f - pixel_15), (0.025f + pixel_15), distance_);
    let reach_1 = (1f - smoothstep(0.28f, 0.68f, abs(distance_)));
    let _e471 = gaps;
    let soilCut = (_e471 * smoothstep(-0.08f, 0.02f, distance_));
    let _e476 = leaves;
    let coverage_1 = clamp((max(body_1, (_e476 * reach_1)) * (1f - soilCut)), 0f, 1f);
    let _e485 = color_4;
    let marginGrass = select(_e485, grassColor, isEarth);
    let _e489 = material.surfaceMarginColor;
    let boundaryColor = mix(_e489.xyz, marginGrass, coverage_1);
    let _e494 = material.surfaceMarginWidth;
    let band = (1f - smoothstep(0.45f, _e494, edgeDistance));
    let _e499 = color_4;
    color_4 = mix(_e499, boundaryColor, (band * resolved_2));
    let _e502 = color_4;
    return _e502;
}

fn applyTerrainSurfaceDetail(worldPos_4: vec3<f32>, baseColor_3: vec3<f32>, normal_12: vec3<f32>, surface_2: vec2<f32>, hasSurface_1: bool) -> vec3<f32> {
    var local_37: bool;
    var local_38: bool;
    var local_39: bool;

    let _e2 = material.surfaceDetailMode;
    if (_e2 > 13.5f) {
        let _e7 = material.surfaceDetailMode;
        local_37 = (_e7 < 14.5f);
    } else {
        local_37 = false;
    }
    let _e13 = local_37;
    if _e13 {
        let p_8 = worldPos_4.xz;
        let _e18 = material.surfaceAccentA;
        let _e22 = material.surfaceAccentB;
        let _e25 = meadowPaletteX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU3LFMFSG6527MZUWK3DEX(p_8, baseColor_3, _e18.xyz, _e22.xyz);
        let _e29 = surfaceFilteredNoise((p_8 / vec2(0.15f)));
        let _e33 = surfaceFilteredNoise((p_8 / vec2(0.73f)));
        let _e42 = surfaceFilteredNoise(((p_8 + (vec2<f32>(_e33, -(_e33)) * 0.25f)) / vec2(0.34f)));
        return (_e25 * (((1f + ((_e29 - 0.5f) * 0.09f)) + ((_e33 - 0.5f) * 0.14f)) + ((_e42 - 0.5f) * 0.08f)));
    }
    let _e62 = material.surfaceDetailMode;
    if (_e62 > 8.5f) {
        let _e67 = material.surfaceDetailMode;
        local_38 = (_e67 < 11.5f);
    } else {
        local_38 = false;
    }
    let _e73 = local_38;
    if _e73 {
        let _e77 = applyPaintedGrass(worldPos_4, baseColor_3, normal_12, surface_2, hasSurface_1);
        return mix(baseColor_3, _e77, smoothstep(0.5f, 0.78f, normal_12.y));
    }
    let p_9 = (vec2<f32>(((worldPos_4.x * 0.8f) + (worldPos_4.z * 0.6f)), ((worldPos_4.z * 0.8f) - (worldPos_4.x * 0.6f))) + (worldPos_4.y * vec2<f32>(0.31f, 0.73f)));
    let _e106 = material.surfacePatchSize;
    let _e113 = surfaceFilteredNoise((p_9 / vec2(max(3f, (_e106 * 3f)))));
    let _e116 = material.surfaceAccentA;
    let _e120 = material.surfaceAccentB;
    let pigment_2 = mix(_e116.xyz, _e120.xyz, _e113);
    let _e125 = material.surfaceDetailStrength;
    let color_5 = mix(baseColor_3, pigment_2, (_e125 * 0.5f));
    let _e131 = material.surfaceDetailMode;
    if (_e131 > 11.5f) {
        let _e136 = material.surfaceDetailMode;
        local_39 = (_e136 < 13.5f);
    } else {
        local_39 = false;
    }
    let _e142 = local_39;
    if _e142 {
        let _e143 = applyMeadowStone(worldPos_4, color_5, normal_12);
        return _e143;
    }
    return color_5;
}

@vertex 
fn vs_main(input: VsIn, @builtin(instance_index) idx: u32) -> VsOut {
    var output: VsOut;

    let _e3 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].worldFromLocal;
    let _e8 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx].localFromInstance;
    let model = (_e3 * _e8);
    let world_3 = (model * vec4<f32>(input.pos, 1f));
    let _e19 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    output.clip = (_e19 * world_3);
    output.worldPos = world_3.xyz;
    output.worldNormal = normalize((model * vec4<f32>(input.normal, 0f)).xyz);
    let _e33 = output.clip.w;
    output.viewZ = -(_e33);
    output.sediment = select(0u, 1u, (input.uv.y > 1.5f));
    let _e45 = output.sediment;
    output.sediment = select(_e45, 2u, (input.uv.y > 2.5f));
    let _e54 = output.sediment;
    output.sediment = select(_e54, 3u, (input.uv.y > 3.5f));
    output.sandWeight = input.uv.x;
    output.hasGrassSurface = select(0u, 1u, (input.uv.y < -0.5f));
    output.grassSurface = vec2<f32>(input.uv.x, (-(input.uv.y) - 2f));
    let _e81 = output;
    return _e81;
}

@fragment 
fn fs_main(input_1: VsOut, @builtin(front_facing) frontFacing: bool) -> @location(0) vec4<f32> {
    var normal: vec3<f32>;
    var local: bool;
    var local_1: bool;
    var local_2: bool;
    var local_3: bool;
    var local_4: bool;
    var surfaceColor: vec3<f32>;
    var local_5: bool;
    var local_6: bool;
    var local_7: bool;
    var local_8: bool;
    var local_9: bool;
    var local_10: bool;
    var local_11: bool;
    var shadowPigment: vec3<f32>;
    var local_12: bool;
    var local_13: bool;
    var color: vec3<f32>;
    var local_14: bool;

    let _e2 = dpdy(input_1.worldPos);
    let _e4 = dpdx(input_1.worldPos);
    normal = normalize(cross(_e2, _e4));
    let _e8 = normal;
    let _e10 = normal;
    let _e11 = normal;
    let _e14 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    normal = select(-(_e8), _e10, (dot(_e11, (_e14 - input_1.worldPos)) > 0f));
    let geometricNormal = normal;
    if !((input_1.sediment == 1u)) {
        local = (input_1.sediment == 3u);
    } else {
        local = true;
    }
    let isSediment = local;
    if (input_1.sediment > 0u) {
        let authored = normalize(input_1.worldNormal);
        normal = select(-(authored), authored, (dot(authored, geometricNormal) >= 0f));
    }
    let _e45 = material.surfaceDetailMode;
    if (_e45 > 13.5f) {
        let _e50 = material.surfaceDetailMode;
        local_1 = (_e50 < 14.5f);
    } else {
        local_1 = false;
    }
    let livingMeadow = local_1;
    let _e59 = material.surfaceDetailMode;
    if (_e59 > 8.5f) {
        let _e64 = material.surfaceDetailMode;
        local_2 = (_e64 < 11.5f);
    } else {
        local_2 = false;
    }
    let _e70 = local_2;
    if !(_e70) {
        local_3 = livingMeadow;
    } else {
        local_3 = true;
    }
    let paintedGrass = local_3;
    if paintedGrass {
        local_4 = (input_1.hasGrassSurface == 1u);
    } else {
        local_4 = false;
    }
    let _e82 = local_4;
    if _e82 {
        let authored_1 = normalize(input_1.worldNormal);
        normal = select(-(authored_1), authored_1, (dot(authored_1, geometricNormal) >= 0f));
    }
    let _e92 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let toLight_1 = normalize(-(_e92));
    let _e97 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    let toCamera = normalize((_e97 - input_1.worldPos));
    let _e101 = normal;
    let lightingNDotL = dot(_e101, toLight_1);
    let _e103 = normal;
    let lightingUpFacing = dot(_e103, vec3<f32>(0f, 1f, 0f));
    let _e112 = material.baseColor;
    let _e114 = normal;
    let _e119 = applyTerrainSurfaceDetail(input_1.worldPos, _e112.xyz, _e114, input_1.grassSurface, (input_1.hasGrassSurface == 1u));
    surfaceColor = _e119;
    let wetSand = select(0f, clamp(input_1.sandWeight, 0f, 1f), (input_1.sediment >= 2u));
    if (input_1.sediment >= 2u) {
        let _e133 = surfaceColor;
        let _e136 = material.baseColor;
        let sandGrain = clamp((_e133 / max(_e136.xyz, vec3(0.001f))), vec3(0.97f), vec3(1.03f));
        let _e147 = surfaceColor;
        let _e150 = material.sedimentColor;
        surfaceColor = mix(_e147, (_e150.xyz * sandGrain), wetSand);
    }
    let _e156 = material.surfaceDetailMode;
    if (_e156 > 0.5f) {
        let _e161 = material.surfaceDetailMode;
        local_5 = (_e161 < 1.5f);
    } else {
        local_5 = false;
    }
    let _e167 = local_5;
    if !(_e167) {
        let _e171 = material.surfaceDetailMode;
        if (_e171 > 8.5f) {
            let _e176 = material.surfaceDetailMode;
            local_7 = (_e176 < 9.5f);
        } else {
            local_7 = false;
        }
        let _e182 = local_7;
        local_6 = _e182;
    } else {
        local_6 = true;
    }
    let _e186 = local_6;
    if !(_e186) {
        let _e190 = material.surfaceDetailMode;
        if (_e190 > 10.5f) {
            let _e195 = material.surfaceDetailMode;
            local_9 = (_e195 < 11.5f);
        } else {
            local_9 = false;
        }
        let _e201 = local_9;
        local_8 = _e201;
    } else {
        local_8 = true;
    }
    let _e205 = local_8;
    if !(_e205) {
        local_10 = livingMeadow;
    } else {
        local_10 = true;
    }
    let isGrassMaterial = local_10;
    if isGrassMaterial {
        local_11 = (lightingUpFacing > 0.5f);
    } else {
        local_11 = false;
    }
    let isGrassCanopy = local_11;
    if isGrassCanopy {
        let _e217 = normal;
        normal = normalize(mix(_e217, vec3<f32>(0f, 1f, 0f), select(select(0.72f, 0.18f, paintedGrass), 0.5f, livingMeadow)));
    }
    let lightingNormal = normal;
    let _e233 = evalDirectionalShadowFactorX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(geometricNormal, input_1.worldPos, input_1.viewZ, 0u);
    let _e236 = material.shadowColor;
    shadowPigment = _e236.xyz;
    let _e239 = shadowPigment;
    let _e242 = material.sedimentShadowColor;
    shadowPigment = mix(_e239, _e242.xyz, wetSand);
    if livingMeadow {
        let _e245 = shadowPigment;
        let _e246 = surfaceColor;
        shadowPigment = mix(_e245, (_e246 * 0.76f), 0.65f);
    }
    let _e253 = material.surfaceDetailMode;
    if (_e253 > 11.5f) {
        let _e258 = material.surfaceDetailMode;
        local_12 = (_e258 < 12.5f);
    } else {
        local_12 = false;
    }
    let _e264 = local_12;
    if _e264 {
        let _e265 = shadowPigment;
        let _e266 = surfaceColor;
        let _e269 = material.baseColor;
        shadowPigment = (_e265 * (_e266 / max(_e269.xyz, vec3(0.002f))));
    }
    let _e276 = surfaceColor;
    let _e277 = shadowPigment;
    let _e278 = normal;
    let _e281 = material.sideShade;
    if !(isGrassCanopy) {
        local_13 = isSediment;
    } else {
        local_13 = true;
    }
    let _e286 = local_13;
    let _e287 = illustratedDiffuseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU2LMNR2XG5DSMF2GKZC7NRUWO2DUNFXGOX(_e276, _e277, _e278, _e233, _e281, _e286);
    color = _e287;
    if (input_1.sediment == 2u) {
        let _e292 = color;
        let _e293 = surfaceColor;
        let _e294 = shadowPigment;
        let _e295 = normal;
        let _e298 = material.sideShade;
        let _e300 = illustratedDiffuseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU2LMNR2XG5DSMF2GKZC7NRUWO2DUNFXGOX(_e293, _e294, _e295, _e233, _e298, true);
        color = mix(_e292, _e300, wetSand);
    }
    let _e304 = material.surfaceDetailMode;
    if (_e304 > 10.5f) {
        let _e309 = material.surfaceDetailMode;
        local_14 = (_e309 < 11.5f);
    } else {
        local_14 = false;
    }
    let _e315 = local_14;
    if _e315 {
        let _e316 = surfaceColor;
        let _e319 = material.shadowColor;
        let _e321 = normal;
        let _e324 = material.sideShade;
        let _e326 = illustratedDiffuseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU2LMNR2XG5DSMF2GKZC7NRUWO2DUNFXGOX(_e316, _e319.xyz, _e321, _e233, _e324, false);
        let _e327 = color;
        color = mix(_e327, _e326, 0.32f);
    }
    let _e330 = color;
    let _e331 = surfaceColor;
    let _e334 = material.surfaceRoughness;
    let _e337 = material.surfaceMetallic;
    let _e340 = material.specularStrength;
    let _e341 = paintedSpecularX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(_e331, lightingNormal, toLight_1, toCamera, _e334, _e337, _e340, _e233);
    color = (_e330 + _e341);
    let _e345 = material.surfaceRoughness;
    let _e348 = material.rimStrength;
    let _e349 = paintedRimX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(lightingNormal, toCamera, _e345, _e348, _e233);
    let _e350 = color;
    let _e353 = material.rimColor;
    color = (_e350 + (_e353.xyz * _e349));
    let _e357 = color;
    let _e360 = material.rimColor;
    let _e364 = material.emissionStrength;
    color = (_e357 + (_e360.xyz * _e364));
    let _e367 = color;
    let _e371 = material.baseColor.w;
    return vec4<f32>(_e367, _e371);
}

@fragment 
fn fs_readability_candidate(input_2: VsOut, @builtin(front_facing) frontFacing_1: bool) -> @location(0) vec4<f32> {
    var normal_1: vec3<f32>;
    var lightBand: f32 = 0.24f;
    var color_1: vec3<f32>;
    var planeShade: f32;

    let _e3 = dpdy(input_2.worldPos);
    let _e5 = dpdx(input_2.worldPos);
    normal_1 = normalize(cross(_e3, _e5));
    let _e9 = normal_1;
    let _e11 = normal_1;
    let _e12 = normal_1;
    let _e15 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    normal_1 = select(-(_e9), _e11, (dot(_e12, (_e15 - input_2.worldPos)) > 0f));
    let _e24 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let toLight_2 = normalize(-(_e24));
    let _e29 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    let toCamera_1 = normalize((_e29 - input_2.worldPos));
    let _e33 = normal_1;
    let nDotL_5 = dot(_e33, toLight_2);
    let _e35 = normal_1;
    let upFacing = dot(_e35, vec3<f32>(0f, 1f, 0f));
    let _e44 = material.baseColor;
    let _e46 = normal_1;
    let _e51 = applyTerrainSurfaceDetail(input_2.worldPos, _e44.xyz, _e46, input_2.grassSurface, (input_2.hasGrassSurface == 1u));
    if (nDotL_5 > -0.22f) {
        lightBand = 0.43f;
    }
    if (nDotL_5 > 0.08f) {
        lightBand = 0.7f;
    }
    if (nDotL_5 > 0.68f) {
        lightBand = 1f;
    }
    let _e64 = material.shadowColor;
    let _e66 = lightBand;
    color_1 = mix(_e64.xyz, _e51, _e66);
    let _e69 = normal_1;
    let _e73 = evalDirectionalShadowFactorX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(_e69, input_2.worldPos, input_2.viewZ, 0u);
    if (nDotL_5 > 0.08f) {
        let retainedLight = mix(0.48f, 1f, _e73);
        let _e81 = material.shadowColor;
        let _e83 = color_1;
        color_1 = mix(_e81.xyz, _e83, retainedLight);
    }
    let _e87 = material.sideShade;
    planeShade = _e87;
    if (upFacing > 0.72f) {
        planeShade = 1f;
    }
    if (upFacing < -0.72f) {
        let _e96 = material.sideShade;
        planeShade = (_e96 * 0.86f);
    }
    let _e99 = color_1;
    let _e100 = planeShade;
    color_1 = (_e99 * _e100);
    let _e102 = color_1;
    let _e103 = normal_1;
    let _e106 = material.surfaceRoughness;
    let _e109 = material.surfaceMetallic;
    let _e112 = material.specularStrength;
    let _e113 = paintedSpecularX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(_e51, _e103, toLight_2, toCamera_1, _e106, _e109, _e112, _e73);
    color_1 = (_e102 + _e113);
    let _e115 = normal_1;
    let _e118 = material.surfaceRoughness;
    let _e121 = material.rimStrength;
    let _e122 = paintedRimX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(_e115, toCamera_1, _e118, _e121, _e73);
    let _e123 = color_1;
    let _e126 = material.rimColor;
    color_1 = (_e123 + (_e126.xyz * _e122));
    let _e130 = color_1;
    let _e133 = material.rimColor;
    let _e137 = material.emissionStrength;
    color_1 = (_e130 + (_e133.xyz * _e137));
    let _e140 = color_1;
    let _e144 = material.baseColor.w;
    return vec4<f32>(_e140, _e144);
}
