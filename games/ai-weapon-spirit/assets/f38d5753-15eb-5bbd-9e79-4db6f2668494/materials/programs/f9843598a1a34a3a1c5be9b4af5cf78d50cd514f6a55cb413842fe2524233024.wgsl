struct MaterialParametersX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX {
    vpA: vec4<f32>,
    vpB: vec4<f32>,
    vpC: vec4<f32>,
    vpD: vec4<f32>,
    invA: vec4<f32>,
    invB: vec4<f32>,
    invC: vec4<f32>,
    invD: vec4<f32>,
    right: vec4<f32>,
    up: vec4<f32>,
    eye: vec4<f32>,
    forward: vec4<f32>,
    settings: vec4<f32>,
    layer: vec4<f32>,
    extra: vec4<f32>,
    design: vec4<f32>,
    motion: vec4<f32>,
    anchor: vec4<f32>,
    basisX: vec4<f32>,
    basisY: vec4<f32>,
    basisZ: vec4<f32>,
    referenceMotion: vec4<f32>,
    tailVelocity: vec4<f32>,
    detailA: vec4<f32>,
    detailB: vec4<f32>,
    shapeA: vec4<f32>,
    shapeB: vec4<f32>,
    shapeC: vec4<f32>,
    shapeD: vec4<f32>,
    tint: vec4<f32>,
    seed: u32,
    texACoordinatesTransform: vec4<f32>,
    texACoordinatesMetadata: vec4<f32>,
    texACoordinatesRotation: vec4<f32>,
    texBCoordinatesTransform: vec4<f32>,
    texBCoordinatesMetadata: vec4<f32>,
    texBCoordinatesRotation: vec4<f32>,
    ueColor: vec4<f32>,
    ueSurface: vec4<f32>,
    overlayColor: vec4<f32>,
    overlayShape: vec4<f32>,
}

struct Frame {
    vp: mat4x4<f32>,
    invvp: mat4x4<f32>,
    right: vec4<f32>,
    up: vec4<f32>,
    eye: vec4<f32>,
    forward: vec4<f32>,
    settings: vec4<f32>,
    layer: vec4<f32>,
    extra: vec4<f32>,
    design: vec4<f32>,
    motion: vec4<f32>,
}

struct NativeInput {
    @location(0) position: vec3<f32>,
    @location(1) normal: vec3<f32>,
    @location(2) uv: vec2<f32>,
    @location(3) tangent: vec4<f32>,
    @location(4) center: vec3<f32>,
    @location(5) right: vec3<f32>,
    @location(6) up: vec3<f32>,
    @location(7) forward: vec3<f32>,
    @location(8) particle_color: vec4<f32>,
    @location(9) render_controls: vec2<f32>,
    @location(14) vertex_color: vec4<f32>,
    @location(15) uv1_: vec2<f32>,
    @location(10) particle_velocity: vec4<f32>,
    @location(11) particle_size: vec4<f32>,
}

struct MeshVertex {
    position: vec4<f32>,
    normal: vec4<f32>,
    uv: vec4<f32>,
    color: vec4<f32>,
}

struct Particle {
    position: vec4<f32>,
    velocity: vec4<f32>,
    color: vec4<f32>,
    size_rotation: vec4<f32>,
    age: f32,
    lifetime: f32,
    alive: u32,
    id: u32,
}

struct MaterialInput {
    uv0_: vec4<f32>,
    custom1_: vec4<f32>,
    custom2_: vec4<f32>,
    custom3_: vec4<f32>,
    color: vec4<f32>,
    normal: vec3<f32>,
    worldPosition: vec3<f32>,
    viewDirection: vec3<f32>,
    objectPosition: vec3<f32>,
    objectNormal: vec3<f32>,
    objectViewDirection: vec3<f32>,
    tangent: vec3<f32>,
    bitangent: vec3<f32>,
    screenUV: vec2<f32>,
    time: f32,
    delta: f32,
    eyeDepth: f32,
    sceneEyeDepth: f32,
    frontFace: bool,
}

struct Varying {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec4<f32>,
    @location(1) color: vec4<f32>,
    @location(2) custom: vec4<f32>,
    @location(3) world: vec3<f32>,
    @location(4) normal: vec3<f32>,
    @location(6) custom2_: vec4<f32>,
    @location(7) custom3_: vec4<f32>,
    @location(8) tangent: vec3<f32>,
    @location(9) object: vec3<f32>,
    @location(10) objectNormal: vec3<f32>,
}

struct DmStreams {
    uv0_: vec4<f32>,
    uv1_: vec4<f32>,
    uv2_: vec4<f32>,
    uv3_: vec4<f32>,
    rotationXY: vec2<f32>,
}

const DM_WORLD: mat4x4<f32> = mat4x4<f32>(vec4<f32>(1f, 0f, 0f, 0f), vec4<f32>(0f, 1f, 0f, 0f), vec4<f32>(0f, 0f, 1f, 0f), vec4<f32>(0f, 0f, 0f, 1f));
const DM_ROT: mat3x3<f32> = mat3x3<f32>(vec3<f32>(1f, 0f, 0f), vec3<f32>(0f, 1f, 0f), vec3<f32>(0f, 0f, 1f));
const DM_SIM_TO_WORLD: mat3x3<f32> = mat3x3<f32>(vec3<f32>(1f, 0f, 0f), vec3<f32>(0f, 1f, 0f), vec3<f32>(0f, 0f, 1f));

@group(1) @binding(0) 
var<uniform> materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: MaterialParametersX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX;
@group(1) @binding(1) 
var texA_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: sampler;
@group(1) @binding(2) 
var texAX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: texture_2d<f32>;
@group(1) @binding(3) 
var texB_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: sampler;
@group(1) @binding(4) 
var texBX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: texture_2d<f32>;
var<private> frame: Frame;
@group(0) @binding(0) 
var scene_depth: texture_depth_2d;

