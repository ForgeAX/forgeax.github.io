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
    texCCoordinatesTransform: vec4<f32>,
    texCCoordinatesMetadata: vec4<f32>,
    texCCoordinatesRotation: vec4<f32>,
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

const DM_WORLD: mat4x4<f32> = mat4x4<f32>(vec4<f32>(1f, 0f, 0f, 0f), vec4<f32>(0f, 1f, 0f, 0f), vec4<f32>(0f, 0f, 1f, 0f), vec4<f32>(0f, 1f, 0f, 1f));
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
@group(1) @binding(5) 
var texC_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: sampler;
@group(1) @binding(6) 
var texCX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: texture_2d<f32>;
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
        return 1f;
    }
    if (t < 1f) {
        let u = ((t - 0f) / 1f);
        return (((((((((2f * u) * u) * u) - ((3f * u) * u)) + 1f) * 1f) + (((((u * u) * u) - ((2f * u) * u)) + u) * -0.7960235f)) + (((((-2f * u) * u) * u) + ((3f * u) * u)) * 0.58247375f)) + ((((u * u) * u) - (u * u)) * -0.111840986f));
    }
    return 0.58247375f;
}

fn curve_1_(t_1: f32) -> f32 {
    if (t_1 <= 0f) {
        return 1f;
    }
    if (t_1 < 1f) {
        let u_1 = ((t_1 - 0f) / 1f);
        return (((((((((2f * u_1) * u_1) * u_1) - ((3f * u_1) * u_1)) + 1f) * 1f) + (((((u_1 * u_1) * u_1) - ((2f * u_1) * u_1)) + u_1) * 0f)) + (((((-2f * u_1) * u_1) * u_1) + ((3f * u_1) * u_1)) * 1f)) + ((((u_1 * u_1) * u_1) - (u_1 * u_1)) * 0f));
    }
    return 1f;
}

