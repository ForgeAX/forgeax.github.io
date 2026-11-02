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

@group(1) @binding(0) 
var<uniform> materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: MaterialParametersX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX;
@group(1) @binding(1) 
var pattern_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: sampler;
@group(1) @binding(2) 
var patternX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: texture_2d<f32>;
@group(1) @binding(3) 
var accent_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: sampler;
@group(1) @binding(4) 
var accentX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX: texture_2d<f32>;

@vertex 
fn vs_main(i: AccentInput, @builtin(vertex_index) vertex: u32) -> AccentOutput {
    var o: AccentOutput;

    let corners = array<vec2<f32>, 6>(vec2<f32>(-1f, -1f), vec2<f32>(1f, -1f), vec2<f32>(1f, 1f), vec2<f32>(-1f, -1f), vec2<f32>(1f, 1f), vec2<f32>(-1f, 1f));
    let c = corners[vertex];
    o.position = vec4<f32>(((i.position.xy + (i.right * c.x)) + (i.up * c.y)), i.position.z, 1f);
    o.uv = c;
    o.color = i.color;
    o.shape = i.trailShape;
    let _e43 = o;
    return _e43;
}

@fragment 
fn fs_main(i_1: AccentOutput) -> @location(0) vec4<f32> {
    var mask: f32;
    var core: f32;
    var segment: u32 = 0u;
    var k: u32 = 1u;

    let p = i_1.uv;
    let tile = (((p * 0.5f) + vec2(0.5f)) * 0.5f);
    let duvdx = dpdx(tile);
    let duvdy = dpdy(tile);
    let _e13 = dpdx(p);
    let _e15 = dpdy(p);
    let footprint = max(length(_e13), length(_e15));
    if (i_1.shape.x > 1.5f) {
        let u = ((p.x * 0.5f) + 0.5f);
        let knots = array<f32, 6>(0f, 0.16f, 0.28f, 0.54f, 0.66f, 1f);
        let bends = array<f32, 6>(0f, 0.32f, -0.58f, 0.46f, -0.24f, 0f);
        loop {
            let _e42 = k;
            if (_e42 < 5u) {
            } else {
                break;
            }
            {
                let _e45 = k;
                if (u >= knots[_e45]) {
                    let _e48 = k;
                    segment = _e48;
                }
            }
            continuing {
                let _e51 = k;
                k = (_e51 + 1u);
            }
        }
        let _e53 = segment;
        let _e57 = segment;
        let span = (knots[(_e53 + 1u)] - knots[_e57]);
        let variation = (0.82f + (0.18f * sin((i_1.shape.y * 2.1f))));
        let _e69 = segment;
        let a = (bends[_e69] * variation);
        let _e72 = segment;
        let b = (bends[(_e72 + 1u)] * variation);
        let _e77 = segment;
        let zig = mix(a, b, ((u - knots[_e77]) / span));
        let slope = ((b - a) / (span * 2f));
        let distance_ = (abs((p.y - zig)) * inverseSqrt((1f + (((slope * slope) * i_1.shape.w) * i_1.shape.w))));
        let aa = max((footprint * 0.65f), 0.006f);
        let core_1 = (1f - smoothstep(max(0f, (0.035f - aa)), (0.035f + aa), distance_));
        let halo = (exp(-(pow((distance_ / (0.035f * 3.5f)), 2f))) * 0.28f);
        let forkU = clamp(((u - 0.54f) / 0.23f), 0f, 1f);
        let forkY = mix((0.46f * variation), -0.82f, forkU);
        let forkDistance = (abs((p.y - forkY)) * 0.58f);
        let fork = ((((1f - smoothstep(max(0f, ((0.035f * 0.65f) - aa)), ((0.035f * 0.65f) + aa), forkDistance)) * smoothstep(0.54f, 0.56f, u)) * (1f - smoothstep(0.7f, 0.77f, u))) * 0.55f);
        let taper = (smoothstep(0f, 0.045f, u) * (1f - smoothstep(0.88f, 1f, u)));
        let flow = (0.7f + (0.3f * sin((((u * 20f) - (i_1.shape.z * 6f)) + (i_1.shape.y * 2f)))));
        let alpha = ((((core_1 + fork) + (halo * 0.4f)) * taper) * i_1.color.w);
        return vec4<f32>(((((i_1.color.xyz * ((core_1 + fork) + halo)) * taper) * flow) * i_1.color.w), clamp(alpha, 0f, 0.96f));
    }
    if (i_1.shape.x > 0.5f) {
        let radius = length(p);
        let disc = (1f - smoothstep(0.35f, 0.95f, radius));
        let light = exp(((-(radius) * radius) * 8f));
        let alpha_1 = (disc * i_1.color.w);
        return vec4<f32>(((i_1.color.xyz * (0.65f + (light * 0.65f))) * alpha_1), alpha_1);
    }
    let _e238 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.style.x;
    if (_e238 < 0.5f) {
        let leaf = textureSampleGrad(accentX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, accent_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, tile, duvdx, duvdy);
        let outline = (1f - smoothstep(0.76f, 1f, (abs(p.y) + (abs(p.x) * 0.75f))));
        mask = (leaf.w * outline);
        core = ((exp(-(pow((p.x * 18f), 2f))) * 0.65f) + (leaf.x * 0.22f));
    } else {
        let _e276 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.style.x;
        if (_e276 < 1.5f) {
            let _e281 = textureSampleGrad(patternX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, pattern_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, tile, duvdx, duvdy);
            let electric = _e281.x;
            let crystal = (1f - smoothstep(0.8f, 1f, (abs(p.y) + (abs(p.x) * 1.5f))));
            let kink = ((abs(p.y) * 0.36f) - 0.16f);
            let bolt = (exp(-(pow(((p.x - kink) * 22f), 2f))) * (1f - smoothstep(0.65f, 1f, abs(p.y))));
            mask = (max((crystal * 0.72f), (bolt * 0.95f)) * (0.8f + (electric * 0.2f)));
            core = (((step(p.x, 0f) * crystal) * 0.35f) + (bolt * 0.7f));
        } else {
            let _e338 = textureSampleGrad(patternX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, pattern_samplerX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX, tile, duvdx, duvdy);
            let electric_1 = _e338.x;
            let diamond = (abs(p.x) + abs(p.y));
            let ring = ((1f - smoothstep(0.09f, 0.16f, abs((diamond - 0.62f)))) * step(-0.2f, (p.y + (p.x * 0.6f))));
            let crossbar = ((1f - smoothstep(0.045f, 0.1f, abs((p.y + (p.x * 0.45f))))) * (1f - smoothstep(0.32f, 0.52f, abs(p.x))));
            mask = max(ring, crossbar);
            core = ((ring * 0.55f) + (electric_1 * 0.2f));
        }
    }
    let _e386 = mask;
    let alpha_2 = clamp((_e386 * i_1.color.w), 0f, 0.95f);
    let _e397 = materialX_naga_oil_mod_XMZXXEZ3FMF4F63LBORSXE2LBNQ5DU4DBOJQW2ZLUMVZHGX.highlight;
    let _e398 = core;
    let _e403 = core;
    let rgb = (mix(i_1.color.xyz, _e397, clamp(_e398, 0f, 1f)) * (1f + (_e403 * 0.45f)));
    return vec4<f32>((rgb * alpha_2), alpha_2);
}
