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

struct AtmosphereOpticalSampleX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    extinction: vec3<f32>,
    rayleigh: vec3<f32>,
    mie: vec3<f32>,
}

struct AtmosphereRayX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2MNXW64TENFXGC5DFOMX {
    origin: vec3<f32>,
    direction: vec3<f32>,
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

const ATMOSPHERE_PIX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX: f32 = 3.1415927f;

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
@group(0) @binding(0) 
var<uniform> viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(0) @binding(3) 
var shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: texture_depth_2d_array;
@group(0) @binding(4) 
var shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: sampler_comparison;
@group(0) @binding(16) 
var cloudShadowMapX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX: texture_2d<f32>;
@group(0) @binding(17) 
var cloudShadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX: sampler;
@group(1) @binding(0) 
var<uniform> materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: MaterialParametersX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX;

fn atmosphere_visibility_sampleX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2OZUXG2LCNFWGS5DZX(v: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, m: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, p: vec3<f32>, depth: texture_depth_2d_array, comparison: sampler_comparison, cloud: texture_2d<f32>, filtering: sampler) -> f32 {
    var visibility: f32 = 1f;
    var layer: u32 = 0u;
    var matrix: mat4x4<f32>;
    var local: bool;
    var local_1: bool;
    var local_2: bool;
    var local_3: bool;
    var local_4: bool;
    var local_5: bool;
    var factor: f32;
    var local_6: bool;

    let world = (((p - vec3<f32>(0f, m.originRadius.w, 0f)) + m.originRadius.xyz) * 1000f);
    let count_1 = min(u32(max(v.cascadeCount, 0f)), 4u);
    loop {
        let _e23 = layer;
        if (_e23 < count_1) {
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
            let clip = (_e39 * vec4<f32>(world, 1f));
            let ndc_1 = (clip.xyz / vec3(clip.w));
            let uv_2 = ((ndc_1.xy * vec2<f32>(0.5f, -0.5f)) + vec2(0.5f));
            if all((uv_2 >= vec2(0f))) {
                local = all((uv_2 <= vec2(1f)));
            } else {
                local = false;
            }
            let _e66 = local;
            if _e66 {
                local_1 = (ndc_1.z >= 0f);
            } else {
                local_1 = false;
            }
            let _e73 = local_1;
            if _e73 {
                local_2 = (ndc_1.z <= 1f);
            } else {
                local_2 = false;
            }
            let _e80 = local_2;
            if _e80 {
                let _e83 = layer;
                let _e88 = textureSampleCompareLevel(depth, comparison, uv_2, i32(_e83), (ndc_1.z + v.depthBias));
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
        local_3 = (v.cloudShadowProjection.z < 0.5f);
    } else {
        local_3 = false;
    }
    let _e104 = local_3;
    if _e104 {
        local_4 = (v.cloudShadowProjection.x > 0f);
    } else {
        local_4 = false;
    }
    let _e112 = local_4;
    if _e112 {
        let offset = (world - v.cloudShadowOrigin.xyz);
        let uv_3 = ((vec2<f32>(dot(offset, v.cloudShadowRight.xyz), dot(offset, v.cloudShadowUp.xyz)) / vec2(v.cloudShadowProjection.x)) + vec2(0.5f));
        if all((uv_3 >= vec2(0f))) {
            local_5 = all((uv_3 <= vec2(1f)));
        } else {
            local_5 = false;
        }
        let _e141 = local_5;
        if _e141 {
            let column = textureSampleLevel(cloud, filtering, uv_3, 0f);
            factor = clamp(column.x, 0f, 1f);
            if (v.cloudShadowRight.w > 0f) {
                local_6 = (column.x < 1f);
            } else {
                local_6 = false;
            }
            let _e161 = local_6;
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

fn atmosphere_sphereX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(p_2: vec3<f32>, direction_1: vec3<f32>, radius: f32) -> vec2<f32> {
    let b = dot(p_2, direction_1);
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

fn atmosphere_transmittance_uvX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_4: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, p_4: vec3<f32>, direction_2: vec3<f32>) -> vec2<f32> {
    let bottom = m_4.originRadius.w;
    let top = (bottom + m_4.geometry.x);
    let radius_1 = clamp(length(p_4), bottom, top);
    let mu_2 = (dot(p_4, direction_2) / max(length(p_4), 0.0001f));
    let H = sqrt(((top - bottom) * (top + bottom)));
    let rho = sqrt(max(((radius_1 - bottom) * (radius_1 + bottom)), 0f));
    let distance_5 = max(((-(radius_1) * mu_2) + sqrt(max(((((radius_1 * radius_1) * mu_2) * mu_2) + ((top - radius_1) * (top + radius_1))), 0f))), 0f);
    let minimum = (top - radius_1);
    let maximum = (rho + H);
    return vec2<f32>(((distance_5 - minimum) / max((maximum - minimum), 0.00001f)), (rho / H));
}

fn atmosphere_sub_uvX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(uv: vec2<f32>, size: vec2<u32>) -> vec2<f32> {
    return ((vec2(0.5f) + (clamp(uv, vec2(0f), vec2(1f)) * (vec2<f32>(size) - vec2(1f)))) / vec2<f32>(size));
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
    let uv_4 = vec2<f32>(((mu_3 * 0.5f) + 0.5f), (_e9 / m_9.geometry.x));
    let _e15 = textureDimensions(lut_1);
    let _e16 = atmosphere_sub_uvX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(uv_4, _e15);
    let _e19 = textureSampleLevel(lut_1, filtering_2, _e16, 0f);
    return (_e19.xyz * m_9.geometry.y);
}

fn atmosphere_segmentX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(extinction: vec3<f32>, distance_1: f32) -> vec3<f32> {
    let x = (extinction * distance_1);
    let regular = ((vec3(1f) - exp(-(x))) / max(extinction, vec3(0.00000000000000000001f)));
    return select(regular, (distance_1 * ((vec3(1f) - (x * 0.5f)) + ((x * x) / vec3(6f)))), (x < vec3(0.001f)));
}

fn atmosphere_integrate_phasesX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_10: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, origin: vec3<f32>, direction_3: vec3<f32>, distance_2: f32, sun_3: vec3<f32>, irradiance: vec3<f32>, transmittance: texture_2d<f32>, multiple: texture_2d<f32>, filtering_3: sampler, sampleCount: u32, opticalScale: f32, phases: vec2<f32>) -> AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    var result: AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX = AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(vec3(0f), vec3(1f));
    var i_2: u32 = 0u;

    let _e10 = atmosphere_intervalX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_10, origin, direction_3, distance_2);
    let count_2 = max(sampleCount, 1u);
    let length_ = (_e10.y - _e10.x);
    let phaseR = phases.x;
    let phaseM = phases.y;
    loop {
        let _e21 = i_2;
        if (_e21 < count_2) {
        } else {
            break;
        }
        {
            let _e23 = i_2;
            let begin = (pow((f32(_e23) / f32(count_2)), 2f) * length_);
            let _e30 = i_2;
            let end_1 = (pow((f32((_e30 + 1u)) / f32(count_2)), 2f) * length_);
            let step_ = (end_1 - begin);
            let p_12 = (origin + (direction_3 * (_e10.x + ((begin + end_1) * 0.5f))));
            let _e47 = atmosphere_mediumX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_10, p_12);
            let _e51 = atmosphere_solar_transmittanceX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_10, p_12, sun_3, transmittance, filtering_3);
            let _e52 = atmosphere_scene_visibilityX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2OZUXG2LCNFWGS5DZX(m_10, p_12);
            let solar = (_e51 * _e52);
            let _e55 = atmosphere_multi_sourceX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_10, p_12, sun_3, multiple, filtering_3);
            let source = (irradiance * ((solar * ((_e47.rayleigh * phaseR) + (_e47.mie * phaseM))) + (_e55 * (_e47.rayleigh + _e47.mie))));
            let _e72 = result.luminance;
            let _e74 = result.transmittance;
            let _e78 = atmosphere_segmentX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(_e47.extinction, (step_ * opticalScale));
            result.luminance = (_e72 + ((_e74 * source) * _e78));
            let _e82 = result.transmittance;
            result.transmittance = (_e82 * exp(((-(_e47.extinction) * step_) * opticalScale)));
        }
        continuing {
            let _e89 = i_2;
            i_2 = (_e89 + 1u);
        }
    }
    let _e92 = result;
    return _e92;
}

