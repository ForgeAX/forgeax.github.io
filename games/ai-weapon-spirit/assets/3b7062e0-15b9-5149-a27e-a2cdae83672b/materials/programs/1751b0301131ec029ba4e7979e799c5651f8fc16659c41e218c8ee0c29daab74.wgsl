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
    region: vec4<f32>,
}

struct AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    luminance: vec3<f32>,
    transmittance: vec3<f32>,
}

struct AtmosphereOpticalSampleX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    extinction: vec3<f32>,
    rayleigh: vec3<f32>,
    mie: vec3<f32>,
}

struct AtmosphereRayX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2MNXW64TENFXGC5DFOMX {
    origin: vec3<f32>,
    direction: vec3<f32>,
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

struct Material {
    colorTint: vec4<f32>,
    region: vec4<f32>,
    pivotAndSize: vec4<f32>,
    slicesAndMode: vec4<f32>,
    flipX: f32,
    flipY: f32,
    baseColorTextureCoordinatesTransform: vec4<f32>,
    baseColorTextureCoordinatesMetadata: vec4<f32>,
    baseColorTextureCoordinatesRotation: vec4<f32>,
}

struct VsIn {
    @location(0) pos: vec3<f32>,
    @location(1) normal: vec3<f32>,
    @location(2) uv: vec2<f32>,
    @location(3) tangent: vec4<f32>,
}

struct VsOut {
    @builtin(position) @invariant clip: vec4<f32>,
    @location(0) uv_atlas: vec2<f32>,
    @location(1) worldPos: vec3<f32>,
}

struct SpriteVertex {
    posLocal: vec3<f32>,
    uvAtlas: vec2<f32>,
}

struct TemporalVsOut {
    @location(3) clippingPositionWS: vec3<f32>,
    @builtin(position) @invariant clip: vec4<f32>,
    @location(0) uvAtlas: vec2<f32>,
    @location(1) currentClip: vec4<f32>,
    @location(2) previousClip: vec4<f32>,
}

const ATMOSPHERE_PIX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX: f32 = 3.1415927f;

@group(0) @binding(0) 
var<uniform> viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(2) @binding(0) 
var<storage> meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<MeshX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX>;
@group(3) @binding(0) 
var<storage> instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<InstanceDataX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX>;
@group(0) @binding(18) 
var atmosphereTransmittanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: texture_2d<f32>;
@group(0) @binding(19) 
var atmosphereMultipleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: texture_2d<f32>;
@group(0) @binding(20) 
var atmosphereAerialLuminanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: texture_3d<f32>;
@group(0) @binding(21) 
var atmosphereAerialTransmittanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: texture_3d<f32>;
@group(0) @binding(23) 
var atmosphereDistantSkyLightX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: texture_2d<f32>;
@group(0) @binding(3) 
var shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: texture_depth_2d_array;
@group(0) @binding(4) 
var shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: sampler_comparison;
@group(0) @binding(16) 
var cloudShadowMapX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX: texture_2d<f32>;
@group(0) @binding(17) 
var cloudShadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX: sampler;
@group(1) @binding(0) 
var<uniform> material: Material;
@group(1) @binding(1) 
var baseColorSampler: sampler;
@group(1) @binding(2) 
var baseColorTexture: texture_2d<f32>;

fn sampleMaterialTextureLinearX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(texture: texture_2d<f32>, textureSampler: sampler, uv: vec2<f32>, uvScale: vec2<f32>) -> vec4<f32> {
    let _e5 = textureSample(texture, textureSampler, (uv * uvScale));
    return _e5;
}

fn sampleMaterialTextureX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(texture_1: texture_2d<f32>, textureSampler_1: sampler, uv_1: vec2<f32>, uvScale_1: vec2<f32>) -> vec4<f32> {
    let _e4 = sampleMaterialTextureLinearX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(texture_1, textureSampler_1, uv_1, uvScale_1);
    return _e4;
}

fn meshMotionValidX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(flags: f32) -> bool {
    return ((u32(flags) & 1u) != 0u);
}

fn clippedByPlanesX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(positionWS: vec3<f32>, planes: array<vec4<f32>, 6>, control: vec4<f32>) -> bool {
    var allOutside: bool;
    var anyOutside: bool = false;
    var index: u32 = 0u;
    var local: bool;
    var local_1: bool;

    let count_1 = min(u32(max(control.x, 0f)), 6u);
    allOutside = (count_1 > 0u);
    loop {
        let _e13 = index;
        if (_e13 < count_1) {
        } else {
            break;
        }
        {
            let _e17 = index;
            let _e21 = index;
            let outside = ((dot(planes[_e17].xyz, positionWS) + planes[_e21].w) < 0f);
            let _e28 = anyOutside;
            if !(_e28) {
                local = outside;
            } else {
                local = true;
            }
            let _e33 = local;
            anyOutside = _e33;
            let _e34 = allOutside;
            if _e34 {
                local_1 = outside;
            } else {
                local_1 = false;
            }
            let _e38 = local_1;
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
    var local_2: bool;
    var local_3: bool;

    if !(!(shadow)) {
        local_2 = (control_1.z > 0.5f);
    } else {
        local_2 = true;
    }
    let _e10 = local_2;
    if _e10 {
        let _e13 = clippedByPlanesX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(positionWS_1, planes_1, control_1);
        local_3 = _e13;
    } else {
        local_3 = false;
    }
    let _e17 = local_3;
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

fn atmosphere_visibility_sampleX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2OZUXG2LCNFWGS5DZX(v: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, m: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, p: vec3<f32>, depth: texture_depth_2d_array, comparison: sampler_comparison, cloud: texture_2d<f32>, filtering: sampler) -> f32 {
    var visibility: f32 = 1f;
    var layer: u32 = 0u;
    var matrix: mat4x4<f32>;
    var local_4: bool;
    var local_5: bool;
    var local_6: bool;
    var local_7: bool;
    var local_8: bool;
    var local_9: bool;
    var factor: f32;
    var local_10: bool;

    let world = (((p - vec3<f32>(0f, m.originRadius.w, 0f)) + m.originRadius.xyz) * 1000f);
    let count_2 = min(u32(max(v.cascadeCount, 0f)), 4u);
    loop {
        let _e23 = layer;
        if (_e23 < count_2) {
        } else {
            break;
        }
        {
            matrix = v.lightViewProj_A;
            let _e27 = layer;
            if (_e27 == 1u) {
                matrix = v.lightViewProj_B;
            }
            let _e31 = layer;
            if (_e31 == 2u) {
                matrix = v.lightViewProj_C;
            }
            let _e35 = layer;
            if (_e35 == 3u) {
                matrix = v.lightViewProj_D;
            }
            let _e39 = matrix;
            let clip_3 = (_e39 * vec4<f32>(world, 1f));
            let ndc = (clip_3.xyz / vec3(clip_3.w));
            let uv_4 = ((ndc.xy * vec2<f32>(0.5f, -0.5f)) + vec2(0.5f));
            if all((uv_4 >= vec2(0f))) {
                local_4 = all((uv_4 <= vec2(1f)));
            } else {
                local_4 = false;
            }
            let _e66 = local_4;
            if _e66 {
                local_5 = (ndc.z >= 0f);
            } else {
                local_5 = false;
            }
            let _e73 = local_5;
            if _e73 {
                local_6 = (ndc.z <= 1f);
            } else {
                local_6 = false;
            }
            let _e80 = local_6;
            if _e80 {
                let _e83 = layer;
                let _e88 = textureSampleCompareLevel(depth, comparison, uv_4, i32(_e83), (ndc.z + v.depthBias));
                visibility = _e88;
                break;
            }
        }
        continuing {
            let _e90 = layer;
            layer = (_e90 + 1u);
        }
    }
    if (v.cloudShadowProjection.y > 0.5f) {
        local_7 = (v.cloudShadowProjection.z < 0.5f);
    } else {
        local_7 = false;
    }
    let _e104 = local_7;
    if _e104 {
        local_8 = (v.cloudShadowProjection.x > 0f);
    } else {
        local_8 = false;
    }
    let _e112 = local_8;
    if _e112 {
        let offset = (world - v.cloudShadowOrigin.xyz);
        let uv_5 = ((vec2<f32>(dot(offset, v.cloudShadowRight.xyz), dot(offset, v.cloudShadowUp.xyz)) / vec2(v.cloudShadowProjection.x)) + vec2(0.5f));
        if all((uv_5 >= vec2(0f))) {
            local_9 = all((uv_5 <= vec2(1f)));
        } else {
            local_9 = false;
        }
        let _e141 = local_9;
        if _e141 {
            let column = textureSampleLevel(cloud, filtering, uv_5, 0f);
            factor = clamp(column.x, 0f, 1f);
            if (v.cloudShadowRight.w > 0f) {
                local_10 = (column.x < 1f);
            } else {
                local_10 = false;
            }
            let _e161 = local_10;
            if _e161 {
                let height = ((world.y - v.cloudShadowOrigin.w) / v.cloudShadowRight.w);
                let remaining = clamp(((column.z - height) / max((column.z - column.y), 0.0001f)), 0f, 1f);
                factor = exp((-(max(column.w, 0f)) * remaining));
            }
            let _e186 = visibility;
            let _e187 = factor;
            visibility = (_e186 * _e187);
        }
    }
    let _e189 = visibility;
    return _e189;
}

fn atmosphere_scene_visibilityX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2OZUXG2LCNFWGS5DZX(m_1: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, p_1: vec3<f32>) -> f32 {
    let _e1 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
    let _e8 = atmosphere_visibility_sampleX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2OZUXG2LCNFWGS5DZX(_e1, m_1, p_1, shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, cloudShadowMapX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX, cloudShadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX);
    return _e8;
}

fn atmosphere_positionX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_2: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPosition: vec3<f32>) -> vec3<f32> {
    return (((worldPosition * 0.001f) - m_2.originRadius.xyz) + vec3<f32>(0f, m_2.originRadius.w, 0f));
}

fn atmosphere_sphereX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(p_2: vec3<f32>, direction: vec3<f32>, radius: f32) -> vec2<f32> {
    let b = dot(p_2, direction);
    let lengthP = length(p_2);
    let c = ((lengthP - radius) * (lengthP + radius));
    let discriminant = ((b * b) - c);
    if (discriminant < 0f) {
        return vec2(-1f);
    }
    let root = sqrt(discriminant);
    return vec2<f32>((-(b) - root), (-(b) + root));
}

fn atmosphere_planet_visibilityX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_3: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, p_3: vec3<f32>, sun: vec3<f32>) -> f32 {
    let _e5 = atmosphere_sphereX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(p_3, sun, m_3.originRadius.w);
    return select(1f, 0f, (_e5.x > 0.00001f));
}

fn atmosphere_transmittance_uvX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_4: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, p_4: vec3<f32>, direction_1: vec3<f32>) -> vec2<f32> {
    let bottom = m_4.originRadius.w;
    let top = (bottom + m_4.geometry.x);
    let radius_1 = clamp(length(p_4), bottom, top);
    let mu_2 = (dot(p_4, direction_1) / max(length(p_4), 0.0001f));
    let H = sqrt(((top - bottom) * (top + bottom)));
    let rho = sqrt(max(((radius_1 - bottom) * (radius_1 + bottom)), 0f));
    let distance_5 = max(((-(radius_1) * mu_2) + sqrt(max(((((radius_1 * radius_1) * mu_2) * mu_2) + ((top - radius_1) * (top + radius_1))), 0f))), 0f);
    let minimum = (top - radius_1);
    let maximum = (rho + H);
    return vec2<f32>(((distance_5 - minimum) / max((maximum - minimum), 0.00001f)), (rho / H));
}

fn atmosphere_sub_uvX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(uv_2: vec2<f32>, size: vec2<u32>) -> vec2<f32> {
    return ((vec2(0.5f) + (clamp(uv_2, vec2(0f), vec2(1f)) * (vec2<f32>(size) - vec2(1f)))) / vec2<f32>(size));
}

fn atmosphere_solar_transmittanceX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_5: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, p_5: vec3<f32>, sun_1: vec3<f32>, lut: texture_2d<f32>, filtering_1: sampler) -> vec3<f32> {
    var position: vec3<f32>;

    let _e3 = atmosphere_planet_visibilityX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_5, p_5, sun_1);
    if (_e3 < 0.5f) {
        return vec3(0f);
    }
    position = p_5;
    let top_1 = (m_5.originRadius.w + m_5.geometry.x);
    let _e14 = position;
    if (length(_e14) > top_1) {
        let _e17 = position;
        let _e18 = atmosphere_sphereX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(_e17, sun_1, top_1);
        if (_e18.x < 0f) {
            return vec3(1f);
        }
        let _e24 = position;
        position = (_e24 + (sun_1 * _e18.x));
    }
    let _e28 = position;
    let _e29 = atmosphere_transmittance_uvX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_5, _e28, sun_1);
    let _e31 = textureDimensions(lut);
    let _e32 = atmosphere_sub_uvX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(_e29, _e31);
    let _e35 = textureSampleLevel(lut, filtering_1, _e32, 0f);
    return _e35.xyz;
}