fn magic_local_axisX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX(v: vec3<f32>) -> vec3<f32> {
    let _e3 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisX;
    let _e9 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisY;
    let _e15 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisZ;
    return vec3<f32>(dot(v, normalize(_e3.xyz)), dot(v, normalize(_e9.xyz)), dot(v, normalize(_e15.xyz)));
}

fn magic_apply_object_vertexX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX(assembled: vec3<f32>, original: vec3<f32>, modified: vec3<f32>, axes: mat3x3<f32>, size_1: f32) -> vec3<f32> {
    return (assembled + ((axes * (modified - original)) * size_1));
}

fn magic_basisX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX() -> mat3x3<f32> {
    let _e2 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisX;
    let _e6 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisY;
    let _e10 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisZ;
    return mat3x3<f32>(_e2.xyz, _e6.xyz, _e10.xyz);
}

fn magic_placeX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX(point: vec3<f32>, age: f32) -> vec3<f32> {
    var local: vec3<f32>;

    local = point;
    let _e5 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.referenceMotion.w;
    if (_e5 > 0.5f) {
        let _e11 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.settings.x;
        let _e16 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.referenceMotion.z;
        let birth = max(0f, ((_e11 + _e16) - age));
        let _e24 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.referenceMotion.y;
        let angle = (birth * _e24);
        let _e26 = local;
        let _e30 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.referenceMotion.x;
        let _e38 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.referenceMotion.x;
        local = (_e26 - vec3<f32>((_e30 * (1f - cos(angle))), 0f, (_e38 * sin(angle))));
    }
    let _e44 = magic_basisX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX();
    let _e45 = local;
    let _e49 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.tailVelocity;
    let _e56 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.settings.x;
    return ((_e44 * _e45) - (_e49.xyz * min(max(0f, age), _e56)));
}

fn magic_frame() {
    let _e2 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.vpA;
    let _e5 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.vpB;
    let _e8 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.vpC;
    let _e11 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.vpD;
    let _e15 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.invA;
    let _e18 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.invB;
    let _e21 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.invC;
    let _e24 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.invD;
    let _e28 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.right;
    let _e31 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.up;
    let _e34 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.eye;
    let _e37 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.forward;
    let _e40 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.settings;
    let _e43 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.layer;
    let _e46 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.seed;
    let _e50 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.extra;
    let _e55 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.design;
    let _e58 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.motion;
    frame = Frame(mat4x4<f32>(_e2, _e5, _e8, _e11), mat4x4<f32>(_e15, _e18, _e21, _e24), _e28, _e31, _e34, _e37, _e40, _e43, vec4<f32>(bitcast<f32>(_e46), _e50.yzw), _e55, _e58);
    return;
}

fn nature_scene_eye_depth(pixel: vec2<f32>) -> f32 {
    let _e1 = textureDimensions(scene_depth);
    let dims = vec2<f32>(_e1);
    let z_2 = textureLoad(scene_depth, vec2<i32>(pixel), 0i);
    let ndc = vec2<f32>((((pixel.x / dims.x) * 2f) - 1f), (1f - ((pixel.y / dims.y) * 2f)));
    let _e25 = frame.invvp;
    let h = (_e25 * vec4<f32>(ndc, z_2, 1f));
    let _e35 = frame.eye;
    let _e40 = frame.forward;
    return dot(((h.xyz / vec3(h.w)) - _e35.xyz), _e40.xyz);
}

fn enchantmentParticleColor(rgb_1: vec3<f32>, palette: f32) -> vec3<f32> {
    var body: vec3<f32> = vec3(1f);
    var core: vec3<f32> = vec3(1f);

    if (palette < 0.5f) {
        return rgb_1;
    }
    if (abs((palette - 0f)) < 0.5f) {
        body = vec3<f32>(1f, 0.055f, 0.008f);
        core = vec3<f32>(1f, 0.6f, 0.23f);
    }
    if (abs((palette - 1f)) < 0.5f) {
        body = vec3<f32>(0.32f, 1f, 0.015f);
        core = vec3<f32>(0.86f, 1f, 0.36f);
    }
    if (abs((palette - 2f)) < 0.5f) {
        body = vec3<f32>(0.33f, 0.035f, 1f);
        core = vec3<f32>(0.82f, 0.64f, 1f);
    }
    if (abs((palette - 3f)) < 0.5f) {
        body = vec3<f32>(0.012f, 0.35f, 1f);
        core = vec3<f32>(0.5f, 0.92f, 1f);
    }
    let peak = max(max(rgb_1.x, rgb_1.y), rgb_1.z);
    let _e65 = body;
    let _e66 = core;
    return (mix(_e65, _e66, smoothstep(0.6f, 4f, peak)) * peak);
}

fn curve_0_(t: f32) -> f32 {
    if (t <= 0f) {
        return 0.99484634f;
    }
    if (t < 0.18867227f) {
        let u = ((t - 0f) / 0.18867227f);
        return (((((((((2f * u) * u) * u) - ((3f * u) * u)) + 1f) * 0.99484634f) + (((((u * u) * u) - ((2f * u) * u)) + u) * -1.0726488f)) + (((((-2f * u) * u) * u) + ((3f * u) * u)) * 0.29923353f)) + ((((u * u) * u) - (u * u)) * -0.11751622f));
    }
    if (t < 1f) {
        let u_1 = ((t - 0.18867227f) / 0.81132776f);
        return (((((((((2f * u_1) * u_1) * u_1) - ((3f * u_1) * u_1)) + 1f) * 0.29923353f) + (((((u_1 * u_1) * u_1) - ((2f * u_1) * u_1)) + u_1) * -0.5053428f)) + (((((-2f * u_1) * u_1) * u_1) + ((3f * u_1) * u_1)) * 0f)) + ((((u_1 * u_1) * u_1) - (u_1 * u_1)) * -0.12835695f));
    }
    return 0f;
}

