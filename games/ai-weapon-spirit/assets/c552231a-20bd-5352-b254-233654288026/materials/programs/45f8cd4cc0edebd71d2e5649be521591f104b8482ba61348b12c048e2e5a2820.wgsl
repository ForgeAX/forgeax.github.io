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

struct ShadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX {
    index: u32,
    isSpot: u32,
    shadowCasterPadB: u32,
    shadowCasterPadC: u32,
    spotLightViewProj: mat4x4<f32>,
}

struct AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    luminance: vec3<f32>,
    transmittance: vec3<f32>,
}

struct AtmosphereFogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
    inscatter: vec3<f32>,
    transmittance: vec3<f32>,
}

struct FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
    inscatter: vec3<f32>,
    transmittance: f32,
}

struct FogViewParamsX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
    color: vec3<f32>,
    density: f32,
    heightFalloff: f32,
    maxOpacity: f32,
}

struct FogRayX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
    origin: vec3<f32>,
    direction: vec3<f32>,
    distance: f32,
}

struct OitOutputX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX {
    @location(0) accum: vec4<f32>,
    @location(1) weight: vec4<f32>,
}

struct Material {
    baseColor: vec4<f32>,
    alphaCutoff: f32,
    alphaHash: f32,
    shadowAlphaMode: f32,
    alphaMode: f32,
    alphaToCoverage: f32,
    shading: f32,
    alphaChannel: f32,
    baseColorTextureCoordinatesTransform: vec4<f32>,
    baseColorTextureCoordinatesMetadata: vec4<f32>,
    baseColorTextureCoordinatesRotation: vec4<f32>,
    alphaTextureCoordinatesTransform: vec4<f32>,
    alphaTextureCoordinatesMetadata: vec4<f32>,
    alphaTextureCoordinatesRotation: vec4<f32>,
}

struct VsIn {
    @location(0) pos: vec3<f32>,
    @location(1) normal: vec3<f32>,
    @location(2) uv: vec2<f32>,
    @location(3) tangent: vec4<f32>,
    @location(6) uv1_: vec2<f32>,
    @location(7) uv2_: vec2<f32>,
    @location(8) uv3_: vec2<f32>,
    @location(9) uv4_: vec2<f32>,
    @location(10) uv5_: vec2<f32>,
    @location(11) uv6_: vec2<f32>,
    @location(12) uv7_: vec2<f32>,
}

struct VsOut {
    @location(3) positionOS: vec3<f32>,
    @builtin(position) @invariant clip: vec4<f32>,
    @location(0) uv: vec2<f32>,
    @location(5) alphaUv: vec2<f32>,
    @location(1) worldPos: vec3<f32>,
    @location(2) worldNormal: vec3<f32>,
}

struct TemporalVsOut {
    @location(3) positionOS: vec3<f32>,
    @location(4) clippingPositionWS: vec3<f32>,
    @builtin(position) @invariant clip: vec4<f32>,
    @location(0) uv: vec2<f32>,
    @location(5) alphaUv: vec2<f32>,
    @location(6) @interpolate(flat) skinHistoryValid: u32,
    @location(1) currentClip: vec4<f32>,
    @location(2) previousClip: vec4<f32>,
}

const OIT_MIN_ALPHAX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX: f32 = 0.001f;
const OIT_WEIGHT_NEARX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX: f32 = 5f;
const OIT_WEIGHT_FARX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX: f32 = 200f;
const OIT_WEIGHT_BIASX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX: f32 = 0.00001f;
const OIT_WEIGHT_SCALEX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX: f32 = 10f;
const OIT_WEIGHT_MINX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX: f32 = 0.01f;
const OIT_WEIGHT_MAXX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX: f32 = 500f;
const UNLIT_SHADING_NORMAL: f32 = 1f;

@group(0) @binding(0) 
var<uniform> viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(2) @binding(0) 
var<storage> meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<MeshX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX>;
@group(3) @binding(0) 
var<storage> instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<InstanceDataX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX>;
@group(0) @binding(7) 
var<uniform> shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ShadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(1) @binding(0) 
var<uniform> material: Material;
@group(1) @binding(1) 
var baseColorSampler: sampler;
@group(1) @binding(2) 
var baseColorTexture: texture_2d<f32>;
@group(1) @binding(3) 
var alphaSampler: sampler;
@group(1) @binding(4) 
var alphaTexture: texture_2d<f32>;

