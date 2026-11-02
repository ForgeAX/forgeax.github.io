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

struct CinderMeshOutX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPXMZTYHI5GG2LOMRSXEX3TOVZGMYLDMUX {
    @builtin(position) position: vec4<f32>,
    @location(0) color: vec4<f32>,
    @location(1) normal: vec3<f32>,
    @location(2) emissive_intensity: vec4<f32>,
    @location(3) surface: vec4<f32>,
    @location(4) local: vec3<f32>,
    @location(5) uv: vec2<f32>,
    @location(6) disp: f32,
    @location(7) tint: vec4<f32>,
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
    cinderPrint: vec4<f32>,
    cinderSurface: vec4<f32>,
    vineGrowthShape: vec4<f32>,
}

struct Input {
    @location(0) pos: vec3<f32>,
    @location(1) normal: vec3<f32>,
}

struct Surface {
    @builtin(position) clip: vec4<f32>,
    @location(0) world: vec3<f32>,
    @location(1) local: vec3<f32>,
    @location(2) normal: vec3<f32>,
    @location(3) viewZ: f32,
    @location(4) @interpolate(flat) variation: f32,
}

struct VineInput {
    @location(0) pos: vec3<f32>,
    @location(1) normal: vec3<f32>,
    @location(2) path: vec2<f32>,
}

const SHADOW_VOGEL_OFFSETSX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX: array<vec2<f32>, 5> = array<vec2<f32>, 5>(vec2<f32>(0.31622776f, 0f), vec2<f32>(-0.40387356f, 0.36998126f), vec2<f32>(0.061819322f, -0.7043993f), vec2<f32>(0.50905645f, 0.66397405f), vec2<f32>(-0.9341812f, -0.1652435f));

@group(0) @binding(0) 
var<uniform> viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(0) @binding(7) 
var<uniform> shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ShadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
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
    let dimensions = vec2<f32>(_e1);
    let pixel_5 = clamp(floor((uv_1 * dimensions)), vec2(0f), ((dimensions * extent_1) - vec2(1f)));
    let _e21 = textureSampleCompareLevel(shadowMap_1, shadowSampler_1, ((pixel_5 + vec2(0.5f)) / dimensions), layer_1, depthRef_1);
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
    return 1f;
}

fn d_ggxX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(nDotH: f32, a: f32) -> f32 {
    let a2_ = (a * a);
    let f = ((((nDotH * a2_) - nDotH) * nDotH) + 1f);
    return (a2_ / ((3.1415927f * f) * f));
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

fn _directionalReceiverDepthBiasX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_6: u32, normal: vec3<f32>, l: vec3<f32>, radius: f32) -> f32 {
    var local: bool;

    let _e4 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[0].w;
    if (_e4 > 0.5f) {
        let _e9 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
        return _e9;
    }
    let nDotL_3 = dot(normal, l);
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
    var local_1: bool;
    var local_2: bool;

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
    let dzdx = ((-((dot(row0_, normal_1) / sx)) * sz) / (nz * sx));
    let dzdy = ((-((dot(row1_, normal_1) / sy)) * sz) / (nz * sy));
    return vec2<f32>(((dzdx * 2f) / texels.x), ((-(dzdy) * 2f) / texels.y));
}

fn _sampleShadowForCascadeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(worldPos: vec3<f32>, layer_8: u32, normal_2: vec3<f32>, l_2: vec3<f32>, layerBase: u32, pixel_2: vec2<f32>) -> f32 {
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
    let _e139 = _directionalReceiverDepthBiasX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_8, normal_2, l_2, footprintRadius);
    let adjustedDepth = (currentDepth + _e139);
    let _e141 = _directionalReceiverPlaneGradientX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_8, normal_2, l_2);
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
        let lit_2 = textureSampleCompareLevel(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, clamp(uv_5, tileLo, tileHi), shadowLayer, adjustedDepth);
        return lit_2;
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
                        let lit_3 = textureSampleCompareLevel(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, offsetUv, shadowLayer, tapDepth);
                        let _e214 = blocked;
                        blocked = (_e214 + (1f - lit_3));
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
                    let lit_4 = textureSampleCompareLevel(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, offsetUv_1, shadowLayer, tapDepth_1);
                    let _e253 = blocked;
                    blocked = (_e253 + (1f - lit_4));
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

fn evalDirectionalShadowFactorAtPixelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(normal_3: vec3<f32>, worldPos_1: vec3<f32>, viewZ: f32, layerBase_1: u32, pixel_3: vec2<f32>) -> f32 {
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
    let receiverPosition = (worldPos_1 + (normal_3 * _e33));
    let _e38 = _sampleShadowForCascadeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(receiverPosition, _e28, normal_3, l_3, layerBase_1, pixel_3);
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

fn paintedSpecularX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(base: vec3<f32>, normal_6: vec3<f32>, light: vec3<f32>, camera: vec3<f32>, roughness_3: f32, metallic_1: f32, strength: f32, visibility_1: f32) -> vec3<f32> {
    let halfVector = normalize((light + camera));
    let smoothness = (1f - clamp(roughness_3, 0.04f, 1f));
    let lobe = pow(max(dot(normal_6, halfVector), 0f), mix(12f, 112f, smoothness));
    let reflection = (((((strength * smoothness) * smoothness) * lobe) * max(dot(normal_6, light), 0f)) * visibility_1);
    return (mix(vec3<f32>(0.88f, 0.86f, 0.81f), base, metallic_1) * reflection);
}

fn cinder_printX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPXMZTYHI5GG2LOMRSXEX3TOVZGMYLDMUX(value: vec4<f32>, pixel_4: vec2<f32>, tint: vec4<f32>, print: vec4<f32>) -> vec4<f32> {
    var color: vec3<f32>;

    if (value.w <= 0.00001f) {
        discard;
    }
    let straight = max((value.xyz / vec3(value.w)), vec3(0f));
    let brightness = max(max(straight.x, straight.y), straight.z);
    let shade = mix(clamp(brightness, 0.2f, 1.6f), ((floor((clamp(brightness, 0f, 1.5f) * 3f)) / 3f) + 0.22f), print.z);
    color = mix(straight, (tint.xyz * shade), tint.w);
    let grid = (pixel_4 / vec2(max(4f, print.w)));
    let cell = (fract(vec2<f32>((grid.x + (grid.y * 0.22f)), grid.y)) - vec2(0.5f));
    let radius_1 = mix(0.12f, 0.32f, (1f - clamp(brightness, 0f, 1f)));
    let dots = (1f - smoothstep((radius_1 - 0.035f), (radius_1 + 0.035f), length(cell)));
    let line1_ = (1f - smoothstep(0.06f, 0.15f, abs((fract((grid.x + grid.y)) - 0.5f))));
    let line2_ = (1f - smoothstep(0.06f, 0.15f, abs((fract((grid.x - grid.y)) - 0.5f))));
    let hatch = max(line1_, (line2_ * (1f - smoothstep(0.3f, 0.8f, brightness))));
    let _e102 = color;
    color = mix(_e102, vec3<f32>(0.006f, 0.004f, 0.015f), (max((dots * print.x), (hatch * print.y)) * 0.9f));
    let _e115 = color;
    return vec4<f32>((_e115 * value.w), value.w);
}

fn cinder_hashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPXMZTYHI5GG2LOMRSXEX3TOVZGMYLDMUX(p: vec2<f32>) -> f32 {
    return fract((sin(dot(p, vec2<f32>(127.1f, 311.7f))) * 43758.547f));
}

fn cinder_rock_shadeX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPXMZTYHI5GG2LOMRSXEX3TOVZGMYLDMUX(input: CinderMeshOutX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPXMZTYHI5GG2LOMRSXEX3TOVZGMYLDMUX) -> vec4<f32> {
    var rock: vec3<f32>;

    let normal_7 = normalize(input.normal);
    let viewDirection = vec3<f32>(0f, 0f, 1f);
    let seed = input.color.x;
    let heat = input.color.y;
    let charge = input.color.z;
    let visibility_2 = input.color.w;
    let p_2 = (input.local * (3.4f + (seed * 0.7f)));
    let field = ((sin(((p_2.x * 2.3f) + sin((p_2.z * 1.7f)))) + sin(((p_2.y * 2.7f) + (p_2.x * 0.8f)))) + sin((((p_2.z * 3.1f) - (p_2.y * 1.2f)) + (seed * 9f))));
    let distance_ = (abs(field) / 3f);
    let width = (0.055f * (1f + (charge * 0.8f)));
    let fissure = (1f - smoothstep((width * 0.35f), width, distance_));
    let lip = (1f - smoothstep(width, (width * 2.5f), distance_));
    let core = (1f - smoothstep(0f, (width * 0.42f), distance_));
    let lightDirection = vec3<f32>(0.36034632f, 0.7412839f, 0.5662585f);
    let diffuse_1 = (0.18f + (0.82f * max(dot(normal_7, lightDirection), 0f)));
    let _e93 = cinder_hashX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPXMZTYHI5GG2LOMRSXEX3TOVZGMYLDMUX((floor((normal_7.xy * 19f)) + vec2(seed)));
    let facet = (0.72f + (0.28f * _e93));
    rock = mix(vec3<f32>(0.21f, 0.16f, 0.12f), vec3<f32>(0.035f, 0.022f, 0.016f), (lip * 0.88f));
    let _e110 = rock;
    rock = (_e110 * (diffuse_1 * facet));
    let flow = (0.68f + (0.32f * sin((((seed * 31f) + (charge * 9f)) + (p_2.y * 3f)))));
    let magma = (((mix(vec3<f32>(1f, 0.12f, 0.005f), vec3<f32>(4.2f, 2.4f, 0.62f), core) * fissure) * heat) * flow);
    let rim = ((pow((1f - abs(dot(normal_7, viewDirection))), 2.2f) * charge) * charge);
    let _e147 = rock;
    let rgb = (((_e147 * (1f - (fissure * 0.9f))) + magma) + (vec3<f32>(1f, 0.12f, 0.01f) * rim));
    return vec4<f32>((rgb * visibility_2), visibility_2);
}

fn seedVineCentre(u: f32) -> vec3<f32> {
    let _e4 = material.vineGrowthShape.z;
    let angle_1 = ((u * _e4) * 6.2831855f);
    let _e11 = material.vineGrowthShape.y;
    let radius_2 = (_e11 * (1f - (((0.45f * u) * u) * u)));
    let _e24 = material.vineGrowthShape.x;
    return vec3<f32>((cos(angle_1) * radius_2), (_e24 * u), (sin(angle_1) * radius_2));
}

fn seedVinePosition(v_3: VineInput, instance: mat4x4<f32>) -> vec4<f32> {
    var pos: vec3<f32>;

    if (v_3.path.y < 0.5f) {
        let _e9 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].worldFromLocal;
        return ((_e9 * instance) * vec4<f32>(v_3.pos, 1f));
    }
    let growth = clamp(length(instance[1].xyz), 0.001f, 1f);
    let u_1 = v_3.path.x;
    pos = v_3.pos;
    if (u_1 >= growth) {
        let _e26 = seedVineCentre(growth);
        pos = _e26;
    } else {
        let _e31 = material.vineGrowthShape.w;
        if ((growth - u_1) < _e31) {
            let _e36 = material.vineGrowthShape.w;
            let tip = smoothstep(0f, _e36, (growth - u_1));
            let _e40 = seedVineCentre(u_1);
            pos = (_e40 + ((v_3.pos - _e40) * tip));
        }
    }
    let _e47 = pos.y;
    pos.y = (max(0f, _e47) / growth);
    let _e54 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].worldFromLocal;
    let _e56 = pos;
    return ((_e54 * instance) * vec4<f32>(_e56, 1f));
}