fn atmosphere_rayleigh_phaseX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(mu: f32) -> f32 {
    return ((3f * (1f + (mu * mu))) / 50.265484f);
}

fn atmosphere_mie_phaseX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(mu_1: f32, g: f32) -> f32 {
    return ((1f - (g * g)) / (12.566371f * pow(max(((1f + (g * g)) - ((2f * g) * mu_1)), 0.0001f), 1.5f)));
}

fn atmosphere_intervalX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_6: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, p_6: vec3<f32>, d: vec3<f32>, distance_: f32) -> vec2<f32> {
    var end: f32;

    let _e8 = atmosphere_sphereX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(p_6, d, (m_6.originRadius.w + m_6.geometry.x));
    if (_e8.y <= 0f) {
        return vec2(0f);
    }
    let start = max(_e8.x, 0f);
    end = min(_e8.y, distance_);
    let _e23 = atmosphere_sphereX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(p_6, d, m_6.originRadius.w);
    if (_e23.x >= 0f) {
        let _e27 = end;
        end = min(_e27, _e23.x);
    }
    let _e30 = end;
    return vec2<f32>(start, max(start, _e30));
}

fn atmosphere_heightX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_7: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, p_7: vec3<f32>) -> f32 {
    return max((length(p_7) - m_7.originRadius.w), 0f);
}