fn materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(source: vec2<f32>, transform: vec4<f32>, rotation: vec4<f32>) -> vec2<f32> {
    let scaled = (source * transform.zw);
    return vec2<f32>(((scaled.x * rotation.x) - (scaled.y * rotation.y)), ((scaled.x * rotation.y) + (scaled.y * rotation.x)));
}

fn sampleMaterialTextureLinearX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(texture: texture_2d<f32>, textureSampler: sampler, uv: vec2<f32>, uvScale: vec2<f32>) -> vec4<f32> {
    let _e5 = textureSample(texture, textureSampler, (uv * uvScale));
    return _e5;
}

fn meshMotionValidX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(flags: f32) -> bool {
    return ((u32(flags) & 1u) != 0u);
}

fn projectShadowPositionX_naga_oil_mod_XMZXXEZ3FMF4F643IMFSG65Z2HJZXK4TGMFRWKX(worldPosition: vec4<f32>) -> vec4<f32> {
    let _e2 = shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.isSpot;
    if (_e2 == 1u) {
        let _e8 = shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.spotLightViewProj;
        return (_e8 * worldPosition);
    }
    let _e12 = shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.index;
    switch _e12 {
        case 0u: {
            let _e15 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightViewProj_A;
            return (_e15 * worldPosition);
        }
        case 1u: {
            let _e19 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightViewProj_B;
            return (_e19 * worldPosition);
        }
        case 2u: {
            let _e23 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightViewProj_C;
            return (_e23 * worldPosition);
        }
        default: {
            let _e27 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightViewProj_D;
            return (_e27 * worldPosition);
        }
    }
}

fn clippedByPlanesX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(positionWS: vec3<f32>, planes: array<vec4<f32>, 6>, control: vec4<f32>) -> bool {
    var allOutside: bool;
    var anyOutside: bool = false;
    var index: u32 = 0u;
    var local_2: bool;
    var local_3: bool;

    let count = min(u32(max(control.x, 0f)), 6u);
    allOutside = (count > 0u);
    loop {
        let _e13 = index;
        if (_e13 < count) {
        } else {
            break;
        }
        {
            let _e17 = index;
            let _e21 = index;
            let outside = ((dot(planes[_e17].xyz, positionWS) + planes[_e21].w) < 0f);
            let _e28 = anyOutside;
            if !(_e28) {
                local_2 = outside;
            } else {
                local_2 = true;
            }
            let _e33 = local_2;
            anyOutside = _e33;
            let _e34 = allOutside;
            if _e34 {
                local_3 = outside;
            } else {
                local_3 = false;
            }
            let _e38 = local_3;
            allOutside = _e38;
        }
        continuing {
            let _e40 = index;
            index = (_e40 + 1u);
        }
    }
    let _e42 = anyOutside;
    let _e43 = allOutside;
    return select(_e42, _e43, (control.y > 0.5f));
}

fn applyLocalClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(positionWS_1: vec3<f32>, shadow: bool, planes_1: array<vec4<f32>, 6>, control_1: vec4<f32>) {
    var local_4: bool;
    var local_5: bool;

    if !(!(shadow)) {
        local_4 = (control_1.z > 0.5f);
    } else {
        local_4 = true;
    }
    let _e10 = local_4;
    if _e10 {
        let _e13 = clippedByPlanesX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(positionWS_1, planes_1, control_1);
        local_5 = _e13;
    } else {
        local_5 = false;
    }
    let _e17 = local_5;
    if _e17 {
        discard;
    } else {
        return;
    }
}

fn applyViewClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(positionWS_2: vec3<f32>, shadow_1: bool) {
    let _e2 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.clippingPlanes;
    let _e5 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.clippingControl;
    applyLocalClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(positionWS_2, shadow_1, _e2, _e5);
    return;
}

fn alphaHash2DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(value: vec2<f32>) -> f32 {
    return fract(((10000f * sin(((17f * value.x) + (0.1f * value.y)))) * (0.1f + abs(sin(((13f * value.y) + value.x))))));
}

fn alphaHash3DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(value_1: vec3<f32>) -> f32 {
    let _e2 = alphaHash2DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(value_1.xy);
    let _e5 = alphaHash2DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(vec2<f32>(_e2, value_1.z));
    return _e5;
}