fn atmosphere_integrateX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_11: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, origin_1: vec3<f32>, direction_4: vec3<f32>, distance_3: f32, sun_4: vec3<f32>, irradiance_1: vec3<f32>, transmittance_1: texture_2d<f32>, multiple_1: texture_2d<f32>, filtering_4: sampler, sampleCount_1: u32, opticalScale_1: f32) -> AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    let mu_4 = dot(direction_4, sun_4);
    let _e3 = atmosphere_rayleigh_phaseX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(mu_4);
    let _e7 = atmosphere_mie_phaseX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(mu_4, m_11.mie.w);
    let _e17 = atmosphere_integrate_phasesX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_11, origin_1, direction_4, distance_3, sun_4, irradiance_1, transmittance_1, multiple_1, filtering_4, sampleCount_1, opticalScale_1, vec2<f32>(_e3, _e7));
    return _e17;
}

fn atmosphere_view_rayX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2MNXW64TENFXGC5DFOMX(v_1: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, uv_1: vec2<f32>) -> AtmosphereRayX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2MNXW64TENFXGC5DFOMX {
    let ndc_2 = vec2<f32>(((uv_1.x * 2f) - 1f), (1f - (uv_1.y * 2f)));
    let near4_ = (v_1.inverseViewProj * vec4<f32>(ndc_2, 1f, 1f));
    let far4_ = (v_1.inverseViewProj * vec4<f32>(ndc_2, 0f, 1f));
    let near = (near4_.xyz / vec3(near4_.w));
    let direction_6 = normalize((far4_.xyz - (near * far4_.w)));
    let origin_3 = select(v_1.cameraPos, (near - (direction_6 * v_1.temporalProjection.x)), (v_1.temporalProjection.z > 0.5f));
    return AtmosphereRayX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2MNXW64TENFXGC5DFOMX(origin_3, direction_6);
}

