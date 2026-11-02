struct EnvironmentScatteringX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX {
    single: vec3<f32>,
    multi: vec3<f32>,
    missingEnergy: f32,
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

struct AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    luminance: vec3<f32>,
    transmittance: vec3<f32>,
}

struct ClusterUniformX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX {
    grid: vec4<u32>,
    near_far_log: vec4<f32>,
}

struct DirectLightSlotX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX {
    position: vec4<f32>,
    colorTimesIntensity: vec4<f32>,
    direction: vec4<f32>,
    auxiliary: vec4<f32>,
    metadata: vec4<u32>,
    channels: vec4<u32>,
}

struct SkylightUniformsX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43UMFXGIYLSMRPWY2LHNB2GS3THX {
    intensity: f32,
    colorR: f32,
    colorG: f32,
    colorB: f32,
    rotation: vec4<f32>,
    diffuseScale: vec4<f32>,
    diffuseRotation: vec4<f32>,
    ambientIrradiance: vec4<f32>,
}

struct StandardEnvironmentX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43UMFXGIYLSMRPWY2LHNB2GS3THX {
    diffuse: vec3<f32>,
    specular: vec3<f32>,
    response: vec4<f32>,
}

struct StandardDirectX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43UMFXGIYLSMRPWY2LHNB2GS3THX {
    radiance: vec3<f32>,
    diffuse: vec3<f32>,
}

struct SkinUniformTaskX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX {
    joints: array<mat4x4<f32>, 255>,
    state: vec4<u32>,
}

struct SkinUniformPreviousX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX {
    joints: array<mat4x4<f32>, 255>,
}

struct MeshX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX {
    worldFromLocal: mat4x4<f32>,
    surface: vec4<u32>,
    spriteRegion: vec4<f32>,
}

struct InstanceDataX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX {
    localFromInstance: mat4x4<f32>,
}

struct SceneTemporalV1X_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX {
    motionUv: vec2<f32>,
    viewDepth: f32,
    reactive: f32,
    validDepth: bool,
    motionValid: bool,
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

struct GBufferOutputX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSL5XXK5DQOV2AX {
    @location(0) scene_color: vec4<f32>,
    @location(1) normal_roughness: u32,
    @location(2) f0_occlusion: vec2<u32>,
    @location(3) albedo_metallic: u32,
    @location(4) lighting_context: vec2<u32>,
    @location(5) receiver_geometry: vec2<u32>,
    @location(6) scene_temporal: vec4<f32>,
}

struct MaterialParameters {
    baseColor: vec4<f32>,
    metallic: f32,
    roughness: f32,
    subsurfaceRadius: vec3<f32>,
    subsurfaceWeight: f32,
    metallicChannel: f32,
    roughnessChannel: f32,
    emissive: vec3<f32>,
    emissiveIntensity: f32,
    occlusionStrength: f32,
    alphaCutoff: f32,
    specular: f32,
    alphaHash: f32,
    shadowAlphaMode: f32,
    alphaMode: f32,
    alphaToCoverage: f32,
    specularColor: vec3<f32>,
    normalScale: vec2<f32>,
    bumpScale: f32,
    transmission: f32,
    ior: f32,
    thickness: f32,
    attenuationColor: vec3<f32>,
    attenuationDistance: f32,
    baseColorTextureCoordinatesTransform: vec4<f32>,
    baseColorTextureCoordinatesMetadata: vec4<f32>,
    baseColorTextureCoordinatesRotation: vec4<f32>,
    metallicRoughnessTextureCoordinatesTransform: vec4<f32>,
    metallicRoughnessTextureCoordinatesMetadata: vec4<f32>,
    metallicRoughnessTextureCoordinatesRotation: vec4<f32>,
    normalTextureCoordinatesTransform: vec4<f32>,
    normalTextureCoordinatesMetadata: vec4<f32>,
    normalTextureCoordinatesRotation: vec4<f32>,
    specularColorTextureCoordinatesTransform: vec4<f32>,
    specularColorTextureCoordinatesMetadata: vec4<f32>,
    specularColorTextureCoordinatesRotation: vec4<f32>,
    emissiveTextureCoordinatesTransform: vec4<f32>,
    emissiveTextureCoordinatesMetadata: vec4<f32>,
    emissiveTextureCoordinatesRotation: vec4<f32>,
    occlusionTextureCoordinatesTransform: vec4<f32>,
    occlusionTextureCoordinatesMetadata: vec4<f32>,
    occlusionTextureCoordinatesRotation: vec4<f32>,
    transmissionTextureCoordinatesTransform: vec4<f32>,
    transmissionTextureCoordinatesMetadata: vec4<f32>,
    transmissionTextureCoordinatesRotation: vec4<f32>,
    thicknessTextureCoordinatesTransform: vec4<f32>,
    thicknessTextureCoordinatesMetadata: vec4<f32>,
    thicknessTextureCoordinatesRotation: vec4<f32>,
    bumpTextureCoordinatesTransform: vec4<f32>,
    bumpTextureCoordinatesMetadata: vec4<f32>,
    bumpTextureCoordinatesRotation: vec4<f32>,
    specularTextureCoordinatesTransform: vec4<f32>,
    specularTextureCoordinatesMetadata: vec4<f32>,
    specularTextureCoordinatesRotation: vec4<f32>,
    alphaChannel: f32,
    metallicTextureCoordinatesTransform: vec4<f32>,
    metallicTextureCoordinatesMetadata: vec4<f32>,
    metallicTextureCoordinatesRotation: vec4<f32>,
    roughnessTextureCoordinatesTransform: vec4<f32>,
    roughnessTextureCoordinatesMetadata: vec4<f32>,
    roughnessTextureCoordinatesRotation: vec4<f32>,
    alphaTextureCoordinatesTransform: vec4<f32>,
    alphaTextureCoordinatesMetadata: vec4<f32>,
    alphaTextureCoordinatesRotation: vec4<f32>,
    displacementScale: f32,
    displacementBias: f32,
    displacementTextureCoordinatesTransform: vec4<f32>,
    displacementTextureCoordinatesMetadata: vec4<f32>,
    displacementTextureCoordinatesRotation: vec4<f32>,
    triplanarSpace: f32,
    triplanarScale: f32,
    triplanarSharpness: f32,
    normalMapSpace: f32,
    flatShading: u32,
    directMultiscatteringLut: u32,
}

struct SurfaceInput {
    positionOS: vec3<f32>,
    positionWS: vec3<f32>,
    geometricNormalWS: vec3<f32>,
    vertexNormalWS: vec3<f32>,
    tangentWS: vec4<f32>,
    viewDirectionWS: vec3<f32>,
    uv0_: vec2<f32>,
    uv1_: vec2<f32>,
    uv2_: vec2<f32>,
    uv3_: vec2<f32>,
    uv4_: vec2<f32>,
    uv5_: vec2<f32>,
    uv6_: vec2<f32>,
    uv7_: vec2<f32>,
    vertexColor: vec4<f32>,
    frontFacing: bool,
    uvFootprint0_: vec4<f32>,
    uvFootprint1_: vec4<f32>,
    objectToWorld: mat3x3<f32>,
    frameTime: f32,
}

struct SurfaceData {
    baseColor: vec3<f32>,
    normalWS: vec3<f32>,
    metallic: f32,
    roughness: f32,
    emissive: vec3<f32>,
    occlusion: f32,
    opacity: f32,
    alphaClipThreshold: f32,
}

struct VsIn {
    @location(0) pos: vec3<f32>,
    @location(1) normal: vec3<f32>,
    @location(2) uv: vec2<f32>,
    @location(3) tangent: vec4<f32>,
    @location(4) skinIndex: vec4<u32>,
    @location(5) skinWeight: vec4<f32>,
    @location(6) uv1_: vec2<f32>,
    @location(7) uv2_: vec2<f32>,
    @location(8) uv3_: vec2<f32>,
    @location(9) uv4_: vec2<f32>,
    @location(10) uv5_: vec2<f32>,
    @location(11) uv6_: vec2<f32>,
    @location(12) uv7_: vec2<f32>,
}

struct VsOut {
    @builtin(position) @invariant clip: vec4<f32>,
    @location(4) @interpolate(flat) objectBasis0_: vec4<f32>,
    @location(0) worldPos: vec3<f32>,
    @location(1) worldNormal: vec3<f32>,
    @location(2) uv0And1_: vec4<f32>,
    @location(3) worldTangent: vec4<f32>,
    @location(7) positionOSAndViewZ: vec4<f32>,
    @location(5) uv2And3_: vec4<f32>,
    @location(9) @interpolate(flat) surfaceData: vec3<u32>,
    @location(11) clipDelta: vec4<f32>,
    @location(10) uv4And5_: vec4<f32>,
    @location(12) uv6And7_: vec4<f32>,
    @location(6) ndc: vec4<f32>,
    @location(13) @interpolate(flat) objectBasis1_: vec4<f32>,
}

struct SurfaceProjection {
    position: vec3<f32>,
    positionDx: vec3<f32>,
    positionDy: vec3<f32>,
    normal: vec3<f32>,
    weights: vec3<f32>,
}

struct SurfaceTriplanarSamples {
    x: vec4<f32>,
    y: vec4<f32>,
    z: vec4<f32>,
}

struct StandardPbrOutput {
    @location(0) color: vec4<f32>,
}

struct StandardForwardLit {
    color: vec3<f32>,
    alpha: f32,
}

struct SkinUncoveredGBufferOutput {
    @location(0) scene_color: vec4<f32>,
    @location(1) normal_roughness: u32,
    @location(2) f0_occlusion: vec2<u32>,
    @location(3) albedo_metallic: u32,
    @location(4) lighting_context: vec2<u32>,
    @location(5) receiver_geometry: vec2<u32>,
    @location(6) visible_surface: vec4<u32>,
    @location(7) scene_temporal: vec4<f32>,
}

struct TemporalVsOut {
    @location(10) positionOS: vec3<f32>,
    @location(11) clippingPositionWS: vec3<f32>,
    @location(12) @interpolate(flat) temporal: vec2<f32>,
    @builtin(position) @invariant clip: vec4<f32>,
    @location(0) uv: vec2<f32>,
    @location(1) uv1_: vec2<f32>,
    @location(2) uv2_: vec2<f32>,
    @location(3) uv3_: vec2<f32>,
    @location(4) uv4_: vec2<f32>,
    @location(5) uv5_: vec2<f32>,
    @location(6) uv6_: vec2<f32>,
    @location(7) uv7_: vec2<f32>,
    @location(8) currentClip: vec4<f32>,
    @location(9) previousClip: vec4<f32>,
}

const PROBE_INV_PIX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA4TPMJSQX: f32 = 0.31830987f;
const SHADOW_VOGEL_OFFSETSX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX: array<vec2<f32>, 5> = array<vec2<f32>, 5>(vec2<f32>(0.31622776f, 0f), vec2<f32>(-0.40387356f, 0.36998126f), vec2<f32>(0.061819322f, -0.7043993f), vec2<f32>(0.50905645f, 0.66397405f), vec2<f32>(-0.9341812f, -0.1652435f));
const CLUSTER_TEXTURE_GRID_WORD_OFFSETX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX: u32 = 6144u;
const CLUSTER_TEXTURE_WIDTHX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX: u32 = 1024u;
const KIND_MASKX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX: u32 = 255u;
const KIND_POINTX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX: u32 = 0u;
const KIND_SPOTX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX: u32 = 1u;
const PROJECTOR_FLAGX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX: i32 = 1073741824i;
const TILE_MASKX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX: i32 = 1073741823i;
const PCF_SHIFTX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX: u32 = 8u;
const KIND_RECT_AREAX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX: u32 = 2u;
const STANDARD_GBUFFER_DIRECT_DFG_LUT_BITX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSX: u32 = 8388608u;
const STANDARD_GBUFFER_NO_RECEIVE_BITX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSX: u32 = 8388608u;
const STANDARD_NO_RECEIVE_BIT: u32 = 2147483648u;
const SURFACE_TRIPLANAR_OBJECT: f32 = 2f;

@group(0) @binding(0) 
var<uniform> viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(0) @binding(3) 
var shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: texture_depth_2d_array;
@group(0) @binding(4) 
var shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: sampler_comparison;
@group(0) @binding(8) 
var spotShadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: texture_depth_2d_array;
@group(2) @binding(6) 
var<uniform> cluster_uniformX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX: ClusterUniformX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX;
@group(2) @binding(3) 
var cluster_data_textureX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX: texture_2d<u32>;
@group(2) @binding(1) 
var<uniform> skinTaskCurrentX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX: SkinUniformTaskX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX;
@group(2) @binding(2) 
var<uniform> skinTaskPreviousX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX: SkinUniformPreviousX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX;
@group(2) @binding(0) 
var<uniform> meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<MeshX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, 128>;
@group(3) @binding(0) 
var<uniform> instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<InstanceDataX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, 128>;
@group(1) @binding(0) 
var<uniform> material: MaterialParameters;
@group(1) @binding(1) 
var baseColorTexture_sampler: sampler;
@group(1) @binding(2) 
var baseColorTexture_1: texture_2d<f32>;
@group(1) @binding(3) 
var metallicRoughnessTexture_sampler: sampler;
@group(1) @binding(4) 
var metallicRoughnessTexture: texture_2d<f32>;
@group(1) @binding(17) 
var metallicTexture_sampler: sampler;
@group(1) @binding(18) 
var metallicTexture: texture_2d<f32>;
@group(1) @binding(19) 
var roughnessTexture_sampler: sampler;
@group(1) @binding(20) 
var roughnessTexture: texture_2d<f32>;
@group(1) @binding(21) 
var alphaTexture_sampler: sampler;
@group(1) @binding(22) 
var alphaTexture_1: texture_2d<f32>;
@group(1) @binding(5) 
var normalTexture_sampler: sampler;
@group(1) @binding(6) 
var normalTexture: texture_2d<f32>;
@group(1) @binding(15) 
var bumpTexture_sampler: sampler;
@group(1) @binding(16) 
var bumpTexture: texture_2d<f32>;
@group(1) @binding(7) 
var emissiveTexture_sampler: sampler;
@group(1) @binding(8) 
var emissiveTexture: texture_2d<f32>;
@group(1) @binding(9) 
var occlusionTexture_sampler: sampler;
@group(1) @binding(10) 
var occlusionTexture: texture_2d<f32>;
@group(1) @binding(42) 
var specularTextureSampler: sampler;
@group(1) @binding(65) 
var specularTexture: texture_2d<f32>;
@group(1) @binding(44) 
var specularColorTextureSampler: sampler;
@group(1) @binding(67) 
var specularColorTexture: texture_2d<f32>;
@group(1) @binding(72) 
var directDfgLut_11: texture_2d<f32>;
@group(1) @binding(26) 
var irradianceSampler_2: sampler;
@group(1) @binding(25) 
var irradianceMap_2: texture_cube<f32>;
@group(1) @binding(29) 
var brdfLut_1: texture_2d<f32>;
@group(1) @binding(27) 
var prefilterMap_2: texture_2d<f32>;
@group(1) @binding(28) 
var prefilterSampler_2: sampler;
@group(1) @binding(30) 
var<uniform> skylight: SkylightUniformsX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43UMFXGIYLSMRPWY2LHNB2GS3THX;
@group(1) @binding(47) 
var skylightPrefilterMap_1: texture_2d<f32>;
@group(1) @binding(23) 
var displacementTexture_sampler: sampler;
@group(1) @binding(24) 
var displacementTexture: texture_2d<f32>;

fn specularF90X_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(f0_: vec3<f32>) -> f32 {
    return saturate((50f * max(f0_.x, max(f0_.y, f0_.z))));
}

fn inverseRotateEnvironmentX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXG2DBOJSWIX(direction: vec3<f32>, rotation: vec4<f32>) -> vec3<f32> {
    let q = normalize(rotation);
    let t = (2f * cross(q.xyz, direction));
    return ((direction - (q.w * t)) + cross(q.xyz, t));
}

fn pmremRoughnessToMipX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU4DNOJSW2X(roughness: f32) -> f32 {
    if (roughness >= 0.8f) {
        return (((1f - roughness) * 5f) - 2f);
    }
    if (roughness >= 0.4f) {
        return (((0.8f - roughness) * 7.5f) - 1f);
    }
    if (roughness >= 0.305f) {
        return (((0.4f - roughness) / 0.095f) + 2f);
    }
    if (roughness >= 0.21f) {
        return (((0.305f - roughness) / 0.095f) + 3f);
    }
    return (-2f * log2(max((1.16f * roughness), 0.000001f)));
}

fn pmremFaceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU4DNOJSW2X(direction_1: vec3<f32>) -> u32 {
    var local: bool;
    var local_1: bool;

    let a_2 = abs(direction_1);
    if (a_2.x > a_2.z) {
        local = (a_2.x > a_2.y);
    } else {
        local = false;
    }
    let _e11 = local;
    if _e11 {
        return select(3u, 0u, (direction_1.x > 0f));
    }
    if (a_2.z >= a_2.x) {
        local_1 = (a_2.z > a_2.y);
    } else {
        local_1 = false;
    }
    let _e27 = local_1;
    if _e27 {
        return select(5u, 2u, (direction_1.z > 0f));
    }
    return select(4u, 1u, (direction_1.y > 0f));
}

fn pmremLevelOriginX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU4DNOJSW2X(baseSize: f32, mip: f32) -> vec2<f32> {
    let size = exp2(max(mip, 4f));
    return vec2<f32>((max((4f - mip), 0f) * 48f), (4f * (baseSize - size)));
}

fn pmremFaceUvX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU4DNOJSW2X(d: vec3<f32>, face: u32) -> vec2<f32> {
    var p: vec2<f32>;

    p = (vec2<f32>(d.x, d.y) / vec2(abs(d.z)));
    switch face {
        case 0u: {
            p = (vec2<f32>(d.z, d.y) / vec2(abs(d.x)));
        }
        case 1u: {
            p = (-(d.xz) / vec2(abs(d.y)));
        }
        case 2u: {
            p = (vec2<f32>(-(d.x), d.y) / vec2(abs(d.z)));
        }
        case 3u: {
            p = (vec2<f32>(-(d.z), d.y) / vec2(abs(d.x)));
        }
        case 4u: {
            p = (vec2<f32>(-(d.x), d.z) / vec2(abs(d.y)));
        }
        default: {
        }
    }
    let _e47 = p;
    return ((_e47 * 0.5f) + vec2(0.5f));
}

fn samplePmremLevelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU4DNOJSW2X(map: texture_2d<f32>, mapSampler: sampler, direction_2: vec3<f32>, mip_1: f32) -> vec3<f32> {
    let _e2 = textureDimensions(map, 0i);
    let dimensions = vec2<f32>(_e2);
    if (dimensions.y == 1f) {
        let _e10 = textureLoad(map, vec2(0i), 0i);
        return _e10.xyz;
    }
    let size_1 = exp2(max(mip_1, 4f));
    let _e17 = pmremFaceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU4DNOJSW2X(direction_2);
    let tile_1 = (vec2<f32>(f32((_e17 % 3u)), f32((_e17 / 3u))) * size_1);
    let _e29 = pmremLevelOriginX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU4DNOJSW2X((dimensions.y * 0.25f), mip_1);
    let _e31 = pmremFaceUvX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU4DNOJSW2X(direction_2, _e17);
    let pixel_9 = (((_e29 + tile_1) + (_e31 * (size_1 - 2f))) + vec2(1f));
    let _e42 = textureSampleLevel(map, mapSampler, (pixel_9 / dimensions), 0f);
    return _e42.xyz;
}

fn samplePmremX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU4DNOJSW2X(map_1: texture_2d<f32>, mapSampler_1: sampler, direction_3: vec3<f32>, roughness_1: f32) -> vec3<f32> {
    let _e2 = textureDimensions(map_1, 0i);
    let maxMip = log2(max((f32(_e2.y) * 0.25f), 1f));
    let _e11 = pmremRoughnessToMipX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU4DNOJSW2X(roughness_1);
    let mip_2 = clamp(_e11, -2f, maxMip);
    let level = floor(mip_2);
    let _e17 = samplePmremLevelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU4DNOJSW2X(map_1, mapSampler_1, direction_3, level);
    if (fract(mip_2) == 0f) {
        return _e17;
    }
    let _e23 = samplePmremLevelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU4DNOJSW2X(map_1, mapSampler_1, direction_3, (level + 1f));
    return mix(_e17, _e23, fract(mip_2));
}

fn decodeSpecularEnvironmentScaleX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(skyColor: vec3<f32>, intensity: f32) -> vec3<f32> {
    return select((skyColor * intensity), vec3(1f), (intensity < 0f));
}

fn sampleIblDiffuseX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(normal: vec3<f32>, rotation_1: vec4<f32>, irradianceMap: texture_cube<f32>, irradianceSampler: sampler) -> vec3<f32> {
    let _e2 = inverseRotateEnvironmentX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXG2DBOJSWIX(normal, rotation_1);
    let dir = vec3<f32>(_e2.x, -(_e2.y), _e2.z);
    let _e11 = textureSampleLevel(irradianceMap, irradianceSampler, dir, 0f);
    let irradianceEOverPi = _e11.xyz;
    return irradianceEOverPi;
}

fn environmentMultiScatteringX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(single: vec3<f32>, missingEnergy: f32, F0_: vec3<f32>) -> vec3<f32> {
    let favg = (F0_ + ((vec3(1f) - F0_) * 0.04761905f));
    return (((single * favg) * missingEnergy) / max((vec3(1f) - (missingEnergy * favg)), vec3(0.000001f)));
}

fn environmentScatteringFromDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(ab: vec2<f32>, F0_1: vec3<f32>, F90_: f32) -> EnvironmentScatteringX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX {
    let single_1 = ((F0_1 * ab.x) + vec3((ab.y * F90_)));
    let ems = clamp(((1f - ab.x) - ab.y), 0f, 1f);
    let _e17 = environmentMultiScatteringX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(single_1, ems, F0_1);
    return EnvironmentScatteringX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(single_1, _e17, ems);
}

fn environmentReflectionDirectionX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(normal_1: vec3<f32>, view: vec3<f32>, roughness_2: f32) -> vec3<f32> {
    let r2_ = (roughness_2 * roughness_2);
    return normalize(mix(reflect(-(view), normal_1), normal_1, (r2_ * r2_)));
}

fn sampleIblRadianceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(normal_2: vec3<f32>, view_1: vec3<f32>, roughness_3: f32, rotation_2: vec4<f32>, prefilterMap: texture_2d<f32>, prefilterSampler: sampler) -> vec3<f32> {
    let _e3 = environmentReflectionDirectionX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(normal_2, view_1, roughness_3);
    let _e5 = inverseRotateEnvironmentX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXG2DBOJSWIX(_e3, rotation_2);
    let Rflip = vec3<f32>(_e5.x, -(_e5.y), _e5.z);
    let _e13 = samplePmremX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU4DNOJSW2X(prefilterMap, prefilterSampler, Rflip, roughness_3);
    return _e13;
}

fn box_projectX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(worldPosition: vec3<f32>, direction_4: vec3<f32>, boxCenter: vec3<f32>, boxExtents: vec3<f32>) -> vec3<f32> {
    let safeExtents = max(boxExtents, vec3(0.0001f));
    if any((abs((worldPosition - boxCenter)) >= safeExtents)) {
        return normalize(direction_4);
    }
    let safeDirection = select(select(vec3(-0.0001f), vec3(0.0001f), (direction_4 >= vec3(0f))), direction_4, (abs(direction_4) >= vec3(0.0001f)));
    let localPosition = (worldPosition - boxCenter);
    let edgeSign = select(vec3(-1f), vec3(1f), (direction_4 >= vec3(0f)));
    let edge = (edgeSign * safeExtents);
    let distances = ((edge - localPosition) / safeDirection);
    let travel = min(distances.x, min(distances.y, distances.z));
    return normalize((localPosition + (direction_4 * max(travel, 0f))));
}

fn sampleReflectionProbeRadianceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(normal_3: vec3<f32>, view_2: vec3<f32>, roughness_4: f32, worldPosition_1: vec3<f32>, boxCenter_1: vec3<f32>, boxExtents_1: vec3<f32>, rotation_3: vec4<f32>, probeMap: texture_2d<f32>, probeSampler: sampler, skylightMap: texture_2d<f32>, skylightRotation: vec4<f32>, skylightScale: vec3<f32>, probeIntensity: f32, boxProjection: bool) -> vec3<f32> {
    var sky: vec3<f32> = vec3(0f);
    var projected: vec3<f32>;

    let relative = (abs((worldPosition_1 - boxCenter_1)) / max(boxExtents_1, vec3(0.0001f)));
    let weight = smoothstep(0f, 0.1f, (1f - max(relative.x, max(relative.y, relative.z))));
    if (weight < 1f) {
        let _e29 = sampleIblRadianceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(normal_3, view_2, roughness_4, skylightRotation, skylightMap, probeSampler);
        sky = (_e29 * skylightScale);
    }
    if (weight <= 0f) {
        let _e35 = sky;
        return _e35;
    }
    let _e36 = environmentReflectionDirectionX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(normal_3, view_2, roughness_4);
    projected = _e36;
    if boxProjection {
        let _e39 = box_projectX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(worldPosition_1, _e36, boxCenter_1, boxExtents_1);
        projected = _e39;
    }
    let _e40 = projected;
    let _e42 = inverseRotateEnvironmentX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXG2DBOJSWIX(_e40, rotation_3);
    let _e44 = samplePmremX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU4DNOJSW2X(probeMap, probeSampler, _e42, roughness_4);
    let local_35 = (_e44 * probeIntensity);
    let _e47 = sky;
    return mix(_e47, local_35, weight);
}

fn fresnelSchlickRoughnessX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXG2DBOJSWIX(cosTheta: f32, F0_2: vec3<f32>, roughness_5: f32) -> vec3<f32> {
    let _e4 = specularF90X_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(F0_2);
    let oneMinusRough = max(vec3(((1f - roughness_5) * _e4)), F0_2);
    let cosineComplement = clamp((1f - cosTheta), 0f, 1f);
    let squared = (cosineComplement * cosineComplement);
    return (F0_2 + ((oneMinusRough - F0_2) * ((squared * squared) * cosineComplement)));
}

fn probe_sh9X_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA4TPMJSQX(shPreblend: array<vec4<f32>, 9>, normal_4: vec3<f32>) -> vec3<f32> {
    var result: vec3<f32>;

    let x_3 = normal_4.x;
    let y_3 = normal_4.y;
    let z = normal_4.z;
    result = (shPreblend[0].xyz * 0.2820948f);
    let _e10 = result;
    result = (_e10 + (shPreblend[1].xyz * (0.48860252f * y_3)));
    let _e17 = result;
    result = (_e17 + (shPreblend[2].xyz * (0.48860252f * z)));
    let _e24 = result;
    result = (_e24 + (shPreblend[3].xyz * (0.48860252f * x_3)));
    let _e31 = result;
    result = (_e31 + (shPreblend[4].xyz * ((1.0925485f * x_3) * y_3)));
    let _e39 = result;
    result = (_e39 + (shPreblend[5].xyz * ((1.0925485f * y_3) * z)));
    let _e47 = result;
    result = (_e47 + (shPreblend[6].xyz * (0.31539157f * (((3f * z) * z) - 1f))));
    let _e59 = result;
    result = (_e59 + (shPreblend[7].xyz * ((1.0925485f * x_3) * z)));
    let _e67 = result;
    result = (_e67 + (shPreblend[8].xyz * (0.54627424f * ((x_3 * x_3) - (y_3 * y_3)))));
    let _e77 = result;
    return _e77;
}

fn evaluateProbeDiffuseX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA4TPMJSQX(shPreblend_1: array<vec4<f32>, 9>, localBlendFraction: f32, normal_5: vec3<f32>, e_sky: vec3<f32>, k_d: vec3<f32>, albedo: vec3<f32>, metallic: f32) -> vec3<f32> {
    let _e2 = probe_sh9X_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA4TPMJSQX(shPreblend_1, normal_5);
    let local_36 = (max(_e2, vec3(0f)) * PROBE_INV_PIX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA4TPMJSQX);
    let skyResidualFraction = (1f - localBlendFraction);
    return ((((local_36 + (skyResidualFraction * e_sky)) * k_d) * albedo) * (1f - metallic));
}

fn lightingChannelsMatchX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(light: u32, receiver: u32) -> bool {
    return ((light & receiver) != 0u);
}

fn atmosphere_scene_visibilityX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2OZUXG2LCNFWGS5DZX(m: AtmosphereMediumX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, p_1: vec3<f32>) -> f32 {
    return 1f;
}

fn cloud_direct_solar_factorX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX(worldPosition_2: vec3<f32>, shadowOrigin: vec3<f32>, shadowRight: vec3<f32>, shadowUp: vec3<f32>, shadowProjection: vec4<f32>) -> f32 {
    return 1f;
}

fn view_solar_transmittanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, position: vec3<f32>) -> vec3<f32> {
    return vec3(1f);
}

