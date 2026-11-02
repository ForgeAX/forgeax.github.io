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
    shallowColor: vec4<f32>,
    deepColor: vec4<f32>,
    reflectionColor: vec4<f32>,
    foamColor: vec4<f32>,
    waveTimeSeconds: f32,
    swellMaxMeters: f32,
    wavelengthMeters: f32,
    rippleHeightMeters: f32,
    speedMetersPerSecond: f32,
    shoreWidthMeters: f32,
    depthFadeMeters: f32,
    reflectionStrength: f32,
    foamStrength: f32,
    flowAngleRadians: f32,
    shallowOpacity: f32,
    deepOpacity: f32,
    depthColorMeters: f32,
    surfaceRoughness: f32,
    diffuseStrength: f32,
    scatteringStrength: f32,
    contactDisturbanceStrength: f32,
    contactA: vec4<f32>,
    contactShapeA: vec4<f32>,
    contactB: vec4<f32>,
    contactShapeB: vec4<f32>,
    contactC: vec4<f32>,
    contactShapeC: vec4<f32>,
    contactD: vec4<f32>,
    contactShapeD: vec4<f32>,
    contactE: vec4<f32>,
    contactShapeE: vec4<f32>,
    contactF: vec4<f32>,
    contactShapeF: vec4<f32>,
    contactG: vec4<f32>,
    contactShapeG: vec4<f32>,
    contactH: vec4<f32>,
    contactShapeH: vec4<f32>,
    contactI: vec4<f32>,
    contactShapeI: vec4<f32>,
    contactJ: vec4<f32>,
    contactShapeJ: vec4<f32>,
    contactK: vec4<f32>,
    contactShapeK: vec4<f32>,
    contactL: vec4<f32>,
    contactShapeL: vec4<f32>,
}

struct VsIn {
    @location(0) pos: vec3<f32>,
    @location(1) normal: vec3<f32>,
    @location(6) shore: vec2<f32>,
}

struct VsOut {
    @builtin(position) clip: vec4<f32>,
    @location(0) worldPos: vec3<f32>,
    @location(1) shore: vec2<f32>,
    @location(2) viewZ: f32,
    @location(3) swell: f32,
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
    let pixel_4 = clamp(floor((uv_1 * dimensions)), vec2(0f), ((dimensions * extent_1) - vec2(1f)));
    let _e21 = textureSampleCompareLevel(shadowMap_1, shadowSampler_1, ((pixel_4 + vec2(0.5f)) / dimensions), layer_1, depthRef_1);
    return _e21;
}