fn atmosphere_observerX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2MNXW64TENFXGC5DFOMX(m_12: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPosition_1: vec3<f32>) -> vec3<f32> {
    let _e2 = atmosphere_positionX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(m_12, worldPosition_1);
    let radius_2 = length(_e2);
    return select(vec3<f32>(0f, (m_12.originRadius.w + 0.001f), 0f), ((_e2 / vec3(max(radius_2, 0.0001f))) * max(radius_2, (m_12.originRadius.w + 0.001f))), (radius_2 > 0.0001f));
}

fn atmosphere_aerial_integrateX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2ONQW24DMNFXGOX(v_2: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, origin_2: vec3<f32>, direction_5: vec3<f32>, distance_4: f32, transmittance_2: texture_2d<f32>, multiple_2: texture_2d<f32>, filtering_5: sampler, count: u32) -> AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    var local_7: bool;

    let start_1 = v_2.atmosphere.geometry.z;
    if !((distance_4 <= start_1)) {
        local_7 = (v_2.atmosphere.geometry.w <= 0f);
    } else {
        local_7 = true;
    }
    let _e15 = local_7;
    if _e15 {
        return AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(vec3(0f), vec3(1f));
    }
    let _e38 = atmosphere_integrateX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(v_2.atmosphere, (origin_2 + (direction_5 * start_1)), direction_5, (distance_4 - start_1), normalize(-(v_2.lightDir)), v_2.lightColor, transmittance_2, multiple_2, filtering_5, count, v_2.atmosphere.geometry.w);
    return _e38;
}