fn alphaHashThresholdX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(position: vec3<f32>, derivative: f32) -> f32 {
    var threshold: f32;

    let scale = (1f / max((0.05f * derivative), 0.000001f));
    let level = log2(scale);
    let _e13 = alphaHash3DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(floor((exp2(floor(level)) * position)));
    let _e18 = alphaHash3DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(floor((exp2(ceil(level)) * position)));
    let noise = vec2<f32>(_e13, _e18);
    let t = fract(level);
    let x = mix(noise.x, noise.y, t);
    let a = min(t, (1f - t));
    threshold = x;
    if (a > 0f) {
        if (x < a) {
            threshold = ((x * x) / ((2f * a) * (1f - a)));
        } else {
            if (x < (1f - a)) {
                threshold = ((x - (0.5f * a)) / (1f - a));
            } else {
                threshold = (1f - (((1f - x) * (1f - x)) / ((2f * a) * (1f - a))));
            }
        }
    }
    let _e60 = threshold;
    return clamp(_e60, 0.000001f, 1f);
}

fn applyAlphaHashX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(alpha: f32, position_1: vec3<f32>, enabled: f32) {
    let _e1 = dpdx(position_1);
    let _e3 = dpdy(position_1);
    let derivative_1 = max(length(_e1), length(_e3));
    if (enabled > 0.5f) {
        let _e9 = alphaHashThresholdX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(position_1, derivative_1);
        if (alpha < _e9) {
            discard;
        } else {
            return;
        }
    } else {
        return;
    }
}

fn alphaCoverageX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(alpha_1: f32, cutoff: f32, smoothing: f32) -> f32 {
    var coverage: f32;

    let width = fwidth(alpha_1);
    coverage = alpha_1;
    if (cutoff > 0f) {
        if (smoothing > 0.5f) {
            coverage = smoothstep(cutoff, (cutoff + max(width, 0.0000001f)), alpha_1);
            let _e13 = coverage;
            if (_e13 <= 0f) {
                discard;
            }
        } else {
            if (alpha_1 <= cutoff) {
                discard;
            }
        }
    }
    let _e17 = coverage;
    return _e17;
}

fn materialOutputAlphaX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(alpha_2: f32, mode: f32) -> f32 {
    var local_6: bool;

    if (mode > 0.5f) {
        local_6 = (mode < 1.5f);
    } else {
        local_6 = false;
    }
    let _e8 = local_6;
    return select(alpha_2, 1f, _e8);
}

fn materialOutputColorX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(color: vec3<f32>, alpha_3: f32, mode_1: f32) -> vec3<f32> {
    return (color * select(1f, alpha_3, (mode_1 > 1.5f)));
}

fn atmosphere_scene_visibilityX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2OZUXG2LCNFWGS5DZX(m: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, p: vec3<f32>) -> f32 {
    return 1f;
}

fn cloud_direct_solar_factorX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX(worldPosition_1: vec3<f32>, shadowOrigin: vec3<f32>, shadowRight: vec3<f32>, shadowUp: vec3<f32>, shadowProjection: vec4<f32>) -> f32 {
    return 1f;
}

fn view_atmosphereX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, position_2: vec3<f32>) -> AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    return AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(vec3(0f), vec3(1f));
}

fn view_solar_transmittanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_1: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, position_3: vec3<f32>) -> vec3<f32> {
    return vec3(1f);
}

fn view_distant_sky_lightX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_2: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX) -> vec3<f32> {
    return vec3(0f);
}

fn fogOpticalDepthX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(params: FogViewParamsX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX, ray: FogRayX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX) -> f32 {
    var integral: f32;

    let rho = (params.density * exp(clamp((-(params.heightFalloff) * ray.origin.y), -60f, 60f)));
    let t_1 = clamp(((params.heightFalloff * ray.direction.y) * ray.distance), -60f, 60f);
    integral = ((1f - (t_1 * 0.5f)) + ((t_1 * t_1) / 6f));
    if (abs(t_1) >= 0.001f) {
        integral = ((1f - exp(-(t_1))) / t_1);
    }
    let _e41 = integral;
    return clamp(((rho * ray.distance) * _e41), 0f, 80f);
}

