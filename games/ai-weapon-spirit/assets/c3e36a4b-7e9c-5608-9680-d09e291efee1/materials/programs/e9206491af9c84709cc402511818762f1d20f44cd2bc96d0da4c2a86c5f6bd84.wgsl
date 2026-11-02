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
    color: vec4<f32>,
    playerXZ: vec2<f32>,
    timeSeconds: f32,
    nearOpacity: f32,
    farOpacity: f32,
    rangeMeters: f32,
    flowSpeed: f32,
    pad: f32,
}

struct In {
    @location(0) pos: vec3<f32>,
    @location(2) uv: vec2<f32>,
    @location(6) role: vec2<f32>,
}

struct Out {
    @builtin(position) clip: vec4<f32>,
    @location(0) world: vec3<f32>,
    @location(1) uv: vec2<f32>,
    @location(2) role: f32,
}

@group(0) @binding(0) 
var<uniform> viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: ViewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX;
@group(2) @binding(0) 
var<storage> meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<MeshX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX>;
@group(3) @binding(0) 
var<storage> instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX: array<InstanceDataX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX>;
@group(1) @binding(0) 
var<uniform> material: Material;

@vertex 
fn vs_main(v: In, @builtin(instance_index) idx: u32) -> Out {
    var o: Out;

    let _e3 = meshesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[0].worldFromLocal;
    let _e9 = instancesX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX[idx].localFromInstance;
    let p = ((_e3 * _e9) * vec4<f32>(v.pos, 1f));
    let _e19 = viewX_naga_oil_mod_XMZXXEZ3FMF4F65TJMV3TUOTDN5WW233OX.worldViewProj;
    o.clip = (_e19 * p);
    o.world = p.xyz;
    o.uv = v.uv;
    o.role = v.role.x;
    let _e28 = o;
    return _e28;
}

@fragment 
fn fs_main(v_1: Out) -> @location(0) vec4<f32> {
    var alpha: f32;
    var color: vec3<f32>;
    var local: bool;

    let _e3 = material.rangeMeters;
    let _e8 = material.playerXZ;
    let near = (1f - smoothstep(1f, _e3, length((v_1.world.xz - _e8))));
    let _e17 = material.farOpacity;
    let _e20 = material.nearOpacity;
    let opacity = mix(_e17, _e20, near);
    let _e28 = material.timeSeconds;
    let _e31 = material.flowSpeed;
    let flow = (0.88f + (0.12f * sin(((v_1.uv.x * 0.55f) - (_e28 * _e31)))));
    let topFade = (1f - smoothstep(0.85f, 1f, v_1.uv.y));
    alpha = (((opacity * flow) * (0.7f + (0.3f * (1f - v_1.uv.y)))) * topFade);
    let _e60 = material.color;
    color = _e60.xyz;
    if (v_1.role < 0.5f) {
        let rim = (1f - smoothstep(0.012f, 0.043f, abs((v_1.uv.y - 0.92f))));
        let _e76 = alpha;
        alpha = max(_e76, ((rim * (0.34f + (0.3f * near))) * flow));
        let _e84 = color;
        color = mix(_e84, vec3<f32>(0.44f, 1.14f, 1.02f), (rim * 0.82f));
    }
    if (v_1.role > 0.5f) {
        local = (v_1.role < 1.5f);
    } else {
        local = false;
    }
    let _e101 = local;
    if _e101 {
        alpha = 1f;
        color = vec3<f32>(0.42f, 1.36f, 1.1f);
    }
    if (v_1.role > 1.5f) {
        alpha = ((0.78f + (0.14f * near)) * flow);
        color = vec3<f32>(0.38f, 1.18f, 1.08f);
    }
    let _e119 = alpha;
    alpha = clamp(_e119, 0f, 1f);
    let _e123 = color;
    let _e124 = alpha;
    let _e126 = alpha;
    return vec4<f32>((_e123 * _e124), _e126);
}