fn sample_shadow_2d_softX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMap_2: texture_depth_2d_array, shadowSampler_2: sampler_comparison, uv_2: vec2<f32>, layer_2: i32, texel_1: vec2<f32>, depthRef_2: f32, extent_2: vec2<f32>) -> f32 {
    var sum: f32 = 0f;
    var y: u32 = 0u;
    var x: u32;

    let phase = fract(((uv_2 / texel_1) + vec2(0.5f)));
    let base = (uv_2 - (phase * texel_1));
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
                    let _e57 = textureSampleCompareLevel(shadowMap_2, shadowSampler_2, clamp((base + ((vec2<f32>(f32(_e36), f32(_e38)) - vec2(1f)) * texel_1)), (texel_1 * 0.5f), (extent_2 - (texel_1 * 0.5f))), layer_2, depthRef_2);
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

fn shoreMeters(shore: vec2<f32>) -> f32 {
    return select(8f, max(0f, shore.x), (shore.y > 1.5f));
}

fn waterFlow(worldXZ: vec2<f32>) -> vec4<f32> {
    let _e2 = material.flowAngleRadians;
    let _e6 = material.flowAngleRadians;
    let direction = vec2<f32>(cos(_e2), sin(_e6));
    let across = vec2<f32>(-(direction.y), direction.x);
    let p = vec2<f32>(dot(worldXZ, direction), dot(worldXZ, across));
    let _e19 = material.wavelengthMeters;
    let k = (6.2831855f / _e19);
    let _e24 = material.waveTimeSeconds;
    let _e27 = material.speedMetersPerSecond;
    let travel = (_e24 * _e27);
    let phaseA = ((k * (p.x - travel)) + (0.62f * sin(((p.y * k) * 0.31f))));
    let phaseB = ((k * (((p.x * 0.57f) + (p.y * 0.82f)) - (travel * 0.73f))) * 1.63f);
    return vec4<f32>(phaseA, phaseB, p);
}

fn waterWade(c: vec4<f32>, shape: vec4<f32>, worldXZ_1: vec2<f32>, edgeAA: f32) -> vec3<f32> {
    var local_9: bool;
    var local_10: bool;
    var local_11: bool;
    var slope_1: vec2<f32> = vec2(0f);
    var foam: f32 = 0f;
    var local_12: bool;

    let _e5 = material.waveTimeSeconds;
    let age = (_e5 - c.z);
    if !((shape.w <= 1.5f)) {
        local_9 = (c.w <= 0f);
    } else {
        local_9 = true;
    }
    let _e19 = local_9;
    if !(_e19) {
        local_10 = (age < 0f);
    } else {
        local_10 = true;
    }
    let _e26 = local_10;
    if !(_e26) {
        local_11 = (age >= 0.45f);
    } else {
        local_11 = true;
    }
    let _e33 = local_11;
    if _e33 {
        return vec3(0f);
    }
    let t_1 = material.waveTimeSeconds;
    let r_1 = max(0.12f, shape.x);
    let speed = length(shape.yz);
    let motion = smoothstep(0.25f, 1.6f, speed);
    let wakeLength = clamp((speed * 0.75f), 0f, 2.8f);
    let delta = (worldXZ_1 - c.xy);
    let bound = ((r_1 + wakeLength) + 1.1f);
    if (dot(delta, delta) > (bound * bound)) {
        return vec3(0f);
    }
    let d = max(0.001f, length(delta));
    let radial = (delta / vec2(d));
    let forward = select(vec2<f32>(1f, 0f), (shape.yz / vec2(max(speed, 0.001f))), (speed > 0.05f));
    let along = dot(delta, forward);
    let side = dot(delta, vec2<f32>(-(forward.y), forward.x));
    let angle_1 = atan2(delta.y, delta.x);
    let fade = ((1f - smoothstep(0f, 0.45f, age)) * c.w);
    let outside = max(0f, (d - r_1));
    let collarBand = ((d - (r_1 * 1.04f)) / (0.065f + edgeAA));
    let breakup = (0.62f + ((0.38f * sin(((angle_1 * 7f) + (t_1 * 3.1f)))) * sin((((angle_1 * 3f) - (t_1 * 1.9f)) + 1.3f))));
    let front = (0.78f + ((0.55f * max(0f, dot(radial, forward))) * motion));
    let _e133 = foam;
    foam = (_e133 + (((exp((-(collarBand) * collarBand)) * breakup) * front) * 0.95f));
    let _e142 = foam;
    foam = (_e142 + ((exp((-(outside) * 7f)) * smoothstep((r_1 * 0.92f), (r_1 * 1.08f), d)) * 0.16f));
    let idlePhase = ((outside * 17f) - (t_1 * 5.6f));
    let idleAmp = ((exp((-(outside) * 2.3f)) * smoothstep((r_1 * 0.95f), (r_1 * 1.15f), d)) * (1f - (0.65f * motion)));
    let _e177 = slope_1;
    slope_1 = (_e177 + (((radial * cos(idlePhase)) * idleAmp) * 0.11f));
    let _e184 = foam;
    foam = (_e184 + ((((smoothstep(0.9f, 1f, sin(idlePhase)) * exp((-(outside) * 3.8f))) * smoothstep(r_1, (r_1 * 1.2f), d)) * 0.22f) * (1f - (0.5f * motion))));
    let bowRadius = (((r_1 * 1.06f) + 0.1f) + (0.1f * motion));
    let bowBand = ((d - bowRadius) / (0.075f + edgeAA));
    let bowMask = (smoothstep(-0.15f, 0.7f, dot(radial, forward)) * motion);
    let bow = (exp((-(bowBand) * bowBand)) * bowMask);
    let _e226 = foam;
    foam = (_e226 + (bow * (0.6f + (0.3f * sin(((angle_1 * 11f) - (t_1 * 4f)))))));
    let _e239 = slope_1;
    slope_1 = (_e239 + ((radial * bow) * 0.18f));
    let behind = -(along);
    if (motion > 0f) {
        local_12 = (behind > -(r_1));
    } else {
        local_12 = false;
    }
    let _e252 = local_12;
    if _e252 {
        let spread = ((behind * 0.354f) + (r_1 * 0.82f));
        let armWidth = ((0.07f + (max(0f, behind) * 0.05f)) + edgeAA);
        let armOffset = ((abs(side) - spread) / armWidth);
        let lengthMask = (smoothstep((-(r_1) * 0.5f), (r_1 * 0.3f), behind) * (1f - smoothstep((wakeLength * 0.45f), (wakeLength + 0.2f), behind)));
        let armDecay = (1f / (1f + (max(0f, behind) * 1.1f)));
        let arm = (((exp((-(armOffset) * armOffset)) * lengthMask) * armDecay) * motion);
        let armBreakup = (0.55f + (0.45f * sin((((behind * 9f) + (abs(side) * 5f)) - (t_1 * 2.3f)))));
        let _e310 = foam;
        foam = (_e310 + ((arm * armBreakup) * 0.95f));
        let armPhase = ((abs(side) - spread) * 15f);
        let armWaves = ((((exp((-(max(0f, (abs(side) - spread))) * 3f)) * step(0f, (abs(side) - (spread * 0.6f)))) * lengthMask) * armDecay) * motion);
        let outward = ((forward * -0.35f) + (vec2<f32>(-(forward.y), forward.x) * sign(side)));
        let _e346 = slope_1;
        slope_1 = (_e346 + (((outward * sin(armPhase)) * armWaves) * 0.12f));
        let wavelength = clamp((speed * 0.33f), 0.26f, 0.85f);
        let inside = (1f - smoothstep((spread * 0.75f), spread, abs(side)));
        let transverse = ((((sin(((behind * 6.2831855f) / wavelength)) * inside) * lengthMask) * armDecay) * motion);
        let _e372 = slope_1;
        slope_1 = (_e372 + ((forward * transverse) * 0.14f));
        let _e377 = foam;
        foam = (_e377 + (smoothstep(0.8f, 1f, transverse) * 0.24f));
        let trail = (((exp((-((side * side)) / ((r_1 * r_1) * 0.45f))) * exp((-(max(0f, behind)) * 2.2f))) * step(0f, behind)) * motion);
        let _e402 = foam;
        foam = (_e402 + (trail * (0.45f + (0.25f * sin((((behind * 13f) - (t_1 * 6f)) + (side * 9f)))))));
    }
    let _e418 = slope_1;
    let _e420 = foam;
    return vec3<f32>((_e418 * fade), (min(1.2f, _e420) * fade));
}

fn waterContact(c_1: vec4<f32>, shape_1: vec4<f32>, worldXZ_2: vec2<f32>, edgeAA_1: f32, optics: bool) -> vec4<f32> {
    var local_13: bool;
    var local_14: bool;

    if (shape_1.w > 1.5f) {
        return vec4(0f);
    }
    let _e9 = material.waveTimeSeconds;
    let age_1 = (_e9 - c_1.z);
    if !((c_1.w <= 0f)) {
        local_13 = (age_1 < 0f);
    } else {
        local_13 = true;
    }
    let _e21 = local_13;
    if !(_e21) {
        local_14 = (age_1 >= 1.8f);
    } else {
        local_14 = true;
    }
    let _e28 = local_14;
    if _e28 {
        return vec4(0f);
    }
    let delta_1 = (worldXZ_2 - c_1.xy);
    let radius_1 = (shape_1.x + (age_1 * (1.45f + (shape_1.w * 0.65f))));
    if (dot(delta_1, delta_1) > ((radius_1 + 0.65f) * (radius_1 + 0.65f))) {
        return vec4(0f);
    }
    let distance_ = max(0.001f, length(delta_1));
    let crest = (distance_ - radius_1);
    let envelope = exp(((-(crest) * crest) * 24f));
    let fade_1 = (((1f - (age_1 / 1.8f)) * (1f - (age_1 / 1.8f))) * c_1.w);
    let bow_1 = (0.72f + (0.28f * max(0f, dot((delta_1 / vec2(distance_)), shape_1.yz))));
    let phase_2 = (crest * 26f);
    let height = ((cos(phase_2) * envelope) * fade_1);
    if !(optics) {
        return vec4<f32>(height, 0f, 0f, 0f);
    }
    let radialGradient = (((((-48f * crest) * cos(phase_2)) - (26f * sin(phase_2))) * envelope) * fade_1);
    let radial_1 = (delta_1 / vec2(distance_));
    let slope_2 = (radial_1 * radialGradient);
    let along_1 = dot(radial_1, shape_1.yz);
    let across_1 = dot(radial_1, vec2<f32>(-(shape_1.z), shape_1.y));
    let arcs = smoothstep(-0.35f, 0.55f, (((0.63f * ((((4f * along_1) * along_1) * along_1) - (3f * along_1))) + (0.32f * across_1)) + (0.16f * along_1)));
    let primary = (1f - smoothstep(0.023f, (0.061f + edgeAA_1), abs(crest)));
    let secondary = ((1f - smoothstep(0.018f, (0.047f + edgeAA_1), abs((crest + 0.242f)))) * 0.24f);
    let trough = ((1f - smoothstep(0.027f, (0.069f + edgeAA_1), abs((crest + 0.121f)))) * 0.58f);
    return vec4<f32>(height, slope_2, (((((primary + secondary) - trough) * fade_1) * bow_1) * arcs));
}

fn waterContacts(worldXZ_3: vec2<f32>, edgeAA_2: f32, optics_1: bool) -> vec4<f32> {
    var field: vec4<f32> = vec4(0f);
    var body: vec3<f32> = vec3(0f);

    let _e4 = field;
    let _e7 = material.contactA;
    let _e10 = material.contactShapeA;
    let _e14 = waterContact(_e7, _e10, worldXZ_3, edgeAA_2, optics_1);
    field = (_e4 + _e14);
    let _e16 = field;
    let _e19 = material.contactB;
    let _e22 = material.contactShapeB;
    let _e23 = waterContact(_e19, _e22, worldXZ_3, edgeAA_2, optics_1);
    field = (_e16 + _e23);
    let _e25 = field;
    let _e28 = material.contactC;
    let _e31 = material.contactShapeC;
    let _e32 = waterContact(_e28, _e31, worldXZ_3, edgeAA_2, optics_1);
    field = (_e25 + _e32);
    let _e34 = field;
    let _e37 = material.contactD;
    let _e40 = material.contactShapeD;
    let _e41 = waterContact(_e37, _e40, worldXZ_3, edgeAA_2, optics_1);
    field = (_e34 + _e41);
    let _e43 = field;
    let _e46 = material.contactE;
    let _e49 = material.contactShapeE;
    let _e50 = waterContact(_e46, _e49, worldXZ_3, edgeAA_2, optics_1);
    field = (_e43 + _e50);
    let _e52 = field;
    let _e55 = material.contactF;
    let _e58 = material.contactShapeF;
    let _e59 = waterContact(_e55, _e58, worldXZ_3, edgeAA_2, optics_1);
    field = (_e52 + _e59);
    let _e61 = field;
    let _e64 = material.contactG;
    let _e67 = material.contactShapeG;
    let _e68 = waterContact(_e64, _e67, worldXZ_3, edgeAA_2, optics_1);
    field = (_e61 + _e68);
    let _e70 = field;
    let _e73 = material.contactH;
    let _e76 = material.contactShapeH;
    let _e77 = waterContact(_e73, _e76, worldXZ_3, edgeAA_2, optics_1);
    field = (_e70 + _e77);
    let _e79 = field;
    let _e82 = material.contactI;
    let _e85 = material.contactShapeI;
    let _e86 = waterContact(_e82, _e85, worldXZ_3, edgeAA_2, optics_1);
    field = (_e79 + _e86);
    let _e88 = field;
    let _e91 = material.contactJ;
    let _e94 = material.contactShapeJ;
    let _e95 = waterContact(_e91, _e94, worldXZ_3, edgeAA_2, optics_1);
    field = (_e88 + _e95);
    let _e97 = field;
    let _e100 = material.contactK;
    let _e103 = material.contactShapeK;
    let _e104 = waterContact(_e100, _e103, worldXZ_3, edgeAA_2, optics_1);
    field = (_e97 + _e104);
    let _e106 = field;
    let _e109 = material.contactL;
    let _e112 = material.contactShapeL;
    let _e113 = waterContact(_e109, _e112, worldXZ_3, edgeAA_2, optics_1);
    field = (_e106 + _e113);
    let _e117 = material.swellMaxMeters;
    let _e120 = material.rippleHeightMeters;
    let _e126 = material.contactDisturbanceStrength;
    let budget = (max(0f, (_e117 - _e120)) * _e126);
    let _e129 = field.x;
    let divisor = (1f + abs(_e129));
    if optics_1 {
        let _e135 = material.contactA;
        let _e138 = material.contactShapeA;
        let _e139 = waterWade(_e135, _e138, worldXZ_3, edgeAA_2);
        body = _e139;
    }
    let _e142 = field.x;
    let _e145 = field;
    let _e151 = body;
    let _e155 = field.w;
    let _e157 = body.z;
    return vec4<f32>(((_e142 * budget) / divisor), (((_e145.yz * budget) / vec2((divisor * divisor))) + _e151.xy), (_e155 + _e157));
}

@vertex 
fn vs_main(input: VsIn, @builtin(instance_index) idx: u32) -> VsOut {
    var world: vec4<f32>;
    var output: VsOut;

    let _e3 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].worldFromLocal;
    let _e9 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx].localFromInstance;
    world = ((_e3 * _e9) * vec4<f32>(input.pos, 1f));
    let _e16 = world;
    let _e18 = waterFlow(_e16.xz);
    let _e20 = shoreMeters(input.shore);
    let bankDamping = smoothstep(0f, 0.8f, _e20);
    let _e24 = world;
    let _e28 = waterContacts(_e24.xz, 0f, false);
    let _e40 = material.rippleHeightMeters;
    let swell = (((((sin(_e18.x) + (0.32f * sin(_e18.y))) / 1.32f) * _e40) + _e28.x) * bankDamping);
    let _e46 = world.y;
    world.y = (_e46 + swell);
    let _e52 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    let _e53 = world;
    output.clip = (_e52 * _e53);
    let _e56 = world;
    output.worldPos = _e56.xyz;
    output.shore = input.shore;
    let _e63 = output.clip.w;
    output.viewZ = -(_e63);
    output.swell = swell;
    let _e66 = output;
    return _e66;
}