fn height_fog_with_sourceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_3: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos: vec3<f32>, source_1: vec3<f32>) -> FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
    var origin: vec3<f32>;

    origin = v_3.cameraPos;
    if (v_3.temporalProjection.z > 0.5f) {
        let forward = -(normalize(vec3<f32>(v_3.worldViewProj[0].z, v_3.worldViewProj[1].z, v_3.worldViewProj[2].z)));
        origin = (worldPos - (forward * dot((worldPos - v_3.cameraPos), forward)));
    }
    let _e25 = origin;
    let delta = (worldPos - _e25);
    let distance_ = length(delta);
    if (distance_ < 0.00001f) {
        return FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(vec3(0f), 1f);
    }
    let params_1 = FogViewParamsX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_3.fogColorDensity.xyz, v_3.fogColorDensity.w, v_3.fogHeightOpacity.x, v_3.fogHeightOpacity.y);
    let _e44 = origin;
    let _e48 = fogOpticalDepthX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(params_1, FogRayX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(_e44, (delta / vec3(distance_)), distance_));
    let opacity = (params_1.maxOpacity * (1f - exp(-(_e48))));
    return FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX((source_1 * opacity), (1f - opacity));
}

fn height_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_4: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos_1: vec3<f32>) -> FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
    var source_2: vec3<f32>;

    source_2 = v_4.fogColorDensity.xyz;
    if (v_4.atmosphereControl.w > 0.5f) {
        let ground = ((v_4.atmosphere.originRadius.xyz * 1000f) + vec3<f32>(0f, 1f, 0f));
        let _e18 = source_2;
        let _e19 = view_distant_sky_lightX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_4);
        let _e20 = view_solar_transmittanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_4, ground);
        source_2 = (_e18 + (_e19 + ((_e20 * v_4.lightColor) / vec3(12.566371f))));
    }
    let _e28 = source_2;
    let _e30 = height_fog_with_sourceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_4, worldPos_1, _e28);
    return _e30;
}

fn view_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_5: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, position_4: vec3<f32>) -> AtmosphereFogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
    let _e2 = height_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_5, position_4);
    let _e3 = view_atmosphereX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_5, position_4);
    return AtmosphereFogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX((_e2.inscatter + (_e2.transmittance * _e3.luminance)), (_e2.transmittance * _e3.transmittance));
}

fn translucent_fog_transmissionX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_6: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos_2: vec3<f32>, color_1: vec3<f32>, alpha_4: f32, backdrop: vec3<f32>, transmission: vec3<f32>) -> vec3<f32> {
    var local_7: bool;

    let composition = u32((v_6.fogHeightOpacity.z + 0.5f));
    if (composition == 0u) {
        local_7 = all((transmission == vec3(0f)));
    } else {
        local_7 = false;
    }
    let _e16 = local_7;
    if _e16 {
        return color_1;
    }
    let _e19 = view_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_6, worldPos_2);
    let coverage_1 = select(1f, alpha_4, (composition == 2u));
    let inscatter = select((((vec3(1f) - transmission) * _e19.inscatter) * coverage_1), vec3(0f), (composition == 3u));
    return ((((color_1 - backdrop) * _e19.transmittance) + backdrop) + inscatter);
}

fn translucent_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_7: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos_3: vec3<f32>, color_2: vec3<f32>, alpha_5: f32) -> vec3<f32> {
    let _e8 = translucent_fog_transmissionX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_7, worldPos_3, color_2, alpha_5, vec3(0f), vec3(0f));
    return _e8;
}

fn oitDepthWeightX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX(viewDistance: f32) -> f32 {
    let d = max(viewDistance, 0f);
    let near = (d / OIT_WEIGHT_NEARX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX);
    let far = (d / OIT_WEIGHT_FARX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX);
    let far2_ = (far * far);
    let denominator = ((OIT_WEIGHT_BIASX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX + (near * near)) + ((far2_ * far2_) * far2_));
    return clamp((OIT_WEIGHT_SCALEX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX / denominator), OIT_WEIGHT_MINX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX, OIT_WEIGHT_MAXX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX);
}

fn oitAccumulateX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX(premultipliedColor: vec3<f32>, alpha_6: f32, viewDistance_1: f32) -> OitOutputX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX {
    var output: OitOutputX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX;

    if !((alpha_6 >= OIT_MIN_ALPHAX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX)) {
        discard;
    }
    let a_1 = min(alpha_6, 1f);
    let _e7 = oitDepthWeightX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX(viewDistance_1);
    output.accum = vec4<f32>((premultipliedColor * _e7), a_1);
    output.weight = vec4<f32>((a_1 * _e7), 0f, 0f, a_1);
    let _e18 = output;
    return _e18;
}