fn view_apply_direct_solarX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_1: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, radiance: vec3<f32>, position_1: vec3<f32>) -> vec3<f32> {
    let _e2 = view_solar_transmittanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_1, position_1);
    let _e12 = cloud_direct_solar_factorX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MN52WIOR2NRQXSZLSX(position_1, v_1.cloudShadowOrigin.xyz, v_1.cloudShadowRight.xyz, v_1.cloudShadowUp.xyz, v_1.cloudShadowProjection);
    return ((radiance * _e2) * _e12);
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
        let edge_1 = (vec2(0.5f) / vec2<f32>(_e10));
        let _e20 = textureSampleCompareLevel(shadowMap, shadowSampler, clamp(uv, edge_1, (extent - edge_1)), layer, depthRef);
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
    let pixel_10 = clamp(floor((uv_1 * dimensions_1)), vec2(0f), ((dimensions_1 * extent_1) - vec2(1f)));
    let _e21 = textureSampleCompareLevel(shadowMap_1, shadowSampler_1, ((pixel_10 + vec2(0.5f)) / dimensions_1), layer_1, depthRef_1);
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

fn f_schlickX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(vDotH: f32, f0_1: vec3<f32>) -> vec3<f32> {
    let fresnel = exp2((((-5.55473f * vDotH) - 6.98316f) * vDotH));
    let _e8 = specularF90X_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(f0_1);
    return (f0_1 + ((vec3(_e8) - f0_1) * fresnel));
}

fn approximateDirectDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_6: f32, nDotV_1: f32) -> vec2<f32> {
    let uv_9 = clamp(vec2<f32>(roughness_6, nDotV_1), vec2(0f), vec2(1f));
    let r = ((uv_9.x * vec4<f32>(-1f, -0.0275f, -0.572f, 0.022f)) + vec4<f32>(1f, 0.0425f, 1.04f, -0.04f));
    let a004_ = ((min((r.x * r.x), exp2((-9.28f * uv_9.y))) * r.x) + r.y);
    let energy = (1f - (0.55f * uv_9.x));
    let bias_1 = clamp(((1.04f * a004_) + r.w), 0f, energy);
    return vec2<f32>((energy - bias_1), bias_1);
}

fn sampleDirectDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_7: f32, nDotV_2: f32, useLut: bool, directDfgLut: texture_2d<f32>, directDfgSampler: sampler) -> vec2<f32> {
    if useLut {
        let _e12 = textureSampleLevel(directDfgLut, directDfgSampler, clamp(vec2<f32>(roughness_7, nDotV_2), vec2(0f), vec2(1f)), 0f);
        return _e12.xy;
    }
    let _e14 = approximateDirectDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_7, nDotV_2);
    return _e14;
}

fn directMultiScatterX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_8: f32, nDotV_3: f32, nDotL_1: f32, F0_3: vec3<f32>, useLut_1: bool, directDfgLut_1: texture_2d<f32>, directDfgSampler_1: sampler) -> vec3<f32> {
    var emsV: f32;
    var emsL: f32;

    let _e5 = sampleDirectDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_8, nDotV_3, useLut_1, directDfgLut_1, directDfgSampler_1);
    let _e7 = sampleDirectDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(roughness_8, nDotL_1, useLut_1, directDfgLut_1, directDfgSampler_1);
    let _e9 = specularF90X_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(F0_3);
    let fssEssV = ((F0_3 * _e5.x) + vec3((_e5.y * _e9)));
    let fssEssL = ((F0_3 * _e7.x) + vec3((_e7.y * _e9)));
    emsV = (0.55f * clamp(roughness_8, 0f, 1f));
    let _e28 = emsV;
    emsL = _e28;
    if useLut_1 {
        emsV = ((1f - _e5.x) - _e5.y);
        emsL = ((1f - _e7.x) - _e7.y);
    }
    let favg_1 = (F0_3 + ((vec3(_e9) - F0_3) * 0.047619f));
    let _e45 = emsV;
    let _e46 = emsL;
    let energyLoss = (_e45 * _e46);
    let fms = (((fssEssV * fssEssL) * favg_1) / ((vec3(1f) - ((energyLoss * favg_1) * favg_1)) + vec3(0.000001f)));
    return (fms * energyLoss);
}

fn standardOpaqueBrdfX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(baseColor: vec3<f32>, metallic_1: f32, alpha: f32, f0_2: vec3<f32>, nDotV_4: f32, nDotL_2: f32, nDotH_1: f32, vDotH_1: f32, useLut_2: bool, directDfgLut_2: texture_2d<f32>, directDfgSampler_2: sampler) -> vec3<f32> {
    let _e2 = d_ggxX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(nDotH_1, alpha);
    let _e5 = v_smithX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(nDotV_4, nDotL_2, alpha);
    let _e9 = f_schlickX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(vDotH_1, f0_2);
    let _e17 = directMultiScatterX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(sqrt(max(alpha, 0f)), nDotV_4, nDotL_2, f0_2, useLut_2, directDfgLut_2, directDfgSampler_2);
    let specular_2 = (((_e2 * _e5) * _e9) + _e17);
    return ((((1f - metallic_1) * baseColor) / vec3(3.1415927f)) + specular_2);
}

fn evalDirectionalNoShadowX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(normal_6: vec3<f32>, viewDir: vec3<f32>, baseColor_1: vec3<f32>, metallic_2: f32, alphaSq: f32, F0_4: vec3<f32>, transmission: vec3<f32>, useDirectDfgLut: bool, directDfgLut_3: texture_2d<f32>, directDfgSampler_3: sampler) -> vec3<f32> {
    let _e2 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let l_3 = normalize(-(_e2));
    let halfVector = (viewDir + l_3);
    let halfVectorLengthSquared = max(dot(halfVector, halfVector), 0.00000001f);
    let h = (halfVector * inverseSqrt(halfVectorLengthSquared));
    let signedNDotL = dot(normal_6, l_3);
    let nDotL_3 = max(signedNDotL, 0f);
    let nDotV_5 = max(dot(normal_6, viewDir), 0.00001f);
    let nDotH_2 = max(dot(normal_6, h), 0f);
    let vDotH_2 = max(dot(viewDir, h), 0f);
    let _e32 = standardOpaqueBrdfX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(baseColor_1, metallic_2, alphaSq, F0_4, nDotV_5, nDotL_3, nDotH_2, vDotH_2, useDirectDfgLut, directDfgLut_3, directDfgSampler_3);
    let transmitted = (transmission * (max(-(signedNDotL), 0f) / 3.1415927f));
    let _e42 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightColor;
    let _e47 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightColor;
    return (((_e32 * _e42) * nDotL_3) + (transmitted * _e47));
}

fn iesProfileFactorX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWSZLTL5YHE33GNFWGKX(lightPos: vec3<f32>, axisX: vec3<f32>, axisY: vec3<f32>, worldPos: vec3<f32>, slice: u32) -> f32 {
    return 1f;
}

fn evalDistanceAttenuationX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWC5DUMVXHKYLUNFXW4X(dSquared: f32, invRangeSquared: f32, decay: f32, nearFloor: f32) -> f32 {
    var local_2: bool;
    var local_3: bool;

    let safeDistance = max(dSquared, nearFloor);
    let window = clamp((1f - ((safeDistance * invRangeSquared) * (safeDistance * invRangeSquared))), 0f, 1f);
    if (decay == 2f) {
        return ((window * window) / safeDistance);
    }
    if (decay == 0f) {
        return (window * window);
    }
    let logDistance = log2(safeDistance);
    if (logDistance < 0f) {
        local_2 = (decay >= ((2f * log2(nearFloor)) / logDistance));
    } else {
        local_2 = false;
    }
    let _e31 = local_2;
    if _e31 {
        return ((window * window) / nearFloor);
    }
    if (logDistance > 0f) {
        local_3 = (decay >= (254f / logDistance));
    } else {
        local_3 = false;
    }
    let _e42 = local_3;
    if _e42 {
        return 0f;
    }
    return ((window * window) / max(pow(safeDistance, (0.5f * decay)), nearFloor));
}

fn evalSpotConeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWC5DUMVXHKYLUNFXW4X(cosInner: f32, cosOuter: f32, angleCos: f32) -> f32 {
    if (cosInner <= cosOuter) {
        return step(cosOuter, angleCos);
    }
    return smoothstep(cosOuter, cosInner, angleCos);
}

fn evalSpotAttenuationX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWC5DUMVXHKYLUNFXW4X(lightPos_1: vec3<f32>, lightDir: vec3<f32>, worldPos_1: vec3<f32>, cosInner_1: f32, cosOuter_1: f32, invRangeSquared_1: f32) -> f32 {
    let toLight = (lightPos_1 - worldPos_1);
    let dSquared_1 = dot(toLight, toLight);
    let _e7 = evalDistanceAttenuationX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWC5DUMVXHKYLUNFXW4X(dSquared_1, invRangeSquared_1, 2f, 0.0001f);
    let direction_7 = normalize(select(vec3<f32>(0f, 0f, -1f), toLight, (dSquared_1 > 0.0001f)));
    let _e22 = evalSpotConeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWC5DUMVXHKYLUNFXW4X(cosInner_1, cosOuter_1, dot(direction_7, -(normalize(lightDir))));
    return (_e7 * _e22);
}

fn projectSpotUvX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWC5DUMVXHKYLUNFXW4X(lightViewProj: mat4x4<f32>, worldPos_2: vec3<f32>) -> vec2<f32> {
    let clip_3 = (lightViewProj * vec4<f32>(worldPos_2, 1f));
    let invW = select((1f / clip_3.w), 0f, (abs(clip_3.w) < 0.000001f));
    return vec2<f32>((((clip_3.x * invW) * 0.5f) + 0.5f), (((clip_3.y * invW) * -0.5f) + 0.5f));
}

fn spotModifierProductX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXG4DPORPW233ENFTGSZLSOMX(brdf: f32, range: f32, cone: f32, ies: f32, cookie: f32, shadow: f32) -> f32 {
    return (((((brdf * range) * cone) * ies) * cookie) * shadow);
}

fn sample_shadow_2d_punctualX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMap_3: texture_depth_2d_array, shadowSampler_3: sampler_comparison, uv_4: vec2<f32>, layer_4: i32, texel_2: vec2<f32>, depthRef_3: f32, kernelSize: f32, pixel_2: vec2<f32>, extent_4: vec2<f32>) -> f32 {
    let radius_1 = max(0f, ((kernelSize - 1f) * 0.5f));
    if (radius_1 == 0f) {
        let _e12 = textureDimensions(shadowMap_3);
        let edge_2 = (vec2(0.5f) / vec2<f32>(_e12));
        let _e22 = textureSampleCompareLevel(shadowMap_3, shadowSampler_3, clamp(uv_4, edge_2, (extent_4 - edge_2)), layer_4, depthRef_3);
        return _e22;
    }
    let _e28 = sample_shadow_2d_vogelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMap_3, shadowSampler_3, uv_4, layer_4, (texel_2 * radius_1), depthRef_3, vec2(0f), pixel_2, extent_4);
    return _e28;
}