fn atmosphere_mediumX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_8: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, p_8: vec3<f32>) -> AtmosphereOpticalSampleX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    let _e2 = atmosphere_heightX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_8, p_8);
    let r = (m_8.rayleigh.xyz * exp((-(_e2) / m_8.rayleigh.w)));
    let densityM = exp((-(_e2) / m_8.mie.z));
    let s = vec3((m_8.mie.x * densityM));
    let a = (m_8.absorption.xyz * max(0f, (1f - (abs((_e2 - m_8.absorption.w)) / m_8.ground.w))));
    return AtmosphereOpticalSampleX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX((((r + s) + vec3((m_8.mie.y * densityM))) + a), r, s);
}

fn atmosphere_multi_sourceX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_9: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, p_9: vec3<f32>, sun_2: vec3<f32>, lut_1: texture_2d<f32>, filtering_2: sampler) -> vec3<f32> {
    let mu_3 = dot(normalize(p_9), sun_2);
    let _e9 = atmosphere_heightX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_9, p_9);
    let uv_6 = vec2<f32>(((mu_3 * 0.5f) + 0.5f), (_e9 / m_9.geometry.x));
    let _e15 = textureDimensions(lut_1);
    let _e16 = atmosphere_sub_uvX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(uv_6, _e15);
    let _e19 = textureSampleLevel(lut_1, filtering_2, _e16, 0f);
    return (_e19.xyz * m_9.geometry.y);
}

fn atmosphere_segmentX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(extinction: vec3<f32>, distance_1: f32) -> vec3<f32> {
    let x = (extinction * distance_1);
    let regular = ((vec3(1f) - exp(-(x))) / max(extinction, vec3(0.00000000000000000001f)));
    return select(regular, (distance_1 * ((vec3(1f) - (x * 0.5f)) + ((x * x) / vec3(6f)))), (x < vec3(0.001f)));
}