fn sceneTemporalUvX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(clip: vec4<f32>) -> vec2<f32> {
    let safeW = select(0.000001f, clip.w, (abs(clip.w) >= 0.000001f));
    let ndc = (clip.xy / vec2(safeW));
    return vec2<f32>(((ndc.x * 0.5f) + 0.5f), (0.5f - (ndc.y * 0.5f)));
}

fn sceneViewZX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(clip_1: vec4<f32>, temporalProjection: vec4<f32>) -> f32 {
    let ndcDepth = (clip_1.z / max(abs(clip_1.w), 0.000000000000000000000000000001f));
    let orthographicViewZ = -((temporalProjection.y - (ndcDepth * (temporalProjection.y - temporalProjection.x))));
    return select(-(clip_1.w), orthographicViewZ, (temporalProjection.z >= 0.5f));
}

fn sceneTemporalViewDepthX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(clip_2: vec4<f32>, temporalProjection_1: vec4<f32>) -> f32 {
    let _e2 = sceneViewZX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(clip_2, temporalProjection_1);
    return log2((1f + max(-(_e2), 0f)));
}

fn packSceneTemporalV1WithValidityX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(currentClip: vec4<f32>, previousClip: vec4<f32>, temporalProjection_2: vec4<f32>, reactive_1: f32, motionValid_1: bool) -> vec4<f32> {
    let _e1 = sceneTemporalUvX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(currentClip);
    let _e3 = sceneTemporalUvX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(previousClip);
    let _e6 = sceneTemporalViewDepthX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(currentClip, temporalProjection_2);
    return vec4<f32>((_e1 - _e3), _e6, (clamp(reactive_1, 0f, 1f) + select(0f, 2f, !(motionValid_1))));
}

fn materialTextureFilteringWitness() {
    let baseWitness = textureSample(baseColorTexture, baseColorSampler, vec2(0f));
    let alphaWitness = textureSample(alphaTexture, alphaSampler, vec2(0f));
    return;
}

fn unlitUv(in_8: VsIn, uvSet: f32, transform_1: vec4<f32>, rotation_1: vec4<f32>) -> vec2<f32> {
    var source_3: vec2<f32>;

    source_3 = in_8.uv;
    if (uvSet >= 1f) {
        source_3 = in_8.uv1_;
    }
    if (uvSet >= 2f) {
        source_3 = in_8.uv2_;
    }
    if (uvSet >= 3f) {
        source_3 = in_8.uv3_;
    }
    if (uvSet >= 4f) {
        source_3 = in_8.uv4_;
    }
    if (uvSet >= 5f) {
        source_3 = in_8.uv5_;
    }
    if (uvSet >= 6f) {
        source_3 = in_8.uv6_;
    }
    if (uvSet >= 7f) {
        source_3 = in_8.uv7_;
    }
    let _e25 = source_3;
    let _e28 = materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(_e25, transform_1, rotation_1);
    return (_e28 + transform_1.xy);
}

fn unlitVertex(in_9: VsIn, idx_3: u32) -> VsOut {
    var out_2: VsOut;

    let _e3 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].worldFromLocal;
    let _e8 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx_3].localFromInstance;
    let localToWorld = (_e3 * _e8);
    let world = (localToWorld * vec4<f32>(in_9.pos, 1f));
    out_2.positionOS = in_9.pos;
    let _e21 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    out_2.clip = (_e21 * world);
    let _e27 = material.baseColorTextureCoordinatesMetadata.x;
    let _e30 = material.baseColorTextureCoordinatesTransform;
    let _e33 = material.baseColorTextureCoordinatesRotation;
    let _e34 = unlitUv(in_9, _e27, _e30, _e33);
    out_2.uv = _e34;
    let _e39 = material.alphaTextureCoordinatesMetadata.x;
    let _e42 = material.alphaTextureCoordinatesTransform;
    let _e45 = material.alphaTextureCoordinatesRotation;
    let _e46 = unlitUv(in_9, _e39, _e42, _e45);
    out_2.alphaUv = _e46;
    out_2.worldPos = world.xyz;
    let _e51 = material.shading;
    if (_e51 > 0.5f) {
        let m0_ = localToWorld[0].xyz;
        let m1_ = localToWorld[1].xyz;
        let m2_ = localToWorld[2].xyz;
        let normalMatrix = mat3x3<f32>(cross(m1_, m2_), cross(m2_, m0_), cross(m0_, m1_));
        out_2.worldNormal = ((normalMatrix * in_9.normal) * sign(dot(m0_, cross(m1_, m2_))));
    }
    let _e71 = out_2;
    return _e71;
}

