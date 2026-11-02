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
}

struct VsIn {
    @location(0) pos: vec3<f32>,
    @location(1) normal: vec3<f32>,
}

struct VsOut {
    @builtin(position) clip: vec4<f32>,
    @location(0) worldPos: vec3<f32>,
    @location(1) worldNormal: vec3<f32>,
    @location(2) viewZ: f32,
    @location(3) paintPos: vec3<f32>,
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
@group(0) @binding(24) 
var shadowMomentsX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: texture_2d_array<f32>;
@group(0) @binding(9) 
var spotModifierSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: sampler;
@group(1) @binding(0) 
var<uniform> material: Material;

fn pigmentHashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(point: vec2<f32>) -> f32 {
    var p: vec3<f32>;

    p = fract((vec3<f32>(point.x, point.y, point.x) * 0.1031f));
    let _e9 = p;
    let _e10 = p;
    let _e11 = p;
    p = (_e9 + vec3(dot(_e10, (_e11.yzx + vec3(33.33f)))));
    let _e20 = p.x;
    let _e22 = p.y;
    let _e25 = p.z;
    return fract(((_e20 + _e22) * _e25));
}

fn pigmentNoiseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(point_1: vec2<f32>) -> f32 {
    let cell = floor(point_1);
    let f = fract(point_1);
    let u = ((f * f) * (vec2(3f) - (2f * f)));
    let _e10 = pigmentHashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(cell);
    let _e15 = pigmentHashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX((cell + vec2<f32>(1f, 0f)));
    let _e22 = pigmentHashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX((cell + vec2<f32>(0f, 1f)));
    let _e27 = pigmentHashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX((cell + vec2<f32>(1f, 1f)));
    return mix(mix(_e10, _e15, u.x), mix(_e22, _e27, u.x), u.y);
}

fn pigmentPlaneX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(position: vec3<f32>, normal_3: vec3<f32>) -> vec2<f32> {
    let axis = abs(normal_3);
    if (axis.y >= max(axis.x, axis.z)) {
        return position.xz;
    }
    if (axis.x > axis.z) {
        return position.zy;
    }
    return position.xy;
}

fn applyPigmentX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(base: vec3<f32>, position_1: vec3<f32>, normal_4: vec3<f32>, scale: f32, strength: f32) -> vec3<f32> {
    let _e2 = pigmentPlaneX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(position_1, normal_4);
    let plane = (_e2 * scale);
    let point_2 = vec2<f32>(((plane.x * 0.8f) + (plane.y * 0.6f)), ((plane.y * 0.8f) - (plane.x * 0.6f)));
    let _e26 = pigmentNoiseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(((point_2 * 0.11f) + vec2<f32>(5.2f, 11.7f)));
    let _e33 = pigmentNoiseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(((point_2 * 0.11f) + vec2<f32>(19.3f, -4.6f)));
    let drift = (vec2<f32>(_e26, _e33) - vec2(0.5f));
    let field = ((point_2 * 0.18f) + (drift * 0.65f));
    let _e47 = pigmentNoiseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX((field + vec2<f32>(3.2f, 8.1f)));
    let wash = (_e47 - 0.5f);
    let _e56 = pigmentNoiseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(((field * 0.47f) + vec2<f32>(-7.4f, 2.9f)));
    let bloom = (_e56 - 0.5f);
    let pigment = (((wash * 0.72f) + (bloom * 0.28f)) * strength);
    return max(vec3(0f), ((base * (1f + pigment)) + (vec3<f32>(0.08f, 0.02f, -0.055f) * pigment)));
}

fn paintedSpecularX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(base_1: vec3<f32>, normal_5: vec3<f32>, light: vec3<f32>, camera: vec3<f32>, roughness: f32, metallic: f32, strength_1: f32, visibility: f32) -> vec3<f32> {
    let halfVector = normalize((light + camera));
    let smoothness = (1f - clamp(roughness, 0.04f, 1f));
    let lobe = pow(max(dot(normal_5, halfVector), 0f), mix(12f, 112f, smoothness));
    let reflection = (((((strength_1 * smoothness) * smoothness) * lobe) * max(dot(normal_5, light), 0f)) * visibility);
    return (mix(vec3<f32>(0.88f, 0.86f, 0.81f), base_1, metallic) * reflection);
}

fn paintedRimX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(normal_6: vec3<f32>, camera_1: vec3<f32>, roughness_1: f32, strength_2: f32, visibility_1: f32) -> f32 {
    let fresnel = pow((1f - clamp(dot(normal_6, camera_1), 0f, 1f)), 4f);
    return (((fresnel * strength_2) * mix(1f, 0.18f, roughness_1)) * mix(0.35f, 1f, visibility_1));
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
            let point_3 = SHADOW_VOGEL_OFFSETSX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX[_e28];
            let offset = vec2<f32>(((point_3.x * _e22.x) - (point_3.y * _e22.y)), ((point_3.x * _e22.y) + (point_3.y * _e22.x)));
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
    let pixel_4 = clamp(floor((uv_1 * dimensions)), vec2(0f), ((dimensions * extent_1) - vec2(1f)));
    let _e21 = textureSampleCompareLevel(shadowMap_1, shadowSampler_1, ((pixel_4 + vec2(0.5f)) / dimensions), layer_1, depthRef_1);
    return _e21;
}

fn sample_shadow_2d_softX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMap_2: texture_depth_2d_array, shadowSampler_2: sampler_comparison, uv_2: vec2<f32>, layer_2: i32, texel_1: vec2<f32>, depthRef_2: f32, extent_2: vec2<f32>) -> f32 {
    var sum: f32 = 0f;
    var y: u32 = 0u;
    var x: u32;

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
                    let _e57 = textureSampleCompareLevel(shadowMap_2, shadowSampler_2, clamp((base_2 + ((vec2<f32>(f32(_e36), f32(_e38)) - vec2(1f)) * texel_1)), (texel_1 * 0.5f), (extent_2 - (texel_1 * 0.5f))), layer_2, depthRef_2);
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
    let fresnel_1 = exp2((((-5.55473f * vDotH) - 6.98316f) * vDotH));
    let _e8 = specularF90X_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(f0_1);
    return (f0_1 + ((vec3(_e8) - f0_1) * fresnel_1));
}