fn atmosphere_integrate_phasesX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_10: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, origin: vec3<f32>, direction_2: vec3<f32>, distance_2: f32, sun_3: vec3<f32>, irradiance: vec3<f32>, transmittance: texture_2d<f32>, multiple: texture_2d<f32>, filtering_3: sampler, sampleCount: u32, opticalScale: f32, phases: vec2<f32>) -> AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    var result: AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX = AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(vec3(0f), vec3(1f));
    var i: u32 = 0u;

    let _e10 = atmosphere_intervalX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_10, origin, direction_2, distance_2);
    let count_3 = max(sampleCount, 1u);
    let length_ = (_e10.y - _e10.x);
    let phaseR = phases.x;
    let phaseM = phases.y;
    loop {
        let _e21 = i;
        if (_e21 < count_3) {
        } else {
            break;
        }
        {
            let _e23 = i;
            let begin = (pow((f32(_e23) / f32(count_3)), 2f) * length_);
            let _e30 = i;
            let end_1 = (pow((f32((_e30 + 1u)) / f32(count_3)), 2f) * length_);
            let step_ = (end_1 - begin);
            let p_10 = (origin + (direction_2 * (_e10.x + ((begin + end_1) * 0.5f))));
            let _e47 = atmosphere_mediumX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_10, p_10);
            let _e51 = atmosphere_solar_transmittanceX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_10, p_10, sun_3, transmittance, filtering_3);
            let _e52 = atmosphere_scene_visibilityX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2OZUXG2LCNFWGS5DZX(m_10, p_10);
            let solar = (_e51 * _e52);
            let _e55 = atmosphere_multi_sourceX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_10, p_10, sun_3, multiple, filtering_3);
            let source_2 = (irradiance * ((solar * ((_e47.rayleigh * phaseR) + (_e47.mie * phaseM))) + (_e55 * (_e47.rayleigh + _e47.mie))));
            let _e72 = result.luminance;
            let _e74 = result.transmittance;
            let _e78 = atmosphere_segmentX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(_e47.extinction, (step_ * opticalScale));
            result.luminance = (_e72 + ((_e74 * source_2) * _e78));
            let _e82 = result.transmittance;
            result.transmittance = (_e82 * exp(((-(_e47.extinction) * step_) * opticalScale)));
        }
        continuing {
            let _e89 = i;
            i = (_e89 + 1u);
        }
    }
    let _e92 = result;
    return _e92;
}

fn atmosphere_integrateX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_11: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, origin_1: vec3<f32>, direction_3: vec3<f32>, distance_3: f32, sun_4: vec3<f32>, irradiance_1: vec3<f32>, transmittance_1: texture_2d<f32>, multiple_1: texture_2d<f32>, filtering_4: sampler, sampleCount_1: u32, opticalScale_1: f32) -> AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    let mu_4 = dot(direction_3, sun_4);
    let _e3 = atmosphere_rayleigh_phaseX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(mu_4);
    let _e7 = atmosphere_mie_phaseX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(mu_4, m_11.mie.w);
    let _e17 = atmosphere_integrate_phasesX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_11, origin_1, direction_3, distance_3, sun_4, irradiance_1, transmittance_1, multiple_1, filtering_4, sampleCount_1, opticalScale_1, vec2<f32>(_e3, _e7));
    return _e17;
}

fn atmosphere_view_rayX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2MNXW64TENFXGC5DFOMX(v_1: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, uv_3: vec2<f32>) -> AtmosphereRayX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2MNXW64TENFXGC5DFOMX {
    let ndc_1 = vec2<f32>(((uv_3.x * 2f) - 1f), (1f - (uv_3.y * 2f)));
    let near4_ = (v_1.inverseViewProj * vec4<f32>(ndc_1, 1f, 1f));
    let far4_ = (v_1.inverseViewProj * vec4<f32>(ndc_1, 0f, 1f));
    let near = (near4_.xyz / vec3(near4_.w));
    let direction_5 = normalize((far4_.xyz - (near * far4_.w)));
    let origin_4 = select(v_1.cameraPos, (near - (direction_5 * v_1.temporalProjection.x)), (v_1.temporalProjection.z > 0.5f));
    return AtmosphereRayX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2MNXW64TENFXGC5DFOMX(origin_4, direction_5);
}

fn atmosphere_observerX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2MNXW64TENFXGC5DFOMX(m_12: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPosition_1: vec3<f32>) -> vec3<f32> {
    let _e2 = atmosphere_positionX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_12, worldPosition_1);
    let radius_2 = length(_e2);
    return select(vec3<f32>(0f, (m_12.originRadius.w + 0.001f), 0f), ((_e2 / vec3(max(radius_2, 0.0001f))) * max(radius_2, (m_12.originRadius.w + 0.001f))), (radius_2 > 0.0001f));
}

fn atmosphere_aerial_integrateX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2ONQW24DMNFXGOX(v_2: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, origin_2: vec3<f32>, direction_4: vec3<f32>, distance_4: f32, transmittance_2: texture_2d<f32>, multiple_2: texture_2d<f32>, filtering_5: sampler, count: u32) -> AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    var local_11: bool;

    let start_1 = v_2.atmosphere.geometry.z;
    if !((distance_4 <= start_1)) {
        local_11 = (v_2.atmosphere.geometry.w <= 0f);
    } else {
        local_11 = true;
    }
    let _e15 = local_11;
    if _e15 {
        return AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(vec3(0f), vec3(1f));
    }
    let _e38 = atmosphere_integrateX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(v_2.atmosphere, (origin_2 + (direction_4 * start_1)), direction_4, (distance_4 - start_1), normalize(-(v_2.lightDir)), v_2.lightColor, transmittance_2, multiple_2, filtering_5, count, v_2.atmosphere.geometry.w);
    return _e38;
}