fn evalPunctualBodyX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA5LOMN2HKYLMX(lightPos_2: vec3<f32>, colorTimesIntensity: vec3<f32>, invRangeSquared_2: f32, decay_1: f32, worldPos_3: vec3<f32>, normal_7: vec3<f32>, viewDir_1: vec3<f32>, baseColor_2: vec3<f32>, metallic_3: f32, alphaSq_1: f32, F0_5: vec3<f32>, transmission_1: vec3<f32>, useDirectDfgLut_1: bool, directDfgLut_4: texture_2d<f32>, directDfgSampler_4: sampler) -> vec3<f32> {
    let toLight_1 = (lightPos_2 - worldPos_3);
    let dSquared_2 = max(dot(toLight_1, toLight_1), 0.0001f);
    let l_4 = (toLight_1 / vec3(sqrt(dSquared_2)));
    let h_1 = normalize((viewDir_1 + l_4));
    let signedNDotL_1 = dot(normal_7, l_4);
    let nDotL_4 = max(signedNDotL_1, 0f);
    let nDotV_6 = max(dot(normal_7, viewDir_1), 0.00001f);
    let nDotH_3 = max(dot(normal_7, h_1), 0f);
    let vDotH_3 = max(dot(viewDir_1, h_1), 0f);
    let _e32 = standardOpaqueBrdfX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(baseColor_2, metallic_3, alphaSq_1, F0_5, nDotV_6, nDotL_4, nDotH_3, vDotH_3, useDirectDfgLut_1, directDfgLut_4, directDfgSampler_4);
    let _e36 = evalDistanceAttenuationX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWC5DUMVXHKYLUNFXW4X(dSquared_2, invRangeSquared_2, decay_1, 0.0001f);
    let transmitted_1 = (transmission_1 * (max(-(signedNDotL_1), 0f) / 3.1415927f));
    return ((((_e32 * colorTimesIntensity) * nDotL_4) * _e36) + ((transmitted_1 * colorTimesIntensity) * _e36));
}

fn evalPointX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA5LOMN2HKYLMX(lightPos_3: vec3<f32>, colorTimesIntensity_1: vec3<f32>, invRangeSquared_3: f32, decay_2: f32, worldPos_4: vec3<f32>, normal_8: vec3<f32>, viewDir_2: vec3<f32>, baseColor_3: vec3<f32>, metallic_4: f32, alphaSq_2: f32, F0_6: vec3<f32>, transmission_2: vec3<f32>, useDirectDfgLut_2: bool, directDfgLut_5: texture_2d<f32>, directDfgSampler_5: sampler) -> vec3<f32> {
    let _e15 = evalPunctualBodyX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA5LOMN2HKYLMX(lightPos_3, colorTimesIntensity_1, invRangeSquared_3, decay_2, worldPos_4, normal_8, viewDir_2, baseColor_3, metallic_4, alphaSq_2, F0_6, transmission_2, useDirectDfgLut_2, directDfgLut_5, directDfgSampler_5);
    return _e15;
}

fn evalPointFlatX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA5LOMN2HKYLMX(lightPos_4: vec3<f32>, colorTimesIntensity_2: vec3<f32>, invRangeSquared_4: f32, decay_3: f32, worldPos_5: vec3<f32>, baseColor_4: vec3<f32>) -> vec3<f32> {
    let toLight_2 = (lightPos_4 - worldPos_5);
    let dSquared_3 = max(dot(toLight_2, toLight_2), 0.0001f);
    let _e12 = evalDistanceAttenuationX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWC5DUMVXHKYLUNFXW4X(dSquared_3, invRangeSquared_4, decay_3, 0.0001f);
    return ((baseColor_4 * colorTimesIntensity_2) * _e12);
}

fn evalSpotFlatX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA5LOMN2HKYLMX(lightPos_5: vec3<f32>, lightDir_1: vec3<f32>, colorTimesIntensity_3: vec3<f32>, cosInner_2: f32, cosOuter_2: f32, invRangeSquared_5: f32, worldPos_6: vec3<f32>, baseColor_5: vec3<f32>) -> vec3<f32> {
    let toLight_3 = (lightPos_5 - worldPos_6);
    let dSquared_4 = max(dot(toLight_3, toLight_3), 0.0001f);
    let l_5 = (toLight_3 / vec3(sqrt(dSquared_4)));
    let _e14 = evalSpotConeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWC5DUMVXHKYLUNFXW4X(cosInner_2, cosOuter_2, dot(l_5, -(lightDir_1)));
    let _e19 = evalPointFlatX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA5LOMN2HKYLMX(lightPos_5, colorTimesIntensity_3, invRangeSquared_5, 2f, worldPos_6, baseColor_5);
    return (_e19 * _e14);
}

fn evalSpotX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA5LOMN2HKYLMX(lightPos_6: vec3<f32>, lightDir_2: vec3<f32>, colorTimesIntensity_4: vec3<f32>, cosInner_3: f32, cosOuter_3: f32, invRangeSquared_6: f32, worldPos_7: vec3<f32>, normal_9: vec3<f32>, viewDir_3: vec3<f32>, baseColor_6: vec3<f32>, metallic_5: f32, alphaSq_3: f32, F0_7: vec3<f32>, transmission_3: vec3<f32>, useDirectDfgLut_3: bool, directDfgLut_6: texture_2d<f32>, directDfgSampler_6: sampler) -> vec3<f32> {
    let _e15 = evalPunctualBodyX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA5LOMN2HKYLMX(lightPos_6, colorTimesIntensity_4, invRangeSquared_6, 2f, worldPos_7, normal_9, viewDir_3, baseColor_6, metallic_5, alphaSq_3, F0_7, transmission_3, useDirectDfgLut_3, directDfgLut_6, directDfgSampler_6);
    let toLight_4 = (lightPos_6 - worldPos_7);
    let l_6 = normalize(toLight_4);
    let _e23 = evalSpotConeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWC5DUMVXHKYLUNFXW4X(cosInner_3, cosOuter_3, dot(l_6, -(lightDir_2)));
    let _e29 = spotModifierProductX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXG4DPORPW233ENFTGSZLSOMX(1f, 1f, _e23, 1f, 1f, 1f);
    return (_e15 * _e29);
}

fn evalSpotShadowedX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA5LOMN2HKYLMX(lightPos_7: vec3<f32>, lightDir_3: vec3<f32>, colorTimesIntensity_5: vec3<f32>, cosInner_4: f32, cosOuter_4: f32, invRangeSquared_7: f32, worldPos_8: vec3<f32>, normal_10: vec3<f32>, viewDir_4: vec3<f32>, baseColor_7: vec3<f32>, metallic_6: f32, alphaSq_4: f32, F0_8: vec3<f32>, transmission_4: vec3<f32>, lightViewProj_1: mat4x4<f32>, shadowAtlasTile: i32, depthBias: f32, normalBias: f32, shadowControls: vec4<f32>, shadowIntensity: f32, pixel_3: vec2<f32>, useDirectDfgLut_4: bool, directDfgLut_7: texture_2d<f32>, directDfgSampler_7: sampler) -> vec3<f32> {
    var local_4: bool;
    var local_5: bool;
    var local_6: bool;
    var local_7: bool;
    var local_8: bool;
    var shadowFactor: f32 = 1f;

    let _e18 = evalSpotX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA5LOMN2HKYLMX(lightPos_7, lightDir_3, colorTimesIntensity_5, cosInner_4, cosOuter_4, invRangeSquared_7, worldPos_8, normal_10, viewDir_4, baseColor_7, metallic_6, alphaSq_4, F0_8, transmission_4, useDirectDfgLut_4, directDfgLut_7, directDfgSampler_7);
    let facing = select(-(normal_10), normal_10, (dot(normal_10, (lightPos_7 - worldPos_8)) >= 0f));
    let receiver_1 = (worldPos_8 + (select(facing, normal_10, (shadowControls.y > 0.5f)) * normalBias));
    let splane = (lightViewProj_1 * vec4<f32>(receiver_1, 1f));
    let invW_1 = select((1f / splane.w), 0f, (abs(splane.w) < 0.000001f));
    let _e46 = projectSpotUvX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWC5DUMVXHKYLUNFXW4X(lightViewProj_1, receiver_1);
    let depthRef_4 = (splane.z * invW_1);
    if (_e46.x >= 0f) {
        local_4 = (_e46.x <= 1f);
    } else {
        local_4 = false;
    }
    let _e58 = local_4;
    if _e58 {
        local_5 = (_e46.y >= 0f);
    } else {
        local_5 = false;
    }
    let _e65 = local_5;
    if _e65 {
        local_6 = (_e46.y <= 1f);
    } else {
        local_6 = false;
    }
    let _e72 = local_6;
    if _e72 {
        local_7 = (depthRef_4 >= 0f);
    } else {
        local_7 = false;
    }
    let _e78 = local_7;
    if _e78 {
        local_8 = (depthRef_4 <= 1f);
    } else {
        local_8 = false;
    }
    let _e84 = local_8;
    if !(_e84) {
        return _e18;
    }
    let _e88 = textureDimensions(spotShadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, 0i);
    let layerDims = vec2<f32>(_e88);
    let texel_4 = (vec2<f32>(1f, 1f) / layerDims);
    let aspect = max(shadowControls.w, 0.000001f);
    let viewportScale = vec2<f32>(min(1f, aspect), min(1f, (1f / aspect)));
    let uv_10 = (_e46 * viewportScale);
    if (shadowControls.z == 1f) {
        let _e113 = sample_shadow_2d_nearestX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(spotShadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, uv_10, shadowAtlasTile, (depthRef_4 + depthBias), viewportScale);
        shadowFactor = _e113;
    } else {
        if (shadowControls.z == 8f) {
            let _e121 = sample_shadow_varianceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(uv_10, (shadowAtlasTile + 4i), (depthRef_4 + depthBias), viewportScale);
            shadowFactor = _e121;
        } else {
            if (shadowControls.z == 7f) {
                let _e128 = sample_shadow_2d_softX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(spotShadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, uv_10, shadowAtlasTile, texel_4, (depthRef_4 + depthBias), viewportScale);
                shadowFactor = _e128;
            } else {
                let _e139 = sample_shadow_2d_punctualX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(spotShadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, uv_10, shadowAtlasTile, (texel_4 * vec2<f32>(1f, (1f / aspect))), (depthRef_4 + depthBias), shadowControls.x, pixel_3, viewportScale);
                shadowFactor = _e139;
            }
        }
    }
    let _e140 = shadowFactor;
    return (_e18 * mix(1f, _e140, clamp(shadowIntensity, 0f, 1f)));
}

fn spotModifierFactorsX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXG4DPORPW233ENFTGSZLSOMX(lightPos_8: vec3<f32>, lightDir_4: vec3<f32>, cosOuter_5: f32, worldPos_9: vec3<f32>, rollDeg: f32, metadata: vec4<u32>) -> vec4<f32> {
    return vec4(1f);
}

fn evalRectAreaLtcStandardX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXEZLDORPWC4TFMEX(lightPos_9: vec3<f32>, lightColor: vec3<f32>, axisX_1: vec3<f32>, axisY_1: vec3<f32>, halfWidth: f32, halfHeight: f32, invRangeSquared_8: f32, worldPos_10: vec3<f32>, n: vec3<f32>, v_2: vec3<f32>, baseColor_8: vec3<f32>, metallic_7: f32, alphaSq_5: f32, F0_9: vec3<f32>, transmission_5: vec3<f32>, sourceSlice: u32) -> vec3<f32> {
    return vec3(0f);
}

fn evalRectAreaLtcGgxX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXEZLDORPWC4TFMEX(lightPos_10: vec3<f32>, lightColor_1: vec3<f32>, axisX_2: vec3<f32>, axisY_2: vec3<f32>, halfWidth_1: f32, halfHeight_1: f32, invRangeSquared_9: f32, worldPos_11: vec3<f32>, n_1: vec3<f32>, v_3: vec3<f32>, baseColor_9: vec3<f32>, metallic_8: f32, alphaSq_6: f32, F0_10: vec3<f32>, transmission_6: vec3<f32>, sourceSlice_1: u32) -> vec3<f32> {
    let _e16 = evalRectAreaLtcStandardX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXEZLDORPWC4TFMEX(lightPos_10, lightColor_1, axisX_2, axisY_2, halfWidth_1, halfHeight_1, invRangeSquared_9, worldPos_11, n_1, v_3, baseColor_9, metallic_8, alphaSq_6, F0_10, transmission_6, sourceSlice_1);
    return _e16;
}

fn view_z_to_z_sliceX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(view_z: f32, grid_z: u32, near: f32, far: f32, log_far_over_near: f32) -> u32 {
    if (view_z >= -(near)) {
        return 0u;
    }
    let slice_1 = floor(((log((-(view_z) / near)) / log_far_over_near) * f32(grid_z)));
    let u_slice = u32(slice_1);
    if (u_slice >= grid_z) {
        return (grid_z - 1u);
    }
    return u_slice;
}

fn ndc_position_to_clusterX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(ndc: vec3<f32>, view_z_1: f32, grid_x: u32, grid_y: u32, grid_z_1: u32, near_1: f32, far_1: f32, log_far: f32) -> vec3<u32> {
    let cx = clamp(u32(floor((((ndc.x * 0.5f) + 0.5f) * f32(grid_x)))), 0u, (grid_x - 1u));
    let cy = clamp(u32(floor((((ndc.y * 0.5f) + 0.5f) * f32(grid_y)))), 0u, (grid_y - 1u));
    let _e34 = view_z_to_z_sliceX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(view_z_1, grid_z_1, near_1, far_1, log_far);
    return vec3<u32>(cx, cy, _e34);
}

fn load_cluster_texelX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(texel_3: u32) -> vec4<u32> {
    let _e10 = textureLoad(cluster_data_textureX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX, vec2<i32>(i32((texel_3 % CLUSTER_TEXTURE_WIDTHX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX)), i32((texel_3 / CLUSTER_TEXTURE_WIDTHX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX))), 0i);
    return _e10;
}

fn load_cluster_wordX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(word: u32) -> u32 {
    let _e3 = load_cluster_texelX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX((word >> 2u));
    return _e3[(word & 3u)];
}

fn load_cluster_lightX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(index: u32) -> DirectLightSlotX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX {
    let first = (index * 6u);
    let _e3 = load_cluster_texelX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(first);
    let _e7 = load_cluster_texelX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX((first + 1u));
    let _e11 = load_cluster_texelX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX((first + 2u));
    let _e15 = load_cluster_texelX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX((first + 3u));
    let _e19 = load_cluster_texelX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX((first + 4u));
    let _e22 = load_cluster_texelX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX((first + 5u));
    return DirectLightSlotX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(bitcast<vec4<f32>>(_e3), bitcast<vec4<f32>>(_e7), bitcast<vec4<f32>>(_e11), bitcast<vec4<f32>>(_e15), _e19, _e22);
}

fn evaluate_cluster_lightX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(light_1: DirectLightSlotX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX, world_pos: vec3<f32>, normal_11: vec3<f32>, view_dir: vec3<f32>, base_color: vec3<f32>, metallic_9: f32, alpha_sq: f32, f0_3: vec3<f32>, transmission_7: vec3<f32>, flat_2d: bool, receive_shadows: bool, pixel_4: vec2<f32>, useDirectDfgLut_5: bool, directDfgLut_8: texture_2d<f32>, directDfgSampler_8: sampler) -> vec3<f32> {
    var projector_selected: bool = false;
    var tile: i32;
    var local_9: bool;
    var local_10: bool;
    var local_11: bool;

    let kind = (light_1.metadata.x & KIND_MASKX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX);
    if (kind == KIND_POINTX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX) {
        let _e19 = iesProfileFactorX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWSZLTL5YHE33GNFWGKX(light_1.position.xyz, light_1.auxiliary.xyz, light_1.direction.xyz, world_pos, light_1.metadata.z);
        let radiance_1 = (light_1.colorTimesIntensity.xyz * _e19);
        if flat_2d {
            let _e29 = evalPointFlatX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA5LOMN2HKYLMX(light_1.position.xyz, radiance_1, light_1.position.w, light_1.colorTimesIntensity.w, world_pos, base_color);
            return _e29;
        }
        let _e45 = evalPointX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA5LOMN2HKYLMX(light_1.position.xyz, radiance_1, light_1.position.w, light_1.colorTimesIntensity.w, world_pos, normal_11, view_dir, base_color, metallic_9, alpha_sq, f0_3, transmission_7, useDirectDfgLut_5, directDfgLut_8, directDfgSampler_8);
        return _e45;
    }
    if (kind == KIND_SPOTX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX) {
        if flat_2d {
            let _e60 = evalSpotFlatX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA5LOMN2HKYLMX(light_1.position.xyz, light_1.direction.xyz, light_1.colorTimesIntensity.xyz, light_1.colorTimesIntensity.w, light_1.direction.w, light_1.position.w, world_pos, base_color);
            return _e60;
        }
        let _e70 = spotModifierFactorsX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXG4DPORPW233ENFTGSZLSOMX(light_1.position.xyz, light_1.direction.xyz, light_1.direction.w, world_pos, light_1.auxiliary.w, light_1.metadata);
        let modifier = (vec3(_e70.x) * _e70.yzw);
        let encoded_tile = bitcast<i32>(light_1.metadata.y);
        tile = encoded_tile;
        if (encoded_tile >= 0i) {
            local_9 = ((encoded_tile & PROJECTOR_FLAGX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX) != 0i);
        } else {
            local_9 = false;
        }
        let _e88 = local_9;
        if _e88 {
            projector_selected = true;
            tile = (encoded_tile & TILE_MASKX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX);
        }
        if receive_shadows {
            let _e94 = tile;
            local_10 = (_e94 >= 0i);
        } else {
            local_10 = false;
        }
        let _e100 = local_10;
        if _e100 {
            let _e101 = tile;
            local_11 = (_e101 < 4i);
        } else {
            local_11 = false;
        }
        let _e107 = local_11;
        if _e107 {
            let _e122 = tile;
            let _e124 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.spotLightViewProj[_e122];
            let _e125 = tile;
            let _e144 = evalSpotShadowedX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA5LOMN2HKYLMX(light_1.position.xyz, light_1.direction.xyz, light_1.colorTimesIntensity.xyz, light_1.colorTimesIntensity.w, light_1.direction.w, light_1.position.w, world_pos, normal_11, view_dir, base_color, metallic_9, alpha_sq, f0_3, transmission_7, _e124, _e125, light_1.auxiliary.x, light_1.auxiliary.y, vec4<f32>(f32(max((light_1.metadata.x >> PCF_SHIFTX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX), 1u)), 0f, 6f, 1f), light_1.auxiliary.z, pixel_4, useDirectDfgLut_5, directDfgLut_8, directDfgSampler_8);
            return (_e144 * modifier);
        }
        let _e158 = evalSpotX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA5LOMN2HKYLMX(light_1.position.xyz, light_1.direction.xyz, light_1.colorTimesIntensity.xyz, light_1.colorTimesIntensity.w, light_1.direction.w, light_1.position.w, world_pos, normal_11, view_dir, base_color, metallic_9, alpha_sq, f0_3, transmission_7, useDirectDfgLut_5, directDfgLut_8, directDfgSampler_8);
        return (_e158 * modifier);
    }
    if (kind == KIND_RECT_AREAX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX) {
        let _e172 = iesProfileFactorX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWSZLTL5YHE33GNFWGKX(light_1.position.xyz, light_1.auxiliary.xyz, light_1.direction.xyz, world_pos, light_1.metadata.z);
        let radiance_2 = (light_1.colorTimesIntensity.xyz * _e172);
        let _e188 = evalRectAreaLtcGgxX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXEZLDORPWC4TFMEX(light_1.position.xyz, radiance_2, light_1.auxiliary.xyz, light_1.direction.xyz, light_1.colorTimesIntensity.w, light_1.direction.w, light_1.position.w, world_pos, normal_11, view_dir, base_color, metallic_9, alpha_sq, f0_3, transmission_7, light_1.metadata.w);
        return _e188;
    }
    return vec3(0f);
}