fn face(s_7: Surface) -> vec3<f32> {
    let _e2 = dpdy(s_7.world);
    let _e4 = dpdx(s_7.world);
    let n_2 = normalize(cross(_e2, _e4));
    let _e10 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    return select(-(n_2), n_2, (dot(n_2, (_e10 - s_7.world)) > 0f));
}

fn lit_1(s_8: Surface, base_1: vec3<f32>, n: vec3<f32>) -> vec3<f32> {
    let _e5 = evalDirectionalShadowFactorX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(n, s_8.world, s_8.viewZ, 0u);
    let _e8 = material.shadowColor;
    let _e12 = material.sideShade;
    let _e15 = illustratedDiffuseX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU2LMNR2XG5DSMF2GKZC7NRUWO2DUNFXGOX(base_1, _e8.xyz, n, _e5, _e12, false);
    let _e18 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let _e23 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    let _e29 = material.surfaceRoughness;
    let _e32 = material.surfaceMetallic;
    let _e35 = material.specularStrength;
    let _e36 = paintedSpecularX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJOQ5DU4DBNFXHIZLSNR4V643VOJTGCY3FX(base_1, n, normalize(-(_e18)), normalize((_e23 - s_8.world)), _e29, _e32, _e35, _e5);
    return (_e15 + _e36);
}