fn atmosphere_aerial_sampleX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2ONQW24DMNFXGOX(v_3: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPosition_2: vec3<f32>, transmittance_3: texture_2d<f32>, multiple_3: texture_2d<f32>, luminance: texture_3d<f32>, extinction_1: texture_3d<f32>, filtering_6: sampler) -> AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    var local_12: bool;
    var local_13: bool;
    var local_14: bool;
    var local_15: bool;
    var local_16: bool;
    var result_1: AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX;

    if (v_3.atmosphereControl.w < 0.5f) {
        return AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(vec3(0f), vec3(1f));
    }
    let clip_4 = (v_3.worldViewProj * vec4<f32>(worldPosition_2, 1f));
    let uv_7 = (((clip_4.xy / vec2(clip_4.w)) * vec2<f32>(0.5f, -0.5f)) + vec2(0.5f));
    let _e26 = atmosphere_view_rayX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2MNXW64TENFXGC5DFOMX(v_3, uv_7);
    let distance_6 = (length((worldPosition_2 - _e26.origin)) * 0.001f);
    let start_2 = v_3.atmosphere.geometry.z;
    if (distance_6 <= start_2) {
        return AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(vec3(0f), vec3(1f));
    }
    let _e43 = atmosphere_observerX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2MNXW64TENFXGC5DFOMX(v_3.atmosphere, _e26.origin);
    let range = v_3.atmosphereControl.z;
    let _e47 = textureDimensions(luminance);
    let slices = f32(_e47.z);
    let first = (start_2 + (range * pow((0.5f / slices), 2f)));
    let last = (start_2 + (range * pow((1f - (0.5f / slices)), 2f)));
    if all((uv_7 >= vec2(0f))) {
        local_12 = all((uv_7 <= vec2(1f)));
    } else {
        local_12 = false;
    }
    let inside = local_12;
    if !((v_3.atmosphereControl.x > 0f)) {
        local_13 = (v_3.temporalProjection.z > 0.5f);
    } else {
        local_13 = true;
    }
    let _e88 = local_13;
    if !(_e88) {
        local_14 = (length(_e43) >= (v_3.atmosphere.originRadius.w + v_3.atmosphere.geometry.x));
    } else {
        local_14 = true;
    }
    let _e102 = local_14;
    if !(_e102) {
        local_15 = !(inside);
    } else {
        local_15 = true;
    }
    let _e108 = local_15;
    if !(_e108) {
        local_16 = (distance_6 >= (start_2 + range));
    } else {
        local_16 = true;
    }
    let _e115 = local_16;
    if _e115 {
        let _e125 = atmosphere_aerial_integrateX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2ONQW24DMNFXGOX(v_3, _e43, _e26.direction, distance_6, transmittance_3, multiple_3, filtering_6, u32(max(64f, v_3.atmosphereControl.x)));
        return _e125;
    }
    let coordinate = vec3<f32>(uv_7, sqrt(max(((distance_6 - start_2) / range), 0f)));
    let _e133 = textureSampleLevel(luminance, filtering_6, coordinate, 0f);
    let _e139 = textureSampleLevel(extinction_1, filtering_6, coordinate, 0f);
    result_1 = AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX((_e133.xyz * v_3.lightColor), _e139.xyz);
    if (distance_6 < first) {
        let weight = ((distance_6 - start_2) / (first - start_2));
        let _e148 = result_1.luminance;
        result_1.luminance = (_e148 * weight);
        let _e154 = result_1.transmittance;
        result_1.transmittance = mix(vec3(1f), _e154, weight);
    }
    if (distance_6 > last) {
        let _e159 = atmosphere_aerial_integrateX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2ONQW24DMNFXGOX(v_3, _e43, _e26.direction, distance_6, transmittance_3, multiple_3, filtering_6, 64u);
        let weight_1 = smoothstep(last, (start_2 + range), distance_6);
        let _e164 = result_1.luminance;
        result_1.luminance = mix(_e164, _e159.luminance, weight_1);
        let _e169 = result_1.transmittance;
        result_1.transmittance = mix(_e169, _e159.transmittance, weight_1);
    }
    let _e172 = result_1;
    return _e172;
}