fn curve_1_(t_1: f32) -> f32 {
    if (t_1 <= 0f) {
        return 1f;
    }
    if (t_1 < 1f) {
        let u_2 = ((t_1 - 0f) / 1f);
        return (((((((((2f * u_2) * u_2) * u_2) - ((3f * u_2) * u_2)) + 1f) * 1f) + (((((u_2 * u_2) * u_2) - ((2f * u_2) * u_2)) + u_2) * 0f)) + (((((-2f * u_2) * u_2) * u_2) + ((3f * u_2) * u_2)) * 1f)) + ((((u_2 * u_2) * u_2) - (u_2 * u_2)) * 0f));
    }
    return 1f;
}

fn curve_2_(t_2: f32) -> f32 {
    if (t_2 <= 0f) {
        return 1f;
    }
    if (t_2 < 1f) {
        let u_3 = ((t_2 - 0f) / 1f);
        return (((((((((2f * u_3) * u_3) * u_3) - ((3f * u_3) * u_3)) + 1f) * 1f) + (((((u_3 * u_3) * u_3) - ((2f * u_3) * u_3)) + u_3) * 0f)) + (((((-2f * u_3) * u_3) * u_3) + ((3f * u_3) * u_3)) * 1f)) + ((((u_3 * u_3) * u_3) - (u_3 * u_3)) * 0f));
    }
    return 1f;
}

fn gradient_3_(t_3: f32) -> vec4<f32> {
    var rgb_2: vec3<f32> = vec3<f32>(1f, 1f, 1f);
    var alpha_1: f32 = 0f;

    if (t_3 <= 0f) {
        rgb_2 = vec3<f32>(1f, 1f, 1f);
    } else {
        if (t_3 <= 1f) {
            rgb_2 = mix(vec3<f32>(1f, 1f, 1f), vec3<f32>(1f, 1f, 1f), ((t_3 - 0f) / 1f));
        }
    }
    if (t_3 <= 0f) {
        alpha_1 = 0f;
    } else {
        if (t_3 <= 0.14706646f) {
            alpha_1 = mix(0f, 1f, ((t_3 - 0f) / 0.14706646f));
        } else {
            if (t_3 <= 0.85000384f) {
                alpha_1 = mix(1f, 1f, ((t_3 - 0.14706646f) / 0.70293736f));
            } else {
                if (t_3 <= 1f) {
                    alpha_1 = mix(1f, 0f, ((t_3 - 0.85000384f) / 0.14999619f));
                }
            }
        }
    }
    let _e57 = rgb_2;
    let _e58 = alpha_1;
    return vec4<f32>(_e57, _e58);
}

fn dm_appearance(seed: u32, id: u32, t_4: f32, particle: ptr<function, Particle>) {
    let _e4 = curve_0_(t_4);
    (*particle).size_rotation.x = max(0f, (3f * (_e4 * 1.2175764f)));
    let _e13 = curve_1_(t_4);
    (*particle).size_rotation.y = max(0f, (4f * (_e13 * 1f)));
    let _e22 = curve_2_(t_4);
    (*particle).size_rotation.w = max(0f, (1f * (_e22 * 1f)));
    let _e35 = gradient_3_(t_4);
    (*particle).color = (vec4<f32>(0.2f, 0f, 0f, 0.6666667f) * _e35);
    (*particle).velocity.w = 0f;
    return;
}

fn dm_hash(value: u32) -> u32 {
    var v_1: u32;

    v_1 = value;
    let _e2 = v_1;
    let _e3 = v_1;
    v_1 = ((_e2 ^ (_e3 >> 16u)) * 2246822519u);
    let _e9 = v_1;
    let _e10 = v_1;
    v_1 = ((_e9 ^ (_e10 >> 13u)) * 3266489917u);
    let _e16 = v_1;
    let _e17 = v_1;
    return (_e16 ^ (_e17 >> 16u));
}

fn dm_random(seed_1: u32, id_1: u32, key: u32) -> f32 {
    let _e13 = dm_hash(((seed_1 ^ ((id_1 + 1u) * 747796405u)) ^ ((key + 1u) * 2891336453u)));
    return (f32(_e13) / 4294967300f);
}

fn dm_streams(uv: vec2<f32>, p_1: Particle, seed_2: u32) -> DmStreams {
    var o_1: DmStreams;

    let id_3 = p_1.id;
    let t_5 = clamp((p_1.age / p_1.lifetime), 0f, 1f);
    let custom1_ = vec4<f32>(2f, 0f, 0f, 0f);
    let custom2_ = vec4(0f);
    o_1.uv0_ = vec4<f32>(uv.x, uv.y, custom1_.x, custom1_.y);
    o_1.uv1_ = vec4<f32>(custom1_.z, custom1_.w, 0f, 0f);
    o_1.uv2_ = vec4<f32>(0f, 0f, 0f, 0f);
    o_1.uv3_ = vec4<f32>(0f, 0f, 0f, 0f);
    o_1.rotationXY = vec2<f32>(0f, 0f);
    let _e45 = o_1;
    return _e45;
}

fn dm_rotate(v_2: vec3<f32>, deg: vec3<f32>) -> vec3<f32> {
    let a = (deg * 0.017453292f);
    let c = cos(a);
    let s = sin(a);
    let z_3 = vec3<f32>(((c.z * v_2.x) - (s.z * v_2.y)), ((s.z * v_2.x) + (c.z * v_2.y)), v_2.z);
    let x_2 = vec3<f32>(z_3.x, ((c.x * z_3.y) - (s.x * z_3.z)), ((s.x * z_3.y) + (c.x * z_3.z)));
    return vec3<f32>(((c.y * x_2.x) + (s.y * x_2.z)), x_2.y, ((-(s.y) * x_2.x) + (c.y * x_2.z)));
}