fn approximateDirectDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_2: f32, nDotV_1: f32) -> vec2<f32> {
    let uv_4 = clamp(vec2<f32>(roughness_2, nDotV_1), vec2(0f), vec2(1f));
    let r = ((uv_4.x * vec4<f32>(-1f, -0.0275f, -0.572f, 0.022f)) + vec4<f32>(1f, 0.0425f, 1.04f, -0.04f));
    let a004_ = ((min((r.x * r.x), exp2((-9.28f * uv_4.y))) * r.x) + r.y);
    let energy = (1f - (0.55f * uv_4.x));
    let bias = clamp(((1.04f * a004_) + r.w), 0f, energy);
    return vec2<f32>((energy - bias), bias);
}

fn sampleDirectDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_3: f32, nDotV_2: f32, useLut: bool) -> vec2<f32> {
    let _e2 = approximateDirectDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_3, nDotV_2);
    return _e2;
}

fn directMultiScatterX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_4: f32, nDotV_3: f32, nDotL_1: f32, F0_: vec3<f32>, useLut_1: bool) -> vec3<f32> {
    var emsV: f32;
    var emsL: f32;

    let _e3 = sampleDirectDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_4, nDotV_3, useLut_1);
    let _e5 = sampleDirectDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_4, nDotL_1, useLut_1);
    let _e7 = specularF90X_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(F0_);
    let fssEssV = ((F0_ * _e3.x) + vec3((_e3.y * _e7)));
    let fssEssL = ((F0_ * _e5.x) + vec3((_e5.y * _e7)));
    emsV = (0.55f * clamp(roughness_4, 0f, 1f));
    let _e26 = emsV;
    emsL = _e26;
    let favg = (F0_ + ((vec3(_e7) - F0_) * 0.047619f));
    let _e33 = emsV;
    let _e34 = emsL;
    let energyLoss = (_e33 * _e34);
    let fms = (((fssEssV * fssEssL) * favg) / ((vec3(1f) - ((energyLoss * favg) * favg)) + vec3(0.000001f)));
    return (fms * energyLoss);
}