fn evaluateStandardClusterLightsX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(ndc_1: vec3<f32>, pixel_5: vec2<f32>, view_z_2: f32, world_pos_1: vec3<f32>, normal_12: vec3<f32>, view_dir_1: vec3<f32>, base_color_1: vec3<f32>, metallic_10: f32, alpha_sq_1: f32, f0_4: vec3<f32>, transmission_8: vec3<f32>, flat_2d_1: bool, receive_shadows_1: bool, receiver_channels: u32, useDirectDfgLut_6: bool, directDfgLut_9: texture_2d<f32>, directDfgSampler_9: sampler) -> vec3<f32> {
    var total_radiance: vec3<f32> = vec3(0f);
    var i_1: u32 = 0u;

    let _e6 = cluster_uniformX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX.grid.w;
    if (_e6 == 0u) {
        return vec3(0f);
    }
    let gx = cluster_uniformX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX.grid.x;
    let gy = cluster_uniformX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX.grid.y;
    let gz = cluster_uniformX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX.grid.z;
    let near_2 = cluster_uniformX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX.near_far_log.x;
    let far_2 = cluster_uniformX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX.near_far_log.y;
    let log_far_1 = cluster_uniformX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX.near_far_log.z;
    let _e37 = ndc_position_to_clusterX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(ndc_1, view_z_2, gx, gy, gz, near_2, far_2, log_far_1);
    let cluster_linear = ((((_e37.z * gy) * gx) + (_e37.y * gx)) + _e37.x);
    let grid_offset = (cluster_linear * 2u);
    let _e50 = load_cluster_wordX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX((CLUSTER_TEXTURE_GRID_WORD_OFFSETX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX + grid_offset));
    let _e55 = load_cluster_wordX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(((CLUSTER_TEXTURE_GRID_WORD_OFFSETX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX + grid_offset) + 1u));
    let list_word_offset = (CLUSTER_TEXTURE_GRID_WORD_OFFSETX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX + (((gx * gy) * gz) * 2u));
    loop {
        let _e63 = i_1;
        if (_e63 < _e55) {
        } else {
            break;
        }
        {
            let _e66 = i_1;
            let _e68 = load_cluster_wordX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(((list_word_offset + _e50) + _e66));
            let _e69 = load_cluster_lightX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(_e68);
            let _e73 = lightingChannelsMatchX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(_e69.channels.x, receiver_channels);
            if !(_e73) {
                continue;
            }
            let _e76 = total_radiance;
            let _e91 = evaluate_cluster_lightX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(_e69, world_pos_1, normal_12, view_dir_1, base_color_1, metallic_10, alpha_sq_1, f0_4, transmission_8, flat_2d_1, receive_shadows_1, pixel_5, useDirectDfgLut_6, directDfgLut_9, directDfgSampler_9);
            total_radiance = (_e76 + _e91);
        }
        continuing {
            let _e93 = i_1;
            i_1 = (_e93 + 1u);
        }
    }
    let _e96 = total_radiance;
    return _e96;
}

fn evaluateStandardEnvironmentX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43UMFXGIYLSMRPWY2LHNB2GS3THX(worldPosition_3: vec3<f32>, normal_13: vec3<f32>, direction_5: vec3<f32>, albedo_1: vec3<f32>, transmission_9: vec3<f32>, metallic_11: f32, roughness_9: f32, f0_5: vec3<f32>, dielectricSpecular: vec4<f32>, metallicF0_: vec3<f32>, sky_1: SkylightUniformsX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43UMFXGIYLSMRPWY2LHNB2GS3THX, irradianceMap_1: texture_cube<f32>, irradianceSampler_1: sampler, prefilterMap_1: texture_2d<f32>, prefilterSampler_1: sampler, brdfLut: texture_2d<f32>, skylightPrefilterMap: texture_2d<f32>, sh: array<vec4<f32>, 9>, localBlend: f32) -> StandardEnvironmentX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43UMFXGIYLSMRPWY2LHNB2GS3THX {
    var irradiance: vec3<f32>;
    var specular: vec3<f32>;
    var diffuse: vec3<f32>;
    var multiIrradiance: vec3<f32>;

    if (sky_1.intensity < 0f) {
        let _e8 = sampleIblDiffuseX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(normal_13, sky_1.diffuseRotation, irradianceMap_1, irradianceSampler_1);
        irradiance = _e8;
        let _e40 = sampleReflectionProbeRadianceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(normal_13, direction_5, roughness_9, worldPosition_3, vec3<f32>(sky_1.colorR, sky_1.colorG, sky_1.colorB), sky_1.rotation.xyz, vec4<f32>(0f, 0f, 0f, 1f), prefilterMap_1, prefilterSampler_1, skylightPrefilterMap, sky_1.diffuseRotation, sky_1.diffuseScale.xyz, max((-(sky_1.intensity) - 1f), 0f), (sky_1.rotation.w > 0.5f));
        specular = _e40;
    } else {
        let _e43 = sampleIblDiffuseX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(normal_13, sky_1.rotation, irradianceMap_1, irradianceSampler_1);
        irradiance = _e43;
        let _e45 = sampleIblRadianceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(normal_13, direction_5, roughness_9, sky_1.rotation, prefilterMap_1, prefilterSampler_1);
        specular = _e45;
    }
    let tint = vec3<f32>(sky_1.colorR, sky_1.colorG, sky_1.colorB);
    let diffuseScale = select((tint * sky_1.intensity), sky_1.diffuseScale.xyz, (sky_1.intensity < 0f));
    let _e62 = fresnelSchlickRoughnessX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXG2DBOJSWIX(max(dot(normal_13, direction_5), 0f), f0_5, roughness_9);
    let _e69 = textureSampleLevel(brdfLut, irradianceSampler_1, vec2<f32>(max(dot(normal_13, direction_5), 0.001f), roughness_9), 0f);
    let ab_1 = _e69.xy;
    let _e74 = environmentScatteringFromDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(ab_1, dielectricSpecular.xyz, dielectricSpecular.w);
    let _e77 = environmentScatteringFromDfgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(ab_1, metallicF0_, dielectricSpecular.w);
    let single_2 = mix(_e74.single, _e77.single, metallic_11);
    let multi = mix(_e74.multi, _e77.multi, metallic_11);
    let kD = (max(vec3(0f), ((vec3(1f) - _e74.single) - _e74.multi)) * (1f - metallic_11));
    let _e98 = irradiance;
    diffuse = (((kD * _e98) * albedo_1) * diffuseScale);
    if (localBlend > 0f) {
        let _e106 = irradiance;
        let _e116 = evaluateProbeDiffuseX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA4TPMJSQX(sh, localBlend, normal_13, (_e106 * diffuseScale), (kD / max(vec3((1f - metallic_11)), vec3(0.0001f))), albedo_1, metallic_11);
        diffuse = _e116;
    }
    let _e117 = irradiance;
    multiIrradiance = (_e117 * diffuseScale);
    if (localBlend > 0f) {
        let _e122 = multiIrradiance;
        let _e128 = evaluateProbeDiffuseX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA4TPMJSQX(sh, localBlend, normal_13, _e122, vec3(1f), vec3(1f), 0f);
        multiIrradiance = _e128;
    }
    let _e129 = diffuse;
    let _e130 = multiIrradiance;
    diffuse = (_e129 + (multi * _e130));
    let _e133 = diffuse;
    diffuse = (_e133 + (((sky_1.ambientIrradiance.xyz * albedo_1) * (1f - metallic_11)) * 0.31830987f));
    if any((transmission_9 > vec3(0f))) {
        let rotation_13 = select(sky_1.rotation, sky_1.diffuseRotation, (sky_1.intensity < 0f));
        let _e155 = sampleIblDiffuseX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(-(normal_13), rotation_13, irradianceMap_1, irradianceSampler_1);
        let backFresnel = (vec3(1f) - _e62);
        if (localBlend > 0f) {
            let _e161 = diffuse;
            let _e165 = evaluateProbeDiffuseX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PXA4TPMJSQX(sh, localBlend, -(normal_13), (_e155 * diffuseScale), backFresnel, transmission_9, 0f);
            diffuse = (_e161 + _e165);
        } else {
            let _e167 = diffuse;
            diffuse = (_e167 + (((backFresnel * _e155) * transmission_9) * diffuseScale));
        }
    }
    let _e172 = diffuse;
    let _e173 = specular;
    let _e176 = decodeSpecularEnvironmentScaleX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(tint, sky_1.intensity);
    return StandardEnvironmentX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43UMFXGIYLSMRPWY2LHNB2GS3THX(_e172, ((_e173 * single_2) * _e176), vec4<f32>(single_2, _e74.missingEnergy));
}

fn evaluateStandardDirectX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43UMFXGIYLSMRPWY2LHNB2GS3THX(worldPosition_4: vec3<f32>, ndc_2: vec3<f32>, viewZ: f32, pixel_6: vec2<f32>, normal_14: vec3<f32>, direction_6: vec3<f32>, albedo_2: vec3<f32>, transmission_10: vec3<f32>, metallic_12: f32, alpha_1: f32, f0_6: vec3<f32>, shadow_1: f32, receiveShadows: bool, receiverChannels: u32, splitDiffuse: bool, useDirectDfgLut_7: bool, directDfgLut_10: texture_2d<f32>, directDfgSampler_10: sampler) -> StandardDirectX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43UMFXGIYLSMRPWY2LHNB2GS3THX {
    var direct: vec3<f32> = vec3(0f);
    var diffuse_1: vec3<f32> = vec3(0f);
    var specular_1: vec3<f32> = vec3(0f);

    let _e4 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightingChannels;
    let _e6 = lightingChannelsMatchX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(_e4, receiverChannels);
    if _e6 {
        let _e8 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
        let _e19 = evalDirectionalNoShadowX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(normal_14, direction_6, albedo_2, metallic_12, alpha_1, f0_6, transmission_10, useDirectDfgLut_7, directDfgLut_10, directDfgSampler_10);
        let _e23 = view_apply_direct_solarX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(_e8, (shadow_1 * _e19), worldPosition_4);
        direct = _e23;
    }
    let _e25 = direct;
    let _e31 = evaluateStandardClusterLightsX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(ndc_2, pixel_6, viewZ, worldPosition_4, normal_14, direction_6, albedo_2, metallic_12, alpha_1, f0_6, transmission_10, false, receiveShadows, receiverChannels, useDirectDfgLut_7, directDfgLut_10, directDfgSampler_10);
    direct = (_e25 + _e31);
    if splitDiffuse {
        let _e36 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightingChannels;
        let _e37 = lightingChannelsMatchX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(_e36, receiverChannels);
        if _e37 {
            let _e39 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
            let _e42 = evalDirectionalNoShadowX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(normal_14, direction_6, vec3(0f), metallic_12, alpha_1, f0_6, transmission_10, useDirectDfgLut_7, directDfgLut_10, directDfgSampler_10);
            let _e44 = view_apply_direct_solarX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(_e39, (shadow_1 * _e42), worldPosition_4);
            specular_1 = _e44;
        }
        let _e46 = specular_1;
        let _e50 = evaluateStandardClusterLightsX_naga_oil_mod_XMZXXEZ3FMF4F643UMFXGIYLSMQ5DUY3MOVZXIZLSX(ndc_2, pixel_6, viewZ, worldPosition_4, normal_14, direction_6, vec3(0f), metallic_12, alpha_1, f0_6, transmission_10, false, receiveShadows, receiverChannels, useDirectDfgLut_7, directDfgLut_10, directDfgSampler_10);
        specular_1 = (_e46 + _e50);
        let _e52 = direct;
        let _e53 = specular_1;
        diffuse_1 = (_e52 - _e53);
    }
    let _e56 = direct;
    let _e57 = diffuse_1;
    return StandardDirectX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43UMFXGIYLSMRPWY2LHNB2GS3THX(_e56, _e57);
}

fn materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(source: vec2<f32>, transform: vec4<f32>, rotation_4: vec4<f32>) -> vec2<f32> {
    let scaled = (source * transform.zw);
    return vec2<f32>(((scaled.x * rotation_4.x) - (scaled.y * rotation_4.y)), ((scaled.x * rotation_4.y) + (scaled.y * rotation_4.x)));
}

fn displaceVertexX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUZDJONYGYYLDMVWWK3TUX(position_2: vec3<f32>, normal_15: vec3<f32>, heightMap: texture_2d<f32>, heightSampler: sampler, scale: f32, bias: f32, transform_1: vec4<f32>, metadata_1: vec4<f32>, rotation_5: vec4<f32>, coordinates: array<vec2<f32>, 8>) -> vec3<f32> {
    let uv_11 = coordinates[u32(clamp(metadata_1.x, 0f, 7f))];
    let _e10 = materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(uv_11, transform_1, rotation_5);
    let transformed = ((_e10 + transform_1.xy) * metadata_1.zw);
    let _e18 = textureSampleLevel(heightMap, heightSampler, transformed, 0f);
    let height = clamp(_e18.x, 0f, 1f);
    let lengthSquared = dot(normal_15, normal_15);
    let direction_8 = (normal_15 * inverseSqrt(max(lengthSquared, 0.00000000000000000001f)));
    return (position_2 + (direction_8 * ((height * scale) + bias)));
}

fn displacedNormalX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUZDJONYGYYLDMVWWK3TUX(position_3: vec3<f32>, original: vec3<f32>) -> vec3<f32> {
    let _e1 = dpdx(position_3);
    let _e2 = dpdy(position_3);
    let geometric = cross(_e1, _e2);
    let lengthSquared_1 = dot(geometric, geometric);
    let unit = (geometric * inverseSqrt(max(lengthSquared_1, 0.000000000000000000000000000001f)));
    return select(original, (unit * select(-1f, 1f, (dot(unit, original) >= 0f))), (lengthSquared_1 > 0.000000000000000000000000000001f));
}

fn skinTaskDirectCandidateX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX() -> u32 {
    return 0u;
}

fn skinTaskDescriptorX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(candidate: u32) -> vec4<u32> {
    let _e3 = skinTaskCurrentX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX.state.x;
    let _e9 = skinTaskCurrentX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX.state.y;
    return vec4<u32>(0u, _e3, 0u, _e9);
}

fn skinTaskHistoryValidX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(descriptor: vec4<u32>) -> bool {
    return ((descriptor.w & 3u) == 3u);
}

fn skinTaskJointX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(descriptor_1: vec4<u32>, index_1: u32, previous: bool) -> mat4x4<f32> {
    var local_12: bool;

    if !(((descriptor_1.w & 1u) == 0u)) {
        local_12 = (index_1 >= descriptor_1.y);
    } else {
        local_12 = true;
    }
    let _e13 = local_12;
    if _e13 {
        return mat4x4<f32>(vec4(0f), vec4(0f), vec4(0f), vec4(0f));
    }
    if previous {
        let _e27 = skinTaskPreviousX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX.joints[index_1];
        return _e27;
    }
    let _e31 = skinTaskCurrentX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX.joints[index_1];
    return _e31;
}

fn skinTaskBlendX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(descriptor_2: vec4<u32>, indices: vec4<u32>, weights: vec4<f32>, previous_1: bool) -> mat4x4<f32> {
    let _e4 = skinTaskJointX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(descriptor_2, indices.x, previous_1);
    let _e9 = skinTaskJointX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(descriptor_2, indices.y, previous_1);
    let _e14 = skinTaskJointX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(descriptor_2, indices.z, previous_1);
    let _e19 = skinTaskJointX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(descriptor_2, indices.w, previous_1);
    return ((((_e4 * weights.x) + (_e9 * weights.y)) + (_e14 * weights.z)) + (_e19 * weights.w));
}

fn sampleMaterialTextureLinearX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(texture: texture_2d<f32>, textureSampler: sampler, uv_5: vec2<f32>, uvScale: vec2<f32>) -> vec4<f32> {
    let _e5 = textureSample(texture, textureSampler, (uv_5 * uvScale));
    return _e5;
}

fn sampleMaterialTextureX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(texture_1: texture_2d<f32>, textureSampler_1: sampler, uv_6: vec2<f32>, uvScale_1: vec2<f32>) -> vec4<f32> {
    let _e4 = sampleMaterialTextureLinearX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(texture_1, textureSampler_1, uv_6, uvScale_1);
    return _e4;
}

fn viewDirectionToCameraX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(worldPosition_5: vec3<f32>) -> vec3<f32> {
    let _e3 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cameraPos;
    let _e8 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.inverseViewProj[2];
    let _e13 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalProjection.z;
    return normalize(select((_e3 - worldPosition_5), _e8.xyz, (_e13 > 0.5f)));
}

fn unpackSceneTemporalV1X_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(packed: vec4<f32>) -> SceneTemporalV1X_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX {
    let invalidDepth = (packed.z < 0f);
    let validDepth = !(invalidDepth);
    let viewDepth_1 = select(0f, (exp2(packed.z) - 1f), validDepth);
    let motionUv = packed.xy;
    let motionInvalid = (packed.w >= 2f);
    let reactive_4 = clamp((packed.w - select(0f, 2f, motionInvalid)), 0f, 1f);
    return SceneTemporalV1X_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(motionUv, viewDepth_1, reactive_4, validDepth, !(motionInvalid));
}

fn sceneViewZX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(clip: vec4<f32>, temporalProjection: vec4<f32>) -> f32 {
    let ndcDepth = (clip.z / max(abs(clip.w), 0.000000000000000000000000000001f));
    let orthographicViewZ = -((temporalProjection.y - (ndcDepth * (temporalProjection.y - temporalProjection.x))));
    return select(-(clip.w), orthographicViewZ, (temporalProjection.z >= 0.5f));
}

fn sceneTemporalUvX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(clip_1: vec4<f32>) -> vec2<f32> {
    let safeW = select(0.000001f, clip_1.w, (abs(clip_1.w) >= 0.000001f));
    let ndc_3 = (clip_1.xy / vec2(safeW));
    return vec2<f32>(((ndc_3.x * 0.5f) + 0.5f), (0.5f - (ndc_3.y * 0.5f)));
}

fn sceneTemporalViewDepthX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(clip_2: vec4<f32>, temporalProjection_1: vec4<f32>) -> f32 {
    let _e2 = sceneViewZX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(clip_2, temporalProjection_1);
    return log2((1f + max(-(_e2), 0f)));
}

fn packSceneTemporalV1WithValidityX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(currentClip: vec4<f32>, previousClip: vec4<f32>, temporalProjection_2: vec4<f32>, reactive: f32, motionValid: bool) -> vec4<f32> {
    let _e1 = sceneTemporalUvX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(currentClip);
    let _e3 = sceneTemporalUvX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(previousClip);
    let _e6 = sceneTemporalViewDepthX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(currentClip, temporalProjection_2);
    return vec4<f32>((_e1 - _e3), _e6, (clamp(reactive, 0f, 1f) + select(0f, 2f, !(motionValid))));
}

fn clippedByPlanesX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(positionWS: vec3<f32>, planes: array<vec4<f32>, 6>, control: vec4<f32>) -> bool {
    var allOutside: bool;
    var anyOutside: bool = false;
    var index_2: u32 = 0u;
    var local_13: bool;
    var local_14: bool;

    let count_1 = min(u32(max(control.x, 0f)), 6u);
    allOutside = (count_1 > 0u);
    loop {
        let _e13 = index_2;
        if (_e13 < count_1) {
        } else {
            break;
        }
        {
            let _e17 = index_2;
            let _e21 = index_2;
            let outside = ((dot(planes[_e17].xyz, positionWS) + planes[_e21].w) < 0f);
            let _e28 = anyOutside;
            if !(_e28) {
                local_13 = outside;
            } else {
                local_13 = true;
            }
            let _e33 = local_13;
            anyOutside = _e33;
            let _e34 = allOutside;
            if _e34 {
                local_14 = outside;
            } else {
                local_14 = false;
            }
            let _e38 = local_14;
            allOutside = _e38;
        }
        continuing {
            let _e40 = index_2;
            index_2 = (_e40 + 1u);
        }
    }
    let _e42 = anyOutside;
    let _e43 = allOutside;
    return select(_e42, _e43, (control.y > 0.5f));
}

fn applyLocalClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(positionWS_1: vec3<f32>, shadow_2: bool, planes_1: array<vec4<f32>, 6>, control_1: vec4<f32>) {
    var local_15: bool;
    var local_16: bool;

    if !(!(shadow_2)) {
        local_15 = (control_1.z > 0.5f);
    } else {
        local_15 = true;
    }
    let _e10 = local_15;
    if _e10 {
        let _e13 = clippedByPlanesX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(positionWS_1, planes_1, control_1);
        local_16 = _e13;
    } else {
        local_16 = false;
    }
    let _e17 = local_16;
    if _e17 {
        discard;
    } else {
        return;
    }
}

fn applyViewClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(positionWS_2: vec3<f32>, shadow_3: bool) {
    let _e2 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.clippingPlanes;
    let _e5 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.clippingControl;
    applyLocalClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(positionWS_2, shadow_3, _e2, _e5);
    return;
}

fn view_atmosphereX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_4: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, position_4: vec3<f32>) -> AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX {
    return AtmosphereTransportX_naga_oil_mod_XMZXXEZ3FMF4F6YLUNVXXG4DIMVZGKOR2N5YHI2LDOMX(vec3(0f), vec3(1f));
}