fn cloud_direct_solar_factorX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX(worldPosition_3: vec3<f32>, shadowOrigin: vec3<f32>, shadowRight: vec3<f32>, shadowUp: vec3<f32>, shadowProjection: vec4<f32>) -> f32 {
    var local_17: bool;
    var local_18: bool;
    var local_19: bool;
    var local_20: bool;
    var local_21: bool;
    var local_22: bool;
    var local_23: bool;
    var local_24: bool;

    if (worldPosition_3.x == worldPosition_3.x) {
        local_17 = (worldPosition_3.y == worldPosition_3.y);
    } else {
        local_17 = false;
    }
    let _e10 = local_17;
    if _e10 {
        local_18 = (worldPosition_3.z == worldPosition_3.z);
    } else {
        local_18 = false;
    }
    let _e17 = local_18;
    if _e17 {
        local_19 = all((abs(worldPosition_3) < vec3(3.402823e38f)));
    } else {
        local_19 = false;
    }
    let validReceiver = local_19;
    let offset_1 = (worldPosition_3 - shadowOrigin);
    let uv_8 = ((vec2<f32>(dot(offset_1, shadowRight), dot(offset_1, shadowUp)) / vec2(max(shadowProjection.x, 0.000001f))) + vec2(0.5f));
    if all((uv_8 >= vec2(0f))) {
        local_20 = all((uv_8 <= vec2(1f)));
    } else {
        local_20 = false;
    }
    let inRange = local_20;
    if (shadowProjection.y > 0.5f) {
        local_21 = (shadowProjection.z < 0.5f);
    } else {
        local_21 = false;
    }
    let _e64 = local_21;
    if _e64 {
        local_22 = (shadowProjection.x > 0f);
    } else {
        local_22 = false;
    }
    let available = local_22;
    let _e80 = textureSampleLevel(cloudShadowMapX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX, cloudShadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX, clamp(uv_8, vec2(0f), vec2(1f)), 0f);
    let sampled = _e80.x;
    if validReceiver {
        local_23 = inRange;
    } else {
        local_23 = false;
    }
    let _e88 = local_23;
    if _e88 {
        local_24 = available;
    } else {
        local_24 = false;
    }
    let _e92 = local_24;
    return select(1f, clamp(sampled, 0f, 1f), _e92);
}

fn view_atmosphereX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_4: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, position_1: vec3<f32>) -> AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    let _e7 = atmosphere_aerial_sampleX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2ONQW24DMNFXGOX(v_4, position_1, atmosphereTransmittanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, atmosphereMultipleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, atmosphereAerialLuminanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, atmosphereAerialTransmittanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, cloudShadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX);
    return _e7;
}

fn view_solar_transmittanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_5: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, position_2: vec3<f32>) -> vec3<f32> {
    if (v_5.atmosphereControl.w > 0.5f) {
        let _e8 = atmosphere_positionX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(v_5.atmosphere, position_2);
        let _e14 = atmosphere_solar_transmittanceX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(v_5.atmosphere, _e8, normalize(-(v_5.lightDir)), atmosphereTransmittanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, cloudShadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX);
        return _e14;
    }
    return vec3(1f);
}

fn view_distant_sky_lightX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_6: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX) -> vec3<f32> {
    if (v_6.atmosphereControl.w > 0.5f) {
        let _e9 = textureLoad(atmosphereDistantSkyLightX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, vec2(0i), 0i);
        return (_e9.xyz * v_6.lightColor);
    }
    return vec3(0f);
}

fn fogOpticalDepthX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(params: FogViewParamsX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX, ray: FogRayX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX) -> f32 {
    var integral: f32;

    let rho_1 = (params.density * exp(clamp((-(params.heightFalloff) * ray.origin.y), -60f, 60f)));
    let t = clamp(((params.heightFalloff * ray.direction.y) * ray.distance), -60f, 60f);
    integral = ((1f - (t * 0.5f)) + ((t * t) / 6f));
    if (abs(t) >= 0.001f) {
        integral = ((1f - exp(-(t))) / t);
    }
    let _e41 = integral;
    return clamp(((rho_1 * ray.distance) * _e41), 0f, 80f);
}

fn height_fog_with_sourceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_7: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos: vec3<f32>, source: vec3<f32>) -> FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
    var origin_3: vec3<f32>;

    origin_3 = v_7.cameraPos;
    if (v_7.temporalProjection.z > 0.5f) {
        let forward = -(normalize(vec3<f32>(v_7.worldViewProj[0].z, v_7.worldViewProj[1].z, v_7.worldViewProj[2].z)));
        origin_3 = (worldPos - (forward * dot((worldPos - v_7.cameraPos), forward)));
    }
    let _e25 = origin_3;
    let delta = (worldPos - _e25);
    let distance_7 = length(delta);
    if (distance_7 < 0.00001f) {
        return FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(vec3(0f), 1f);
    }
    let params_1 = FogViewParamsX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_7.fogColorDensity.xyz, v_7.fogColorDensity.w, v_7.fogHeightOpacity.x, v_7.fogHeightOpacity.y);
    let _e44 = origin_3;
    let _e48 = fogOpticalDepthX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(params_1, FogRayX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(_e44, (delta / vec3(distance_7)), distance_7));
    let opacity = (params_1.maxOpacity * (1f - exp(-(_e48))));
    return FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX((source * opacity), (1f - opacity));
}

fn height_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_8: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos_1: vec3<f32>) -> FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
    var source_1: vec3<f32>;

    source_1 = v_8.fogColorDensity.xyz;
    if (v_8.atmosphereControl.w > 0.5f) {
        let ground = ((v_8.atmosphere.originRadius.xyz * 1000f) + vec3<f32>(0f, 1f, 0f));
        let _e18 = source_1;
        let _e19 = view_distant_sky_lightX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_8);
        let _e20 = view_solar_transmittanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_8, ground);
        source_1 = (_e18 + (_e19 + ((_e20 * v_8.lightColor) / vec3(12.566371f))));
    }
    let _e28 = source_1;
    let _e30 = height_fog_with_sourceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_8, worldPos_1, _e28);
    return _e30;
}

fn view_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_9: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, position_3: vec3<f32>) -> AtmosphereFogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
    let _e2 = height_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_9, position_3);
    let _e3 = view_atmosphereX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_9, position_3);
    return AtmosphereFogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX((_e2.inscatter + (_e2.transmittance * _e3.luminance)), (_e2.transmittance * _e3.transmittance));
}