fn source_vertex(input_2: MaterialInput) -> vec3<f32> {
    let n1_ = input_2.objectPosition;
    let n2_ = input_2.custom1_;
    let n3_ = n2_.z;
    let n4_ = input_2.uv0_;
    let n5_ = vec4<f32>(1f, 0f, 0f, 0f);
    let n6_ = input_2.time;
    let n7_ = (n5_ * vec4(n6_));
    let n8_ = ((n4_.xy * vec2<f32>(1f, 1f)) + n7_.xy);
    let n11_ = textureSampleLevel(texAX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, texA_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, vec2<f32>(((n8_ * vec2<f32>(0.4f, 1f)) + vec2<f32>(0f, 0f)).x, (1f - ((n8_ * vec2<f32>(0.4f, 1f)) + vec2<f32>(0f, 0f)).y)), 0f);
    let n12_ = vec4<f32>(1f, 0f, 0f, 0f);
    let n13_ = (n11_ * n12_);
    let n14_ = clamp(n13_, vec4(0f), vec4(1f));
    let n15_ = n14_.x;
    let n16_ = n14_.y;
    let n17_ = (n15_ + n16_);
    let n18_ = n14_.z;
    let n19_ = n14_.w;
    let n20_ = (n18_ + n19_);
    let n21_ = (n17_ + n20_);
    let n22_ = clamp(n21_, 0f, 1f);
    let n23_ = vec4(n22_);
    let n24_ = n23_.x;
    let n25_ = n23_.y;
    let n26_ = n23_.z;
    let n27_ = vec3<f32>(n24_, n25_, n26_);
    let n28_ = (vec3(n3_) * n27_);
    let n29_ = input_2.objectNormal;
    let n30_ = (n28_ * n29_);
    let n34_ = (n1_ + n30_);
    return n34_;
}