fn unlitViewBasis() -> mat3x3<f32> {
    let _e2 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.inverseViewProj;
    let origin_1 = (_e2 * vec4<f32>(0f, 0f, 0.5f, 1f));
    let _e11 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.inverseViewProj;
    let rightPoint = (_e11 * vec4<f32>(1f, 0f, 0.5f, 1f));
    let _e20 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.inverseViewProj;
    let upPoint = (_e20 * vec4<f32>(0f, 1f, 0.5f, 1f));
    let center = (origin_1.xyz / vec3(origin_1.w));
    let right = normalize(((rightPoint.xyz / vec3(rightPoint.w)) - center));
    let up = normalize(((upPoint.xyz / vec3(upPoint.w)) - center));
    return mat3x3<f32>(right, up, cross(right, up));
}

fn unlitViewNormal(in_10: VsOut, frontFacing_3: bool) -> vec3<f32> {
    let n = (normalize(in_10.worldNormal) * select(-1f, 1f, frontFacing_3));
    let _e8 = unlitViewBasis();
    return normalize((n * _e8));
}

fn unlitMatcapUv(in_11: VsOut, frontFacing_4: bool) -> vec2<f32> {
    let _e3 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    let _e7 = unlitViewBasis();
    let viewDir = normalize((normalize((_e3 - in_11.worldPos)) * _e7));
    let _e11 = unlitViewNormal(in_11, frontFacing_4);
    let x_1 = normalize(vec3<f32>(viewDir.z, 0f, -(viewDir.x)));
    let y = cross(viewDir, x_1);
    let uv_1 = ((vec2<f32>(dot(x_1, _e11), dot(y, _e11)) * 0.495f) + vec2(0.5f));
    return vec2<f32>(uv_1.x, (1f - uv_1.y));
}

fn unlitTextureAlpha(textureAlpha: f32) -> f32 {
    let _e2 = material.shading;
    return select(1f, textureAlpha, (_e2 < 0.5f));
}

fn materialVertexColor(in_12: VsOut) -> vec4<f32> {
    return vec4(1f);
}

fn unlitColor(in_13: VsOut, frontFacing_5: bool) -> vec4<f32> {
    var sampleUv: vec2<f32>;
    var sampleScale: vec2<f32>;
    var local_8: bool;
    var normalColor: vec3<f32>;

    applyViewClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(in_13.worldPos, false);
    sampleUv = in_13.uv;
    let _e7 = material.baseColorTextureCoordinatesMetadata;
    sampleScale = _e7.zw;
    let _e12 = material.shading;
    if (abs((_e12 - 2f)) < 0.5f) {
        let _e19 = unlitMatcapUv(in_13, frontFacing_5);
        sampleUv = _e19;
        sampleScale = vec2(1f);
    }
    let _e22 = sampleUv;
    let _e23 = sampleScale;
    let _e26 = sampleMaterialTextureLinearX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(baseColorTexture, baseColorSampler, _e22, _e23);
    let _e27 = materialVertexColor(in_13);
    let _e31 = material.alphaTextureCoordinatesMetadata;
    let _e35 = sampleMaterialTextureLinearX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(alphaTexture, alphaSampler, in_13.alphaUv, _e31.zw);
    let _e38 = material.alphaChannel;
    let mappedAlpha = _e35[u32(_e38)];
    let _e44 = material.baseColor.w;
    let _e46 = unlitTextureAlpha(_e26.w);
    let _e53 = material.alphaCutoff;
    let _e56 = material.alphaToCoverage;
    let _e57 = alphaCoverageX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX((((_e44 * _e46) * _e27.w) * mappedAlpha), _e53, _e56);
    let _e61 = material.alphaHash;
    applyAlphaHashX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(_e57, in_13.positionOS, _e61);
    let _e64 = material.alphaMode;
    let _e65 = materialOutputAlphaX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(_e57, _e64);
    let _e68 = material.shading;
    if !((abs((_e68 - UNLIT_SHADING_NORMAL)) < 0.5f)) {
        let _e77 = material.shading;
        local_8 = (_e77 > 2.5f);
    } else {
        local_8 = true;
    }
    let _e83 = local_8;
    if _e83 {
        let _e84 = unlitViewNormal(in_13, frontFacing_5);
        normalColor = ((_e84 * 0.5f) + vec3(0.5f));
        let _e93 = material.shading;
        if (_e93 > 2.5f) {
            let _e96 = normalColor;
            let _e106 = normalColor;
            let _e110 = normalColor;
            normalColor = select(pow(((_e96 + vec3(0.055f)) / vec3(1.055f)), vec3(2.4f)), (_e106 / vec3(12.92f)), (_e110 <= vec3(0.04045f)));
        }
        let _e115 = normalColor;
        let _e118 = material.alphaMode;
        let _e119 = materialOutputColorX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(_e115, _e65, _e118);
        return vec4<f32>(_e119, _e65);
    }
    let _e123 = material.baseColor;
    let _e131 = material.alphaMode;
    let _e132 = materialOutputColorX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(((_e123.xyz * _e26.xyz) * _e27.xyz), _e65, _e131);
    let _e134 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
    let _e136 = translucent_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(_e134, in_13.worldPos, _e132, _e65);
    return vec4<f32>(_e136, _e65);
}