fn translucent_fog_transmissionX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_10: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos_2: vec3<f32>, color: vec3<f32>, alpha: f32, backdrop: vec3<f32>, transmission: vec3<f32>) -> vec3<f32> {
    var local_25: bool;

    let composition = u32((v_10.fogHeightOpacity.z + 0.5f));
    if (composition == 0u) {
        local_25 = all((transmission == vec3(0f)));
    } else {
        local_25 = false;
    }
    let _e16 = local_25;
    if _e16 {
        return color;
    }
    let _e19 = view_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_10, worldPos_2);
    let coverage = select(1f, alpha, (composition == 2u));
    let inscatter = select((((vec3(1f) - transmission) * _e19.inscatter) * coverage), vec3(0f), (composition == 3u));
    return ((((color - backdrop) * _e19.transmittance) + backdrop) + inscatter);
}

fn translucent_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_11: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos_3: vec3<f32>, color_1: vec3<f32>, alpha_1: f32) -> vec3<f32> {
    let _e8 = translucent_fog_transmissionX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_11, worldPos_3, color_1, alpha_1, vec3(0f), vec3(0f));
    return _e8;
}

fn sceneTemporalUvX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(clip: vec4<f32>) -> vec2<f32> {
    let safeW = select(0.000001f, clip.w, (abs(clip.w) >= 0.000001f));
    let ndc_2 = (clip.xy / vec2(safeW));
    return vec2<f32>(((ndc_2.x * 0.5f) + 0.5f), (0.5f - (ndc_2.y * 0.5f)));
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

fn packSceneTemporalV1WithValidityX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(currentClip: vec4<f32>, previousClip: vec4<f32>, temporalProjection_2: vec4<f32>, reactive: f32, motionValid_1: bool) -> vec4<f32> {
    let _e1 = sceneTemporalUvX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(currentClip);
    let _e3 = sceneTemporalUvX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(previousClip);
    let _e6 = sceneTemporalViewDepthX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(currentClip, temporalProjection_2);
    return vec4<f32>((_e1 - _e3), _e6, (clamp(reactive, 0f, 1f) + select(0f, 2f, !(motionValid_1))));
}

fn materialTextureFilteringWitness() {
    let baseWitness = textureSample(baseColorTexture, baseColorSampler, vec2(0f));
    return;
}

fn resolveSpriteVertex(in_5: VsIn, idx_2: u32, vertex_index_2: u32) -> SpriteVertex {
    var selectedRegion: vec4<f32>;
    var pos_local: vec3<f32>;
    var uv_atlas: vec2<f32>;
    var u_uv_arr: array<f32, 4>;
    var v_uv_arr: array<f32, 4>;
    var out_2: SpriteVertex;

    let _e2 = material.region;
    selectedRegion = _e2;
    let _e8 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].surface.w;
    if (_e8 != 0u) {
        let _e14 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].spriteRegion;
        selectedRegion = _e14;
    }
    let _e19 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx_2].region;
    selectedRegion = _e19;
    let _e22 = material.flipX;
    if (_e22 != 0f) {
        let _e26 = selectedRegion.x;
        let _e28 = selectedRegion.z;
        selectedRegion.x = (_e26 + _e28);
        let _e32 = selectedRegion.z;
        selectedRegion.z = -(_e32);
    }
    let _e36 = material.flipY;
    if (_e36 != 0f) {
        let _e40 = selectedRegion.y;
        let _e42 = selectedRegion.w;
        selectedRegion.y = (_e40 + _e42);
        let _e46 = selectedRegion.w;
        selectedRegion.w = -(_e46);
    }
    let _e50 = material.pivotAndSize;
    let pivot = _e50.xy;
    let _e54 = material.slicesAndMode;
    let useSlices = any((_e54 != vec4(0f)));
    if useSlices {
        let _e61 = material.slicesAndMode;
        let abs_slices = abs(_e61);
        let _e66 = material.slicesAndMode.w;
        let is_tile = (_e66 < 0f);
        let i_1 = (vertex_index_2 % 4u);
        let j = (vertex_index_2 / 4u);
        let u_pos_arr = array<f32, 4>(0f, abs_slices.x, (1f - abs_slices.z), 1f);
        let v_pos_arr = array<f32, 4>(0f, abs_slices.y, (1f - abs_slices.w), 1f);
        let u_pos = u_pos_arr[i_1];
        let v_pos_top = v_pos_arr[j];
        let v_pos_eff = (1f - v_pos_top);
        pos_local = vec3<f32>((u_pos - pivot.x), (v_pos_eff - pivot.y), 0f);
        u_uv_arr = array<f32, 4>(0f, abs_slices.x, (1f - abs_slices.z), 1f);
        v_uv_arr = array<f32, 4>(0f, abs_slices.y, (1f - abs_slices.w), 1f);
        if is_tile {
            let mid_u = ((1f - abs_slices.x) - abs_slices.z);
            let mid_v = ((1f - abs_slices.y) - abs_slices.w);
            u_uv_arr[2] = (abs_slices.x + (2f * mid_u));
            let _e132 = u_uv_arr[2];
            u_uv_arr[3] = (_e132 + abs_slices.z);
            v_uv_arr[2] = (abs_slices.y + (2f * mid_v));
            let _e142 = v_uv_arr[2];
            v_uv_arr[3] = (_e142 + abs_slices.w);
        }
        let uv_u = u_uv_arr[i_1];
        let uv_v_top = v_uv_arr[j];
        let uv_v_eff = (1f - uv_v_top);
        let _e152 = selectedRegion;
        let _e155 = selectedRegion;
        uv_atlas = ((vec2<f32>(uv_u, uv_v_eff) * _e152.zw) + _e155.xy);
    } else {
        let uv_eff = vec2<f32>(in_5.uv.x, (1f - in_5.uv.y));
        pos_local = vec3<f32>((uv_eff - pivot), 0f);
        let _e170 = selectedRegion;
        let _e173 = selectedRegion;
        uv_atlas = ((uv_eff * _e170.zw) + _e173.xy);
    }
    let _e178 = pos_local;
    out_2.posLocal = _e178;
    let _e180 = uv_atlas;
    out_2.uvAtlas = _e180;
    let _e181 = out_2;
    return _e181;
}