fn view_distant_sky_lightX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_5: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX) -> vec3<f32> {
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

fn height_fog_with_sourceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_6: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos_12: vec3<f32>, source_1: vec3<f32>) -> FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
    var origin: vec3<f32>;

    origin = v_6.cameraPos;
    if (v_6.temporalProjection.z > 0.5f) {
        let forward = -(normalize(vec3<f32>(v_6.worldViewProj[0].z, v_6.worldViewProj[1].z, v_6.worldViewProj[2].z)));
        origin = (worldPos_12 - (forward * dot((worldPos_12 - v_6.cameraPos), forward)));
    }
    let _e25 = origin;
    let delta = (worldPos_12 - _e25);
    let distance_ = length(delta);
    if (distance_ < 0.00001f) {
        return FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(vec3(0f), 1f);
    }
    let params_1 = FogViewParamsX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_6.fogColorDensity.xyz, v_6.fogColorDensity.w, v_6.fogHeightOpacity.x, v_6.fogHeightOpacity.y);
    let _e44 = origin;
    let _e48 = fogOpticalDepthX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(params_1, FogRayX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(_e44, (delta / vec3(distance_)), distance_));
    let opacity_1 = (params_1.maxOpacity * (1f - exp(-(_e48))));
    return FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX((source_1 * opacity_1), (1f - opacity_1));
}

fn height_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_7: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos_13: vec3<f32>) -> FogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
    var source_2: vec3<f32>;

    source_2 = v_7.fogColorDensity.xyz;
    if (v_7.atmosphereControl.w > 0.5f) {
        let ground = ((v_7.atmosphere.originRadius.xyz * 1000f) + vec3<f32>(0f, 1f, 0f));
        let _e18 = source_2;
        let _e19 = view_distant_sky_lightX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_7);
        let _e20 = view_solar_transmittanceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_7, ground);
        source_2 = (_e18 + (_e19 + ((_e20 * v_7.lightColor) / vec3(12.566371f))));
    }
    let _e28 = source_2;
    let _e30 = height_fog_with_sourceX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_7, worldPos_13, _e28);
    return _e30;
}

fn view_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_8: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, position_5: vec3<f32>) -> AtmosphereFogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX {
    let _e2 = height_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_8, position_5);
    let _e3 = view_atmosphereX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTBORWW643QNBSXEZIX(v_8, position_5);
    return AtmosphereFogSampleX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX((_e2.inscatter + (_e2.transmittance * _e3.luminance)), (_e2.transmittance * _e3.transmittance));
}

fn translucent_fog_transmissionX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_9: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos_14: vec3<f32>, color: vec3<f32>, alpha_2: f32, backdrop: vec3<f32>, transmission_11: vec3<f32>) -> vec3<f32> {
    var local_17: bool;

    let composition = u32((v_9.fogHeightOpacity.z + 0.5f));
    if (composition == 0u) {
        local_17 = all((transmission_11 == vec3(0f)));
    } else {
        local_17 = false;
    }
    let _e16 = local_17;
    if _e16 {
        return color;
    }
    let _e19 = view_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_9, worldPos_14);
    let coverage_2 = select(1f, alpha_2, (composition == 2u));
    let inscatter = select((((vec3(1f) - transmission_11) * _e19.inscatter) * coverage_2), vec3(0f), (composition == 3u));
    return ((((color - backdrop) * _e19.transmittance) + backdrop) + inscatter);
}

fn translucent_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_10: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, worldPos_15: vec3<f32>, color_1: vec3<f32>, alpha_3: f32) -> vec3<f32> {
    let _e8 = translucent_fog_transmissionX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(v_10, worldPos_15, color_1, alpha_3, vec3(0f), vec3(0f));
    return _e8;
}

fn geometricNormalSpreadX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43QMVRXK3DBOJPWCYIX(geometricNormalWS: vec3<f32>) -> f32 {
    let n_2 = normalize(geometricNormalWS);
    let _e2 = dpdx(n_2);
    let _e4 = dpdy(n_2);
    let spread = max(abs(_e2), abs(_e4));
    return max(max(spread.x, spread.y), spread.z);
}

fn specularAntiAliasedRoughnessX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43QMVRXK3DBOJPWCYIX(roughness_10: f32, normalSpread: f32) -> f32 {
    return min((roughness_10 + (0.5f * normalSpread)), 1f);
}

fn alphaHash2DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(value: vec2<f32>) -> f32 {
    return fract(((10000f * sin(((17f * value.x) + (0.1f * value.y)))) * (0.1f + abs(sin(((13f * value.y) + value.x))))));
}

fn alphaHash3DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(value_1: vec3<f32>) -> f32 {
    let _e2 = alphaHash2DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(value_1.xy);
    let _e5 = alphaHash2DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(vec2<f32>(_e2, value_1.z));
    return _e5;
}

fn alphaHashThresholdX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(position_6: vec3<f32>, derivative: f32) -> f32 {
    var threshold: f32;

    let scale_3 = (1f / max((0.05f * derivative), 0.000001f));
    let level_1 = log2(scale_3);
    let _e13 = alphaHash3DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(floor((exp2(floor(level_1)) * position_6)));
    let _e18 = alphaHash3DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(floor((exp2(ceil(level_1)) * position_6)));
    let noise_1 = vec2<f32>(_e13, _e18);
    let t_2 = fract(level_1);
    let x_4 = mix(noise_1.x, noise_1.y, t_2);
    let a_3 = min(t_2, (1f - t_2));
    threshold = x_4;
    if (a_3 > 0f) {
        if (x_4 < a_3) {
            threshold = ((x_4 * x_4) / ((2f * a_3) * (1f - a_3)));
        } else {
            if (x_4 < (1f - a_3)) {
                threshold = ((x_4 - (0.5f * a_3)) / (1f - a_3));
            } else {
                threshold = (1f - (((1f - x_4) * (1f - x_4)) / ((2f * a_3) * (1f - a_3))));
            }
        }
    }
    let _e60 = threshold;
    return clamp(_e60, 0.000001f, 1f);
}

fn applyAlphaHashX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(alpha_4: f32, position_7: vec3<f32>, enabled: f32) {
    let _e1 = dpdx(position_7);
    let _e3 = dpdy(position_7);
    let derivative_1 = max(length(_e1), length(_e3));
    if (enabled > 0.5f) {
        let _e9 = alphaHashThresholdX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(position_7, derivative_1);
        if (alpha_4 < _e9) {
            discard;
        } else {
            return;
        }
    } else {
        return;
    }
}

fn alphaCoverageX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(alpha_5: f32, cutoff: f32, smoothing: f32) -> f32 {
    var coverage: f32;

    let width = fwidth(alpha_5);
    coverage = alpha_5;
    if (cutoff > 0f) {
        if (smoothing > 0.5f) {
            coverage = smoothstep(cutoff, (cutoff + max(width, 0.0000001f)), alpha_5);
            let _e13 = coverage;
            if (_e13 <= 0f) {
                discard;
            }
        } else {
            if (alpha_5 <= cutoff) {
                discard;
            }
        }
    }
    let _e17 = coverage;
    return _e17;
}

fn materialOutputAlphaX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(alpha_6: f32, mode: f32) -> f32 {
    var local_18: bool;

    if (mode > 0.5f) {
        local_18 = (mode < 1.5f);
    } else {
        local_18 = false;
    }
    let _e8 = local_18;
    return select(alpha_6, 1f, _e8);
}

fn materialOutputColorX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(color_2: vec3<f32>, alpha_7: f32, mode_1: f32) -> vec3<f32> {
    return (color_2 * select(1f, alpha_7, (mode_1 > 1.5f)));
}

fn standardDielectricF0X_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(ior: f32) -> f32 {
    let ratio = ((ior - 1f) / (ior + 1f));
    return (ratio * ratio);
}

fn _pickCascadeLayerX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(viewDepth: f32, count: u32) -> u32 {
    var layer_5: u32;
    var i_2: u32 = 0u;

    layer_5 = (count - 1u);
    loop {
        let _e6 = i_2;
        if (_e6 < (count - 1u)) {
        } else {
            break;
        }
        {
            let _e12 = i_2;
            let sp = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[_e12].x;
            if (viewDepth < sp) {
                let _e18 = i_2;
                layer_5 = _e18;
                break;
            }
        }
        continuing {
            let _e19 = i_2;
            i_2 = (_e19 + 1u);
        }
    }
    let _e22 = layer_5;
    return _e22;
}

fn _cascadeLightViewProjX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_6: u32) -> mat4x4<f32> {
    switch layer_6 {
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

fn _directionalReceiverDepthBiasX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_7: u32, normal_16: vec3<f32>, l: vec3<f32>, radius: f32) -> f32 {
    var local_19: bool;

    let _e4 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[0].w;
    if (_e4 > 0.5f) {
        let _e9 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
        return _e9;
    }
    let nDotL_5 = dot(normal_16, l);
    let depthSpan = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[layer_7].z;
    if (nDotL_5 > 0f) {
        local_19 = (depthSpan > 0f);
    } else {
        local_19 = false;
    }
    let _e26 = local_19;
    if !(_e26) {
        let _e30 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
        return _e30;
    }
    let _e31 = _cascadeLightViewProjX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_7);
    let right = normalize(vec3<f32>(_e31[0].x, _e31[1].x, _e31[2].x));
    let up = normalize(vec3<f32>(_e31[0].y, _e31[1].y, _e31[2].y));
    let _e53 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[layer_7].y;
    let footprint_2 = ((_e53 * radius) * (abs(dot(normal_16, right)) + abs(dot(normal_16, up))));
    let _e63 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.normalBias;
    let missingCoverage = max(0f, (footprint_2 - _e63));
    if !((missingCoverage > 0f)) {
        let _e72 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
        return _e72;
    }
    let _e75 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.depthBias;
    return min(1.0000001f, (_e75 + ((missingCoverage / nDotL_5) / depthSpan)));
}

fn _directionalReceiverPlaneGradientX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_8: u32, normal_17: vec3<f32>, l_1: vec3<f32>) -> vec2<f32> {
    var local_20: bool;
    var local_21: bool;

    let _e4 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[0].w;
    if (_e4 > 0.5f) {
        return vec2(0f);
    }
    if !((dot(normal_17, l_1) > 0.01f)) {
        return vec2(0f);
    }
    let _e18 = _cascadeLightViewProjX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_8);
    let row0_ = vec3<f32>(_e18[0].x, _e18[1].x, _e18[2].x);
    let row1_ = vec3<f32>(_e18[0].y, _e18[1].y, _e18[2].y);
    let row2_ = vec3<f32>(_e18[0].z, _e18[1].z, _e18[2].z);
    let sx = length(row0_);
    let sy = length(row1_);
    let sz = length(row2_);
    let nz = (dot(row2_, normal_17) / sz);
    if (abs(nz) > 0.01f) {
        local_20 = (sx > 0f);
    } else {
        local_20 = false;
    }
    let _e53 = local_20;
    if _e53 {
        local_21 = (sy > 0f);
    } else {
        local_21 = false;
    }
    let _e59 = local_21;
    if !(_e59) {
        return vec2(0f);
    }
    let _e65 = textureDimensions(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, 0i);
    let texels = vec2<f32>(_e65);
    let dzdx = ((-((dot(row0_, normal_17) / sx)) * sz) / (nz * sx));
    let dzdy = ((-((dot(row1_, normal_17) / sy)) * sz) / (nz * sy));
    return vec2<f32>(((dzdx * 2f) / texels.x), ((-(dzdy) * 2f) / texels.y));
}