fn atmosphere_aerial_sampleX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2ONQW24DMNFXGOX(v_3: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPosition_2: vec3<f32>, transmittance_3: texture_2d<f32>, multiple_3: texture_2d<f32>, luminance: texture_3d<f32>, extinction_1: texture_3d<f32>, filtering_6: sampler) -> AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    var local_8: bool;
    var local_9: bool;
    var local_10: bool;
    var local_11: bool;
    var local_12: bool;
    var result_1: AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX;

    if (v_3.atmosphereControl.w < 0.5f) {
        return AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(vec3(0f), vec3(1f));
    }
    let clip_1 = (v_3.worldViewProj * vec4<f32>(worldPosition_2, 1f));
    let uv_5 = (((clip_1.xy / vec2(clip_1.w)) * vec2<f32>(0.5f, -0.5f)) + vec2(0.5f));
    let _e26 = atmosphere_view_rayX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2MNXW64TENFXGC5DFOMX(v_3, uv_5);
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
    if all((uv_5 >= vec2(0f))) {
        local_8 = all((uv_5 <= vec2(1f)));
    } else {
        local_8 = false;
    }
    let inside = local_8;
    if !((v_3.atmosphereControl.x > 0f)) {
        local_9 = (v_3.temporalProjection.z > 0.5f);
    } else {
        local_9 = true;
    }
    let _e88 = local_9;
    if !(_e88) {
        local_10 = (length(_e43) >= (v_3.atmosphere.originRadius.w + v_3.atmosphere.geometry.x));
    } else {
        local_10 = true;
    }
    let _e102 = local_10;
    if !(_e102) {
        local_11 = !(inside);
    } else {
        local_11 = true;
    }
    let _e108 = local_11;
    if !(_e108) {
        local_12 = (distance_6 >= (start_2 + range));
    } else {
        local_12 = true;
    }
    let _e115 = local_12;
    if _e115 {
        let _e125 = atmosphere_aerial_integrateX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2ONQW24DMNFXGOX(v_3, _e43, _e26.direction, distance_6, transmittance_3, multiple_3, filtering_6, u32(max(64f, v_3.atmosphereControl.x)));
        return _e125;
    }
    let coordinate = vec3<f32>(uv_5, sqrt(max(((distance_6 - start_2) / range), 0f)));
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
    var local_13: bool;
    var local_14: bool;
    var local_15: bool;
    var local_16: bool;
    var local_17: bool;
    var local_18: bool;
    var local_19: bool;
    var local_20: bool;

    if (worldPosition_3.x == worldPosition_3.x) {
        local_13 = (worldPosition_3.y == worldPosition_3.y);
    } else {
        local_13 = false;
    }
    let _e10 = local_13;
    if _e10 {
        local_14 = (worldPosition_3.z == worldPosition_3.z);
    } else {
        local_14 = false;
    }
    let _e17 = local_14;
    if _e17 {
        local_15 = all((abs(worldPosition_3) < vec3(3.402823e38f)));
    } else {
        local_15 = false;
    }
    let validReceiver = local_15;
    let offset_1 = (worldPosition_3 - shadowOrigin);
    let uv_6 = ((vec2<f32>(dot(offset_1, shadowRight), dot(offset_1, shadowUp)) / vec2(max(shadowProjection.x, 0.000001f))) + vec2(0.5f));
    if all((uv_6 >= vec2(0f))) {
        local_16 = all((uv_6 <= vec2(1f)));
    } else {
        local_16 = false;
    }
    let inRange = local_16;
    if (shadowProjection.y > 0.5f) {
        local_17 = (shadowProjection.z < 0.5f);
    } else {
        local_17 = false;
    }
    let _e64 = local_17;
    if _e64 {
        local_18 = (shadowProjection.x > 0f);
    } else {
        local_18 = false;
    }
    let available = local_18;
    let _e80 = textureSampleLevel(cloudShadowMapX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX, cloudShadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX, clamp(uv_6, vec2(0f), vec2(1f)), 0f);
    let sampled = _e80.x;
    if validReceiver {
        local_19 = inRange;
    } else {
        local_19 = false;
    }
    let _e88 = local_19;
    if _e88 {
        local_20 = available;
    } else {
        local_20 = false;
    }
    let _e92 = local_20;
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

fn ndc_worldX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_7: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, ndc: vec3<f32>) -> vec3<f32> {
    let world_1 = (v_7.inverseViewProj * vec4<f32>(ndc, 1f));
    return (world_1.xyz / vec3(world_1.w));
}