fn standardOpaqueBrdfX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(baseColor: vec3<f32>, metallic_1: f32, alpha: f32, f0_2: vec3<f32>, nDotV_4: f32, nDotL_2: f32, nDotH_1: f32, vDotH_1: f32, useLut_2: bool) -> vec3<f32> {
    let _e2 = d_ggxX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(nDotH_1, alpha);
    let _e5 = v_smithX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(nDotV_4, nDotL_2, alpha);
    let _e9 = f_schlickX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(vDotH_1, f0_2);
    let _e15 = directMultiScatterX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(sqrt(max(alpha, 0f)), nDotV_4, nDotL_2, f0_2, useLut_2);
    let specular = (((_e2 * _e5) * _e9) + _e15);
    return ((((1f - metallic_1) * baseColor) / vec3(3.1415927f)) + specular);
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

fn _directionalReceiverDepthBiasX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_6: u32, normal_7: vec3<f32>, l: vec3<f32>, radius: f32) -> f32 {
    var local: bool;

    let _e4 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[0].w;
    if (_e4 > 0.5f) {
        let _e9 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
        return _e9;
    }
    let nDotL_3 = dot(normal_7, l);
    let depthSpan = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[layer_6].z;
    if (nDotL_3 > 0f) {
        local = (depthSpan > 0f);
    } else {
        local = false;
    }
    let _e26 = local;
    if !(_e26) {
        let _e30 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
        return _e30;
    }
    let _e31 = _cascadeLightViewProjX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_6);
    let right = normalize(vec3<f32>(_e31[0].x, _e31[1].x, _e31[2].x));
    let up = normalize(vec3<f32>(_e31[0].y, _e31[1].y, _e31[2].y));
    let _e53 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[layer_6].y;
    let footprint = ((_e53 * radius) * (abs(dot(normal_7, right)) + abs(dot(normal_7, up))));
    let _e63 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.normalBias;
    let missingCoverage = max(0f, (footprint - _e63));
    if !((missingCoverage > 0f)) {
        let _e72 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
        return _e72;
    }
    let _e75 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
    return min(1.0000001f, (_e75 + ((missingCoverage / nDotL_3) / depthSpan)));
}

fn _directionalReceiverPlaneGradientX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_7: u32, normal_8: vec3<f32>, l_1: vec3<f32>) -> vec2<f32> {
    var local_1: bool;
    var local_2: bool;

    let _e4 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[0].w;
    if (_e4 > 0.5f) {
        return vec2(0f);
    }
    if !((dot(normal_8, l_1) > 0.01f)) {
        return vec2(0f);
    }
    let _e18 = _cascadeLightViewProjX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_7);
    let row0_ = vec3<f32>(_e18[0].x, _e18[1].x, _e18[2].x);
    let row1_ = vec3<f32>(_e18[0].y, _e18[1].y, _e18[2].y);
    let row2_ = vec3<f32>(_e18[0].z, _e18[1].z, _e18[2].z);
    let sx = length(row0_);
    let sy = length(row1_);
    let sz = length(row2_);
    let nz = (dot(row2_, normal_8) / sz);
    if (abs(nz) > 0.01f) {
        local_1 = (sx > 0f);
    } else {
        local_1 = false;
    }
    let _e53 = local_1;
    if _e53 {
        local_2 = (sy > 0f);
    } else {
        local_2 = false;
    }
    let _e59 = local_2;
    if !(_e59) {
        return vec2(0f);
    }
    let _e65 = textureDimensions(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, 0i);
    let texels = vec2<f32>(_e65);
    let dzdx = ((-((dot(row0_, normal_8) / sx)) * sz) / (nz * sx));
    let dzdy = ((-((dot(row1_, normal_8) / sy)) * sz) / (nz * sy));
    return vec2<f32>(((dzdx * 2f) / texels.x), ((-(dzdy) * 2f) / texels.y));
}