fn source_material(input_3: MaterialInput) -> vec4<f32> {
    let n1_1 = vec4<f32>(0f, 0f, 0f, 0f);
    let n2_1 = input_3.uv0_;
    let n3_1 = vec4<f32>(1f, 0f, 0f, 0f);
    let n4_1 = input_3.time;
    let n5_1 = (n3_1 * vec4(n4_1));
    let n6_1 = ((n2_1.xy * vec2<f32>(1f, 1f)) + n5_1.xy);
    let n103_ = textureSample(texAX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, texA_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, vec2<f32>(((n6_1 * vec2<f32>(0.4f, 1f)) + vec2<f32>(0f, 0f)).x, (1f - ((n6_1 * vec2<f32>(0.4f, 1f)) + vec2<f32>(0f, 0f)).y)));
    let n8_1 = (n1_1 * n103_);
    let n10_ = (1f - 0f);
    let n11_1 = mix(vec3(dot(n8_1.xyz, vec3<f32>(0.2126729f, 0.7151522f, 0.072175f))), n8_1.xyz, n10_);
    let n13_1 = n1_1.x;
    let n14_1 = n1_1.y;
    let n15_1 = (n13_1 + n14_1);
    let n16_1 = n1_1.z;
    let n17_1 = n1_1.w;
    let n18_1 = (n16_1 + n17_1);
    let n19_1 = (n15_1 + n18_1);
    let n20_1 = (n19_1 > 0f);
    let n23_1 = select(vec3(1f), n11_1, n20_1);
    let n25_1 = input_3.uv0_;
    let n28_1 = vec4<f32>(0.5f, 0f, 0f, 0f);
    let n29_1 = (n103_ * n28_1);
    let n30_1 = clamp(n29_1, vec4(0f), vec4(1f));
    let n31_ = n30_1.x;
    let n32_ = n30_1.y;
    let n33_ = (n31_ + n32_);
    let n34_1 = n30_1.z;
    let n35_ = n30_1.w;
    let n36_ = (n34_1 + n35_);
    let n37_ = (n33_ + n36_);
    let n38_ = clamp(n37_, 0f, 1f);
    let n39_ = vec4(n38_);
    let n44_ = (n39_ * vec4(0f));
    let n45_ = (n25_1 + n44_);
    let n46_ = vec4<f32>(0f, 0.1f, 0f, 0f);
    let n47_ = input_3.time;
    let n48_ = (n46_ * vec4(n47_));
    let n49_ = ((n45_.xy * vec2<f32>(1f, 1f)) + n48_.xy);
    let n52_ = textureSample(texBX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, texB_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, vec2<f32>(((n49_ * vec2<f32>(1f, 1f)) + vec2<f32>(0f, 0f)).x, (1f - ((n49_ * vec2<f32>(1f, 1f)) + vec2<f32>(0f, 0f)).y)));
    let n54_ = vec4<f32>(1f, 1f, 1f, 0f);
    let n53_ = n52_.x;
    let n55_ = n54_.x;
    let n56_ = (n53_ * n55_);
    let n57_ = n52_.y;
    let n58_ = n54_.y;
    let n59_ = (n57_ * n58_);
    let n60_ = n52_.z;
    let n61_ = n54_.z;
    let n62_ = (n60_ * n61_);
    let n63_ = n52_.w;
    let n64_ = n54_.w;
    let n65_ = (n63_ * n64_);
    let n67_ = vec4<f32>(n56_, n59_, n62_, n65_);
    let n69_ = (1f - 1f);
    let n70_ = mix(vec3(dot(n67_.xyz, vec3<f32>(0.2126729f, 0.7151522f, 0.072175f))), n67_.xyz, n69_);
    let n71_ = (n23_1 * n70_);
    let n72_ = vec4<f32>(0f, 0f, 0f, 0f);
    let n73_ = (n72_ * n103_);
    let n74_ = n73_.x;
    let n75_ = n73_.y;
    let n76_ = n73_.z;
    let n77_ = n73_.w;
    let n78_ = vec4<f32>(n74_, n75_, n76_, n77_);
    let n82_ = mix(vec3(dot(n78_.xyz, vec3<f32>(0.2126729f, 0.7151522f, 0.072175f))), n78_.xyz, 0f);
    let n84_ = (n71_ + n82_);
    let n85_ = input_3.color;
    let n86_ = (vec4<f32>(n84_, 0f) * n85_);
    let n87_ = input_3.uv0_;
    let n88_ = n87_.z;
    let n89_ = (n88_ + 1f);
    let n91_ = (n86_ * vec4(n89_));
    let n92_ = input_3.frontFace;
    let n93_ = select(n91_, n91_, n92_);
    let n94_ = input_3.uv0_;
    let n95_ = n94_.w;
    let n96_ = (n95_ + -1f);
    let n97_ = vec4<f32>(-0.25f, 1f, 0f, 0f);
    let n98_ = (n97_.xy.x + (((n96_ - 0f) * (n97_.xy.y - n97_.xy.x)) / 1f));
    let n99_ = n97_.x;
    let n100_ = (n99_ * -1f);
    let n101_ = (n98_ + n100_);
    let n104_ = vec4<f32>(1f, 0f, 0f, 0f);
    let n105_ = (n103_ * n104_);
    let n106_ = clamp(n105_, vec4(0f), vec4(1f));
    let n107_ = n106_.x;
    let n108_ = n106_.y;
    let n109_ = (n107_ + n108_);
    let n110_ = n106_.z;
    let n111_ = n106_.w;
    let n112_ = (n110_ + n111_);
    let n113_ = (n109_ + n112_);
    let n114_ = clamp(n113_, 0f, 1f);
    let n116_ = vec4(n114_);
    let n117_ = smoothstep(vec4(n98_), vec4(n101_), n116_);
    let n119_ = clamp(n117_, vec4(0f), vec4(1f));
    let n121_ = input_3.sceneEyeDepth;
    let n122_ = input_3.eyeDepth;
    let n123_ = (n121_ - n122_);
    let n125_ = max(0f, 1f);
    let n126_ = (n123_ / n125_);
    let n128_ = clamp(n126_, 0f, 1f);
    let n133_ = textureSample(texBX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, texB_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, vec2<f32>(((n49_ * vec2<f32>(1f, 1f)) + vec2<f32>(0f, 0f)).x, (1f - ((n49_ * vec2<f32>(1f, 1f)) + vec2<f32>(0f, 0f)).y)));
    let n134_ = vec4<f32>(0f, 0f, 1f, 0f);
    let n135_ = (n133_ * n134_);
    let n136_ = n135_.x;
    let n137_ = n135_.y;
    let n138_ = (n136_ + n137_);
    let n139_ = n135_.z;
    let n140_ = n135_.w;
    let n141_ = (n139_ + n140_);
    let n142_ = (n138_ + n141_);
    let n143_ = clamp(n142_, 0f, 1f);
    let n144_ = vec4(n143_);
    let n145_ = (vec4(1f) * n144_);
    let n147_ = (vec4(n128_) * n145_);
    let n148_ = (n119_ * n147_);
    let n149_ = input_3.color;
    let n150_ = n149_.w;
    let n153_ = (n148_ * vec4(n150_));
    return vec4<f32>(n93_.xyz, n153_.x);
}

fn dm_safe(v_3: vec3<f32>) -> vec3<f32> {
    return (v_3 / vec3(max(length(v_3), 0.000001f)));
}

fn dm_orbit(r: vec3<f32>, w: vec3<f32>, dt: f32) -> vec3<f32> {
    var local_1: bool;

    let speed = length(w);
    if !((speed < 0.000001f)) {
        local_1 = (dt <= 0f);
    } else {
        local_1 = true;
    }
    let _e11 = local_1;
    if _e11 {
        return vec3(0f);
    }
    let axis = (w / vec3(speed));
    let angle_1 = (speed * dt);
    let c_1 = cos(angle_1);
    let rotated = (((r * c_1) + (cross(axis, r) * sin(angle_1))) + ((axis * dot(axis, r)) * (1f - c_1)));
    return ((rotated - r) / vec3(dt));
}