fn fresnel(s_9: Surface, n_1: vec3<f32>) -> f32 {
    let _e4 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    return pow((1f - abs(dot(n_1, normalize((_e4 - s_9.world))))), 3f);
}

fn cracks(p_1: vec3<f32>) -> f32 {
    let vein = abs((sin((((p_1.x * 11f) + (p_1.y * 7f)) + sin((p_1.z * 9f)))) * sin(((p_1.z * 8f) - (p_1.y * 13f)))));
    return (1f - smoothstep(0.015f, 0.045f, vein));
}

@vertex 
fn vs_main(v: Input, @builtin(instance_index) idx: u32) -> Surface {
    var o: Surface;

    let _e3 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].worldFromLocal;
    let _e8 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx].localFromInstance;
    let m = (_e3 * _e8);
    let p_3 = (m * vec4<f32>(v.pos, 1f));
    let _e19 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    o.clip = (_e19 * p_3);
    o.world = p_3.xyz;
    o.local = v.pos;
    o.normal = normalize((m * vec4<f32>(v.normal, 0f)).xyz);
    let _e35 = o.clip.w;
    o.viewZ = -(_e35);
    o.variation = fract((f32(idx) * 0.618034f));
    let _e42 = o;
    return _e42;
}

@vertex 
fn vs_seed_vine(v_1: VineInput, @builtin(instance_index) idx_1: u32) -> Surface {
    var o_1: Surface;

    let _e3 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].worldFromLocal;
    let _e8 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx_1].localFromInstance;
    let m_1 = (_e3 * _e8);
    let _e13 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx_1].localFromInstance;
    let _e15 = seedVinePosition(v_1, _e13);
    let _e20 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    o_1.clip = (_e20 * _e15);
    o_1.world = _e15.xyz;
    o_1.local = v_1.pos;
    o_1.normal = normalize((m_1 * vec4<f32>(v_1.normal, 0f)).xyz);
    let _e36 = o_1.clip.w;
    o_1.viewZ = -(_e36);
    o_1.variation = fract((f32(idx_1) * 0.618034f));
    let _e43 = o_1;
    return _e43;
}

@vertex 
fn vs_seed_vine_shadow(v_2: VineInput, @builtin(instance_index) idx_2: u32) -> @builtin(position) vec4<f32> {
    let _e4 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx_2].localFromInstance;
    let _e6 = seedVinePosition(v_2, _e4);
    let _e9 = shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.isSpot;
    if (_e9 == 1u) {
        let _e14 = shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.spotLightViewProj;
        return (_e14 * _e6);
    }
    let _e18 = shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.index;
    switch _e18 {
        case 0u: {
            let _e21 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightViewProj_A;
            return (_e21 * _e6);
        }
        case 1u: {
            let _e25 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightViewProj_B;
            return (_e25 * _e6);
        }
        case 2u: {
            let _e29 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightViewProj_C;
            return (_e29 * _e6);
        }
        default: {
            let _e33 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightViewProj_D;
            return (_e33 * _e6);
        }
    }
}