fn _sampleShadowForCascadeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(worldPos: vec3<f32>, layer_8: u32, normal_9: vec3<f32>, l_2: vec3<f32>, layerBase: u32, pixel_2: vec2<f32>) -> f32 {
    var local_3: bool;
    var local_4: bool;
    var local_5: bool;
    var local_6: bool;
    var local_7: bool;
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
        local_3 = (tileUv.x <= 1f);
    } else {
        local_3 = false;
    }
    let _e60 = local_3;
    if _e60 {
        local_4 = (tileUv.y >= 0f);
    } else {
        local_4 = false;
    }
    let _e67 = local_4;
    if _e67 {
        local_5 = (tileUv.y <= 1f);
    } else {
        local_5 = false;
    }
    let _e74 = local_5;
    if _e74 {
        local_6 = (currentDepth >= 0f);
    } else {
        local_6 = false;
    }
    let _e80 = local_6;
    if _e80 {
        local_7 = (currentDepth <= 1f);
    } else {
        local_7 = false;
    }
    let _e86 = local_7;
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
    let _e139 = _directionalReceiverDepthBiasX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_8, normal_9, l_2, footprintRadius);
    let adjustedDepth = (currentDepth + _e139);
    let _e141 = _directionalReceiverPlaneGradientX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_8, normal_9, l_2);
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

fn evalDirectionalShadowFactorAtPixelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(normal_10: vec3<f32>, worldPos_1: vec3<f32>, viewZ: f32, layerBase_1: u32, pixel_3: vec2<f32>) -> f32 {
    var shadow: f32;
    var local_8: bool;

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
    let receiverPosition = (worldPos_1 + (normal_10 * _e33));
    let _e38 = _sampleShadowForCascadeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(receiverPosition, _e28, normal_10, l_3, layerBase_1, pixel_3);
    shadow = _e38;
    let _e42 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cascadeBlend;
    if (_e42 > 0f) {
        local_8 = ((_e28 + 1u) < count_1);
    } else {
        local_8 = false;
    }
    let _e51 = local_8;
    if _e51 {
        let spCurr = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[_e28].x;
        let _e59 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cascadeBlend;
        let blendWidth = (spCurr * _e59);
        if (blendWidth > 0f) {
            let dist = (spCurr - viewDepth_1);
            let t = clamp((1f - (dist / blendWidth)), 0f, 1f);
            if (t > 0f) {
                let _e74 = _sampleShadowForCascadeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(receiverPosition, (_e28 + 1u), normal_10, l_3, layerBase_1, pixel_3);
                shadow = mix(_e38, _e74, t);
            }
        }
    }
    let _e76 = shadow;
    let _e81 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[1].w;
    return mix(1f, _e76, (1f - _e81));
}

fn evalDirectionalShadowFactorX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(normal_11: vec3<f32>, worldPos_2: vec3<f32>, viewZ_1: f32, layerBase_2: u32) -> f32 {
    let _e5 = evalDirectionalShadowFactorAtPixelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(normal_11, worldPos_2, viewZ_1, layerBase_2, worldPos_2.xy);
    return _e5;
}

fn illustratedDiffuseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU2LMNR2XG5DSMF2GKZC7NRUWO2DUNFXGOX(surface_1: vec3<f32>, shadowPigment: vec3<f32>, normal_12: vec3<f32>, visibility_2: f32, sideShade: f32, continuous: bool) -> vec3<f32> {
    var diffuse: f32;

    let _e3 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let nDotL_4 = dot(normal_12, normalize(-(_e3)));
    let up_1 = clamp(normal_12.y, 0f, 1f);
    diffuse = ((0.52f * smoothstep(0f, 0.14f, nDotL_4)) + (0.48f * smoothstep(0.6f, 0.78f, nDotL_4)));
    if continuous {
        diffuse = max(0f, nDotL_4);
    }
    let fill = (mix(shadowPigment, surface_1, 0.16f) * vec3<f32>(0.88f, 1.02f, 1.12f));
    let ambient = (fill * mix(0.82f, 1f, up_1));
    let _e41 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightColor;
    let _e43 = diffuse;
    let direct = ((surface_1 * _e41) * ((0.54f * _e43) * visibility_2));
    let plane_1 = mix(sideShade, 1f, (0.65f + (0.35f * up_1)));
    return ((ambient + direct) * plane_1);
}