fn dm_noise(p_2: vec3<f32>) -> f32 {
    var zvals: array<f32, 2>;
    var z: i32 = 0i;
    var yvals: array<f32, 2>;
    var y: i32;
    var xvals: array<f32, 2>;
    var x: i32;

    let i_1 = vec3<i32>(floor(p_2));
    let q = fract(p_2);
    let w_1 = (((q * q) * q) * ((q * ((q * 6f) - vec3(15f))) + vec3(10f)));
    loop {
        let _e18 = z;
        if (_e18 < 2i) {
        } else {
            break;
        }
        {
            yvals = array<f32, 2>();
            y = 0i;
            loop {
                let _e25 = y;
                if (_e25 < 2i) {
                } else {
                    break;
                }
                {
                    xvals = array<f32, 2>();
                    x = 0i;
                    loop {
                        let _e32 = x;
                        if (_e32 < 2i) {
                        } else {
                            break;
                        }
                        {
                            let _e35 = x;
                            let _e36 = y;
                            let _e37 = z;
                            let n = (i_1 + vec3<i32>(_e35, _e36, _e37));
                            let _e54 = dm_hash((((bitcast<u32>(n.x) * 1597334677u) ^ (bitcast<u32>(n.y) * 3812015801u)) ^ (bitcast<u32>(n.z) * 2798796415u)));
                            let g = normalize(((vec3<f32>(f32((_e54 & 255u)), f32(((_e54 >> 8u) & 255u)), f32(((_e54 >> 16u) & 255u))) / vec3(127.5f)) - vec3(1f)));
                            let _e76 = x;
                            let _e78 = x;
                            let _e80 = y;
                            let _e82 = z;
                            xvals[_e76] = dot(g, (q - vec3<f32>(f32(_e78), f32(_e80), f32(_e82))));
                        }
                        continuing {
                            let _e88 = x;
                            x = (_e88 + 1i);
                        }
                    }
                    let _e90 = y;
                    let _e93 = xvals[0];
                    let _e95 = xvals[1];
                    yvals[_e90] = mix(_e93, _e95, w_1.x);
                }
                continuing {
                    let _e99 = y;
                    y = (_e99 + 1i);
                }
            }
            let _e102 = z;
            let _e105 = yvals[0];
            let _e107 = yvals[1];
            zvals[_e102] = mix(_e105, _e107, w_1.y);
        }
        continuing {
            let _e111 = z;
            z = (_e111 + 1i);
        }
    }
    let _e114 = zvals[0];
    let _e116 = zvals[1];
    return (mix(_e114, _e116, w_1.z) * 1.7f);
}

fn stream_dm_hash(value_1: u32) -> u32 {
    var v_4: u32;

    v_4 = value_1;
    let _e2 = v_4;
    let _e3 = v_4;
    v_4 = ((_e2 ^ (_e3 >> 16u)) * 2246822519u);
    let _e9 = v_4;
    let _e10 = v_4;
    v_4 = ((_e9 ^ (_e10 >> 13u)) * 3266489917u);
    let _e16 = v_4;
    let _e17 = v_4;
    return (_e16 ^ (_e17 >> 16u));
}

fn stream_dm_random(seed_3: u32, id_2: u32, key_1: u32) -> f32 {
    let _e13 = stream_dm_hash(((seed_3 ^ ((id_2 + 1u) * 747796405u)) ^ ((key_1 + 1u) * 2891336453u)));
    return (f32(_e13) / 4294967300f);
}

fn stream_dm_rotate(v_5: vec3<f32>, deg_1: vec3<f32>) -> vec3<f32> {
    let a_1 = (deg_1 * 0.017453292f);
    let c_2 = cos(a_1);
    let s_1 = sin(a_1);
    let z_4 = vec3<f32>(((c_2.z * v_5.x) - (s_1.z * v_5.y)), ((s_1.z * v_5.x) + (c_2.z * v_5.y)), v_5.z);
    let x_3 = vec3<f32>(z_4.x, ((c_2.x * z_4.y) - (s_1.x * z_4.z)), ((s_1.x * z_4.y) + (c_2.x * z_4.z)));
    return vec3<f32>(((c_2.y * x_3.x) + (s_1.y * x_3.z)), x_3.y, ((-(s_1.y) * x_3.x) + (c_2.y * x_3.z)));
}

fn stream_dm_noise(p_3: vec3<f32>) -> f32 {
    var zvals_1: array<f32, 2>;
    var z_1: i32 = 0i;
    var yvals_1: array<f32, 2>;
    var y_1: i32;
    var xvals_1: array<f32, 2>;
    var x_1: i32;

    let i_2 = vec3<i32>(floor(p_3));
    let q_1 = fract(p_3);
    let w_2 = (((q_1 * q_1) * q_1) * ((q_1 * ((q_1 * 6f) - vec3(15f))) + vec3(10f)));
    loop {
        let _e18 = z_1;
        if (_e18 < 2i) {
        } else {
            break;
        }
        {
            yvals_1 = array<f32, 2>();
            y_1 = 0i;
            loop {
                let _e25 = y_1;
                if (_e25 < 2i) {
                } else {
                    break;
                }
                {
                    xvals_1 = array<f32, 2>();
                    x_1 = 0i;
                    loop {
                        let _e32 = x_1;
                        if (_e32 < 2i) {
                        } else {
                            break;
                        }
                        {
                            let _e35 = x_1;
                            let _e36 = y_1;
                            let _e37 = z_1;
                            let n_1 = (i_2 + vec3<i32>(_e35, _e36, _e37));
                            let _e54 = stream_dm_hash((((bitcast<u32>(n_1.x) * 1597334677u) ^ (bitcast<u32>(n_1.y) * 3812015801u)) ^ (bitcast<u32>(n_1.z) * 2798796415u)));
                            let g_1 = normalize(((vec3<f32>(f32((_e54 & 255u)), f32(((_e54 >> 8u) & 255u)), f32(((_e54 >> 16u) & 255u))) / vec3(127.5f)) - vec3(1f)));
                            let _e76 = x_1;
                            let _e78 = x_1;
                            let _e80 = y_1;
                            let _e82 = z_1;
                            xvals_1[_e76] = dot(g_1, (q_1 - vec3<f32>(f32(_e78), f32(_e80), f32(_e82))));
                        }
                        continuing {
                            let _e88 = x_1;
                            x_1 = (_e88 + 1i);
                        }
                    }
                    let _e90 = y_1;
                    let _e93 = xvals_1[0];
                    let _e95 = xvals_1[1];
                    yvals_1[_e90] = mix(_e93, _e95, w_2.x);
                }
                continuing {
                    let _e99 = y_1;
                    y_1 = (_e99 + 1i);
                }
            }
            let _e102 = z_1;
            let _e105 = yvals_1[0];
            let _e107 = yvals_1[1];
            zvals_1[_e102] = mix(_e105, _e107, w_2.y);
        }
        continuing {
            let _e111 = z_1;
            z_1 = (_e111 + 1i);
        }
    }
    let _e114 = zvals_1[0];
    let _e116 = zvals_1[1];
    return (mix(_e114, _e116, w_2.z) * 1.7f);
}

