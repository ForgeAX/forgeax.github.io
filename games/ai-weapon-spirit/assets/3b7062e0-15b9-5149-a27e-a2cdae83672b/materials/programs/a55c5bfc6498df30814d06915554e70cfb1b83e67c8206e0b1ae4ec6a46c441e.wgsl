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

@group(0) @binding(0) 
var<uniform> viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(2) @binding(0) 
var<storage> meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<MeshX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX>;
@group(3) @binding(0) 
var<storage> instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<InstanceDataX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX>;
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

fn atmosphere_scene_visibilityX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2OZUXG2LCNFWGS5DZX(m: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, p: vec3<f32>) -> f32 {
    return 1f;
}

fn cloud_direct_solar_factorX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX(worldPosition: vec3<f32>, shadowOrigin: vec3<f32>, shadowRight: vec3<f32>, shadowUp: vec3<f32>, shadowProjection: vec4<f32>) -> f32 {
    return 1f;
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

fn fogOpticalDepthX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(params: FogViewParamsX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX, ray: FogRayX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX) -> f32 {
    var integral: f32;

    let rho = (params.density * exp(clamp((-(params.heightFalloff) * ray.origin.y), -60f, 60f)));
    let t = clamp(((params.heightFalloff * ray.direction.y) * ray.distance), -60f, 60f);
    integral = ((1f - (t * 0.5f)) + ((t * t) / 6f));
    if (abs(t) >= 0.001f) {
        integral = ((1f - exp(-(t))) / t);
    }
    let _e41 = integral;
    return clamp(((rho * ray.distance) * _e41), 0f, 80f);
}

fn height_fog_with_sourceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_3: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos: vec3<f32>, source: vec3<f32>) -> FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
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
    return FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX((source * opacity), (1f - opacity));
}

fn height_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_4: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos_1: vec3<f32>) -> FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
    var source_1: vec3<f32>;

    source_1 = v_4.fogColorDensity.xyz;
    if (v_4.atmosphereControl.w > 0.5f) {
        let ground = ((v_4.atmosphere.originRadius.xyz * 1000f) + vec3<f32>(0f, 1f, 0f));
        let _e18 = source_1;
        let _e19 = view_distant_sky_lightX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_4);
        let _e20 = view_solar_transmittanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_4, ground);
        source_1 = (_e18 + (_e19 + ((_e20 * v_4.lightColor) / vec3(12.566371f))));
    }
    let _e28 = source_1;
    let _e30 = height_fog_with_sourceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_4, worldPos_1, _e28);
    return _e30;
}

fn view_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_5: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, position_2: vec3<f32>) -> AtmosphereFogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
    let _e2 = height_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_5, position_2);
    let _e3 = view_atmosphereX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_5, position_2);
    return AtmosphereFogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX((_e2.inscatter + (_e2.transmittance * _e3.luminance)), (_e2.transmittance * _e3.transmittance));
}

fn translucent_fog_transmissionX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_6: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos_2: vec3<f32>, color: vec3<f32>, alpha: f32, backdrop: vec3<f32>, transmission: vec3<f32>) -> vec3<f32> {
    var local_4: bool;

    let composition = u32((v_6.fogHeightOpacity.z + 0.5f));
    if (composition == 0u) {
        local_4 = all((transmission == vec3(0f)));
    } else {
        local_4 = false;
    }
    let _e16 = local_4;
    if _e16 {
        return color;
    }
    let _e19 = view_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_6, worldPos_2);
    let coverage = select(1f, alpha, (composition == 2u));
    let inscatter = select((((vec3(1f) - transmission) * _e19.inscatter) * coverage), vec3(0f), (composition == 3u));
    return ((((color - backdrop) * _e19.transmittance) + backdrop) + inscatter);
}

fn translucent_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_7: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos_3: vec3<f32>, color_1: vec3<f32>, alpha_1: f32) -> vec3<f32> {
    let _e8 = translucent_fog_transmissionX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_7, worldPos_3, color_1, alpha_1, vec3(0f), vec3(0f));
    return _e8;
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
        let i = (vertex_index_2 % 4u);
        let j = (vertex_index_2 / 4u);
        let u_pos_arr = array<f32, 4>(0f, abs_slices.x, (1f - abs_slices.z), 1f);
        let v_pos_arr = array<f32, 4>(0f, abs_slices.y, (1f - abs_slices.w), 1f);
        let u_pos = u_pos_arr[i];
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
        let uv_u = u_uv_arr[i];
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
    let c = clamp(linear, 0f, 1f);
    return select((c * 12.92f), ((pow(c, 0.41666666f) * 1.055f) - 0.055f), (c > 0.0031308f));
}

@vertex 
fn vs_main(in: VsIn, @builtin(instance_index) idx: u32, @builtin(vertex_index) vertex_index: u32) -> VsOut {
    var out: VsOut;

    let _e3 = resolveSpriteVertex(in, idx, vertex_index);
    let _e7 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].worldFromLocal;
    let _e11 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx].localFromInstance;
    let world = ((_e7 * _e11) * vec4<f32>(_e3.posLocal, 1f));
    let _e21 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    out.clip = (_e21 * world);
    out.uv_atlas = _e3.uvAtlas;
    out.worldPos = world.xyz;
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