@fragment 
fn fs_seed_vine_shadow() {
    return;
}

@fragment 
fn fs_fire(s: Surface) -> @location(0) vec4<f32> {
    let _e1 = face(s);
    let fold = sin((((s.local.x * 8f) + (s.local.z * 4f)) + sin((s.local.y * 7f))));
    let hot = smoothstep(-0.1f, 0.7f, fold);
    let _e23 = material.shadowColor;
    let _e27 = material.baseColor;
    let color_1 = mix(_e23.xyz, _e27.xyz, (0.3f + (hot * 0.7f)));
    let _e34 = lit_1(s, color_1, _e1);
    let _e37 = material.baseColor;
    let _e41 = material.rimColor;
    let _e52 = material.rimColor;
    let _e54 = fresnel(s, _e1);
    return vec4<f32>(((_e34 + (mix(_e37.xyz, _e41.xyz, hot) * (0.35f + (hot * 0.7f)))) + ((_e52.xyz * _e54) * 0.5f)), 1f);
}

@fragment 
fn fs_meteor(s_1: Surface) -> @location(0) vec4<f32> {
    var source: CinderMeshOutX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPXMZTYHI5GG2LOMRSXEX3TOVZGMYLDMUX;

    let _e1 = face(s_1);
    source.normal = _e1;
    source.local = s_1.local;
    let _e10 = material.cinderSurface.z;
    let _e14 = material.cinderSurface.w;
    source.color = vec4<f32>(0f, _e10, _e14, 1f);
    let _e18 = source;
    let _e19 = cinder_rock_shadeX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPXMZTYHI5GG2LOMRSXEX3TOVZGMYLDMUX(_e18);
    let _e24 = material.cinderSurface.x;
    let _e32 = material.baseColor;
    let _e35 = material.cinderPrint;
    let _e36 = cinder_printX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPXMZTYHI5GG2LOMRSXEX3TOVZGMYLDMUX(vec4<f32>((_e19.xyz * _e24), 1f), s_1.clip.xy, _e32, _e35);
    let _e41 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    let edge_1 = abs(dot(normalize(s_1.normal), normalize((_e41 - s_1.world))));
    let _e47 = fwidth(edge_1);
    let _e53 = material.cinderSurface.y;
    let _e64 = material.cinderSurface.y;
    let inside = select(1f, smoothstep(0.02f, (0.02f + (max(_e47, 0.005f) * max(_e53, 0.001f))), edge_1), (_e64 > 0f));
    let _e74 = lit_1(s_1, _e36.xyz, _e1);
    return vec4<f32>(mix(vec3<f32>(0.004f, 0.003f, 0.012f), _e74, inside), 1f);
}

@fragment 
fn fs_ice(s_2: Surface) -> @location(0) vec4<f32> {
    let _e1 = face(s_2);
    let _e2 = fresnel(s_2, _e1);
    let tip_1 = smoothstep(0.1f, 0.82f, s_2.local.z);
    let faceTone = clamp(((dot(_e1, vec3<f32>(-0.4866643f, 0.81110716f, 0.32444286f)) * 0.5f) + 0.5f), 0f, 1f);
    let _e23 = cracks((s_2.local * 1.7f));
    let seam = (_e23 * 0.08f);
    let _e28 = material.shadowColor;
    let _e32 = material.baseColor;
    let base_3 = mix(_e28.xyz, _e32.xyz, (0.25f + (faceTone * 0.7f)));
    let milk = ((tip_1 * 0.32f) + (s_2.variation * 0.16f));
    let _e47 = material.rimColor;
    let _e50 = lit_1(s_2, mix(base_3, _e47.xyz, milk), _e1);
    let _e53 = material.rimColor;
    let _e66 = material.baseColor.w;
    return vec4<f32>((_e50 + (_e53.xyz * (((_e2 * 0.32f) + seam) + (tip_1 * 0.12f)))), clamp(((_e66 + (_e2 * 0.18f)) + (tip_1 * 0.15f)), 0f, 0.92f));
}