@vertex 
fn vs_main(native: NativeInput, @builtin(vertex_index) vertex: u32) -> Varying {
    var p: Particle;
    var hidden: Varying;
    var center: vec3<f32>;
    var size: vec2<f32>;
    var right: vec3<f32> = vec3<f32>(1f, 0f, 0f);
    var up: vec3<f32> = vec3<f32>(0f, 1f, 0f);
    var world: vec3<f32>;
    var input: MaterialInput;
    var o: Varying;

    magic_frame();
    p.id = u32(native.particle_color.x);
    p.age = native.particle_color.y;
    p.lifetime = native.particle_color.z;
    p.size_rotation = native.particle_size;
    p.velocity = native.particle_velocity;
    p.alive = 1u;
    let _e23 = p.age;
    if (_e23 < 0f) {
        hidden.position = vec4<f32>(2f, 2f, 2f, 1f);
        let _e33 = hidden;
        return _e33;
    }
    let _e36 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.seed;
    let _e38 = p.id;
    let _e40 = p.age;
    let _e42 = p.lifetime;
    dm_appearance(_e36, _e38, clamp((_e40 / _e42), 0f, 1f), (&p));
    let origin = vec4<f32>(native.center, 1f);
    let _e57 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.anchor;
    let _e60 = magic_local_axisX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX(((origin.xyz / vec3(origin.w)) - _e57.xyz));
    p.position = vec4<f32>(_e60, 1f);
    let mv = MeshVertex(vec4<f32>(native.position, 1f), vec4<f32>(native.normal, 0f), vec4<f32>(native.uv, native.uv1_), native.vertex_color);
    let corners = array<vec2<f32>, 6>(vec2<f32>(-0.5f, -0.5f), vec2<f32>(0.5f, -0.5f), vec2<f32>(0.5f, 0.5f), vec2<f32>(-0.5f, -0.5f), vec2<f32>(0.5f, 0.5f), vec2<f32>(-0.5f, 0.5f));
    let c_3 = (mv.uv.xy - vec2(0.5f));
    let _e99 = p.position;
    let _e103 = frame.motion;
    let _e108 = frame.settings.x;
    center = (_e99.xyz + (_e103.xyz * _e108));
    let _e113 = p.size_rotation;
    size = _e113.xy;
    let _e118 = frame.vp;
    let _e119 = center;
    let _e121 = p.age;
    let _e122 = magic_placeX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX(_e119, _e121);
    let _e125 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.anchor;
    let clipCenter = (_e118 * vec4<f32>((_e122 + _e125.xyz), 1f));
    let _e140 = frame.vp[1][1];
    let maxWorld = ((100f * max(clipCenter.w, 0.0001f)) / max(abs(_e140), 0.0001f));
    let _e145 = size;
    size = min(_e145, vec2(maxWorld));
    let _e151 = frame.layer.x;
    let columns = u32(_e151);
    let _e156 = frame.layer.y;
    let rows = u32(_e156);
    let _e160 = p.velocity.w;
    let tile = min(u32(max(_e160, 0f)), ((columns * rows) - 1u));
    let cell = vec2<f32>(f32((tile % columns)), f32(((rows - 1u) - (tile / columns))));
    let _e182 = frame.extra.x;
    let _e185 = p.id;
    let _e187 = dm_random(bitcast<u32>(_e182), _e185, 210u);
    let _e197 = frame.extra.x;
    let _e200 = p.id;
    let _e202 = dm_random(bitcast<u32>(_e197), _e200, 211u);
    let uvCorner = vec2<f32>(select(c_3.x, -(c_3.x), (_e187 < 0f)), select(c_3.y, -(c_3.y), (_e202 < 0f)));
    let _e213 = frame.layer;
    let _e216 = p;
    let _e220 = frame.extra.x;
    let _e222 = dm_streams((((uvCorner + vec2(0.5f)) + cell) / _e213.xy), _e216, bitcast<u32>(_e220));
    let _e223 = size;
    let _e226 = p.size_rotation.w;
    let meshSize = vec3<f32>(_e223, min(_e226, maxWorld));
    let _e233 = p.size_rotation.z;
    let angles = (vec3<f32>(-(_e222.rotationXY), -(_e233)) * 57.29578f);
    let _e241 = dm_rotate((mv.position.xyz * meshSize), angles);
    let forward = vec3<f32>(0f, 0f, 1f);
    let _e253 = dm_rotate((mv.normal.xyz / max(abs(meshSize), vec3(0.00001f))), angles);
    let _e256 = right;
    let _e259 = up;
    let normal = normalize((((_e256 * _e253.x) + (_e259 * _e253.y)) + (forward * _e253.z)));
    let _e267 = center;
    let _e268 = right;
    let _e271 = up;
    let _e281 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.settings.w;
    world = (_e267 + ((((_e268 * _e241.x) + (_e271 * _e241.y)) + (forward * _e241.z)) * _e281));
    let _e285 = right;
    let _e286 = right;
    let tangent = normalize((_e285 - (normal * dot(_e286, normal))));
    let _e293 = frame.eye;
    let _e297 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.anchor;
    let _e300 = magic_local_axisX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX((_e293.xyz - _e297.xyz));
    let _e301 = world;
    let viewDir = (_e300 - _e301);
    let _e303 = right;
    let _e305 = up;
    let objectView = vec3<f32>(dot(viewDir, _e303), dot(viewDir, _e305), dot(viewDir, forward));
    input.uv0_ = _e222.uv0_;
    input.custom1_ = _e222.uv1_;
    input.custom2_ = _e222.uv2_;
    input.custom3_ = _e222.uv3_;
    let _e320 = p.color;
    let _e326 = p.color;
    let _e341 = p.color;
    let _e349 = p.color.w;
    input.color = (vec4<f32>(select((_e320.xyz / vec3(12.92f)), pow(max(((_e326.xyz + vec3(0.055f)) / vec3(1.055f)), vec3(0f)), vec3(2.4f)), (_e341.xyz > vec3(0.04045f))), _e349) * mv.color);
    input.normal = normal;
    let _e355 = world;
    input.worldPosition = _e355;
    input.viewDirection = viewDir;
    input.objectPosition = _e241;
    input.objectNormal = _e253;
    input.objectViewDirection = objectView;
    input.tangent = tangent;
    input.bitangent = cross(normal, tangent);
    let _e367 = frame.settings.x;
    input.time = _e367;
    input.delta = 0.008333334f;
    let _e370 = world;
    let _e372 = input.objectPosition;
    let _e373 = input;
    let _e374 = source_vertex(_e373);
    let _e375 = right;
    let _e376 = up;
    let _e381 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.settings.w;
    let _e382 = magic_apply_object_vertexX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX(_e370, _e372, _e374, mat3x3<f32>(_e375, _e376, forward), _e381);
    let _e384 = p.age;
    let _e385 = magic_placeX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX(_e382, _e384);
    let _e388 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.anchor;
    world = (_e385 + _e388.xyz);
    let _e395 = frame.vp;
    let _e396 = world;
    o.position = (_e395 * vec4<f32>(_e396, 1f));
    o.uv = _e222.uv0_;
    o.custom = _e222.uv1_;
    o.custom2_ = _e222.uv2_;
    o.custom3_ = _e222.uv3_;
    let _e410 = p.color;
    let _e416 = p.color;
    let _e431 = p.color;
    let _e439 = p.color.w;
    o.color = (vec4<f32>(select((_e410.xyz / vec3(12.92f)), pow(max(((_e416.xyz + vec3(0.055f)) / vec3(1.055f)), vec3(0f)), vec3(2.4f)), (_e431.xyz > vec3(0.04045f))), _e439) * mv.color);
    let _e444 = world;
    o.world = _e444;
    let _e448 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisX;
    let _e452 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisY;
    let _e456 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisZ;
    o.normal = normalize((mat3x3<f32>(_e448.xyz, _e452.xyz, _e456.xyz) * normal));
    let _e464 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisX;
    let _e468 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisY;
    let _e472 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisZ;
    o.tangent = normalize((mat3x3<f32>(_e464.xyz, _e468.xyz, _e472.xyz) * tangent));
    o.object = _e241;
    o.objectNormal = _e253;
    let _e479 = o;
    return _e479;
}