@vertex 
fn vs_main(input: VsIn, @builtin(instance_index) idx: u32) -> VsOut {
    var output: VsOut;

    let _e3 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].worldFromLocal;
    let _e8 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx].localFromInstance;
    let model = (_e3 * _e8);
    let world = (model * vec4<f32>(input.pos, 1f));
    let _e19 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    output.clip = (_e19 * world);
    output.worldPos = world.xyz;
    output.paintPos = (input.pos * vec3<f32>(length(model[0].xyz), length(model[1].xyz), length(model[2].xyz)));
    output.worldNormal = normalize((model * vec4<f32>(input.normal, 0f)).xyz);
    let _e46 = output.clip.w;
    output.viewZ = -(_e46);
    let _e48 = output;
    return _e48;
}

@fragment 
fn fs_main(input_1: VsOut, @builtin(front_facing) frontFacing: bool) -> @location(0) vec4<f32> {
    var normal: vec3<f32>;
    var color: vec3<f32>;

    let _e2 = dpdy(input_1.worldPos);
    let _e4 = dpdx(input_1.worldPos);
    normal = normalize(cross(_e2, _e4));
    let _e8 = normal;
    let _e10 = normal;
    let _e11 = normal;
    let _e14 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    normal = select(-(_e8), _e10, (dot(_e11, (_e14 - input_1.worldPos)) > 0f));
    let _e23 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let toLight = normalize(-(_e23));
    let _e28 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    let toCamera = normalize((_e28 - input_1.worldPos));
    let _e32 = normal;
    let nDotL_5 = dot(_e32, toLight);
    let _e34 = normal;
    let upFacing = dot(_e34, vec3<f32>(0f, 1f, 0f));
    let _e41 = dpdy(input_1.paintPos);
    let _e43 = dpdx(input_1.paintPos);
    let paintNormal = normalize(cross(_e41, _e43));
    let _e48 = material.baseColor;
    let _e53 = material.pigmentScale;
    let _e56 = material.pigmentStrength;
    let _e57 = applyPigmentX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(_e48.xyz, input_1.paintPos, paintNormal, _e53, _e56);
    let _e58 = normal;
    let _e62 = evalDirectionalShadowFactorX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(_e58, input_1.worldPos, input_1.viewZ, 0u);
    let _e65 = material.shadowColor;
    let _e67 = normal;
    let _e70 = material.sideShade;
    let _e72 = illustratedDiffuseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU2LMNR2XG5DSMF2GKZC7NRUWO2DUNFXGOX(_e57, _e65.xyz, _e67, _e62, _e70, false);
    color = _e72;
    let _e74 = color;
    let _e75 = normal;
    let _e78 = material.surfaceRoughness;
    let _e81 = material.surfaceMetallic;
    let _e84 = material.specularStrength;
    let _e85 = paintedSpecularX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(_e57, _e75, toLight, toCamera, _e78, _e81, _e84, _e62);
    color = (_e74 + _e85);
    let _e87 = normal;
    let _e90 = material.surfaceRoughness;
    let _e93 = material.rimStrength;
    let _e94 = paintedRimX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(_e87, toCamera, _e90, _e93, _e62);
    let _e95 = color;
    let _e98 = material.rimColor;
    color = (_e95 + (_e98.xyz * _e94));
    let _e102 = color;
    let _e105 = material.rimColor;
    let _e109 = material.emissionStrength;
    color = (_e102 + (_e105.xyz * _e109));
    let _e112 = color;
    let _e116 = material.baseColor.w;
    return vec4<f32>(_e112, _e116);
}