fn accent_vertex(i_3: AccentInput, vertex_1: u32, right: vec2<f32>, up: vec2<f32>) -> AccentOutput {
    var o: AccentOutput;

    let corners = array<vec2<f32>, 6>(vec2<f32>(-1f, -1f), vec2<f32>(1f, -1f), vec2<f32>(1f, 1f), vec2<f32>(-1f, -1f), vec2<f32>(1f, 1f), vec2<f32>(-1f, 1f));
    let c_1 = corners[vertex_1];
    o.position = vec4<f32>(((i_3.position.xy + (right * c_1.x)) + (up * c_1.y)), i_3.position.z, 1f);
    o.uv = c_1;
    o.color = i_3.color;
    o.shape = i_3.trailShape;
    let _e43 = o;
    return _e43;
}

fn flame_hash(p_10: vec2<f32>) -> f32 {
    return fract((sin(dot(p_10, vec2<f32>(127.1f, 311.7f))) * 43758.547f));
}

fn flame_noise(p_11: vec2<f32>) -> f32 {
    let i_4 = floor(p_11);
    let f = fract(p_11);
    let u = ((f * f) * (vec2(3f) - (2f * f)));
    let _e10 = flame_hash(i_4);
    let _e15 = flame_hash((i_4 + vec2<f32>(1f, 0f)));
    let _e22 = flame_hash((i_4 + vec2<f32>(0f, 1f)));
    let _e27 = flame_hash((i_4 + vec2<f32>(1f, 1f)));
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
    let p_13 = i_1.uv;
    let _e2 = fwidth(p_13);
    let aa = max((length(_e2) * 0.7f), 0.015f);
    if (i_1.shape.x > 0.5f) {
        let radius_3 = length(p_13);
        let body = (max(0f, ((exp(((-(radius_3) * radius_3) * 3.2f)) - 0.040762205f) / 0.9592378f)) * (1f - smoothstep((1f - aa), 1f, radius_3)));
        let alpha = (body * i_1.color.w);
        let core = exp(((-(radius_3) * radius_3) * 28f));
        return vec4<f32>(((i_1.color.xyz * (0.78f + (core * 2.1f))) * alpha), alpha);
    }
    let phase = vec2<f32>(sin((i_1.shape.y * 6.28f)), cos((i_1.shape.y * 6.28f)));
    let time = (i_1.shape.z * 0.52f);
    let height_1 = clamp(((p_13.y * 0.5f) + 0.5f), 0f, 1f);
    let _e82 = flame_noise((((p_13 * 2.15f) + (phase * 3.1f)) + vec2<f32>(0f, (-(time) * 2.4f))));
    let _e99 = flame_noise(((vec2<f32>((p_13.x * 7.3f), (p_13.y * 4.1f)) - (phase * 4.3f)) + vec2<f32>(0f, (-(time) * 4.2f))));
    let bend = ((sin((((height_1 * 5.5f) - (time * 6f)) + (phase.x * 3f))) * height_1) * 0.25f);
    let width = max(0.015f, (pow((1f - height_1), 0.85f) * (0.42f + (sin((height_1 * 3.14159f)) * 0.32f))));
    let across = abs(((p_13.x - bend) + (((_e82 - 0.5f) * height_1) * 0.18f)));
    let edgeWidth = (width * (0.82f + (_e99 * 0.3f)));
    let body_1 = (1f - smoothstep((edgeWidth - aa), (edgeWidth + aa), across));
    let base = smoothstep(0f, 0.14f, height_1);
    let tip_1 = (1f - smoothstep(0.93f, 1f, height_1));
    let inner = ((1f - smoothstep(0.16f, 0.72f, (across / max(width, 0.04f)))) * (1f - smoothstep(0.42f, 0.9f, height_1)));
    let core_1 = ((1f - smoothstep(0.02f, 0.25f, (across / max(width, 0.04f)))) * (1f - smoothstep(0.28f, 0.6f, height_1)));
    let cooling = smoothstep(0.25f, 1f, i_1.shape.z);
    let _e191 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.body;
    let orange = mix(i_1.color.xyz, _e191, (cooling * 0.42f));
    let _e197 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.body;
    let _e205 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.highlight;
    let rgb = (mix(_e197, orange, (0.25f + (inner * 0.75f))) + ((_e205 * ((inner * 0.8f) + (core_1 * 1.35f))) * (1f - (cooling * 0.45f))));
    let alpha_1 = ((((i_1.color.w * body_1) * base) * tip_1) * (0.68f + (inner * 0.32f)));
    return vec4<f32>((rgb * alpha_1), alpha_1);
}