fn linear_to_srgb(linear: f32) -> f32 {
    let c_1 = clamp(linear, 0f, 1f);
    return select((c_1 * 12.92f), ((pow(c_1, 0.41666666f) * 1.055f) - 0.055f), (c_1 > 0.0031308f));
}

@vertex 
fn vs_main(in: VsIn, @builtin(instance_index) idx: u32, @builtin(vertex_index) vertex_index: u32) -> VsOut {
    var out: VsOut;

    let _e3 = resolveSpriteVertex(in, idx, vertex_index);
    let _e7 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].worldFromLocal;
    let _e11 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx].localFromInstance;
    let world_1 = ((_e7 * _e11) * vec4<f32>(_e3.posLocal, 1f));
    let _e21 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    out.clip = (_e21 * world_1);
    out.uv_atlas = _e3.uvAtlas;
    out.worldPos = world_1.xyz;
    let _e27 = out;
    return _e27;
}

@fragment 
fn fs_main(in_1: VsOut) -> @location(0) vec4<f32> {
    applyViewClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(in_1.worldPos, false);
    let _e6 = material.baseColorTextureCoordinatesMetadata;
    let _e10 = sampleMaterialTextureX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(baseColorTexture, baseColorSampler, in_1.uv_atlas, _e6.zw);
    let _e13 = material.colorTint;
    let rgba = clamp((_e10 * _e13), vec4(0f), vec4(1f));
    let _e21 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
    let _e27 = translucent_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(_e21, in_1.worldPos, (rgba.xyz * rgba.w), rgba.w);
    let premult = vec4<f32>(_e27, rgba.w);
    let _e31 = linear_to_srgb(premult.x);
    let _e33 = linear_to_srgb(premult.y);
    let _e35 = linear_to_srgb(premult.z);
    return vec4<f32>(_e31, _e33, _e35, premult.w);
}

@fragment 
fn fs_main_hdr(in_2: VsOut) -> @location(0) vec4<f32> {
    applyViewClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(in_2.worldPos, false);
    let _e6 = material.baseColorTextureCoordinatesMetadata;
    let _e10 = sampleMaterialTextureX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(baseColorTexture, baseColorSampler, in_2.uv_atlas, _e6.zw);
    let _e13 = material.colorTint;
    let rgba_1 = clamp((_e10 * _e13), vec4(0f), vec4(1f));
    let _e21 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
    let _e27 = translucent_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(_e21, in_2.worldPos, (rgba_1.xyz * rgba_1.w), rgba_1.w);
    return vec4<f32>(_e27, rgba_1.w);
}

@vertex 
fn vs_temporal(in_3: VsIn, @builtin(instance_index) idx_1: u32, @builtin(vertex_index) vertex_index_1: u32) -> TemporalVsOut {
    var previousWorld: vec4<f32>;
    var out_1: TemporalVsOut;

    let _e3 = resolveSpriteVertex(in_3, idx_1, vertex_index_1);
    let _e7 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].worldFromLocal;
    let _e11 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx_1].localFromInstance;
    let currentWorld = ((_e7 * _e11) * vec4<f32>(_e3.posLocal, 1f));
    previousWorld = currentWorld;
    let _e21 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].previousWorldFromLocal;
    let _e25 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx_1].previousLocalFromInstance;
    previousWorld = ((_e21 * _e25) * vec4<f32>(_e3.posLocal, 1f));
    out_1.clippingPositionWS = currentWorld.xyz;
    let _e37 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalCurrentViewProj;
    out_1.currentClip = (_e37 * currentWorld);
    let _e42 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    out_1.clip = (_e42 * currentWorld);
    let _e47 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalPreviousViewProj;
    let _e48 = previousWorld;
    out_1.previousClip = (_e47 * _e48);
    out_1.uvAtlas = _e3.uvAtlas;
    let _e52 = out_1;
    return _e52;
}

@fragment 
fn fs_temporal(in_4: TemporalVsOut) -> @location(0) vec4<f32> {
    var motionValid: bool = true;

    applyViewClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(in_4.clippingPositionWS, false);
    let _e7 = material.baseColorTextureCoordinatesMetadata;
    let _e11 = sampleMaterialTextureX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(baseColorTexture, baseColorSampler, in_4.uvAtlas, _e7.zw);
    let _e16 = material.colorTint.w;
    let alpha_2 = clamp((_e11.w * _e16), 0f, 1f);
    if (alpha_2 <= 0f) {
        discard;
    }
    let _e27 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].temporal.y;
    let _e28 = meshMotionValidX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(_e27);
    motionValid = _e28;
    let _e34 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalProjection;
    let _e35 = motionValid;
    let _e37 = packSceneTemporalV1WithValidityX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(in_4.currentClip, in_4.previousClip, _e34, 1f, _e35);
    return _e37;
}