@fragment 
fn fs_weathered_cloth(input_2: VsOut) -> @location(0) vec4<f32> {
    var normal_1: vec3<f32>;
    var surface: vec3<f32>;
    var color_1: vec3<f32>;

    let _e2 = dpdy(input_2.worldPos);
    let _e4 = dpdx(input_2.worldPos);
    normal_1 = normalize(cross(_e2, _e4));
    let _e8 = normal_1;
    let _e10 = normal_1;
    let _e11 = normal_1;
    let _e14 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    normal_1 = select(-(_e8), _e10, (dot(_e11, (_e14 - input_2.worldPos)) > 0f));
    let _e22 = dpdy(input_2.paintPos);
    let _e24 = dpdx(input_2.paintPos);
    let paintNormal_1 = normalize(cross(_e22, _e24));
    let _e28 = pigmentPlaneX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(input_2.paintPos, paintNormal_1);
    let _e35 = pigmentNoiseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(((_e28 * 9f) + vec2<f32>(4.1f, 8.3f)));
    let _e48 = pigmentNoiseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX((((_e28 * vec2<f32>(5.2f, 3.8f)) + vec2<f32>(8.3f, 2.7f)) + vec2((_e35 * 0.48f))));
    let _e57 = pigmentNoiseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(((_e28 * vec2<f32>(8f, 5.5f)) + vec2<f32>(1.7f, 11.3f)));
    let _e63 = material.pigmentStrength;
    let faded = (smoothstep(0.26f, 0.73f, _e48) * _e63);
    let dust = (smoothstep(0.54f, 0.79f, _e57) * 0.56f);
    let _e72 = material.baseColor;
    let flax = _e72.xyz;
    let bleached = ((flax * 1.44f) + vec3<f32>(0.03f, 0.03f, 0.024f));
    let _e85 = material.shadowColor;
    let greyDirt = mix((flax * 0.67f), (_e85.xyz * 1.38f), 0.65f);
    surface = mix(mix(flax, bleached, faded), greyDirt, dust);
    let _e96 = material.pigmentScale;
    let yarn = (_e28 * _e96);
    let pixelYarn = fwidth(yarn);
    let visible = (vec2(1f) - smoothstep(vec2(0.18f), vec2(0.65f), pixelYarn));
    let warp = (cos(((yarn.x + (0.09f * sin((yarn.y * 0.39f)))) * 6.2831855f)) * visible.x);
    let weft = (cos(((yarn.y + (0.07f * sin((yarn.x * 0.31f)))) * 6.2831855f)) * visible.y);
    let _e141 = pigmentNoiseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(((_e28 * vec2<f32>(39f, 9f)) + vec2<f32>(3.9f, 1.2f)));
    let _e142 = surface;
    surface = (_e142 * (1f + (((warp * 0.029f) + (weft * 0.019f)) * (0.65f + (_e141 * 0.7f)))));
    let _e156 = normal_1;
    let _e160 = evalDirectionalShadowFactorX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(_e156, input_2.worldPos, input_2.viewZ, 0u);
    let _e163 = material.shadowColor;
    let _e165 = surface;
    let shadedPigment = ((_e163.xyz * _e165) / max(flax, vec3(0.001f)));
    let _e171 = surface;
    let _e172 = normal_1;
    let _e175 = material.sideShade;
    let _e177 = illustratedDiffuseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU2LMNR2XG5DSMF2GKZC7NRUWO2DUNFXGOX(_e171, shadedPigment, _e172, _e160, _e175, false);
    color_1 = _e177;
    let _e179 = color_1;
    let _e180 = surface;
    let _e181 = normal_1;
    let _e184 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let _e189 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    let _e195 = material.surfaceRoughness;
    let _e198 = material.surfaceMetallic;
    let _e201 = material.specularStrength;
    let _e202 = paintedSpecularX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(_e180, _e181, normalize(-(_e184)), normalize((_e189 - input_2.worldPos)), _e195, _e198, _e201, _e160);
    color_1 = (_e179 + _e202);
    let _e204 = color_1;
    let _e208 = material.baseColor.w;
    return vec4<f32>(_e204, _e208);
}