fn _sampleShadowForCascadeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(worldPos_16: vec3<f32>, layer_9: u32, normal_18: vec3<f32>, l_2: vec3<f32>, layerBase: u32, pixel_7: vec2<f32>) -> f32 {
    var local_22: bool;
    var local_23: bool;
    var local_24: bool;
    var local_25: bool;
    var local_26: bool;
    var blocked: f32 = 0f;
    var x_1: i32 = -1i;
    var y_1: i32;
    var x_2: i32 = -2i;
    var y_2: i32;

    let _e4 = _cascadeLightViewProjX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_9);
    let lightClip = (_e4 * vec4<f32>(worldPos_16, 1f));
    let projCoords = (lightClip.xyz / vec3(lightClip.w));
    let tileUv = vec2<f32>(((projCoords.x * 0.5f) + 0.5f), ((-(projCoords.y) * 0.5f) + 0.5f));
    let _e29 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[3].w;
    let _e34 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[3].w;
    let aspect_1 = select(1f, _e29, (_e34 > 0f));
    let viewportScale_1 = vec2<f32>(min(1f, aspect_1), min(1f, (1f / aspect_1)));
    let uv_12 = (tileUv * viewportScale_1);
    let shadowLayer = i32((layer_9 + layerBase));
    let currentDepth = projCoords.z;
    if (tileUv.x >= 0f) {
        local_22 = (tileUv.x <= 1f);
    } else {
        local_22 = false;
    }
    let _e60 = local_22;
    if _e60 {
        local_23 = (tileUv.y >= 0f);
    } else {
        local_23 = false;
    }
    let _e67 = local_23;
    if _e67 {
        local_24 = (tileUv.y <= 1f);
    } else {
        local_24 = false;
    }
    let _e74 = local_24;
    if _e74 {
        local_25 = (currentDepth >= 0f);
    } else {
        local_25 = false;
    }
    let _e80 = local_25;
    if _e80 {
        local_26 = (currentDepth <= 1f);
    } else {
        local_26 = false;
    }
    let _e86 = local_26;
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
    let phase_1 = fract(((uv_12 * texelDims) - vec2(0.5f)));
    let reach = max(phase_1, (vec2(1f) - phase_1));
    let footprintRadius = select(max(reach.x, reach.y), 1f, (filterProfile == 6u));
    let _e139 = _directionalReceiverDepthBiasX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_9, normal_18, l_2, footprintRadius);
    let adjustedDepth = (currentDepth + _e139);
    let _e141 = _directionalReceiverPlaneGradientX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(layer_9, normal_18, l_2);
    if (filterProfile == 8u) {
        let _e144 = sample_shadow_varianceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(uv_12, shadowLayer, adjustedDepth, viewportScale_1);
        return _e144;
    }
    if (filterProfile == 7u) {
        let _e149 = sample_shadow_2d_softX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, uv_12, shadowLayer, tileLo, adjustedDepth, viewportScale_1);
        return _e149;
    }
    if (filterProfile == 6u) {
        let _e161 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[2].w;
        let _e170 = sample_shadow_2d_vogelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, uv_12, shadowLayer, ((tileLo * vec2<f32>(1f, (1f / aspect_1))) * max((1f + _e161), 0f)), adjustedDepth, _e141, pixel_7, viewportScale_1);
        return _e170;
    }
    if (kernel == 1u) {
        let _e177 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[0].w;
        if (_e177 > 0.5f) {
            let _e182 = sample_shadow_2d_nearestX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43IMFSG6527OBRWMX(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, uv_12, shadowLayer, adjustedDepth, viewportScale_1);
            return _e182;
        }
        let lit_4 = textureSampleCompareLevel(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, clamp(uv_12, tileLo, tileHi), shadowLayer, adjustedDepth);
        return lit_4;
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
                        let offsetUv = clamp((uv_12 + (vec2<f32>(f32(_e198), f32(_e200)) * tileLo)), tileLo, tileHi);
                        let tapDepth = (adjustedDepth + dot(_e141, ((offsetUv - uv_12) / tileLo)));
                        let lit_5 = textureSampleCompareLevel(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, offsetUv, shadowLayer, tapDepth);
                        let _e214 = blocked;
                        blocked = (_e214 + (1f - lit_5));
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
                    let offsetUv_1 = clamp((uv_12 + (vec2<f32>(f32(_e238), f32(_e240)) * tileLo)), tileLo, tileHi);
                    let tapDepth_1 = (adjustedDepth + dot(_e141, ((offsetUv_1 - uv_12) / tileLo)));
                    let lit_6 = textureSampleCompareLevel(shadowMapX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, shadowSamplerX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, offsetUv_1, shadowLayer, tapDepth_1);
                    let _e253 = blocked;
                    blocked = (_e253 + (1f - lit_6));
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

fn evalDirectionalShadowFactorAtPixelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(normal_19: vec3<f32>, worldPos_17: vec3<f32>, viewZ_1: f32, layerBase_1: u32, pixel_8: vec2<f32>) -> f32 {
    var shadow_4: f32;
    var local_27: bool;

    let _e2 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cascadeCount;
    if (_e2 < 1f) {
        return 1f;
    }
    let _e8 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    let l_7 = normalize(-(_e8));
    let _e13 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cascadeCount;
    let count_2 = u32(max(_e13, 1f));
    let viewDepth_2 = -(viewZ_1);
    let _e25 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[(count_2 - 1u)].x;
    if (viewDepth_2 > _e25) {
        return 1f;
    }
    let _e28 = _pickCascadeLayerX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(viewDepth_2, count_2);
    let _e33 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.normalBias;
    let receiverPosition = (worldPos_17 + (normal_19 * _e33));
    let _e38 = _sampleShadowForCascadeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(receiverPosition, _e28, normal_19, l_7, layerBase_1, pixel_8);
    shadow_4 = _e38;
    let _e42 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cascadeBlend;
    if (_e42 > 0f) {
        local_27 = ((_e28 + 1u) < count_2);
    } else {
        local_27 = false;
    }
    let _e51 = local_27;
    if _e51 {
        let spCurr = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[_e28].x;
        let _e59 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.cascadeBlend;
        let blendWidth = (spCurr * _e59);
        if (blendWidth > 0f) {
            let dist = (spCurr - viewDepth_2);
            let t_3 = clamp((1f - (dist / blendWidth)), 0f, 1f);
            if (t_3 > 0f) {
                let _e74 = _sampleShadowForCascadeX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(receiverPosition, (_e28 + 1u), normal_19, l_7, layerBase_1, pixel_8);
                shadow_4 = mix(_e38, _e74, t_3);
            }
        }
    }
    let _e76 = shadow_4;
    let _e81 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[1].w;
    return mix(1f, _e76, (1f - _e81));
}

fn encodeStandardNormalRoughnessX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSX(normal_20: vec3<f32>, roughness_11: f32) -> u32 {
    var oct: vec2<f32>;

    let n_3 = normalize(normal_20);
    oct = (n_3.xy / vec2(((abs(n_3.x) + abs(n_3.y)) + abs(n_3.z))));
    if (n_3.z < 0f) {
        let _e17 = oct;
        let _e27 = oct;
        oct = ((vec2(1f) - abs(_e17.yx)) * select(vec2(-1f), vec2(1f), (_e27 >= vec2(0f))));
    }
    let _e33 = oct;
    let uv_13 = vec2<u32>(round((clamp(((_e33 * 0.5f) + vec2(0.5f)), vec2(0f), vec2(1f)) * 4095f)));
    return ((uv_13.x | (uv_13.y << 12u)) | (u32(round((clamp(roughness_11, 0f, 1f) * 255f))) << 24u));
}

fn encodeStandardReceiverNormalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSX(normal_21: vec3<f32>) -> u32 {
    var oct_1: vec2<f32>;

    let n_4 = normalize(normal_21);
    oct_1 = (n_4.xy / vec2(((abs(n_4.x) + abs(n_4.y)) + abs(n_4.z))));
    if (n_4.z < 0f) {
        let _e17 = oct_1;
        let _e27 = oct_1;
        oct_1 = ((vec2(1f) - abs(_e17.yx)) * select(vec2(-1f), vec2(1f), (_e27 >= vec2(0f))));
    }
    let _e33 = oct_1;
    let uv_14 = vec2<u32>(round((clamp(((_e33 * 0.5f) + vec2(0.5f)), vec2(0f), vec2(1f)) * vec2<f32>(4095f, 2047f))));
    return (uv_14.x | (uv_14.y << 12u));
}

fn encodeStandardReflectanceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSX(rgb: vec3<f32>, alpha_8: f32) -> u32 {
    return pack4x8unorm(vec4<f32>(sqrt(clamp(rgb, vec3(0f), vec3(1f))), alpha_8));
}

fn encodeStandardGBufferX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSL5XXK5DQOV2AX(normal_22: vec3<f32>, receiverNormal: vec3<f32>, roughness_12: f32, albedo_3: vec3<f32>, metallic_13: f32, f0_7: vec3<f32>, dielectricSpecular_1: vec4<f32>, occlusion: f32, emissive: vec3<f32>, opacity: f32, reflection: u32, probeRow: u32, receiveShadows_1: bool, receiverChannels_1: u32, subsurface: vec4<f32>, useDirectDfgLut_8: bool) -> GBufferOutputX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSL5XXK5DQOV2AX {
    var output: GBufferOutputX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSL5XXK5DQOV2AX;

    output.scene_color = vec4<f32>(emissive, opacity);
    let _e7 = encodeStandardReceiverNormalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSX(receiverNormal);
    output.receiver_geometry = vec2<u32>((_e7 | select(0u, STANDARD_GBUFFER_DIRECT_DFG_LUT_BITX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSX, useDirectDfgLut_8)), receiverChannels_1);
    let _e18 = encodeStandardNormalRoughnessX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSX(normal_22, roughness_12);
    output.normal_roughness = _e18;
    let _e22 = encodeStandardReflectanceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSX(f0_7, occlusion);
    let _e26 = encodeStandardReflectanceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSX(dielectricSpecular_1.xyz, dielectricSpecular_1.w);
    output.f0_occlusion = vec2<u32>(_e22, _e26);
    let _e31 = encodeStandardReflectanceX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSX(albedo_3, metallic_13);
    output.albedo_metallic = _e31;
    let subsurfaceBytes = vec4<u32>(floor((vec4(0.5f) + (255f * clamp(vec4<f32>((subsurface.xyz / vec3(12f)), subsurface.w), vec4(0f), vec4(1f))))));
    let subsurfaceProfile = (((subsurfaceBytes.x | (subsurfaceBytes.y << 8u)) | (subsurfaceBytes.z << 16u)) | (subsurfaceBytes.w << 24u));
    output.lighting_context = vec2<u32>((((reflection << 24u) | select(STANDARD_GBUFFER_NO_RECEIVE_BITX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSX, 0u, receiveShadows_1)) | probeRow), subsurfaceProfile);
    output.scene_temporal = vec4<f32>(0f, 0f, -1f, 1f);
    let _e82 = output;
    return _e82;
}

fn resolvePbrTemporalReactiveX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DFNVYG64TBNQX(reactive_1: f32, baseColorAlpha: f32, sampledAlpha: f32) -> f32 {
    let coverage_3 = clamp((baseColorAlpha * sampledAlpha), 0f, 1f);
    let coverageReactive = (1f - coverage_3);
    return max(clamp(reactive_1, 0f, 1f), coverageReactive);
}

fn transformedPbrTemporalUvX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DFNVYG64TBNQX(transform_2: vec4<f32>, metadata_2: vec4<f32>, rotation_6: vec4<f32>, uv0_: vec2<f32>, uv1_: vec2<f32>, uv2_: vec2<f32>, uv3_: vec2<f32>, uv4_: vec2<f32>, uv5_: vec2<f32>, uv6_: vec2<f32>, uv7_: vec2<f32>) -> vec2<f32> {
    var source_3: vec2<f32>;

    source_3 = uv0_;
    if (metadata_2.x >= 1f) {
        source_3 = uv1_;
    }
    if (metadata_2.x >= 2f) {
        source_3 = uv2_;
    }
    if (metadata_2.x >= 3f) {
        source_3 = uv3_;
    }
    if (metadata_2.x >= 4f) {
        source_3 = uv4_;
    }
    if (metadata_2.x >= 5f) {
        source_3 = uv5_;
    }
    if (metadata_2.x >= 6f) {
        source_3 = uv6_;
    }
    if (metadata_2.x >= 7f) {
        source_3 = uv7_;
    }
    let _e31 = source_3;
    let _e34 = materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(_e31, transform_2, rotation_6);
    return (_e34 + transform_2.xy);
}

fn projectPbrSceneTemporalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DFNVYG64TBNQX(baseColorAlpha_1: f32, alphaCutoff: f32, alphaToCoverage: f32, alphaHash: f32, positionOS: vec3<f32>, baseColorTextureEnabled: bool, baseColorTexture: texture_2d<f32>, baseColorSampler: sampler, transform_3: vec4<f32>, metadata_3: vec4<f32>, rotation_7: vec4<f32>, alphaTextureEnabled: bool, alphaTexture: texture_2d<f32>, alphaSampler: sampler, alphaTransform: vec4<f32>, alphaMetadata: vec4<f32>, alphaRotation: vec4<f32>, alphaChannel: f32, currentClip_1: vec4<f32>, previousClip_1: vec4<f32>, temporalProjection_3: vec4<f32>, reactive_2: f32, motionValid_1: bool, uv0_1: vec2<f32>, uv1_1: vec2<f32>, uv2_1: vec2<f32>, uv3_1: vec2<f32>, uv4_1: vec2<f32>, uv5_1: vec2<f32>, uv6_1: vec2<f32>, uv7_1: vec2<f32>) -> vec4<f32> {
    var baseSample: vec4<f32> = vec4(1f);
    var alphaSample: f32 = 1f;
    var reactiveCoverage: f32;

    if baseColorTextureEnabled {
        let _e14 = transformedPbrTemporalUvX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DFNVYG64TBNQX(transform_3, metadata_3, rotation_7, uv0_1, uv1_1, uv2_1, uv3_1, uv4_1, uv5_1, uv6_1, uv7_1);
        let _e18 = sampleMaterialTextureX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(baseColorTexture, baseColorSampler, _e14, metadata_3.zw);
        baseSample = _e18;
    }
    if alphaTextureEnabled {
        let _e24 = transformedPbrTemporalUvX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DFNVYG64TBNQX(alphaTransform, alphaMetadata, alphaRotation, uv0_1, uv1_1, uv2_1, uv3_1, uv4_1, uv5_1, uv6_1, uv7_1);
        let _e28 = sampleMaterialTextureX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(alphaTexture, alphaSampler, _e24, alphaMetadata.zw);
        switch u32(alphaChannel) {
            case 0u: {
                alphaSample = _e28.x;
            }
            case 1u: {
                alphaSample = _e28.y;
            }
            case 2u: {
                alphaSample = _e28.z;
            }
            default: {
                alphaSample = _e28.w;
            }
        }
    }
    let _e38 = baseSample.w;
    let _e40 = alphaSample;
    let sampledAlpha_1 = ((baseColorAlpha_1 * _e38) * _e40);
    let _e44 = alphaCoverageX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(sampledAlpha_1, alphaCutoff, alphaToCoverage);
    applyAlphaHashX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(_e44, positionOS, alphaHash);
    let _e49 = resolvePbrTemporalReactiveX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DFNVYG64TBNQX(reactive_2, _e44, 1f);
    reactiveCoverage = _e49;
    let _e51 = reactiveCoverage;
    reactiveCoverage = select(_e51, reactive_2, (alphaHash > 0.5f));
    let _e55 = reactiveCoverage;
    let _e60 = packSceneTemporalV1WithValidityX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(currentClip_1, previousClip_1, temporalProjection_3, _e55, motionValid_1);
    return _e60;
}

fn decodeTangentSpaceNormalRgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(rg: vec2<f32>) -> vec3<f32> {
    let xy = ((rg * 2f) - vec2(1f));
    let z_1 = sqrt(saturate((1f - dot(xy, xy))));
    return vec3<f32>(xy, z_1);
}

fn scaleTangentSpaceNormalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(tn: vec3<f32>, scale_1: vec2<f32>) -> vec3<f32> {
    let scaled_1 = vec3<f32>((tn.xy * scale_1), tn.z);
    if (dot(scaled_1, scaled_1) < 0.00000000000000000001f) {
        return vec3<f32>(0f, 0f, 1f);
    }
    return scaled_1;
}

fn perturbBumpNormalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(positionWS_3: vec3<f32>, normalWS: vec3<f32>, heightGradient: vec2<f32>, faceDirection: f32) -> vec3<f32> {
    let dx_2 = dpdx(positionWS_3);
    let dy_2 = dpdy(positionWS_3);
    let sx_1 = (dx_2 * inverseSqrt(max(dot(dx_2, dx_2), 0.00000000000000000001f)));
    let sy_1 = (dy_2 * inverseSqrt(max(dot(dy_2, dy_2), 0.00000000000000000001f)));
    let r1_ = cross(sy_1, normalWS);
    let r2_1 = cross(normalWS, sx_1);
    let determinant_ = (dot(sx_1, r1_) * faceDirection);
    let gradient = (sign(determinant_) * ((heightGradient.x * r1_) + (heightGradient.y * r2_1)));
    let perturbed = ((abs(determinant_) * normalWS) - gradient);
    if (dot(perturbed, perturbed) < 0.00000000000000000001f) {
        return normalWS;
    }
    return normalize(perturbed);
}

fn applyTBNX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(worldNormal: vec3<f32>, worldTangent: vec4<f32>, tn_1: vec3<f32>) -> vec3<f32> {
    let n0_ = normalize(worldNormal);
    let t0_ = normalize((worldTangent.xyz - (dot(worldTangent.xyz, n0_) * n0_)));
    let b0_ = (cross(n0_, t0_) * worldTangent.w);
    return normalize((((t0_ * tn_1.x) + (b0_ * tn_1.y)) + (n0_ * tn_1.z)));
}

fn surfaceGeometryNormal(dx: vec3<f32>, dy: vec3<f32>, fallback: vec3<f32>) -> vec3<f32> {
    var local_28: bool;

    let scaleX = max(max(abs(dx.x), abs(dx.y)), abs(dx.z));
    let scaleY = max(max(abs(dy.x), abs(dy.y)), abs(dy.z));
    if (scaleX > 0f) {
        local_28 = (scaleY > 0f);
    } else {
        local_28 = false;
    }
    let _e25 = local_28;
    if !(_e25) {
        return fallback;
    }
    let geometric_1 = cross((dy / vec3(scaleY)), (dx / vec3(scaleX)));
    let lengthSquared_2 = dot(geometric_1, geometric_1);
    if !((lengthSquared_2 > 0f)) {
        return fallback;
    }
    return (geometric_1 * inverseSqrt(lengthSquared_2));
}

fn materialTextureFilteringWitness() {
    let directDfgWitness = textureSample(directDfgLut_11, irradianceSampler_2, vec2(0f));
    let irradianceWitness = textureSample(irradianceMap_2, irradianceSampler_2, vec3<f32>(0f, 0f, 1f));
    let brdfWitness = textureSample(brdfLut_1, irradianceSampler_2, vec2(0f));
    let bumpWitness = textureSample(bumpTexture, bumpTexture_sampler, vec2(0f));
    let baseWitness = textureSample(baseColorTexture_1, baseColorTexture_sampler, vec2(0f));
    let metallicRoughnessWitness = textureSample(metallicRoughnessTexture, metallicRoughnessTexture_sampler, vec2(0f));
    let normalWitness = textureSample(normalTexture, normalTexture_sampler, vec2(0f));
    let emissiveWitness = textureSample(emissiveTexture, emissiveTexture_sampler, vec2(0f));
    let occlusionWitness = textureSample(occlusionTexture, occlusionTexture_sampler, vec2(0f));
    let specularWeightWitness = textureSample(specularTexture, specularTextureSampler, vec2(0f));
    let specularColorWitness = textureSample(specularColorTexture, specularColorTextureSampler, vec2(0f));
    return;
}

fn standardUsesDisplacementTexture() -> bool {
    return true;
}

fn standardVertexPosition(in_7: VsIn) -> vec3<f32> {
    let _e0 = standardUsesDisplacementTexture();
    if _e0 {
        let _e6 = material.displacementScale;
        let _e9 = material.displacementBias;
        let _e12 = material.displacementTextureCoordinatesTransform;
        let _e15 = material.displacementTextureCoordinatesMetadata;
        let _e18 = material.displacementTextureCoordinatesRotation;
        let _e30 = displaceVertexX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUZDJONYGYYLDMVWWK3TUX(in_7.pos, in_7.normal, displacementTexture, displacementTexture_sampler, _e6, _e9, _e12, _e15, _e18, array<vec2<f32>, 8>(in_7.uv, in_7.uv1_, in_7.uv2_, in_7.uv3_, in_7.uv4_, in_7.uv5_, in_7.uv6_, in_7.uv7_));
        return _e30;
    }
    return in_7.pos;
}

fn vs_main_impl(in_8: VsIn, paletteBase: u32, materialAddress: vec3<u32>, temporal: vec2<f32>) -> VsOut {
    var out_2: VsOut;
    var local_29: bool;

    let _e1 = standardVertexPosition(in_8);
    let _e3 = skinTaskDescriptorX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(paletteBase);
    let _e7 = skinTaskBlendX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(_e3, in_8.skinIndex, in_8.skinWeight, false);
    let skinnedLocal = (_e7 * vec4<f32>(_e1, 1f));
    let m0_ = _e7[0].xyz;
    let m1_ = _e7[1].xyz;
    let m2_ = _e7[2].xyz;
    let skinNormal3x3_ = mat3x3<f32>(m0_, m1_, m2_);
    let _e22 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    out_2.clip = (_e22 * skinnedLocal);
    let _e27 = skinTaskBlendX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(_e3, in_8.skinIndex, in_8.skinWeight, true);
    let previousWorld = (_e27 * vec4<f32>(_e1, 1f));
    let _e33 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalCurrentViewProj;
    let currentClip_2 = (_e33 * skinnedLocal);
    let _e37 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalPreviousViewProj;
    let previousClip_2 = (_e37 * previousWorld);
    out_2.clipDelta = (currentClip_2 - previousClip_2);
    let _e44 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalProjection;
    if (temporal.y >= 0.5f) {
        let _e49 = skinTaskHistoryValidX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(_e3);
        local_29 = _e49;
    } else {
        local_29 = false;
    }
    let _e53 = local_29;
    let _e54 = packSceneTemporalV1WithValidityX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(currentClip_2, previousClip_2, _e44, temporal.x, _e53);
    let reactiveLane = _e54.w;
    out_2.surfaceData = vec3<u32>(0u, bitcast<u32>(reactiveLane), 4294967295u);
    let _e63 = out_2.clip;
    let _e66 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalProjection;
    let _e67 = sceneViewZX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(_e63, _e66);
    out_2.positionOSAndViewZ = vec4<f32>(_e1, _e67);
    out_2.worldPos = skinnedLocal.xyz;
    out_2.worldNormal = normalize((skinNormal3x3_ * in_8.normal));
    let worldTangentXyz = normalize((skinNormal3x3_ * in_8.tangent.xyz));
    out_2.worldTangent = vec4<f32>(worldTangentXyz, in_8.tangent.w);
    out_2.uv0And1_ = vec4<f32>(in_8.uv, in_8.uv1_);
    out_2.uv2And3_ = vec4<f32>(in_8.uv2_, in_8.uv3_);
    out_2.uv4And5_ = vec4<f32>(in_8.uv4_, in_8.uv5_);
    out_2.uv6And7_ = vec4<f32>(in_8.uv6_, in_8.uv7_);
    out_2.objectBasis0_ = vec4<f32>(_e7[0].xyz, _e7[1].x);
    out_2.objectBasis1_ = vec4<f32>(_e7[1].y, _e7[1].z, _e7[2].x, _e7[2].y);
    let clipPos = out_2.clip;
    out_2.ndc = vec4<f32>((clipPos.xy / vec2(clipPos.w)), (clipPos.z / clipPos.w), _e7[2].z);
    let _e128 = out_2;
    return _e128;
}

fn standardViewZ(in_9: VsOut) -> f32 {
    return in_9.positionOSAndViewZ.w;
}

fn standardReceivesShadows(in_10: VsOut) -> bool {
    return true;
}

fn transformedMaterialUv(transform_4: vec4<f32>, metadata_4: vec4<f32>, rotation_8: vec4<f32>, in_11: VsOut) -> vec2<f32> {
    var source_4: vec2<f32>;

    source_4 = in_11.uv0And1_.xy;
    if (metadata_4.x >= 1f) {
        source_4 = in_11.uv0And1_.zw;
    }
    if (metadata_4.x >= 2f) {
        source_4 = in_11.uv2And3_.xy;
    }
    if (metadata_4.x >= 3f) {
        source_4 = in_11.uv2And3_.zw;
    }
    if (metadata_4.x >= 4f) {
        source_4 = in_11.uv4And5_.xy;
    }
    if (metadata_4.x >= 5f) {
        source_4 = in_11.uv4And5_.zw;
    }
    if (metadata_4.x >= 6f) {
        source_4 = in_11.uv6And7_.xy;
    }
    if (metadata_4.x >= 7f) {
        source_4 = in_11.uv6And7_.zw;
    }
    let _e40 = source_4;
    let _e43 = materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(_e40, transform_4, rotation_8);
    return (_e43 + transform_4.xy);
}

fn materialVertexColor(in_12: VsOut) -> vec4<f32> {
    return vec4(1f);
}

fn standardSkinVariantIdentity() -> f32 {
    var identity: f32 = 0f;

    let _e2 = identity;
    identity = (_e2 + 2f);
    let _e5 = identity;
    return _e5;
}

fn standardObjectToWorld(in_13: VsOut) -> mat3x3<f32> {
    return mat3x3<f32>(in_13.objectBasis0_.xyz, vec3<f32>(in_13.objectBasis0_.w, in_13.objectBasis1_.xy), vec3<f32>(in_13.objectBasis1_.zw, in_13.ndc.w));
}

fn standardUsesTriplanarProjection() -> bool {
    return false;
}

fn surfaceProjection(input: SurfaceInput, materialValue: MaterialParameters) -> SurfaceProjection {
    let objectSpace = (materialValue.triplanarSpace > 1.5f);
    let normalOS_1 = normalize((input.vertexNormalWS * input.objectToWorld));
    let normal_24 = select(normalize(input.vertexNormalWS), normalOS_1, objectSpace);
    let position_8 = (select(input.positionWS, input.positionOS, objectSpace) * materialValue.triplanarScale);
    let blend = pow(abs(normal_24), vec3(max(materialValue.triplanarSharpness, 1f)));
    let dx_3 = dpdx(position_8);
    let dy_3 = dpdy(position_8);
    return SurfaceProjection(position_8, dx_3, dy_3, normal_24, (blend / vec3(max(((blend.x + blend.y) + blend.z), 0.000001f))));
}

fn standardUsesBaseColorTexture() -> bool {
    return true;
}

fn surfacePlaneSample(tex: texture_2d<f32>, smp: sampler, uv_7: vec2<f32>, dx_1: vec2<f32>, dy_1: vec2<f32>, transform_5: vec4<f32>, metadata_5: vec4<f32>, rotation_9: vec4<f32>) -> vec4<f32> {
    let scale_4 = metadata_5.zw;
    let _e5 = materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(uv_7, transform_5, rotation_9);
    let _e10 = materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(dx_1, transform_5, rotation_9);
    let _e13 = materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(dy_1, transform_5, rotation_9);
    let _e17 = textureSampleGrad(tex, smp, ((_e5 + transform_5.xy) * scale_4), (_e10 * scale_4), (_e13 * scale_4));
    return _e17;
}

fn surfaceTriplanarSamples(tex_1: texture_2d<f32>, smp_1: sampler, projection: SurfaceProjection, transform_6: vec4<f32>, metadata_6: vec4<f32>, rotation_10: vec4<f32>) -> SurfaceTriplanarSamples {
    let p_2 = projection.position;
    let dx_4 = projection.positionDx;
    let dy_4 = projection.positionDy;
    let _e12 = surfacePlaneSample(tex_1, smp_1, p_2.yz, dx_4.yz, dy_4.yz, transform_6, metadata_6, rotation_10);
    let _e16 = surfacePlaneSample(tex_1, smp_1, p_2.zx, dx_4.zx, dy_4.zx, transform_6, metadata_6, rotation_10);
    let _e20 = surfacePlaneSample(tex_1, smp_1, p_2.xy, dx_4.xy, dy_4.xy, transform_6, metadata_6, rotation_10);
    return SurfaceTriplanarSamples(_e12, _e16, _e20);
}

fn fxSurfaceHelper_f2fa0e67c8860195_sampleSurfaceTexture(tex_2: texture_2d<f32>, smp_2: sampler, uv_8: vec2<f32>, footprint: f32) -> vec4<f32> {
    let _e3 = textureSample(tex_2, smp_2, uv_8);
    return _e3;
}

fn surfaceUv(input_1: SurfaceInput, transform_7: vec4<f32>, metadata_7: vec4<f32>, rotation_11: vec4<f32>) -> vec2<f32> {
    var source_5: vec2<f32>;

    source_5 = input_1.uv0_;
    if (metadata_7.x >= 1f) {
        source_5 = input_1.uv1_;
    }
    if (metadata_7.x >= 2f) {
        source_5 = input_1.uv2_;
    }
    if (metadata_7.x >= 3f) {
        source_5 = input_1.uv3_;
    }
    if (metadata_7.x >= 4f) {
        source_5 = input_1.uv4_;
    }
    if (metadata_7.x >= 5f) {
        source_5 = input_1.uv5_;
    }
    if (metadata_7.x >= 6f) {
        source_5 = input_1.uv6_;
    }
    if (metadata_7.x >= 7f) {
        source_5 = input_1.uv7_;
    }
    let _e32 = source_5;
    let _e35 = materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(_e32, transform_7, rotation_11);
    return (_e35 + transform_7.xy);
}

fn fxSurfaceHelper_f2fa0e67c8860195_surfaceTextureFootprint(input_2: SurfaceInput, transform_8: vec4<f32>, metadata_8: vec4<f32>) -> f32 {
    var footprint_1: f32;

    let index_3 = u32(clamp(metadata_8.x, 0f, 7f));
    footprint_1 = input_2.uvFootprint0_[(index_3 % 4u)];
    if (index_3 >= 4u) {
        footprint_1 = input_2.uvFootprint1_[(index_3 % 4u)];
    }
    let _e19 = footprint_1;
    return ((_e19 * max(abs(transform_8.z), abs(transform_8.w))) * max(abs(metadata_8.z), abs(metadata_8.w)));
}

fn surfaceSample(tex_3: texture_2d<f32>, smp_3: sampler, input_3: SurfaceInput, triplanar: bool, projection_1: SurfaceProjection, transform_9: vec4<f32>, metadata_9: vec4<f32>, rotation_12: vec4<f32>) -> vec4<f32> {
    if triplanar {
        let _e7 = surfaceTriplanarSamples(tex_3, smp_3, projection_1, transform_9, metadata_9, rotation_12);
        let w = projection_1.weights;
        return (((_e7.x * w.x) + (_e7.y * w.y)) + (_e7.z * w.z));
    }
    let _e21 = surfaceUv(input_3, transform_9, metadata_9, rotation_12);
    let _e24 = fxSurfaceHelper_f2fa0e67c8860195_surfaceTextureFootprint(input_3, transform_9, metadata_9);
    let _e25 = fxSurfaceHelper_f2fa0e67c8860195_sampleSurfaceTexture(tex_3, smp_3, (_e21 * metadata_9.zw), _e24);
    return _e25;
}

fn standardUsesMetallicRoughnessTexture() -> bool {
    return true;
}

fn standardUsesMetallicTexture() -> bool {
    return true;
}

fn standardReusesMetallicTextureFromBaseColorTexture() -> bool {
    return false;
}

fn standardReusesMetallicTextureFromMetallicRoughnessTexture() -> bool {
    return false;
}

fn standardUsesRoughnessTexture() -> bool {
    return true;
}

fn standardReusesRoughnessTextureFromBaseColorTexture() -> bool {
    return false;
}

fn standardReusesRoughnessTextureFromMetallicRoughnessTexture() -> bool {
    return false;
}

fn standardReusesRoughnessTextureFromMetallicTexture() -> bool {
    return false;
}

fn standardUsesAlphaTexture() -> bool {
    return true;
}

fn standardReusesAlphaTextureFromBaseColorTexture() -> bool {
    return false;
}

fn standardReusesAlphaTextureFromMetallicRoughnessTexture() -> bool {
    return false;
}

fn standardReusesAlphaTextureFromMetallicTexture() -> bool {
    return false;
}

fn standardReusesAlphaTextureFromRoughnessTexture() -> bool {
    return false;
}

fn surfaceChannel(value_2: vec4<f32>, channel: u32) -> f32 {
    switch channel {
        case 0u: {
            return value_2.x;
        }
        case 1u: {
            return value_2.y;
        }
        case 2u: {
            return value_2.z;
        }
        default: {
            return value_2.w;
        }
    }
}

fn standardUsesNormalTexture() -> bool {
    return true;
}

fn surfaceTriplanarNormal(samples: SurfaceTriplanarSamples, projection_2: SurfaceProjection, scale_2: vec2<f32>) -> vec3<f32> {
    let n_5 = projection_2.normal;
    let _e5 = decodeTangentSpaceNormalRgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(samples.x.xy);
    let _e7 = scaleTangentSpaceNormalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(_e5, scale_2);
    let _e10 = decodeTangentSpaceNormalRgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(samples.y.xy);
    let _e11 = scaleTangentSpaceNormalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(_e10, scale_2);
    let _e14 = decodeTangentSpaceNormalRgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(samples.z.xy);
    let _e15 = scaleTangentSpaceNormalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(_e14, scale_2);
    let tx = vec3<f32>((_e7.xy + n_5.yz), (abs(_e7.z) * n_5.x));
    let ty = vec3<f32>((_e11.xy + n_5.zx), (abs(_e11.z) * n_5.y));
    let tz = vec3<f32>((_e15.xy + n_5.xy), (abs(_e15.z) * n_5.z));
    let w_1 = projection_2.weights;
    return normalize((((tx.zxy * w_1.x) + (ty.yzx * w_1.y)) + (tz * w_1.z)));
}

fn surfaceObjectNormalToWorld(input_4: SurfaceInput, normalOS: vec3<f32>) -> vec3<f32> {
    let m_1 = input_4.objectToWorld;
    let cofactor = mat3x3<f32>(cross(m_1[1], m_1[2]), cross(m_1[2], m_1[0]), cross(m_1[0], m_1[1]));
    return (normalize((cofactor * normalOS)) * sign(dot(m_1[0], cofactor[0])));
}

fn surfaceTriplanarObjectSpace(materialValue_1: MaterialParameters) -> bool {
    return (materialValue_1.triplanarSpace > 1.5f);
}

fn standardUsesObjectSpaceNormal() -> bool {
    return false;
}

fn standardUsesBumpTexture() -> bool {
    return true;
}

fn standardUsesEmissiveTexture() -> bool {
    return true;
}

fn standardUsesOcclusionTexture() -> bool {
    return true;
}

fn evaluate_standard_surface(sourceInput: SurfaceInput, materialValue_2: MaterialParameters) -> SurfaceData {
    var input_5: SurfaceInput;
    var baseSample_1: vec4<f32> = vec4(1f);
    var metallicRoughnessSample: vec4<f32> = vec4(1f);
    var metallicSample: vec4<f32>;
    var roughnessSample: vec4<f32>;
    var alpha_9: f32 = 1f;
    var alphaSample_1: vec4<f32> = vec4(1f);
    var normal_23: vec3<f32>;
    var usesNormal: bool = false;
    var local_30: bool;
    var emissiveSample: vec4<f32> = vec4(1f);
    var occlusionSample: vec4<f32> = vec4(1f);
    var alphaClipThreshold: f32 = 0f;

    input_5 = sourceInput;
    let _e9 = input_5.vertexNormalWS;
    let _e11 = input_5.geometricNormalWS;
    input_5.vertexNormalWS = select(_e9, _e11, (materialValue_2.flatShading != 0u));
    let _e16 = standardUsesTriplanarProjection();
    let _e17 = input_5;
    let _e18 = surfaceProjection(_e17, materialValue_2);
    let _e19 = standardUsesBaseColorTexture();
    if _e19 {
        let _e20 = input_5;
        let _e26 = surfaceSample(baseColorTexture_1, baseColorTexture_sampler, _e20, _e16, _e18, materialValue_2.baseColorTextureCoordinatesTransform, materialValue_2.baseColorTextureCoordinatesMetadata, materialValue_2.baseColorTextureCoordinatesRotation);
        baseSample_1 = _e26;
    }
    let _e28 = standardUsesMetallicRoughnessTexture();
    if _e28 {
        let _e29 = input_5;
        let _e35 = surfaceSample(metallicRoughnessTexture, metallicRoughnessTexture_sampler, _e29, _e16, _e18, materialValue_2.metallicRoughnessTextureCoordinatesTransform, materialValue_2.metallicRoughnessTextureCoordinatesMetadata, materialValue_2.metallicRoughnessTextureCoordinatesRotation);
        metallicRoughnessSample = _e35;
    }
    let _e37 = metallicRoughnessSample;
    metallicSample = _e37;
    let _e39 = metallicRoughnessSample;
    roughnessSample = _e39;
    let _e41 = standardUsesMetallicTexture();
    if _e41 {
        let _e42 = standardReusesMetallicTextureFromBaseColorTexture();
        if _e42 {
            let _e43 = baseSample_1;
            metallicSample = _e43;
        } else {
            let _e44 = standardReusesMetallicTextureFromMetallicRoughnessTexture();
            if _e44 {
                let _e45 = metallicRoughnessSample;
                metallicSample = _e45;
            } else {
                let _e46 = input_5;
                let _e52 = surfaceSample(metallicTexture, metallicTexture_sampler, _e46, _e16, _e18, materialValue_2.metallicTextureCoordinatesTransform, materialValue_2.metallicTextureCoordinatesMetadata, materialValue_2.metallicTextureCoordinatesRotation);
                metallicSample = _e52;
            }
        }
    }
    let _e53 = standardUsesRoughnessTexture();
    if _e53 {
        let _e54 = standardReusesRoughnessTextureFromBaseColorTexture();
        if _e54 {
            let _e55 = baseSample_1;
            roughnessSample = _e55;
        } else {
            let _e56 = standardReusesRoughnessTextureFromMetallicRoughnessTexture();
            if _e56 {
                let _e57 = metallicRoughnessSample;
                roughnessSample = _e57;
            } else {
                let _e58 = standardReusesRoughnessTextureFromMetallicTexture();
                if _e58 {
                    let _e59 = metallicSample;
                    roughnessSample = _e59;
                } else {
                    let _e60 = input_5;
                    let _e66 = surfaceSample(roughnessTexture, roughnessTexture_sampler, _e60, _e16, _e18, materialValue_2.roughnessTextureCoordinatesTransform, materialValue_2.roughnessTextureCoordinatesMetadata, materialValue_2.roughnessTextureCoordinatesRotation);
                    roughnessSample = _e66;
                }
            }
        }
    }
    let _e67 = standardUsesAlphaTexture();
    if _e67 {
        let _e68 = standardReusesAlphaTextureFromBaseColorTexture();
        if _e68 {
            let _e69 = baseSample_1;
            alphaSample_1 = _e69;
        } else {
            let _e71 = standardReusesAlphaTextureFromMetallicRoughnessTexture();
            if _e71 {
                let _e72 = metallicRoughnessSample;
                alphaSample_1 = _e72;
            } else {
                let _e73 = standardReusesAlphaTextureFromMetallicTexture();
                if _e73 {
                    let _e74 = metallicSample;
                    alphaSample_1 = _e74;
                } else {
                    let _e75 = standardReusesAlphaTextureFromRoughnessTexture();
                    if _e75 {
                        let _e76 = roughnessSample;
                        alphaSample_1 = _e76;
                    } else {
                        let _e77 = input_5;
                        let _e83 = surfaceSample(alphaTexture_1, alphaTexture_sampler, _e77, _e16, _e18, materialValue_2.alphaTextureCoordinatesTransform, materialValue_2.alphaTextureCoordinatesMetadata, materialValue_2.alphaTextureCoordinatesRotation);
                        alphaSample_1 = _e83;
                    }
                }
            }
        }
        let _e84 = alphaSample_1;
        let _e87 = surfaceChannel(_e84, u32(materialValue_2.alphaChannel));
        alpha_9 = _e87;
    }
    let _e90 = input_5.frontFacing;
    let faceDirection_1 = select(-1f, 1f, _e90);
    let _e95 = input_5.vertexNormalWS;
    normal_23 = (normalize(_e95) * faceDirection_1);
    let _e99 = standardUsesNormalTexture();
    if _e99 {
        let transform_10 = materialValue_2.normalTextureCoordinatesTransform;
        let metadata_10 = materialValue_2.normalTextureCoordinatesMetadata;
        let rotation_14 = materialValue_2.normalTextureCoordinatesRotation;
        if _e16 {
            let _e105 = surfaceTriplanarSamples(normalTexture, normalTexture_sampler, _e18, transform_10, metadata_10, rotation_14);
            let _e107 = surfaceTriplanarNormal(_e105, _e18, materialValue_2.normalScale);
            let _e108 = input_5;
            let _e109 = surfaceObjectNormalToWorld(_e108, _e107);
            let _e110 = surfaceTriplanarObjectSpace(materialValue_2);
            normal_23 = (select(_e107, _e109, _e110) * faceDirection_1);
        } else {
            let _e113 = input_5;
            let _e114 = surfaceUv(_e113, transform_10, metadata_10, rotation_14);
            let _e117 = input_5;
            let _e118 = fxSurfaceHelper_f2fa0e67c8860195_surfaceTextureFootprint(_e117, transform_10, metadata_10);
            let _e121 = fxSurfaceHelper_f2fa0e67c8860195_sampleSurfaceTexture(normalTexture, normalTexture_sampler, (_e114 * metadata_10.zw), _e118);
            let _e122 = standardUsesObjectSpaceNormal();
            if _e122 {
                let normalOS_2 = vec3<f32>((((_e121.xy * 2f) - vec2(1f)) * materialValue_2.normalScale), ((_e121.z * 2f) - 1f));
                let _e137 = input_5;
                let _e138 = surfaceObjectNormalToWorld(_e137, normalOS_2);
                normal_23 = (_e138 * faceDirection_1);
            } else {
                let _e141 = input_5.vertexNormalWS;
                let _e143 = input_5.tangentWS;
                let _e145 = decodeTangentSpaceNormalRgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(_e121.xy);
                let _e147 = scaleTangentSpaceNormalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(_e145, materialValue_2.normalScale);
                let _e148 = applyTBNX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(_e141, _e143, _e147);
                normal_23 = (_e148 * faceDirection_1);
            }
        }
        usesNormal = true;
    }
    let _e152 = usesNormal;
    if !(_e152) {
        let _e154 = standardUsesBumpTexture();
        local_30 = _e154;
    } else {
        local_30 = false;
    }
    let _e158 = local_30;
    if _e158 {
        let _e159 = input_5;
        let _e163 = surfaceUv(_e159, materialValue_2.bumpTextureCoordinatesTransform, materialValue_2.bumpTextureCoordinatesMetadata, materialValue_2.bumpTextureCoordinatesRotation);
        let uv_15 = (_e163 * materialValue_2.bumpTextureCoordinatesMetadata.zw);
        let dx_5 = dpdx(uv_15);
        let dy_5 = dpdy(uv_15);
        let _e171 = textureSampleGrad(bumpTexture, bumpTexture_sampler, uv_15, dx_5, dy_5);
        let height_1 = _e171.x;
        let _e176 = textureSampleGrad(bumpTexture, bumpTexture_sampler, (uv_15 + dx_5), dx_5, dy_5);
        let heightX = _e176.x;
        let _e181 = textureSampleGrad(bumpTexture, bumpTexture_sampler, (uv_15 + dy_5), dx_5, dy_5);
        let heightY = _e181.x;
        let _e184 = input_5.positionWS;
        let _e185 = normal_23;
        let _e191 = perturbBumpNormalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(_e184, _e185, (materialValue_2.bumpScale * vec2<f32>((heightX - height_1), (heightY - height_1))), faceDirection_1);
        normal_23 = _e191;
    }
    let _e192 = standardUsesEmissiveTexture();
    if _e192 {
        let _e193 = input_5;
        let _e199 = surfaceSample(emissiveTexture, emissiveTexture_sampler, _e193, _e16, _e18, materialValue_2.emissiveTextureCoordinatesTransform, materialValue_2.emissiveTextureCoordinatesMetadata, materialValue_2.emissiveTextureCoordinatesRotation);
        emissiveSample = _e199;
    }
    let _e201 = standardUsesOcclusionTexture();
    if _e201 {
        let _e202 = input_5;
        let _e208 = surfaceSample(occlusionTexture, occlusionTexture_sampler, _e202, _e16, _e18, materialValue_2.occlusionTextureCoordinatesTransform, materialValue_2.occlusionTextureCoordinatesMetadata, materialValue_2.occlusionTextureCoordinatesRotation);
        occlusionSample = _e208;
    }
    let vertexColor = input_5.vertexColor;
    let _e214 = baseSample_1;
    let baseColor_10 = ((materialValue_2.baseColor.xyz * _e214.xyz) * vertexColor.xyz);
    let _e220 = metallicSample;
    let _e223 = surfaceChannel(_e220, u32(materialValue_2.metallicChannel));
    let metallic_14 = clamp((materialValue_2.metallic * _e223), 0f, 1f);
    let _e229 = roughnessSample;
    let _e232 = surfaceChannel(_e229, u32(materialValue_2.roughnessChannel));
    let roughness_13 = clamp((materialValue_2.roughness * _e232), 0.04f, 1f);
    let _e240 = emissiveSample;
    let emissive_1 = ((materialValue_2.emissive * materialValue_2.emissiveIntensity) * _e240.xyz);
    let _e244 = occlusionSample.x;
    let occlusion_1 = clamp((1f + ((_e244 - 1f) * materialValue_2.occlusionStrength)), 0f, 1f);
    let _e257 = baseSample_1.w;
    let _e261 = alpha_9;
    let sampledAlpha_2 = clamp((((materialValue_2.baseColor.w * _e257) * vertexColor.w) * _e261), 0f, 1f);
    let _e268 = alphaCoverageX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(sampledAlpha_2, materialValue_2.alphaCutoff, materialValue_2.alphaToCoverage);
    let _e270 = input_5.positionOS;
    applyAlphaHashX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(_e268, _e270, materialValue_2.alphaHash);
    let _e273 = normal_23;
    let _e274 = alphaClipThreshold;
    return SurfaceData(baseColor_10, _e273, metallic_14, roughness_13, emissive_1, occlusion_1, _e268, _e274);
}

fn evaluate_surface(input_6: SurfaceInput) -> SurfaceData {
    let _e1 = material;
    let _e3 = evaluate_standard_surface(input_6, _e1);
    return _e3;
}

fn evaluateStandardSurface(in_14: VsOut, frontFacing_4: bool, geometricNormal: vec3<f32>) -> SurfaceData {
    var vertexNormal: vec3<f32>;
    var local_31: bool;
    var local_32: bool;

    let _e3 = displacedNormalX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUZDJONYGYYLDMVWWK3TUX(in_14.worldPos, in_14.worldNormal);
    applyViewClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(in_14.worldPos, false);
    let viewDirectionWS = vec3(0f);
    let surfaceTangent = in_14.worldTangent;
    let surfaceUvs = array<vec2<f32>, 8>(in_14.uv0And1_.xy, in_14.uv0And1_.zw, in_14.uv2And3_.xy, in_14.uv2And3_.zw, in_14.uv4And5_.xy, in_14.uv4And5_.zw, in_14.uv6And7_.xy, in_14.uv6And7_.zw);
    let positionOS_1 = in_14.positionOSAndViewZ.xyz;
    vertexNormal = in_14.worldNormal;
    let _e30 = standardUsesDisplacementTexture();
    if _e30 {
        let _e33 = material.displacementScale;
        if !((_e33 != 0f)) {
            let _e39 = material.displacementBias;
            local_32 = (_e39 != 0f);
        } else {
            local_32 = true;
        }
        let _e45 = local_32;
        local_31 = _e45;
    } else {
        local_31 = false;
    }
    let _e49 = local_31;
    if _e49 {
        vertexNormal = _e3;
    }
    let _e51 = vertexNormal;
    let _e60 = materialVertexColor(in_14);
    let _e65 = standardObjectToWorld(in_14);
    let _e71 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.fogHeightOpacity.w;
    let input_7 = SurfaceInput(positionOS_1, in_14.worldPos, geometricNormal, _e51, surfaceTangent, viewDirectionWS, surfaceUvs[0], surfaceUvs[1], surfaceUvs[2], surfaceUvs[3], surfaceUvs[4], surfaceUvs[5], surfaceUvs[6], surfaceUvs[7], _e60, frontFacing_4, vec4(0f), vec4(0f), _e65, _e71);
    let _e73 = evaluate_surface(input_7);
    return _e73;
}

fn finiteScalar(value_3: f32, fallback_1: f32) -> f32 {
    let bounded = clamp(value_3, -65504f, 65504f);
    return select(fallback_1, bounded, (value_3 == value_3));
}

fn finiteColor(value_4: vec3<f32>, fallback_2: vec3<f32>) -> vec3<f32> {
    let _e4 = finiteScalar(value_4.x, fallback_2.x);
    let _e7 = finiteScalar(value_4.y, fallback_2.y);
    let _e10 = finiteScalar(value_4.z, fallback_2.z);
    return vec3<f32>(_e4, _e7, _e10);
}

fn alphaTestSurface(surface: SurfaceData) {
    var local_33: bool;

    if (surface.alphaClipThreshold > 0f) {
        local_33 = (surface.opacity <= surface.alphaClipThreshold);
    } else {
        local_33 = false;
    }
    let _e10 = local_33;
    if _e10 {
        discard;
    } else {
        return;
    }
}

fn standardForwardOutput(lit_1: StandardForwardLit, color_3: vec3<f32>) -> StandardPbrOutput {
    var output_1: StandardPbrOutput;

    output_1.color = vec4<f32>(color_3, lit_1.alpha);
    let _e6 = output_1;
    return _e6;
}

fn standardForwardFogged(in_15: VsOut, lit_2: StandardForwardLit) -> StandardPbrOutput {
    let _e3 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
    let _e7 = translucent_fogX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTGN5TQX(_e3, in_15.worldPos, lit_2.color, lit_2.alpha);
    let _e8 = standardForwardOutput(lit_2, _e7);
    return _e8;
}

fn standardUsesSpecularColorTexture() -> bool {
    return true;
}

fn standardUsesSpecularTexture() -> bool {
    return true;
}

fn standardSurfaceSpecular(in_16: VsOut, surface_1: SurfaceData, dielectricF0_: f32) -> vec4<f32> {
    var specularColor: vec3<f32>;
    var specularWeight: f32;

    let albedo_4 = surface_1.baseColor;
    let _e4 = finiteScalar(surface_1.metallic, 0f);
    let metallic_15 = clamp(_e4, 0f, 1f);
    let _e10 = material.specularColor;
    specularColor = _e10;
    let _e12 = standardUsesSpecularColorTexture();
    if _e12 {
        let _e15 = material.specularColorTextureCoordinatesTransform;
        let _e18 = material.specularColorTextureCoordinatesMetadata;
        let _e21 = material.specularColorTextureCoordinatesRotation;
        let _e23 = transformedMaterialUv(_e15, _e18, _e21, in_16);
        let _e24 = specularColor;
        let _e27 = material.specularColorTextureCoordinatesMetadata;
        let _e31 = sampleMaterialTextureX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(specularColorTexture, specularColorTextureSampler, _e23, _e27.zw);
        specularColor = (_e24 * _e31.xyz);
    }
    let _e36 = material.specular;
    let _e38 = finiteScalar(_e36, 1f);
    specularWeight = clamp(_e38, 0f, 1f);
    let _e43 = standardUsesSpecularTexture();
    if _e43 {
        let _e46 = material.specularTextureCoordinatesTransform;
        let _e49 = material.specularTextureCoordinatesMetadata;
        let _e52 = material.specularTextureCoordinatesRotation;
        let _e53 = transformedMaterialUv(_e46, _e49, _e52, in_16);
        let _e54 = specularWeight;
        let _e57 = material.specularTextureCoordinatesMetadata;
        let _e61 = sampleMaterialTextureX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(specularTexture, specularTextureSampler, _e53, _e57.zw);
        specularWeight = (_e54 * _e61.w);
    }
    let _e66 = specularColor;
    let _e71 = specularWeight;
    let _e73 = specularWeight;
    return vec4<f32>((min((vec3(dielectricF0_) * _e66), vec3(1f)) * _e71), mix(_e73, 1f, metallic_15));
}

fn standardSsrCoverage() -> f32 {
    var coverage_1: f32 = 1f;

    let _e2 = coverage_1;
    return _e2;
}

fn standardAlphaMode() -> f32 {
    let _e2 = material.alphaMode;
    return _e2;
}

fn standardSkinForwardLit(in_17: VsOut, frontFacing_5: bool) -> StandardForwardLit {
    var normalSpread_1: f32;
    var useDirectDfgLut_9: bool = false;
    var dielectricSpecular_2: vec4<f32>;
    var metallicF0_1: vec3<f32>;
    var f0_8: vec3<f32>;
    var physicalNormal: vec3<f32>;
    var diffuseAlbedo: vec3<f32>;
    var transmissionAlbedo: vec3<f32> = vec3(0f);
    var coatF: vec3<f32> = vec3(0f);
    var probeShPreblend: array<vec4<f32>, 9>;
    var probeLocalBlendFraction: f32 = 0f;
    var ambient: vec3<f32>;
    var reflectionFallback: vec3<f32>;
    var color_4: vec3<f32>;
    var directionalShadowNormal: vec3<f32>;
    var directionalShadow: f32 = 1f;
    var needsDirectionalShadow: bool;
    var local_34: bool;
    var lit_3: StandardForwardLit;

    let _e4 = standardSkinVariantIdentity();
    let _e7 = dpdx(in_17.worldPos);
    let _e9 = dpdy(in_17.worldPos);
    let _e16 = surfaceGeometryNormal(_e7, _e9, (in_17.worldNormal * select(-1f, 1f, frontFacing_5)));
    let geometricNormal_1 = (_e16 * select(-1f, 1f, frontFacing_5));
    let _e22 = geometricNormalSpreadX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43QMVRXK3DBOJPWCYIX(in_17.worldNormal);
    normalSpread_1 = _e22;
    let _e24 = evaluateStandardSurface(in_17, frontFacing_5, geometricNormal_1);
    let _e25 = normalSpread_1;
    let _e28 = material.flatShading;
    normalSpread_1 = select(_e25, 0f, (_e28 != 0u));
    let _e35 = material.directMultiscatteringLut;
    useDirectDfgLut_9 = (_e35 != 0u);
    alphaTestSurface(_e24);
    let _e40 = standardAlphaMode();
    let _e41 = materialOutputAlphaX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(_e24.opacity, _e40);
    let albedo_5 = _e24.baseColor;
    let _e45 = finiteScalar(_e24.metallic, 0f);
    let metallic_16 = clamp(_e45, 0f, 1f);
    let _e51 = finiteScalar(_e24.roughness, 0.5f);
    let _e55 = normalSpread_1;
    let _e56 = specularAntiAliasedRoughnessX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43QMVRXK3DBOJPWCYIX(clamp(_e51, 0.04f, 1f), _e55);
    let a_4 = (_e56 * _e56);
    let n_6 = _e24.normalWS;
    let _e60 = viewDirectionToCameraX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX(in_17.worldPos);
    let _e63 = material.ior;
    let _e65 = finiteScalar(_e63, 1.5f);
    let safeIor = max(_e65, 1f);
    let _e68 = standardDielectricF0X_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(safeIor);
    let _e69 = standardSurfaceSpecular(in_17, _e24, _e68);
    dielectricSpecular_2 = _e69;
    metallicF0_1 = albedo_5;
    f0_8 = mix(_e69.xyz, albedo_5, metallic_16);
    physicalNormal = n_6;
    diffuseAlbedo = albedo_5;
    let _e79 = physicalNormal;
    let _e80 = diffuseAlbedo;
    let _e81 = transmissionAlbedo;
    let _e82 = f0_8;
    let _e83 = dielectricSpecular_2;
    let _e84 = metallicF0_1;
    let _e86 = skylight;
    let _e89 = probeShPreblend;
    let _e90 = probeLocalBlendFraction;
    let _e97 = evaluateStandardEnvironmentX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43UMFXGIYLSMRPWY2LHNB2GS3THX(in_17.worldPos, _e79, _e60, _e80, _e81, metallic_16, _e56, _e82, _e83, _e84, _e86, irradianceMap_2, irradianceSampler_2, prefilterMap_2, prefilterSampler_2, brdfLut_1, skylightPrefilterMap_1, _e89, _e90);
    let ao = _e24.occlusion;
    let _e101 = skylight.colorR;
    let _e104 = skylight.colorG;
    let _e107 = skylight.colorB;
    let _e111 = skylight.intensity;
    let _e112 = decodeSpecularEnvironmentScaleX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU2LCNRPXGYLNOBWGS3THX(vec3<f32>(_e101, _e104, _e107), _e111);
    let _e119 = coatF;
    ambient = (((_e97.diffuse + _e97.specular) * (vec3(1f) - _e119)) * ao);
    let _e127 = coatF;
    reflectionFallback = ((_e97.specular * (vec3(1f) - _e127)) * ao);
    let _e132 = ambient;
    color_4 = _e132;
    let _e134 = color_4;
    color_4 = (_e134 + _e24.emissive);
    directionalShadowNormal = _e16;
    let _e138 = standardReceivesShadows(in_17);
    let _e139 = physicalNormal;
    let _e142 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.lightDir;
    needsDirectionalShadow = !((dot(_e139, normalize(-(_e142))) <= 0f));
    if _e138 {
        let _e150 = needsDirectionalShadow;
        local_34 = _e150;
    } else {
        local_34 = false;
    }
    let _e154 = local_34;
    if _e154 {
        let _e155 = directionalShadowNormal;
        let _e156 = physicalNormal;
        let _e161 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.splitPlanes[0].w;
        let _e166 = standardViewZ(in_17);
        let _e170 = evalDirectionalShadowFactorAtPixelX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU3DJM5UHI2LOM5PWI2LSMVRXI2LPNZQWYX(select(_e155, _e156, (_e161 > 0.5f)), in_17.worldPos, _e166, 0u, in_17.clip.xy);
        directionalShadow = _e170;
    }
    let _e172 = color_4;
    let _e176 = standardViewZ(in_17);
    let _e179 = physicalNormal;
    let _e180 = diffuseAlbedo;
    let _e181 = transmissionAlbedo;
    let _e182 = f0_8;
    let _e183 = directionalShadow;
    let _e186 = useDirectDfgLut_9;
    let _e190 = evaluateStandardDirectX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43UMFXGIYLSMRPWY2LHNB2GS3THX(in_17.worldPos, in_17.ndc.xyz, _e176, in_17.clip.xy, _e179, _e60, _e180, _e181, metallic_16, a_4, _e182, _e183, _e138, in_17.surfaceData.z, false, _e186, directDfgLut_11, irradianceSampler_2);
    color_4 = (_e172 + _e190.radiance);
    let _e195 = color_4;
    let _e196 = standardAlphaMode();
    let _e197 = materialOutputColorX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(_e195, _e41, _e196);
    lit_3.color = _e197;
    lit_3.alpha = _e41;
    let _e199 = lit_3;
    return _e199;
}

fn skinGBuffer(in_18: VsOut, frontFacing_6: bool) -> GBufferOutputX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSL5XXK5DQOV2AX {
    var normalSpread_2: f32;
    var useDirectDfgLut_10: bool = false;
    var probeRow_1: u32 = 0u;
    var subsurface_1: vec4<f32> = vec4(0f);
    var output_2: GBufferOutputX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSL5XXK5DQOV2AX;
    var reactive_3: f32;

    let _e6 = dpdx(in_18.worldPos);
    let _e8 = dpdy(in_18.worldPos);
    let _e11 = surfaceGeometryNormal(_e6, _e8, vec3(0f));
    let receiverNormal_1 = select((in_18.worldNormal * select(-1f, 1f, frontFacing_6)), _e11, (dot(_e11, _e11) > 0f));
    let geometricNormal_2 = (receiverNormal_1 * select(-1f, 1f, frontFacing_6));
    let _e27 = geometricNormalSpreadX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43QMVRXK3DBOJPWCYIX(in_18.worldNormal);
    normalSpread_2 = _e27;
    let _e29 = evaluateStandardSurface(in_18, frontFacing_6, geometricNormal_2);
    let _e30 = normalSpread_2;
    let _e33 = material.flatShading;
    normalSpread_2 = select(_e30, 0f, (_e33 != 0u));
    let _e40 = material.directMultiscatteringLut;
    useDirectDfgLut_10 = (_e40 != 0u);
    alphaTestSurface(_e29);
    let _e46 = material.subsurfaceRadius;
    let _e49 = material.subsurfaceWeight;
    subsurface_1 = vec4<f32>(_e46, _e49);
    let _e54 = material.ior;
    let _e56 = finiteScalar(_e54, 1.5f);
    let _e59 = standardDielectricF0X_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUYTSMRTAX(max(_e56, 1f));
    let _e60 = standardSurfaceSpecular(in_18, _e29, _e59);
    let _e66 = normalSpread_2;
    let _e67 = specularAntiAliasedRoughnessX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU43QMVRXK3DBOJPWCYIX(clamp(_e29.roughness, 0.04f, 1f), _e66);
    let _e83 = standardAlphaMode();
    let _e84 = materialOutputAlphaX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(_e29.opacity, _e83);
    let _e89 = skylight.diffuseScale.w;
    let _e91 = probeRow_1;
    let _e92 = standardReceivesShadows(in_18);
    let _e95 = subsurface_1;
    let _e96 = useDirectDfgLut_10;
    let _e97 = encodeStandardGBufferX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSL5XXK5DQOV2AX(_e29.normalWS, receiverNormal_1, _e67, _e29.baseColor, clamp(_e29.metallic, 0f, 1f), mix(_e60.xyz, _e29.baseColor, clamp(_e29.metallic, 0f, 1f)), _e60, _e29.occlusion, _e29.emissive, _e84, u32(_e89), _e91, _e92, in_18.surfaceData.z, _e95, _e96);
    output_2 = _e97;
    let _e106 = unpackSceneTemporalV1X_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(vec4<f32>(0f, 0f, 0f, bitcast<f32>(in_18.surfaceData.y)));
    let _e109 = standardAlphaMode();
    let _e110 = materialOutputAlphaX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(_e29.opacity, _e109);
    let _e112 = resolvePbrTemporalReactiveX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DFNVYG64TBNQX(_e106.reactive, _e110, 1f);
    reactive_3 = _e112;
    let _e116 = material.alphaHash;
    if (_e116 > 0.5f) {
        reactive_3 = _e106.reactive;
    }
    let _e122 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalCurrentViewProj;
    let currentClip_3 = (_e122 * vec4<f32>(in_18.worldPos, 1f));
    let _e132 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalProjection;
    let _e133 = reactive_3;
    let _e135 = packSceneTemporalV1WithValidityX_naga_oil_mod_XMZXXEZ3FMF4F643DMVXGKX3UMVWXA33SMFWAX(currentClip_3, (currentClip_3 - in_18.clipDelta), _e132, _e133, _e106.motionValid);
    output_2.scene_temporal = _e135;
    let _e136 = output_2;
    return _e136;
}

fn temporalVertexAlpha(in_19: TemporalVsOut) -> f32 {
    return 1f;
}

fn standardUsesTransmissionTexture() -> bool {
    return true;
}

fn standardUsesThicknessTexture() -> bool {
    return true;
}

@vertex 
fn vs_main(in: VsIn, @builtin(instance_index) idx: u32) -> VsOut {
    var out: VsOut;

    let phony = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].worldFromLocal;
    let phony_1 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx].localFromInstance;
    let temporal_1 = vec2<f32>(1f, 1f);
    let _e12 = skinTaskDirectCandidateX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX();
    let _e18 = vs_main_impl(in, _e12, vec3<u32>(4294967295u, 0u, 0u), temporal_1);
    out = _e18;
    let _e26 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].surface.z;
    out.surfaceData.z = _e26;
    let _e27 = out;
    return _e27;
}