fn temporalVertexColor(in_14: TemporalVsOut) -> vec4<f32> {
    return vec4(1f);
}

@vertex 
fn vs_main(in: VsIn, @builtin(instance_index) idx: u32) -> VsOut {
    let _e2 = unlitVertex(in, idx);
    return _e2;
}

@vertex 
fn vs_shadow(in_1: VsIn, @builtin(instance_index) idx_1: u32) -> VsOut {
    var out: VsOut;

    let _e2 = unlitVertex(in_1, idx_1);
    out = _e2;
    let _e6 = out.worldPos;
    let _e9 = projectShadowPositionX_naga_oil_mod_XMZXXEZ3FMF4F643IMFSG65Z2HJZXK4TGMFRWKX(vec4<f32>(_e6, 1f));
    out.clip = _e9;
    let _e10 = out;
    return _e10;
}

@fragment 
fn fs_main(in_2: VsOut, @builtin(front_facing) frontFacing: bool) -> @location(0) vec4<f32> {
    let _e2 = unlitColor(in_2, frontFacing);
    return _e2;
}

@fragment 
fn fs_oit(in_3: VsOut, @builtin(front_facing) frontFacing_1: bool) -> OitOutputX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX {
    let _e2 = unlitColor(in_3, frontFacing_1);
    let _e10 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    let _e12 = oitAccumulateX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX((_e2.xyz * _e2.w), _e2.w, distance(in_3.worldPos, _e10));
    return _e12;
}

@fragment 
fn fs_oit_premultiplied(in_4: VsOut, @builtin(front_facing) frontFacing_2: bool) -> OitOutputX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX {
    let _e2 = unlitColor(in_4, frontFacing_2);
    let _e8 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    let _e10 = oitAccumulateX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU33JOQX(_e2.xyz, _e2.w, distance(in_4.worldPos, _e8));
    return _e10;
}

@fragment 
fn fs_shadow(in_5: VsOut) {
    applyViewClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(in_5.worldPos, true);
    let _e6 = material.baseColorTextureCoordinatesMetadata;
    let _e10 = sampleMaterialTextureLinearX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(baseColorTexture, baseColorSampler, in_5.uv, _e6.zw);
    let _e11 = materialVertexColor(in_5);
    let _e14 = material.shadowAlphaMode;
    if (_e14 > 0.5f) {
        let _e20 = material.alphaTextureCoordinatesMetadata;
        let _e24 = sampleMaterialTextureLinearX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(alphaTexture, alphaSampler, in_5.alphaUv, _e20.zw);
        let _e27 = material.alphaChannel;
        let mappedAlpha_1 = _e24[u32(_e27)];
        let _e31 = unlitTextureAlpha(_e10.w);
        let _e35 = material.alphaCutoff;
        let _e37 = alphaCoverageX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX((_e31 * mappedAlpha_1), _e35, 0f);
        return;
    }
    let _e41 = material.alphaTextureCoordinatesMetadata;
    let _e45 = sampleMaterialTextureLinearX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(alphaTexture, alphaSampler, in_5.alphaUv, _e41.zw);
    let _e48 = material.alphaChannel;
    let mappedAlpha_2 = _e45[u32(_e48)];
    let _e54 = material.baseColor.w;
    let _e56 = unlitTextureAlpha(_e10.w);
    let _e63 = material.alphaCutoff;
    let _e66 = material.alphaToCoverage;
    let _e67 = alphaCoverageX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX((((_e54 * _e56) * _e11.w) * mappedAlpha_2), _e63, _e66);
    let _e71 = material.alphaHash;
    applyAlphaHashX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(_e67, in_5.positionOS, _e71);
    let _e74 = material.alphaMode;
    let _e75 = materialOutputAlphaX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(_e67, _e74);
    return;
}