@fragment 
fn fs_main(input_1: VsOut) -> @location(0) vec4<f32> {
    var slope: vec2<f32>;
    var color: vec3<f32>;

    let _e2 = shoreMeters(input_1.shore);
    let _e5 = material.flowAngleRadians;
    let _e9 = material.flowAngleRadians;
    let direction_1 = vec2<f32>(cos(_e5), sin(_e9));
    let across_2 = vec2<f32>(-(direction_1.y), direction_1.x);
    let _e18 = waterFlow(input_1.worldPos.xz);
    let p_1 = _e18.zw;
    let _e22 = material.wavelengthMeters;
    let k_1 = (6.2831855f / _e22);
    let _e27 = material.waveTimeSeconds;
    let _e30 = material.speedMetersPerSecond;
    let travel_1 = (_e27 * _e30);
    let phaseA_1 = _e18.x;
    let phaseB_1 = _e18.y;
    let dx = (cos(phaseA_1) + (0.297312f * cos(phaseB_1)));
    let dz = ((((cos(phaseA_1) * 0.62f) * 0.31f) * cos(((p_1.y * k_1) * 0.31f))) + (0.427712f * cos(phaseB_1)));
    let bankDamping_1 = smoothstep(0f, 0.8f, _e2);
    let _e63 = material.rippleHeightMeters;
    slope = (((((direction_1 * dx) + (across_2 * dz)) * k_1) * _e63) / vec2(1.32f));
    let _e71 = fwidth(input_1.worldPos.xz);
    let contactAA = max(0.012f, (length(_e71) * 0.55f));
    let _e80 = waterContacts(input_1.worldPos.xz, contactAA, true);
    let _e81 = slope;
    slope = ((_e81 + _e80.yz) * bankDamping_1);
    let contactCrest = (max(0f, _e80.w) * smoothstep(0f, 0.18f, _e2));
    let contactTrough = (max(0f, -(_e80.w)) * smoothstep(0f, 0.18f, _e2));
    let _e101 = slope.x;
    let _e104 = slope.y;
    let normal_5 = normalize(vec3<f32>(-(_e101), 1f, -(_e104)));
    let _e111 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    let camera = normalize((_e111 - input_1.worldPos));
    let _e117 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let sun = normalize(-(_e117));
    let _e127 = evalDirectionalShadowFactorX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(vec3<f32>(0f, 1f, 0f), input_1.worldPos, input_1.viewZ, 0u);
    let verticalDepth = max(0f, ((input_1.shore.y - 3f) + input_1.swell));
    let _e138 = material.depthFadeMeters;
    let _e143 = material.depthColorMeters;
    let depth = select(smoothstep(0f, _e138, _e2), smoothstep(0f, _e143, verticalDepth), (input_1.shore.y > 2.5f));
    let _e153 = material.shallowColor;
    let _e157 = material.deepColor;
    color = mix(_e153.xyz, _e157.xyz, depth);
    let broadWave = (0.5f + (0.5f * ((sin(phaseA_1) * 0.72f) + (sin(phaseB_1) * 0.28f))));
    let _e172 = color;
    color = (_e172 * (0.97f + (0.07f * smoothstep(0.24f, 0.8f, broadWave))));
    let noL = max(0f, dot(normal_5, sun));
    let noV = max(0f, dot(normal_5, camera));
    let _e187 = color;
    let _e194 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightColor;
    let _e197 = material.diffuseStrength;
    color = (_e187 * (vec3<f32>(0.56f, 0.65f, 0.7f) + (_e194 * (((0.32f * _e197) * noL) * _e127))));
    let _e205 = color;
    let _e208 = material.shallowColor;
    let _e212 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightColor;
    let _e216 = material.scatteringStrength;
    color = (_e205 + (((((_e208.xyz * _e212) * _e216) * (1f - (0.7f * depth))) * (0.24f + (0.38f * (1f - noV)))) * (0.3f + (0.7f * _e127))));
    let fresnel_1 = (0.02f + (0.98f * pow((1f - noV), 5f)));
    let roughness_3 = material.surfaceRoughness;
    let crestDistance = (1f - sin(phaseA_1));
    let _e250 = fwidth(crestDistance);
    let crestAA = max(0.008f, _e250);
    let crestLine = (1f - smoothstep(0.016f, (0.034f + crestAA), crestDistance));
    let longGap = smoothstep(0.1f, 0.62f, sin((((p_1.y * k_1) * 0.9f) + (0.48f * sin(((p_1.x * k_1) * 0.31f))))));
    let crestBand = (crestLine * longGap);
    let reflected = ((crestBand * 0.8f) + fresnel_1);
    let _e279 = color;
    let _e282 = material.reflectionColor;
    let _e286 = material.reflectionStrength;
    color = mix(_e279, _e282.xyz, ((reflected * _e286) * (1f - (0.3f * roughness_3))));
    let halfVector = normalize((camera + sun));
    let highlight = pow(max(0f, dot(normal_5, halfVector)), mix(160f, 24f, roughness_3));
    let _e303 = color;
    let _e306 = material.reflectionColor;
    let _e311 = material.reflectionStrength;
    color = (_e303 + ((((_e306.xyz * highlight) * _e311) * _e127) * mix(0.28f, 0.1f, roughness_3)));
    let _e321 = material.shoreWidthMeters;
    let shoreWidth = (_e321 * (0.75f + (0.25f * sin((phaseA_1 * 0.43f)))));
    let _e330 = fwidth(_e2);
    let edgeAA_3 = max(0.025f, _e330);
    let wash = (1f - smoothstep(shoreWidth, (shoreWidth + edgeAA_3), _e2));
    let continuity = smoothstep(-0.45f, 0.65f, sin((((p_1.y * 0.74f) + (p_1.x * 0.23f)) - (travel_1 * 0.36f))));
    let _e351 = color;
    let _e354 = material.foamColor;
    let _e359 = material.foamStrength;
    color = mix(_e351, _e354.xyz, (((wash * continuity) * _e359) * mix(0.55f, 1f, _e127)));
    let _e366 = color;
    color = (_e366 * (1f - (min(0.4f, (contactTrough * 1.5f)) * mix(0.7f, 1f, _e127))));
    let _e380 = material.shallowColor;
    let _e384 = material.deepColor;
    let rippleTint = mix(_e380.xyz, _e384.xyz, 0.28f);
    let _e390 = material.reflectionColor;
    let _e398 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightColor;
    let rippleLight = (mix(rippleTint, _e390.xyz, 0.28f) * (vec3(0.79f) + ((_e398 * 0.28f) * _e127)));
    let _e404 = color;
    color = mix(_e404, rippleLight, ((min(0.86f, (contactCrest * 2.35f)) * (0.72f + (0.28f * noL))) * mix(0.7f, 1f, _e127)));
    let edgeCoverage = smoothstep(0f, (0.12f + edgeAA_3), _e2);
    let _e425 = material.shallowOpacity;
    let _e428 = material.deepOpacity;
    let opacity = (min(0.92f, (((mix(_e425, _e428, depth) + (fresnel_1 * 0.08f)) + (crestBand * 0.035f)) + min(0.26f, (contactCrest * 0.56f)))) * edgeCoverage);
    let _e444 = color;
    return vec4<f32>((_e444 * opacity), opacity);
}