@fragment 
fn fs_main(in_1: VsOut, @builtin(front_facing) frontFacing: bool) -> StandardPbrOutput {
    let _e2 = standardSkinForwardLit(in_1, frontFacing);
    let _e3 = standardForwardFogged(in_1, _e2);
    return _e3;
}

@fragment 
fn fs_opaque(in_2: VsOut, @builtin(front_facing) frontFacing_1: bool) -> StandardPbrOutput {
    let _e2 = standardSkinForwardLit(in_2, frontFacing_1);
    let _e4 = standardForwardOutput(_e2, _e2.color);
    return _e4;
}

@fragment 
fn fs_gbuffer(in_3: VsOut, @builtin(front_facing) frontFacing_2: bool) -> GBufferOutputX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DUZ3COVTGMZLSL5XXK5DQOV2AX {
    let _e2 = skinGBuffer(in_3, frontFacing_2);
    return _e2;
}

@fragment 
fn fs_gbuffer_uncovered(in_4: VsOut, @builtin(front_facing) frontFacing_3: bool) -> SkinUncoveredGBufferOutput {
    let _e2 = skinGBuffer(in_4, frontFacing_3);
    return SkinUncoveredGBufferOutput(_e2.scene_color, _e2.normal_roughness, _e2.f0_occlusion, _e2.albedo_metallic, _e2.lighting_context, _e2.receiver_geometry, vec4(0u), _e2.scene_temporal);
}