@fragment 
fn fs_readability_candidate(input_3: VsOut, @builtin(front_facing) frontFacing_1: bool) -> @location(0) vec4<f32> {
    var normal_2: vec3<f32>;
    var lightBand: f32 = 0.24f;
    var color_2: vec3<f32>;
    var planeShade: f32;

    let _e3 = dpdy(input_3.worldPos);
    let _e5 = dpdx(input_3.worldPos);
    normal_2 = normalize(cross(_e3, _e5));
    let _e9 = normal_2;
    let _e11 = normal_2;
    let _e12 = normal_2;
    let _e15 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    normal_2 = select(-(_e9), _e11, (dot(_e12, (_e15 - input_3.worldPos)) > 0f));
    let _e24 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let toLight_1 = normalize(-(_e24));
    let _e29 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    let toCamera_1 = normalize((_e29 - input_3.worldPos));
    let _e33 = normal_2;
    let nDotL_6 = dot(_e33, toLight_1);
    let _e35 = normal_2;
    let upFacing_1 = dot(_e35, vec3<f32>(0f, 1f, 0f));
    let _e42 = dpdy(input_3.paintPos);
    let _e44 = dpdx(input_3.paintPos);
    let paintNormal_2 = normalize(cross(_e42, _e44));
    let _e49 = material.baseColor;
    let _e54 = material.pigmentScale;
    let _e57 = material.pigmentStrength;
    let _e58 = applyPigmentX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(_e49.xyz, input_3.paintPos, paintNormal_2, _e54, _e57);
    if (nDotL_6 > -0.22f) {
        lightBand = 0.43f;
    }
    if (nDotL_6 > 0.08f) {
        lightBand = 0.7f;
    }
    if (nDotL_6 > 0.68f) {
        lightBand = 1f;
    }
    let _e71 = material.shadowColor;
    let _e73 = lightBand;
    color_2 = mix(_e71.xyz, _e58, _e73);
    let _e76 = normal_2;
    let _e80 = evalDirectionalShadowFactorX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(_e76, input_3.worldPos, input_3.viewZ, 0u);
    if (nDotL_6 > 0.08f) {
        let retainedLight = mix(0.48f, 1f, _e80);
        let _e88 = material.shadowColor;
        let _e90 = color_2;
        color_2 = mix(_e88.xyz, _e90, retainedLight);
    }
    let _e94 = material.sideShade;
    planeShade = _e94;
    if (upFacing_1 > 0.72f) {
        planeShade = 1f;
    }
    if (upFacing_1 < -0.72f) {
        let _e103 = material.sideShade;
        planeShade = (_e103 * 0.86f);
    }
    let _e106 = color_2;
    let _e107 = planeShade;
    color_2 = (_e106 * _e107);
    let _e109 = color_2;
    let _e110 = normal_2;
    let _e113 = material.surfaceRoughness;
    let _e116 = material.surfaceMetallic;
    let _e119 = material.specularStrength;
    let _e120 = paintedSpecularX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(_e58, _e110, toLight_1, toCamera_1, _e113, _e116, _e119, _e80);
    color_2 = (_e109 + _e120);
    let _e122 = normal_2;
    let _e125 = material.surfaceRoughness;
    let _e128 = material.rimStrength;
    let _e129 = paintedRimX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(_e122, toCamera_1, _e125, _e128, _e80);
    let _e130 = color_2;
    let _e133 = material.rimColor;
    color_2 = (_e130 + (_e133.xyz * _e129));
    let _e137 = color_2;
    let _e140 = material.rimColor;
    let _e144 = material.emissionStrength;
    color_2 = (_e137 + (_e140.xyz * _e144));
    let _e147 = color_2;
    let _e151 = material.baseColor.w;
    return vec4<f32>(_e147, _e151);
}