fn curve_2_(t_2: f32) -> f32 {
    if (t_2 <= 0f) {
        return 1f;
    }
    if (t_2 < 1f) {
        let u_2 = ((t_2 - 0f) / 1f);
        return (((((((((2f * u_2) * u_2) * u_2) - ((3f * u_2) * u_2)) + 1f) * 1f) + (((((u_2 * u_2) * u_2) - ((2f * u_2) * u_2)) + u_2) * 0f)) + (((((-2f * u_2) * u_2) * u_2) + ((3f * u_2) * u_2)) * 1f)) + ((((u_2 * u_2) * u_2) - (u_2 * u_2)) * 0f));
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
        if (t_3 <= 0.10000763f) {
            alpha_1 = mix(0f, 1f, ((t_3 - 0f) / 0.10000763f));
        } else {
            if (t_3 <= 0.8f) {
                alpha_1 = mix(1f, 1f, ((t_3 - 0.10000763f) / 0.69999236f));
            } else {
                if (t_3 <= 1f) {
                    alpha_1 = mix(1f, 0f, ((t_3 - 0.8f) / 0.2f));
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
    (*particle).size_rotation.x = max(0f, (1.4f * (_e4 * 1.2175764f)));
    let _e13 = curve_1_(t_4);
    (*particle).size_rotation.y = max(0f, (13f * (_e13 * 1f)));
    let _e22 = curve_2_(t_4);
    (*particle).size_rotation.w = max(0f, (1f * (_e22 * 1f)));
    let _e35 = gradient_3_(t_4);
    (*particle).color = (vec4<f32>(1f, 0f, 0.007843138f, 0.9019608f) * _e35);
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
    let custom1_ = vec4<f32>(4f, 0f, 0f, 0f);
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
    let n46_ = vec4<f32>(0.05f, -0.4f, 0f, 0f);
    let n47_ = input_3.time;
    let n48_ = (n46_ * vec4(n47_));
    let n49_ = ((n45_.xy * vec2<f32>(1f, 1f)) + n48_.xy);
    let n52_ = textureSample(texBX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, texB_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, vec2<f32>(((n49_ * vec2<f32>(2f, 1f)) + vec2<f32>(0f, 0f)).x, (1f - ((n49_ * vec2<f32>(2f, 1f)) + vec2<f32>(0f, 0f)).y)));
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
    let n120_ = input_3.time;
    let n121_ = vec4<f32>(0f, 0f, 0f, 0f);
    let n122_ = (vec4(n120_) * n121_);
    let n123_ = ((input_3.uv0_.xy * vec2<f32>(1f, 1f)) + n122_.xy);
    let n126_ = textureSample(texCX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, texC_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, vec2<f32>(((n123_ * vec2<f32>(1f, 1f)) + vec2<f32>(0f, 0f)).x, (1f - ((n123_ * vec2<f32>(1f, 1f)) + vec2<f32>(0f, 0f)).y)));
    let n127_ = vec4<f32>(0f, 0.5f, 0f, 0f);
    let n128_ = (n126_ * n127_);
    let n129_ = n128_.x;
    let n130_ = n128_.y;
    let n131_ = (n129_ + n130_);
    let n132_ = n128_.z;
    let n133_ = n128_.w;
    let n134_ = (n132_ + n133_);
    let n135_ = (n131_ + n134_);
    let n136_ = clamp(n135_, 0f, 1f);
    let n138_ = vec4(n136_);
    let n141_ = textureSample(texBX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, texB_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, vec2<f32>(((n49_ * vec2<f32>(2f, 1f)) + vec2<f32>(0f, 0f)).x, (1f - ((n49_ * vec2<f32>(2f, 1f)) + vec2<f32>(0f, 0f)).y)));
    let n142_ = vec4<f32>(0f, 0f, 1f, 0f);
    let n143_ = (n141_ * n142_);
    let n144_ = n143_.x;
    let n145_ = n143_.y;
    let n146_ = (n144_ + n145_);
    let n147_ = n143_.z;
    let n148_ = n143_.w;
    let n149_ = (n147_ + n148_);
    let n150_ = (n146_ + n149_);
    let n151_ = clamp(n150_, 0f, 1f);
    let n152_ = vec4(n151_);
    let n154_ = (n138_ * n152_);
    let n155_ = (n119_ * n154_);
    let n156_ = input_3.color;
    let n157_ = n156_.w;
    let n160_ = (n155_ * vec4(n157_));
    return vec4<f32>(n93_.xyz, n160_.x);
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
    var up: vec3<f32> = vec3<f32>(0f, 1f, 0f);
    var right: vec3<f32>;
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
    let _e22 = p.age;
    if (_e22 < 0f) {
        hidden.position = vec4<f32>(2f, 2f, 2f, 1f);
        let _e32 = hidden;
        return _e32;
    }
    let _e35 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.seed;
    let _e37 = p.id;
    let _e39 = p.age;
    let _e41 = p.lifetime;
    dm_appearance(_e35, _e37, clamp((_e39 / _e41), 0f, 1f), (&p));
    let origin = vec4<f32>(native.center, 1f);
    let _e56 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.anchor;
    let _e59 = magic_local_axisX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX(((origin.xyz / vec3(origin.w)) - _e56.xyz));
    p.position = vec4<f32>(_e59, 1f);
    let corners = array<vec2<f32>, 6>(vec2<f32>(-0.5f, -0.5f), vec2<f32>(0.5f, -0.5f), vec2<f32>(0.5f, 0.5f), vec2<f32>(-0.5f, -0.5f), vec2<f32>(0.5f, 0.5f), vec2<f32>(-0.5f, 0.5f));
    let c_3 = corners[(vertex % 6u)];
    let _e86 = p.position;
    let _e90 = frame.motion;
    let _e95 = frame.settings.x;
    center = (_e86.xyz + (_e90.xyz * _e95));
    let _e100 = p.size_rotation;
    size = _e100.xy;
    let _e106 = frame.eye.x;
    let _e108 = center.x;
    let _e113 = frame.eye.z;
    let _e115 = center.z;
    let toCam = vec3<f32>((_e106 - _e108), 0f, (_e113 - _e115));
    let toCamLen = length(toCam);
    let _e125 = up;
    right = select(vec3<f32>(1f, 0f, 0f), cross(_e125, (toCam / vec3(toCamLen))), (toCamLen > 0.00001f));
    let _e133 = right;
    let _e134 = up;
    let _e138 = frame.eye;
    let _e142 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.anchor;
    let _e145 = magic_local_axisX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX((_e138.xyz - _e142.xyz));
    let _e146 = center;
    if (dot(cross(_e133, _e134), (_e145 - _e146)) < 0f) {
        let _e151 = right;
        right = -(_e151);
    }
    let _e155 = frame.vp;
    let _e156 = center;
    let _e158 = p.age;
    let _e159 = magic_placeX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX(_e156, _e158);
    let _e162 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.anchor;
    let clipCenter = (_e155 * vec4<f32>((_e159 + _e162.xyz), 1f));
    let _e177 = frame.vp[1][1];
    let maxWorld = ((100f * max(clipCenter.w, 0.0001f)) / max(abs(_e177), 0.0001f));
    let _e182 = size;
    size = min(_e182, vec2(maxWorld));
    let _e188 = frame.layer.x;
    let columns = u32(_e188);
    let _e193 = frame.layer.y;
    let rows = u32(_e193);
    let _e197 = p.velocity.w;
    let tile = min(u32(max(_e197, 0f)), ((columns * rows) - 1u));
    let cell = vec2<f32>(f32((tile % columns)), f32(((rows - 1u) - (tile / columns))));
    let _e219 = frame.extra.x;
    let _e222 = p.id;
    let _e224 = dm_random(bitcast<u32>(_e219), _e222, 210u);
    let _e234 = frame.extra.x;
    let _e237 = p.id;
    let _e239 = dm_random(bitcast<u32>(_e234), _e237, 211u);
    let uvCorner = vec2<f32>(select(c_3.x, -(c_3.x), (_e224 < 0f)), select(c_3.y, -(c_3.y), (_e239 < 0f)));
    let _e250 = frame.layer;
    let _e253 = p;
    let _e257 = frame.extra.x;
    let _e259 = dm_streams((((uvCorner + vec2(0.5f)) + cell) / _e250.xy), _e253, bitcast<u32>(_e257));
    let _e262 = frame.layer;
    let _e265 = size;
    let plane = vec3<f32>(((c_3 + _e262.zw) * _e265), 0f);
    let _e273 = p.size_rotation.z;
    let _e278 = dm_rotate(plane, (vec3<f32>(-(_e259.rotationXY), -(_e273)) * 57.29578f));
    let _e279 = right;
    let _e280 = up;
    let normal = normalize(cross(_e279, _e280));
    let _e283 = center;
    let _e284 = right;
    let _e287 = up;
    let _e297 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.settings.w;
    world = (_e283 + ((((_e284 * _e278.x) + (_e287 * _e278.y)) + (normal * _e278.z)) * _e297));
    let _e301 = right;
    let _e302 = right;
    let tangent = normalize((_e301 - (normal * dot(_e302, normal))));
    let objectNormal = vec3<f32>(0f, 0f, 1f);
    let _e313 = frame.eye;
    let _e317 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.anchor;
    let _e320 = magic_local_axisX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX((_e313.xyz - _e317.xyz));
    let _e321 = world;
    let viewDir = (_e320 - _e321);
    let _e323 = right;
    let _e325 = up;
    let objectView = vec3<f32>(dot(viewDir, _e323), dot(viewDir, _e325), dot(viewDir, normal));
    input.uv0_ = _e259.uv0_;
    input.custom1_ = _e259.uv1_;
    input.custom2_ = _e259.uv2_;
    input.custom3_ = _e259.uv3_;
    let _e340 = p.color;
    let _e346 = p.color;
    let _e361 = p.color;
    let _e369 = p.color.w;
    input.color = vec4<f32>(select((_e340.xyz / vec3(12.92f)), pow(max(((_e346.xyz + vec3(0.055f)) / vec3(1.055f)), vec3(0f)), vec3(2.4f)), (_e361.xyz > vec3(0.04045f))), _e369);
    input.normal = normal;
    let _e373 = world;
    input.worldPosition = _e373;
    input.viewDirection = viewDir;
    input.objectPosition = _e278;
    input.objectNormal = objectNormal;
    input.objectViewDirection = objectView;
    input.tangent = tangent;
    input.bitangent = cross(normal, tangent);
    let _e385 = frame.settings.x;
    input.time = _e385;
    input.delta = 0.008333334f;
    let _e388 = world;
    let _e390 = input.objectPosition;
    let _e391 = input;
    let _e392 = source_vertex(_e391);
    let _e393 = right;
    let _e394 = up;
    let _e399 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.settings.w;
    let _e400 = magic_apply_object_vertexX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX(_e388, _e390, _e392, mat3x3<f32>(_e393, _e394, normal), _e399);
    let _e402 = p.age;
    let _e403 = magic_placeX_naga_oil_mod_XMFUV653FMFYG63S7ONYGS4TJORPW2YLHNFRTUOTQNRQWGZLNMVXHIX(_e400, _e402);
    let _e406 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.anchor;
    world = (_e403 + _e406.xyz);
    let _e413 = frame.vp;
    let _e414 = world;
    o.position = (_e413 * vec4<f32>(_e414, 1f));
    o.uv = _e259.uv0_;
    o.custom = _e259.uv1_;
    o.custom2_ = _e259.uv2_;
    o.custom3_ = _e259.uv3_;
    let _e428 = p.color;
    let _e434 = p.color;
    let _e449 = p.color;
    let _e457 = p.color.w;
    o.color = vec4<f32>(select((_e428.xyz / vec3(12.92f)), pow(max(((_e434.xyz + vec3(0.055f)) / vec3(1.055f)), vec3(0f)), vec3(2.4f)), (_e449.xyz > vec3(0.04045f))), _e457);
    let _e460 = world;
    o.world = _e460;
    let _e464 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisX;
    let _e468 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisY;
    let _e472 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisZ;
    o.normal = normalize((mat3x3<f32>(_e464.xyz, _e468.xyz, _e472.xyz) * normal));
    let _e480 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisX;
    let _e484 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisY;
    let _e488 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.basisZ;
    o.tangent = normalize((mat3x3<f32>(_e480.xyz, _e484.xyz, _e488.xyz) * tangent));
    o.object = _e278;
    o.objectNormal = objectNormal;
    let _e495 = o;
    return _e495;
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
    rgb = _e82.xyz;
    let _e91 = rgb.x;
    let _e93 = rgb.y;
    let _e96 = rgb.z;
    let peak_1 = max(max(_e91, _e93), _e96);
    let eclipse = (mix(vec3<f32>(0.32f, 0.045f, 0.82f), vec3<f32>(0.88f, 0.78f, 1f), smoothstep(0.6f, 4f, peak_1)) * peak_1);
    let _e114 = frame.design.z;
    if (_e114 > 0.5f) {
        let _e117 = rgb;
        let _e121 = frame.design.y;
        let _e122 = enchantmentParticleColor(_e117, _e121);
        rgb = _e122;
    } else {
        let _e123 = rgb;
        let _e127 = frame.design.x;
        rgb = mix(_e123, eclipse, _e127);
    }
    let _e129 = alpha;
    let _e133 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.tint.w;
    alpha = (_e129 * _e133);
    let _e135 = rgb;
    let _e138 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.tint;
    let _e141 = alpha;
    let _e143 = alpha;
    return vec4<f32>(((_e135 * _e138.xyz) * _e141), _e143);
}