@vertex 
fn vs_temporal(in_5: VsIn, @builtin(instance_index) idx_1: u32) -> TemporalVsOut {
    var out_1: TemporalVsOut;

    let _e1 = standardVertexPosition(in_5);
    let _e2 = skinTaskDirectCandidateX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX();
    let _e3 = skinTaskDescriptorX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(_e2);
    let _e7 = skinTaskBlendX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(_e3, in_5.skinIndex, in_5.skinWeight, false);
    let _e11 = skinTaskBlendX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(_e3, in_5.skinIndex, in_5.skinWeight, true);
    let currentWorld = (_e7 * vec4<f32>(_e1, 1f));
    let previousWorld_1 = (_e11 * vec4<f32>(_e1, 1f));
    let _e20 = skinTaskHistoryValidX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(_e3);
    out_1.temporal = vec2<f32>(1f, select(0f, 1f, _e20));
    out_1.positionOS = _e1;
    out_1.clippingPositionWS = currentWorld.xyz;
    let _e32 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalCurrentViewProj;
    out_1.currentClip = (_e32 * currentWorld);
    let _e37 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    out_1.clip = (_e37 * currentWorld);
    let _e42 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalPreviousViewProj;
    out_1.previousClip = (_e42 * previousWorld_1);
    out_1.uv = in_5.uv;
    out_1.uv1_ = in_5.uv1_;
    out_1.uv2_ = in_5.uv2_;
    out_1.uv3_ = in_5.uv3_;
    out_1.uv4_ = in_5.uv4_;
    out_1.uv5_ = in_5.uv5_;
    out_1.uv6_ = in_5.uv6_;
    out_1.uv7_ = in_5.uv7_;
    let _e60 = out_1;
    return _e60;
}

@fragment 
fn fs_temporal(in_6: TemporalVsOut) -> @location(0) vec4<f32> {
    applyViewClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(in_6.clippingPositionWS, false);
    let reactive_5 = in_6.temporal.x;
    let motionValid_2 = (in_6.temporal.y >= 0.5f);
    let _e12 = material.baseColor.w;
    let _e13 = temporalVertexAlpha(in_6);
    let _e17 = material.alphaCutoff;
    let _e20 = material.alphaToCoverage;
    let _e23 = material.alphaHash;
    let _e25 = standardUsesBaseColorTexture();
    let _e28 = material.baseColorTextureCoordinatesTransform;
    let _e31 = material.baseColorTextureCoordinatesMetadata;
    let _e34 = material.baseColorTextureCoordinatesRotation;
    let _e35 = standardUsesAlphaTexture();
    let _e38 = material.alphaTextureCoordinatesTransform;
    let _e41 = material.alphaTextureCoordinatesMetadata;
    let _e44 = material.alphaTextureCoordinatesRotation;
    let _e47 = material.alphaChannel;
    let _e52 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.temporalProjection;
    let _e65 = projectPbrSceneTemporalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DFNVYG64TBNQX((_e12 * _e13), _e17, _e20, _e23, in_6.positionOS, _e25, baseColorTexture_1, baseColorTexture_sampler, _e28, _e31, _e34, _e35, alphaTexture_1, alphaTexture_sampler, _e38, _e41, _e44, _e47, in_6.currentClip, in_6.previousClip, _e52, reactive_5, motionValid_2, in_6.uv, in_6.uv1_, in_6.uv2_, in_6.uv3_, in_6.uv4_, in_6.uv5_, in_6.uv6_, in_6.uv7_);
    return _e65;
}