@fragment 
fn fs_bark(s_3: Surface) -> @location(0) vec4<f32> {
    let _e1 = face(s_3);
    let grain = sin(((atan2(s_3.local.x, ((s_3.local.z * 0.12f) + 0.12f)) * 21f) + (sin((s_3.local.y * 5f)) * 0.7f)));
    let ridge = smoothstep(-0.35f, 0.4f, grain);
    let _e27 = material.shadowColor;
    let _e31 = material.baseColor;
    let bark = mix(_e27.xyz, _e31.xyz, ((0.35f + (ridge * 0.55f)) + (s_3.variation * 0.1f)));
    let _e70 = material.cinderSurface.w;
    let moss = (((smoothstep(0.55f, 0.95f, sin((((s_3.local.y * 3f) + (s_3.local.x * 7f)) + (s_3.local.z * 4f)))) * smoothstep(-0.1f, 0.7f, _e1.y)) * 0.65f) * _e70);
    let _e74 = material.rimColor;
    let _e77 = lit_1(s_3, mix(bark, _e74.xyz, moss), _e1);
    return vec4<f32>(_e77, 1f);
}

@fragment 
fn fs_leaf(s_4: Surface) -> @location(0) vec4<f32> {
    let _e1 = face(s_4);
    let vein_1 = (1f - smoothstep(0.008f, 0.025f, abs(s_4.local.x)));
    let _e12 = material.baseColor;
    let _e16 = material.rimColor;
    let leaf = mix(_e12.xyz, _e16.xyz, (((vein_1 * 0.25f) + (s_4.variation * 0.3f)) + (max(0f, _e1.y) * 0.15f)));
    let _e31 = lit_1(s_4, leaf, _e1);
    return vec4<f32>(_e31, 1f);
}

@fragment 
fn fs_stratum(s_5: Surface) -> @location(0) vec4<f32> {
    let _e1 = face(s_5);
    let strata = sin(((s_5.local.y * 40f) + (sin(((s_5.local.x * 5f) + (s_5.local.z * 3f))) * 0.45f)));
    let layer_9 = mix(select(0.68f, 0.92f, (strata > -0.35f)), 1f, max(0f, _e1.y));
    let fault = min(abs(((((s_5.local.x * 0.8f) + (s_5.local.z * 0.3f)) - 0.17f) + (floor((s_5.local.z * 4f)) * 0.025f))), abs((((s_5.local.z * 0.9f) - (s_5.local.x * 0.35f)) + 0.22f)));
    let fracture = (1f - smoothstep(0.002f, 0.012f, fault));
    let _e70 = material.baseColor;
    let _e74 = material.rimColor;
    let pigment = mix(_e70.xyz, _e74.xyz, ((s_5.variation * 0.4f) + (max(0f, _e1.y) * 0.22f)));
    let _e92 = lit_1(s_5, ((pigment * layer_9) * (1f - (fracture * 0.24f))), _e1);
    return vec4<f32>(_e92, 1f);
}

@fragment 
fn fs_blade(s_6: Surface) -> @location(0) vec4<f32> {
    let _e1 = face(s_6);
    let _e4 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    let v_4 = normalize((_e4 - s_6.world));
    let _e10 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let highlight = pow(max(0f, dot(reflect(-(normalize(-(_e10))), _e1), v_4)), 64f);
    let bevel = (1f - smoothstep(0.001f, 0.008f, abs(s_6.local.y)));
    let _e30 = material.baseColor;
    let _e38 = lit_1(s_6, (_e30.xyz * (0.7f + (s_6.variation * 0.3f))), _e1);
    let _e41 = material.rimColor;
    return vec4<f32>(((_e38 + ((_e41.xyz * bevel) * 1.35f)) + ((vec3<f32>(1f, 0.94f, 0.72f) * highlight) * 1.2f)), 1f);
}
