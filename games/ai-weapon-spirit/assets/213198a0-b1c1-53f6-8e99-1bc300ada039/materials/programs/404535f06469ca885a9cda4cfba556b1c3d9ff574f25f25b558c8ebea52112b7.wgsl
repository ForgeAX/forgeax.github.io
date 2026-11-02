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

struct SkinTaskAddressX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX {
    candidateBase: u32,
    descriptorBase: u32,
    directCandidate: u32,
    reserved: u32,
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

struct VsInput {
    @location(0) position: vec3<f32>,
    @location(1) normal: vec3<f32>,
    @location(2) uv: vec2<f32>,
    @location(3) tangent: vec4<f32>,
    @location(13) color: vec4<f32>,
    @location(6) uv1_: vec2<f32>,
    @location(7) uv2_: vec2<f32>,
    @location(8) uv3_: vec2<f32>,
    @location(9) uv4_: vec2<f32>,
    @location(10) uv5_: vec2<f32>,
    @location(11) uv6_: vec2<f32>,
    @location(12) uv7_: vec2<f32>,
    @location(4) skinIndex: vec4<u32>,
    @location(5) skinWeight: vec4<f32>,
}

struct VsOut {
    @builtin(position) @invariant clip: vec4<f32>,
    @location(1) positionWS: vec3<f32>,
    @location(0) positionOS: vec3<f32>,
    @location(2) normalWS: vec3<f32>,
    @location(3) tangentWS: vec4<f32>,
    @location(4) uv0And1_: vec4<f32>,
    @location(5) uv2And3_: vec4<f32>,
    @location(6) uv4And5_: vec4<f32>,
    @location(10) uv6And7_: vec4<f32>,
    @location(7) @interpolate(flat) objectBasis0_: vec3<f32>,
    @location(8) @interpolate(flat) objectBasis1_: vec3<f32>,
    @location(9) @interpolate(flat) objectBasis2_: vec3<f32>,
    @location(12) color: vec4<f32>,
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

const SURFACE_TRIPLANAR_OBJECT: f32 = 2f;

@group(0) @binding(0) 
var<uniform> viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(0) @binding(7) 
var<uniform> shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ShadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(2) @binding(2) 
var<uniform> skinTaskAddressX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX: SkinTaskAddressX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX;
@group(2) @binding(1) 
var<storage> skinTaskOutputX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX: array<vec4<u32>>;
@group(1) @binding(0) 
var<uniform> material: MaterialParameters;
@group(1) @binding(1) 
var baseColorTexture_sampler: sampler;
@group(1) @binding(2) 
var baseColorTexture: texture_2d<f32>;
@group(1) @binding(3) 
var metallicRoughnessTexture_sampler: sampler;
@group(1) @binding(4) 
var metallicRoughnessTexture: texture_2d<f32>;
@group(1) @binding(5) 
var normalTexture_sampler: sampler;
@group(1) @binding(6) 
var normalTexture: texture_2d<f32>;
@group(1) @binding(66) 
var specularColorTexture_sampler: sampler;
@group(1) @binding(67) 
var specularColorTexture: texture_2d<f32>;
@group(1) @binding(7) 
var emissiveTexture_sampler: sampler;
@group(1) @binding(8) 
var emissiveTexture: texture_2d<f32>;
@group(1) @binding(9) 
var occlusionTexture_sampler: sampler;
@group(1) @binding(10) 
var occlusionTexture: texture_2d<f32>;
@group(1) @binding(11) 
var transmissionTexture_sampler: sampler;
@group(1) @binding(12) 
var transmissionTexture: texture_2d<f32>;
@group(1) @binding(13) 
var thicknessTexture_sampler: sampler;
@group(1) @binding(14) 
var thicknessTexture: texture_2d<f32>;
@group(1) @binding(15) 
var bumpTexture_sampler: sampler;
@group(1) @binding(16) 
var bumpTexture: texture_2d<f32>;
@group(1) @binding(64) 
var specularTexture_sampler: sampler;
@group(1) @binding(65) 
var specularTexture: texture_2d<f32>;
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
var alphaTexture: texture_2d<f32>;
@group(1) @binding(23) 
var displacementTexture_sampler: sampler;
@group(1) @binding(24) 
var displacementTexture: texture_2d<f32>;

fn materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(source: vec2<f32>, transform: vec4<f32>, rotation: vec4<f32>) -> vec2<f32> {
    let scaled = (source * transform.zw);
    return vec2<f32>(((scaled.x * rotation.x) - (scaled.y * rotation.y)), ((scaled.x * rotation.y) + (scaled.y * rotation.x)));
}

fn displaceVertexX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUZDJONYGYYLDMVWWK3TUX(position: vec3<f32>, normal: vec3<f32>, heightMap: texture_2d<f32>, heightSampler: sampler, scale: f32, bias: f32, transform_1: vec4<f32>, metadata: vec4<f32>, rotation_1: vec4<f32>, coordinates: array<vec2<f32>, 8>) -> vec3<f32> {
    let uv_2 = coordinates[u32(clamp(metadata.x, 0f, 7f))];
    let _e10 = materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(uv_2, transform_1, rotation_1);
    let transformed = ((_e10 + transform_1.xy) * metadata.zw);
    let _e18 = textureSampleLevel(heightMap, heightSampler, transformed, 0f);
    let height = clamp(_e18.x, 0f, 1f);
    let lengthSquared = dot(normal, normal);
    let direction = (normal * inverseSqrt(max(lengthSquared, 0.00000000000000000001f)));
    return (position + (direction * ((height * scale) + bias)));
}

fn skinTaskDirectCandidateX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX() -> u32 {
    let _e2 = skinTaskAddressX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX.directCandidate;
    return _e2;
}

fn skinTaskDescriptorX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(candidate: u32) -> vec4<u32> {
    let _e4 = skinTaskAddressX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX.candidateBase;
    let hashSlot = skinTaskOutputX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX[(_e4 + candidate)].x;
    if (hashSlot == 4294967295u) {
        return vec4(0u);
    }
    let _e16 = skinTaskAddressX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX.descriptorBase;
    let _e19 = skinTaskOutputX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX[(_e16 + hashSlot)];
    return _e19;
}

fn skinTaskJointX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(descriptor: vec4<u32>, index: u32, previous: bool) -> mat4x4<f32> {
    var local: bool;

    if !(((descriptor.w & 1u) == 0u)) {
        local = (index >= descriptor.y);
    } else {
        local = true;
    }
    let _e13 = local;
    if _e13 {
        return mat4x4<f32>(vec4(0f), vec4(0f), vec4(0f), vec4(0f));
    }
    let base = (descriptor.z + ((index + select(0u, descriptor.y, previous)) * 4u));
    let _e34 = skinTaskOutputX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX[base];
    let _e40 = skinTaskOutputX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX[(base + 1u)];
    let _e46 = skinTaskOutputX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX[(base + 2u)];
    let _e52 = skinTaskOutputX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX[(base + 3u)];
    return mat4x4<f32>(bitcast<vec4<f32>>(_e34), bitcast<vec4<f32>>(_e40), bitcast<vec4<f32>>(_e46), bitcast<vec4<f32>>(_e52));
}

fn skinTaskBlendX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(descriptor_1: vec4<u32>, indices: vec4<u32>, weights: vec4<f32>, previous_1: bool) -> mat4x4<f32> {
    let _e4 = skinTaskJointX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(descriptor_1, indices.x, previous_1);
    let _e9 = skinTaskJointX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(descriptor_1, indices.y, previous_1);
    let _e14 = skinTaskJointX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(descriptor_1, indices.z, previous_1);
    let _e19 = skinTaskJointX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(descriptor_1, indices.w, previous_1);
    return ((((_e4 * weights.x) + (_e9 * weights.y)) + (_e14 * weights.z)) + (_e19 * weights.w));
}

fn clippedByPlanesX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(positionWS: vec3<f32>, planes: array<vec4<f32>, 6>, control: vec4<f32>) -> bool {
    var allOutside: bool;
    var anyOutside: bool = false;
    var index_1: u32 = 0u;
    var local_1: bool;
    var local_2: bool;

    let count = min(u32(max(control.x, 0f)), 6u);
    allOutside = (count > 0u);
    loop {
        let _e13 = index_1;
        if (_e13 < count) {
        } else {
            break;
        }
        {
            let _e17 = index_1;
            let _e21 = index_1;
            let outside = ((dot(planes[_e17].xyz, positionWS) + planes[_e21].w) < 0f);
            let _e28 = anyOutside;
            if !(_e28) {
                local_1 = outside;
            } else {
                local_1 = true;
            }
            let _e33 = local_1;
            anyOutside = _e33;
            let _e34 = allOutside;
            if _e34 {
                local_2 = outside;
            } else {
                local_2 = false;
            }
            let _e38 = local_2;
            allOutside = _e38;
        }
        continuing {
            let _e40 = index_1;
            index_1 = (_e40 + 1u);
        }
    }
    let _e42 = anyOutside;
    let _e43 = allOutside;
    return select(_e42, _e43, (control.y > 0.5f));
}

fn applyLocalClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(positionWS_1: vec3<f32>, shadow: bool, planes_1: array<vec4<f32>, 6>, control_1: vec4<f32>) {
    var local_3: bool;
    var local_4: bool;

    if !(!(shadow)) {
        local_3 = (control_1.z > 0.5f);
    } else {
        local_3 = true;
    }
    let _e10 = local_3;
    if _e10 {
        let _e13 = clippedByPlanesX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(positionWS_1, planes_1, control_1);
        local_4 = _e13;
    } else {
        local_4 = false;
    }
    let _e17 = local_4;
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

fn decodeTangentSpaceNormalRgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(rg: vec2<f32>) -> vec3<f32> {
    let xy = ((rg * 2f) - vec2(1f));
    let z = sqrt(saturate((1f - dot(xy, xy))));
    return vec3<f32>(xy, z);
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
    let sx = (dx_2 * inverseSqrt(max(dot(dx_2, dx_2), 0.00000000000000000001f)));
    let sy = (dy_2 * inverseSqrt(max(dot(dy_2, dy_2), 0.00000000000000000001f)));
    let r1_ = cross(sy, normalWS);
    let r2_ = cross(normalWS, sx);
    let determinant_ = (dot(sx, r1_) * faceDirection);
    let gradient = (sign(determinant_) * ((heightGradient.x * r1_) + (heightGradient.y * r2_)));
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

fn alphaHash2DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(value: vec2<f32>) -> f32 {
    return fract(((10000f * sin(((17f * value.x) + (0.1f * value.y)))) * (0.1f + abs(sin(((13f * value.y) + value.x))))));
}

fn alphaHash3DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(value_1: vec3<f32>) -> f32 {
    let _e2 = alphaHash2DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(value_1.xy);
    let _e5 = alphaHash2DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(vec2<f32>(_e2, value_1.z));
    return _e5;
}

fn alphaHashThresholdX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(position_1: vec3<f32>, derivative: f32) -> f32 {
    var threshold: f32;

    let scale_3 = (1f / max((0.05f * derivative), 0.000001f));
    let level = log2(scale_3);
    let _e13 = alphaHash3DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(floor((exp2(floor(level)) * position_1)));
    let _e18 = alphaHash3DX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(floor((exp2(ceil(level)) * position_1)));
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

fn applyAlphaHashX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(alpha: f32, position_2: vec3<f32>, enabled: f32) {
    let _e1 = dpdx(position_2);
    let _e3 = dpdy(position_2);
    let derivative_1 = max(length(_e1), length(_e3));
    if (enabled > 0.5f) {
        let _e9 = alphaHashThresholdX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(position_2, derivative_1);
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

fn surfaceGeometryNormal(dx: vec3<f32>, dy: vec3<f32>, fallback: vec3<f32>) -> vec3<f32> {
    var local_5: bool;

    let scaleX = max(max(abs(dx.x), abs(dx.y)), abs(dx.z));
    let scaleY = max(max(abs(dy.x), abs(dy.y)), abs(dy.z));
    if (scaleX > 0f) {
        local_5 = (scaleY > 0f);
    } else {
        local_5 = false;
    }
    let _e25 = local_5;
    if !(_e25) {
        return fallback;
    }
    let geometric = cross((dy / vec3(scaleY)), (dx / vec3(scaleX)));
    let lengthSquared_1 = dot(geometric, geometric);
    if !((lengthSquared_1 > 0f)) {
        return fallback;
    }
    return (geometric * inverseSqrt(lengthSquared_1));
}

fn _cascadeLightViewProj(layer: u32) -> mat4x4<f32> {
    switch layer {
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

fn standardUsesDisplacementTexture() -> bool {
    return true;
}

fn standardVertexPosition(in_4: VsInput) -> vec3<f32> {
    let _e0 = standardUsesDisplacementTexture();
    if _e0 {
        let _e6 = material.displacementScale;
        let _e9 = material.displacementBias;
        let _e12 = material.displacementTextureCoordinatesTransform;
        let _e15 = material.displacementTextureCoordinatesMetadata;
        let _e18 = material.displacementTextureCoordinatesRotation;
        let _e30 = displaceVertexX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUZDJONYGYYLDMVWWK3TUX(in_4.position, in_4.normal, displacementTexture, displacementTexture_sampler, _e6, _e9, _e12, _e15, _e18, array<vec2<f32>, 8>(in_4.uv, in_4.uv1_, in_4.uv2_, in_4.uv3_, in_4.uv4_, in_4.uv5_, in_4.uv6_, in_4.uv7_));
        return _e30;
    }
    return in_4.position;
}

fn shadowVertex(in_5: VsInput, idx_2: u32) -> VsOut {
    var out: VsOut;

    let _e0 = skinTaskDirectCandidateX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX();
    let _e2 = standardVertexPosition(in_5);
    let _e3 = skinTaskDescriptorX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(_e0);
    let _e7 = skinTaskBlendX_naga_oil_mod_XMZXXEZ3FMF4F643LNFXDUOTUMFZWWX(_e3, in_5.skinIndex, in_5.skinWeight, false);
    let worldPos = (_e7 * vec4<f32>(_e2, 1f));
    let worldNormal_1 = normalize((_e7 * vec4<f32>(in_5.normal, 0f)).xyz);
    let worldTangent_1 = normalize((_e7 * vec4<f32>(in_5.tangent.xyz, 0f)).xyz);
    let _e26 = shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.isSpot;
    if (_e26 == 1u) {
        let _e33 = shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.spotLightViewProj;
        out.clip = (_e33 * worldPos);
    } else {
        let _e38 = shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.index;
        let _e39 = _cascadeLightViewProj(_e38);
        out.clip = (_e39 * worldPos);
    }
    out.positionWS = worldPos.xyz;
    out.positionOS = _e2;
    out.normalWS = worldNormal_1;
    out.tangentWS = vec4<f32>(worldTangent_1, in_5.tangent.w);
    out.uv0And1_ = vec4<f32>(in_5.uv, in_5.uv1_);
    out.uv2And3_ = vec4<f32>(in_5.uv2_, in_5.uv3_);
    out.uv4And5_ = vec4<f32>(in_5.uv4_, in_5.uv5_);
    out.uv6And7_ = vec4<f32>(in_5.uv6_, in_5.uv7_);
    out.objectBasis0_ = _e7[0].xyz;
    out.objectBasis1_ = _e7[1].xyz;
    out.objectBasis2_ = _e7[2].xyz;
    out.color = in_5.color;
    let _e76 = out;
    return _e76;
}

fn standardUsesTriplanarProjection() -> bool {
    return false;
}

fn surfaceProjection(input: SurfaceInput, materialValue: MaterialParameters) -> SurfaceProjection {
    let objectSpace = (materialValue.triplanarSpace > 1.5f);
    let normalOS_1 = normalize((input.vertexNormalWS * input.objectToWorld));
    let normal_2 = select(normalize(input.vertexNormalWS), normalOS_1, objectSpace);
    let position_3 = (select(input.positionWS, input.positionOS, objectSpace) * materialValue.triplanarScale);
    let blend = pow(abs(normal_2), vec3(max(materialValue.triplanarSharpness, 1f)));
    let dx_3 = dpdx(position_3);
    let dy_3 = dpdy(position_3);
    return SurfaceProjection(position_3, dx_3, dy_3, normal_2, (blend / vec3(max(((blend.x + blend.y) + blend.z), 0.000001f))));
}

fn standardUsesBaseColorTexture() -> bool {
    return true;
}

fn surfacePlaneSample(tex: texture_2d<f32>, smp: sampler, uv: vec2<f32>, dx_1: vec2<f32>, dy_1: vec2<f32>, transform_2: vec4<f32>, metadata_1: vec4<f32>, rotation_2: vec4<f32>) -> vec4<f32> {
    let scale_4 = metadata_1.zw;
    let _e5 = materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(uv, transform_2, rotation_2);
    let _e10 = materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(dx_1, transform_2, rotation_2);
    let _e13 = materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(dy_1, transform_2, rotation_2);
    let _e17 = textureSampleGrad(tex, smp, ((_e5 + transform_2.xy) * scale_4), (_e10 * scale_4), (_e13 * scale_4));
    return _e17;
}

fn surfaceTriplanarSamples(tex_1: texture_2d<f32>, smp_1: sampler, projection: SurfaceProjection, transform_3: vec4<f32>, metadata_2: vec4<f32>, rotation_3: vec4<f32>) -> SurfaceTriplanarSamples {
    let p = projection.position;
    let dx_4 = projection.positionDx;
    let dy_4 = projection.positionDy;
    let _e12 = surfacePlaneSample(tex_1, smp_1, p.yz, dx_4.yz, dy_4.yz, transform_3, metadata_2, rotation_3);
    let _e16 = surfacePlaneSample(tex_1, smp_1, p.zx, dx_4.zx, dy_4.zx, transform_3, metadata_2, rotation_3);
    let _e20 = surfacePlaneSample(tex_1, smp_1, p.xy, dx_4.xy, dy_4.xy, transform_3, metadata_2, rotation_3);
    return SurfaceTriplanarSamples(_e12, _e16, _e20);
}

fn fxSurfaceHelper_f2fa0e67c8860195_sampleSurfaceTexture(tex_2: texture_2d<f32>, smp_2: sampler, uv_1: vec2<f32>, footprint: f32) -> vec4<f32> {
    let _e3 = textureSample(tex_2, smp_2, uv_1);
    return _e3;
}

fn surfaceUv(input_1: SurfaceInput, transform_4: vec4<f32>, metadata_3: vec4<f32>, rotation_4: vec4<f32>) -> vec2<f32> {
    var source_1: vec2<f32>;

    source_1 = input_1.uv0_;
    if (metadata_3.x >= 1f) {
        source_1 = input_1.uv1_;
    }
    if (metadata_3.x >= 2f) {
        source_1 = input_1.uv2_;
    }
    if (metadata_3.x >= 3f) {
        source_1 = input_1.uv3_;
    }
    if (metadata_3.x >= 4f) {
        source_1 = input_1.uv4_;
    }
    if (metadata_3.x >= 5f) {
        source_1 = input_1.uv5_;
    }
    if (metadata_3.x >= 6f) {
        source_1 = input_1.uv6_;
    }
    if (metadata_3.x >= 7f) {
        source_1 = input_1.uv7_;
    }
    let _e32 = source_1;
    let _e35 = materialUvLinearX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU5DFPB2HK4TFL5RW633SMRUW4YLUMVZQX(_e32, transform_4, rotation_4);
    return (_e35 + transform_4.xy);
}

fn fxSurfaceHelper_f2fa0e67c8860195_surfaceTextureFootprint(input_2: SurfaceInput, transform_5: vec4<f32>, metadata_4: vec4<f32>) -> f32 {
    var footprint_1: f32;

    let index_2 = u32(clamp(metadata_4.x, 0f, 7f));
    footprint_1 = input_2.uvFootprint0_[(index_2 % 4u)];
    if (index_2 >= 4u) {
        footprint_1 = input_2.uvFootprint1_[(index_2 % 4u)];
    }
    let _e19 = footprint_1;
    return ((_e19 * max(abs(transform_5.z), abs(transform_5.w))) * max(abs(metadata_4.z), abs(metadata_4.w)));
}

fn surfaceSample(tex_3: texture_2d<f32>, smp_3: sampler, input_3: SurfaceInput, triplanar: bool, projection_1: SurfaceProjection, transform_6: vec4<f32>, metadata_5: vec4<f32>, rotation_5: vec4<f32>) -> vec4<f32> {
    if triplanar {
        let _e7 = surfaceTriplanarSamples(tex_3, smp_3, projection_1, transform_6, metadata_5, rotation_5);
        let w = projection_1.weights;
        return (((_e7.x * w.x) + (_e7.y * w.y)) + (_e7.z * w.z));
    }
    let _e21 = surfaceUv(input_3, transform_6, metadata_5, rotation_5);
    let _e24 = fxSurfaceHelper_f2fa0e67c8860195_surfaceTextureFootprint(input_3, transform_6, metadata_5);
    let _e25 = fxSurfaceHelper_f2fa0e67c8860195_sampleSurfaceTexture(tex_3, smp_3, (_e21 * metadata_5.zw), _e24);
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
    let n = projection_2.normal;
    let _e5 = decodeTangentSpaceNormalRgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(samples.x.xy);
    let _e7 = scaleTangentSpaceNormalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(_e5, scale_2);
    let _e10 = decodeTangentSpaceNormalRgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(samples.y.xy);
    let _e11 = scaleTangentSpaceNormalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(_e10, scale_2);
    let _e14 = decodeTangentSpaceNormalRgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(samples.z.xy);
    let _e15 = scaleTangentSpaceNormalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(_e14, scale_2);
    let tx = vec3<f32>((_e7.xy + n.yz), (abs(_e7.z) * n.x));
    let ty = vec3<f32>((_e11.xy + n.zx), (abs(_e11.z) * n.y));
    let tz = vec3<f32>((_e15.xy + n.xy), (abs(_e15.z) * n.z));
    let w_1 = projection_2.weights;
    return normalize((((tx.zxy * w_1.x) + (ty.yzx * w_1.y)) + (tz * w_1.z)));
}

fn surfaceObjectNormalToWorld(input_4: SurfaceInput, normalOS: vec3<f32>) -> vec3<f32> {
    let m = input_4.objectToWorld;
    let cofactor = mat3x3<f32>(cross(m[1], m[2]), cross(m[2], m[0]), cross(m[0], m[1]));
    return (normalize((cofactor * normalOS)) * sign(dot(m[0], cofactor[0])));
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
    var baseSample: vec4<f32> = vec4(1f);
    var metallicRoughnessSample: vec4<f32> = vec4(1f);
    var metallicSample: vec4<f32>;
    var roughnessSample: vec4<f32>;
    var alpha_2: f32 = 1f;
    var alphaSample: vec4<f32> = vec4(1f);
    var normal_1: vec3<f32>;
    var usesNormal: bool = false;
    var local_6: bool;
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
        let _e26 = surfaceSample(baseColorTexture, baseColorTexture_sampler, _e20, _e16, _e18, materialValue_2.baseColorTextureCoordinatesTransform, materialValue_2.baseColorTextureCoordinatesMetadata, materialValue_2.baseColorTextureCoordinatesRotation);
        baseSample = _e26;
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
            let _e43 = baseSample;
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
            let _e55 = baseSample;
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
            let _e69 = baseSample;
            alphaSample = _e69;
        } else {
            let _e71 = standardReusesAlphaTextureFromMetallicRoughnessTexture();
            if _e71 {
                let _e72 = metallicRoughnessSample;
                alphaSample = _e72;
            } else {
                let _e73 = standardReusesAlphaTextureFromMetallicTexture();
                if _e73 {
                    let _e74 = metallicSample;
                    alphaSample = _e74;
                } else {
                    let _e75 = standardReusesAlphaTextureFromRoughnessTexture();
                    if _e75 {
                        let _e76 = roughnessSample;
                        alphaSample = _e76;
                    } else {
                        let _e77 = input_5;
                        let _e83 = surfaceSample(alphaTexture, alphaTexture_sampler, _e77, _e16, _e18, materialValue_2.alphaTextureCoordinatesTransform, materialValue_2.alphaTextureCoordinatesMetadata, materialValue_2.alphaTextureCoordinatesRotation);
                        alphaSample = _e83;
                    }
                }
            }
        }
        let _e84 = alphaSample;
        let _e87 = surfaceChannel(_e84, u32(materialValue_2.alphaChannel));
        alpha_2 = _e87;
    }
    let _e90 = input_5.frontFacing;
    let faceDirection_1 = select(-1f, 1f, _e90);
    let _e95 = input_5.vertexNormalWS;
    normal_1 = (normalize(_e95) * faceDirection_1);
    let _e99 = standardUsesNormalTexture();
    if _e99 {
        let transform_7 = materialValue_2.normalTextureCoordinatesTransform;
        let metadata_6 = materialValue_2.normalTextureCoordinatesMetadata;
        let rotation_6 = materialValue_2.normalTextureCoordinatesRotation;
        if _e16 {
            let _e105 = surfaceTriplanarSamples(normalTexture, normalTexture_sampler, _e18, transform_7, metadata_6, rotation_6);
            let _e107 = surfaceTriplanarNormal(_e105, _e18, materialValue_2.normalScale);
            let _e108 = input_5;
            let _e109 = surfaceObjectNormalToWorld(_e108, _e107);
            let _e110 = surfaceTriplanarObjectSpace(materialValue_2);
            normal_1 = (select(_e107, _e109, _e110) * faceDirection_1);
        } else {
            let _e113 = input_5;
            let _e114 = surfaceUv(_e113, transform_7, metadata_6, rotation_6);
            let _e117 = input_5;
            let _e118 = fxSurfaceHelper_f2fa0e67c8860195_surfaceTextureFootprint(_e117, transform_7, metadata_6);
            let _e121 = fxSurfaceHelper_f2fa0e67c8860195_sampleSurfaceTexture(normalTexture, normalTexture_sampler, (_e114 * metadata_6.zw), _e118);
            let _e122 = standardUsesObjectSpaceNormal();
            if _e122 {
                let normalOS_2 = vec3<f32>((((_e121.xy * 2f) - vec2(1f)) * materialValue_2.normalScale), ((_e121.z * 2f) - 1f));
                let _e137 = input_5;
                let _e138 = surfaceObjectNormalToWorld(_e137, normalOS_2);
                normal_1 = (_e138 * faceDirection_1);
            } else {
                let _e141 = input_5.vertexNormalWS;
                let _e143 = input_5.tangentWS;
                let _e145 = decodeTangentSpaceNormalRgX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(_e121.xy);
                let _e147 = scaleTangentSpaceNormalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(_e145, materialValue_2.normalScale);
                let _e148 = applyTBNX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(_e141, _e143, _e147);
                normal_1 = (_e148 * faceDirection_1);
            }
        }
        usesNormal = true;
    }
    let _e152 = usesNormal;
    if !(_e152) {
        let _e154 = standardUsesBumpTexture();
        local_6 = _e154;
    } else {
        local_6 = false;
    }
    let _e158 = local_6;
    if _e158 {
        let _e159 = input_5;
        let _e163 = surfaceUv(_e159, materialValue_2.bumpTextureCoordinatesTransform, materialValue_2.bumpTextureCoordinatesMetadata, materialValue_2.bumpTextureCoordinatesRotation);
        let uv_3 = (_e163 * materialValue_2.bumpTextureCoordinatesMetadata.zw);
        let dx_5 = dpdx(uv_3);
        let dy_5 = dpdy(uv_3);
        let _e171 = textureSampleGrad(bumpTexture, bumpTexture_sampler, uv_3, dx_5, dy_5);
        let height_1 = _e171.x;
        let _e176 = textureSampleGrad(bumpTexture, bumpTexture_sampler, (uv_3 + dx_5), dx_5, dy_5);
        let heightX = _e176.x;
        let _e181 = textureSampleGrad(bumpTexture, bumpTexture_sampler, (uv_3 + dy_5), dx_5, dy_5);
        let heightY = _e181.x;
        let _e184 = input_5.positionWS;
        let _e185 = normal_1;
        let _e191 = perturbBumpNormalX_naga_oil_mod_XMZXXEZ3FMF4F64DCOI5DU5DCNYX(_e184, _e185, (materialValue_2.bumpScale * vec2<f32>((heightX - height_1), (heightY - height_1))), faceDirection_1);
        normal_1 = _e191;
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
    let _e214 = baseSample;
    let baseColor = ((materialValue_2.baseColor.xyz * _e214.xyz) * vertexColor.xyz);
    let _e220 = metallicSample;
    let _e223 = surfaceChannel(_e220, u32(materialValue_2.metallicChannel));
    let metallic = clamp((materialValue_2.metallic * _e223), 0f, 1f);
    let _e229 = roughnessSample;
    let _e232 = surfaceChannel(_e229, u32(materialValue_2.roughnessChannel));
    let roughness = clamp((materialValue_2.roughness * _e232), 0.04f, 1f);
    let _e240 = emissiveSample;
    let emissive = ((materialValue_2.emissive * materialValue_2.emissiveIntensity) * _e240.xyz);
    let _e244 = occlusionSample.x;
    let occlusion = clamp((1f + ((_e244 - 1f) * materialValue_2.occlusionStrength)), 0f, 1f);
    let _e257 = baseSample.w;
    let _e261 = alpha_2;
    let sampledAlpha = clamp((((materialValue_2.baseColor.w * _e257) * vertexColor.w) * _e261), 0f, 1f);
    let _e268 = alphaCoverageX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(sampledAlpha, materialValue_2.alphaCutoff, materialValue_2.alphaToCoverage);
    let _e270 = input_5.positionOS;
    applyAlphaHashX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DUYLMOBUGCX3IMFZWQX(_e268, _e270, materialValue_2.alphaHash);
    let _e273 = normal_1;
    let _e274 = alphaClipThreshold;
    return SurfaceData(baseColor, _e273, metallic, roughness, emissive, occlusion, _e268, _e274);
}

fn evaluateShadowSurface(in_6: VsOut, frontFacing_2: bool) -> SurfaceData {
    var shadowMaterial: MaterialParameters;
    var shadowInput: SurfaceInput;

    applyViewClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(in_6.positionWS, true);
    let viewDirectionWS = vec3(0f);
    let _e8 = dpdy(in_6.positionWS);
    let _e10 = dpdx(in_6.positionWS);
    let _e48 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.fogHeightOpacity.w;
    let input_7 = SurfaceInput(in_6.positionOS, in_6.positionWS, (normalize(cross(_e8, _e10)) * select(-1f, 1f, frontFacing_2)), in_6.normalWS, in_6.tangentWS, viewDirectionWS, in_6.uv0And1_.xy, in_6.uv0And1_.zw, in_6.uv2And3_.xy, in_6.uv2And3_.zw, in_6.uv4And5_.xy, in_6.uv4And5_.zw, in_6.uv6And7_.xy, in_6.uv6And7_.zw, in_6.color, frontFacing_2, vec4(0f), vec4(0f), mat3x3<f32>(in_6.objectBasis0_, in_6.objectBasis1_, in_6.objectBasis2_), _e48);
    let _e51 = material;
    shadowMaterial = _e51;
    shadowInput = input_7;
    let _e56 = material.shadowAlphaMode;
    let textureOnly = (_e56 > 0.5f);
    let _e64 = material.baseColor.w;
    shadowMaterial.baseColor.w = select(_e64, 1f, textureOnly);
    let _e70 = material.alphaHash;
    shadowMaterial.alphaHash = select(_e70, 0f, textureOnly);
    let _e76 = material.alphaToCoverage;
    shadowMaterial.alphaToCoverage = select(_e76, 0f, textureOnly);
    shadowInput.vertexColor.w = select(input_7.vertexColor.w, 1f, textureOnly);
    let _e85 = shadowInput;
    let _e86 = shadowMaterial;
    let _e87 = evaluate_standard_surface(_e85, _e86);
    return _e87;
}

fn alphaTestShadowSurface(surface: SurfaceData) {
    var local_7: bool;

    if (surface.alphaClipThreshold > 0f) {
        local_7 = (surface.opacity <= surface.alphaClipThreshold);
    } else {
        local_7 = false;
    }
    let _e10 = local_7;
    if _e10 {
        discard;
    } else {
        return;
    }
}

fn evaluate_surface(input_6: SurfaceInput) -> SurfaceData {
    let _e1 = material;
    let _e3 = evaluate_standard_surface(input_6, _e1);
    return _e3;
}

fn standardUsesSpecularColorTexture() -> bool {
    return true;
}

fn standardUsesTransmissionTexture() -> bool {
    return true;
}

fn standardUsesThicknessTexture() -> bool {
    return true;
}

fn standardUsesSpecularTexture() -> bool {
    return true;
}

@vertex 
fn vs_main(in: VsInput, @builtin(instance_index) idx: u32) -> VsOut {
    let _e2 = shadowVertex(in, idx);
    return _e2;
}

@vertex 
fn vs_scene_index(in_1: VsInput, @builtin(instance_index) idx_1: u32) -> VsOut {
    let _e2 = shadowVertex(in_1, idx_1);
    return _e2;
}

@fragment 
fn fs_shadow(in_2: VsOut, @builtin(front_facing) frontFacing: bool) {
    let _e2 = evaluateShadowSurface(in_2, frontFacing);
    alphaTestShadowSurface(_e2);
    return;
}

@fragment 
fn fs_main(in_3: VsOut, @builtin(front_facing) frontFacing_1: bool) {
    let _e2 = evaluateShadowSurface(in_3, frontFacing_1);
    alphaTestShadowSurface(_e2);
    return;
}