@vertex 
fn vs_temporal(in_6: VsIn, @builtin(instance_index) idx_2: u32) -> TemporalVsOut {
    var previousWorld: vec4<f32>;
    var out_1: TemporalVsOut;

    let _e2 = unlitVertex(in_6, idx_2);
    let currentWorld = vec4<f32>(_e2.worldPos, 1f);
    previousWorld = currentWorld;
    let _e10 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].previousWorldFromLocal;
    let _e14 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx_2].previousLocalFromInstance;
    previousWorld = ((_e10 * _e14) * vec4<f32>(in_6.pos, 1f));
    out_1.skinHistoryValid = 1u;
    out_1.positionOS = in_6.pos;
    out_1.clippingPositionWS = currentWorld.xyz;
    let _e30 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalCurrentViewProj;
    out_1.currentClip = (_e30 * currentWorld);
    let _e35 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    out_1.clip = (_e35 * currentWorld);
    let _e40 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalPreviousViewProj;
    let _e41 = previousWorld;
    out_1.previousClip = (_e40 * _e41);
    out_1.uv = _e2.uv;
    out_1.alphaUv = _e2.alphaUv;
    let _e47 = out_1;
    return _e47;
}

@fragment 
fn fs_temporal(in_7: TemporalVsOut) -> @location(0) vec4<f32> {
    var reactive: f32 = 0f;
    var motionValid: bool = true;
    var local: bool;
    var local_1: bool;

    applyViewClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(in_7.clippingPositionWS, false);
    let _e8 = material.baseColorTextureCoordinatesMetadata;
    let _e12 = sampleMaterialTextureLinearX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(baseColorTexture, baseColorSampler, in_7.uv, _e8.zw);
    let _e13 = temporalVertexColor(in_7);
    let _e17 = material.alphaTextureCoordinatesMetadata;
    let _e21 = sampleMaterialTextureLinearX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(alphaTexture, alphaSampler, in_7.alphaUv, _e17.zw);
    let _e24 = material.alphaChannel;
    let mappedAlpha_3 = _e21[u32(_e24)];
    let _e30 = material.baseColor.w;
    let _e32 = unlitTextureAlpha(_e12.w);
    let _e39 = material.alphaCutoff;
    let _e42 = material.alphaToCoverage;
    let _e43 = alphaCoverageX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX((((_e30 * _e32) * _e13.w) * mappedAlpha_3), _e39, _e42);
    let _e47 = material.alphaHash;
    applyAlphaHashX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(_e43, in_7.positionOS, _e47);
    let _e50 = material.alphaMode;
    let _e51 = materialOutputAlphaX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(_e43, _e50);
    let _e56 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].temporal.x;
    reactive = _e56;
    let _e62 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].temporal.y;
    let _e63 = meshMotionValidX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(_e62);
    motionValid = _e63;
    let _e65 = motionValid;
    if _e65 {
        local = (in_7.skinHistoryValid != 0u);
    } else {
        local = false;
    }
    let _e72 = local;
    motionValid = _e72;
    let _e75 = material.alphaHash;
    if (_e75 <= 0.5f) {
        local_1 = (_e51 < 1f);
    } else {
        local_1 = false;
    }
    let _e83 = local_1;
    if _e83 {
        reactive = 1f;
    }
    let _e89 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalProjection;
    let _e90 = reactive;
    let _e91 = motionValid;
    let _e92 = packSceneTemporalV1WithValidityX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(in_7.currentClip, in_7.previousClip, _e89, _e90, _e91);
    return _e92;
}
