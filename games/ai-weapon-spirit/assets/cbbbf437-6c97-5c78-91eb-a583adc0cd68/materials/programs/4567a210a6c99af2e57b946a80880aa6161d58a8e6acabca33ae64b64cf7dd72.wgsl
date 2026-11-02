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
    surface: vec4<u32>,
    spriteRegion: vec4<f32>,
}

struct InstanceDataX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX {
    localFromInstance: mat4x4<f32>,
}

struct MaterialParameters {
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
}

struct VsOut {
    @builtin(position) @invariant clip: vec4<f32>,
    @location(1) positionWS: vec3<f32>,
}

@group(0) @binding(0) 
var<uniform> viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(0) @binding(7) 
var<uniform> shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ShadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(2) @binding(0) 
var<uniform> meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<MeshX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, 128>;
@group(3) @binding(0) 
var<uniform> instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<InstanceDataX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX, 128>;
@group(1) @binding(0) 
var<uniform> material: MaterialParameters;

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

fn surfaceGeometryNormal(dx: vec3<f32>, dy: vec3<f32>, fallback: vec3<f32>) -> vec3<f32> {
    var local_4: bool;

    let scaleX = max(max(abs(dx.x), abs(dx.y)), abs(dx.z));
    let scaleY = max(max(abs(dy.x), abs(dy.y)), abs(dy.z));
    if (scaleX > 0f) {
        local_4 = (scaleY > 0f);
    } else {
        local_4 = false;
    }
    let _e25 = local_4;
    if !(_e25) {
        return fallback;
    }
    let geometric = cross((dy / vec3(scaleY)), (dx / vec3(scaleX)));
    let lengthSquared = dot(geometric, geometric);
    if !((lengthSquared > 0f)) {
        return fallback;
    }
    return (geometric * inverseSqrt(lengthSquared));
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

fn standardVertexPosition(in_4: VsInput) -> vec3<f32> {
    return in_4.position;
}

fn shadowVertex(in_5: VsInput, idx_2: u32) -> VsOut {
    var out: VsOut;

    let _e1 = standardVertexPosition(in_5);
    let _e5 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].worldFromLocal;
    let _e10 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx_2].localFromInstance;
    let worldMatrix = (_e5 * _e10);
    let worldPos = (worldMatrix * vec4<f32>(_e1, 1f));
    let _e17 = shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.isSpot;
    if (_e17 == 1u) {
        let _e24 = shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.spotLightViewProj;
        out.clip = (_e24 * worldPos);
    } else {
        let _e29 = shadowCasterCascadeX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.index;
        let _e30 = _cascadeLightViewProj(_e29);
        out.clip = (_e30 * worldPos);
    }
    out.positionWS = worldPos.xyz;
    let _e34 = out;
    return _e34;
}

fn evaluate_surface(input: SurfaceInput) -> SurfaceData {
    return SurfaceData(vec3(1f), input.vertexNormalWS, 0f, 1f, vec3(0f), 1f, 1f, 0f);
}

fn evaluateShadowSurface(in_6: VsOut, frontFacing_2: bool) -> SurfaceData {
    applyViewClippingX_naga_oil_mod_XMZXXEZ3FMF4F6Y3MNFYHA2LOM45DU4DMMFXGK4YX(in_6.positionWS, true);
    let _e4 = evaluate_surface(SurfaceInput());
    return _e4;
}

fn alphaTestShadowSurface(surface: SurfaceData) {
    var local_5: bool;

    if (surface.alphaClipThreshold > 0f) {
        local_5 = (surface.opacity <= surface.alphaClipThreshold);
    } else {
        local_5 = false;
    }
    let _e10 = local_5;
    if _e10 {
        discard;
    } else {
        return;
    }
}

fn standardUsesTriplanarProjection() -> bool {
    return false;
}

fn standardUsesObjectSpaceNormal() -> bool {
    return false;
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