@fragment 
fn fs_main(i: Varying, @builtin(front_facing) front: bool) -> @location(0) vec4<f32> {
    var input_1: MaterialInput;
    var alpha: f32;
    var rgb: vec3<f32>;

    magic_frame();
    input_1.uv0_ = i.uv;
    input_1.custom1_ = i.custom;
    input_1.custom2_ = i.custom2_;
    input_1.custom3_ = i.custom3_;
    input_1.color = i.color;
    input_1.normal = i.normal;
    input_1.worldPosition = i.world;
    let _e19 = frame.eye;
    input_1.viewDirection = (_e19.xyz - i.world);
    input_1.objectPosition = i.object;
    input_1.objectNormal = i.objectNormal;
    let _e29 = input_1.viewDirection;
    let _e33 = input_1.viewDirection;
    let _e39 = input_1.viewDirection;
    input_1.objectViewDirection = vec3<f32>(dot(_e29, i.tangent), dot(_e33, cross(i.normal, i.tangent)), dot(_e39, i.normal));
    input_1.tangent = i.tangent;
    input_1.bitangent = cross(i.normal, i.tangent);
    let _e53 = textureDimensions(scene_depth);
    input_1.screenUV = (i.position.xy / vec2<f32>(_e53));
    let _e60 = frame.settings.x;
    input_1.time = _e60;
    input_1.delta = 0.008333334f;
    let _e67 = frame.eye;
    let _e72 = frame.forward;
    input_1.eyeDepth = dot((i.world - _e67.xyz), _e72.xyz);
    let _e78 = nature_scene_eye_depth(i.position.xy);
    input_1.sceneEyeDepth = _e78;
    input_1.frontFace = front;
    let _e81 = input_1;
    let _e82 = source_material(_e81);
    alpha = clamp(_e82.w, 0f, 1f);
    rgb = max(_e82.xyz, vec3(0f));
    let _e94 = rgb.x;
    let _e96 = rgb.y;
    let _e99 = rgb.z;
    let peak_1 = max(max(_e94, _e96), _e99);
    let eclipse = (mix(vec3<f32>(0.32f, 0.045f, 0.82f), vec3<f32>(0.88f, 0.78f, 1f), smoothstep(0.6f, 4f, peak_1)) * peak_1);
    let _e117 = frame.design.z;
    if (_e117 > 0.5f) {
        let _e120 = rgb;
        let _e124 = frame.design.y;
        let _e125 = enchantmentParticleColor(_e120, _e124);
        rgb = _e125;
    } else {
        let _e126 = rgb;
        let _e130 = frame.design.x;
        rgb = mix(_e126, eclipse, _e130);
    }
    let _e132 = alpha;
    let _e136 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.tint.w;
    alpha = (_e132 * _e136);
    let _e138 = rgb;
    let _e141 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.tint;
    let _e144 = alpha;
    let _e146 = alpha;
    return vec4<f32>(((_e138 * _e141.xyz) * _e144), _e146);
}
