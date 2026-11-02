import{a as e,i as t,o as n,r,t as i}from"./program-group-3c2370ec90ca50a6-B_AYR_8m.js";import{t as a}from"./program-group-85e042aa0af104cd-XSkNvu-A.js";import{t as o}from"./program-group-4e3fb768ec19a1e2-B_96X3Qn.js";import{u as s}from"./program-group-f9623ba57ffd079b-nfBOqwIp.js";import{t as c}from"./program-group-c19850601333a5c9-DkAUyEGH.js";import{n as l}from"./program-group-e90a0b4e2d3448c9-C9Z6seyQ.js";import{a as u,i as d,r as f,t as p}from"./program-group-262fbea3949bb9aa-BOrx0jvP.js";import{n as m,t as h}from"./program-group-1770f3efe97d6d81-D2cgVvhk.js";import{t as g}from"./program-group-ae40630cb1d00a2b-Bl2wTPQH.js";import{t as _}from"./program-group-4e0a7a008e893cb9-c4RDBJlu.js";import{createFullscreenRenderFeature as v}from"./app-B9G2oASD.js";import{mat4 as y}from"./math-Dtdjytof.js";import{AssetGuid as b}from"./guid-B9bWGx5t.js";import{Update as ee}from"./ecs-DkrPO0r-.js";import{ANTIALIAS_MSAA as x,CAMERA_PROJECTION_PERSPECTIVE as S,Camera as C,CameraView as w,DirectionalLight as T,DirectionalShadowFilterValue as E,PostProcessParams as D,getActiveCamera as O}from"./render-ljZkdv98.js";import{GlobalTransform as k}from"./scene-CfHnTFbc.js";function A(e){let t=!1,n,r=0,i=[],a=()=>{n!==void 0&&e.hasComponent(n,C)&&e.set(n,C,{exposure:r}).unwrap(),n=void 0},o=()=>{a();for(let t of i)e.hasComponent(t.entity,T)&&e.set(t.entity,T,t.value).unwrap();i.length=0,t=!1};return{sync(s,c){if(!c)t&&o();else{if(!t){for(let t of e.query({read:[T]}).unwrap()){let n=e.get(t.entity,T).unwrap();i.push({entity:t.entity,value:{direction:Array.from(n.direction),color:Array.from(n.color),intensity:n.intensity,shadowFilter:n.shadowFilter,shadowAngularRadius:n.shadowAngularRadius,maxPenumbraTexels:n.maxPenumbraTexels}}),e.set(t.entity,T,{direction:[-.55,-1,-.42],color:[1,.96,.86],intensity:1.35,shadowFilter:E.pcssMedium,shadowAngularRadius:.0093,maxPenumbraTexels:32}).unwrap()}t=!0}n!==s&&(a(),s!==void 0&&(n=s,r=e.get(n,C).unwrap().exposure,e.set(n,C,{exposure:1.08}).unwrap()))}},dispose:o}}function j(e){return{announce(t){e.broadcast(e.apply(t))},save(t){let n=e.apply(t),r=e.persist(n);return e.broadcast(n),r}}}function M(e,t){if(!e)return t;let n=t.replace(/\btexture_depth_2d\b/,`texture_depth_multisampled_2d`);if(n===t)throw Error(`[presentation-settings] depth texture declaration is missing`);let r=/fn sceneDepth\([^}]*\}/;if(!r.test(n))throw Error(`[presentation-settings] sceneDepth helper is missing`);n=n.replace(r,`fn sceneDepth(pixel: vec2<i32>) -> f32 {
    let samples = textureNumSamples(depthTexture);
    var sum = 0.0;
    for (var i = 0u; i < samples; i += 1u) { sum += textureLoad(depthTexture, pixel, i32(i)); }
    return sum / f32(samples);
  }`);let i=/fn outlineDepth\([^}]*\}/;if(!i.test(n))throw Error(`[presentation-settings] outlineDepth helper is missing`);n=n.replace(i,`fn outlineDepth(pixel: vec2<i32>) -> f32 {
    let samples = textureNumSamples(depthTexture);
    var nearest = 0.0;
    for (var i = 0u; i < samples; i += 1u) { nearest = max(nearest, textureLoad(depthTexture, pixel, i32(i))); }
    return nearest;
  }`);let a=/fn outlineSampleCoverage\([^}]*\}/;if(!a.test(n))throw Error(`[presentation-settings] outlineSampleCoverage helper is missing`);return n=n.replace(a,`fn outlineSampleCoverage(pixel: vec2<i32>, foreground: f32) -> f32 {
    let samples = textureNumSamples(depthTexture);
    let threshold = p.depth.z + foreground * p.depth.w;
    var covered = 0.0;
    for (var i = 0u; i < samples; i += 1u) {
      let depth = linearDepth(textureLoad(depthTexture, pixel, i32(i)));
      covered += select(0.0, 1.0, abs(depth - foreground) < threshold);
    }
    return covered / f32(samples);
  }`),n}function te(e){let t,r,i=()=>{t!==void 0&&e.hasComponent(t,w)&&(r===void 0?e.removeComponent(t,w).unwrap():e.set(t,w,{resolutionScale:r}).unwrap()),t=void 0,r=void 0};return{sync(a,o,s){let c=Math.fround(n(o,s));if((t!==a||c===1)&&i(),a===void 0||c===1||!e.hasComponent(a,C))return 1;if(e.get(a,C).unwrap().target)return i(),1;t===void 0&&(r=e.hasComponent(a,w)?e.get(a,w).unwrap().resolutionScale:void 0,r===void 0&&e.addComponent(a,{component:w,data:{resolutionScale:c}}).unwrap(),t=a);let l=Math.fround(Math.min(r??1,c));return e.get(a,w).unwrap().resolutionScale!==l&&e.set(a,w,{resolutionScale:l}).unwrap(),l},dispose:i}}function N(e,t,n=`quality`){let r=i[n];return Math.min(e,t?r.touchShadowSize:r.shadowSize)}function P(){return typeof matchMedia==`function`&&matchMedia(`(pointer: coarse)`).matches}function F(e,t=`quality`){return Math.min(e,i[t].maxShadowDistance)}function ne(e,t=`quality`){return Math.min(e,i[t].maxShadowCascades)}function re(e,t=P()){let n=Array.from(e.query({read:[T]}).unwrap(),e=>({entity:e.entity,mapSize:e.get(T).mapSize,shadowDistance:e.get(T).shadowDistance,cascadeCount:e.get(T).cascadeCount}));return{apply(r){for(let{entity:i,mapSize:a,shadowDistance:o,cascadeCount:s}of n){let n=N(a,t,r),c=F(o,r),l=ne(s,r),u=e.get(i,T).unwrap();(u.mapSize!==n||u.shadowDistance!==c||u.cascadeCount!==l)&&e.set(i,T,{mapSize:n,shadowDistance:c,cascadeCount:l}).unwrap()}},dispose(){for(let{entity:t,mapSize:r,shadowDistance:i,cascadeCount:a}of n)e.set(t,T,{mapSize:r,shadowDistance:i,cascadeCount:a}).unwrap()}}}var ie=`weapon-spirit.title-state`,ae=Object.freeze({surfaceRoughness:.36,diffuseStrength:.8,scatteringStrength:.12,contactDisturbanceStrength:.3}),oe=class{values=new Float32Array(52);bytes=new Uint8Array(this.values.buffer);view=y.create();projection=y.create();viewProjection=y.create();inverse=y.create();relativeWorld=y.create();setStyle(e){this.bytes.set(e)}setOutlineRadius(e){this.values[9]=e}setOutlineStrength(e){this.values[7]=e}setOutlineDepthThreshold(e){this.values[2]=e}update(e,t,n,r,a=ae.surfaceRoughness){let o=this.values;o[0]=e.near,o[1]=e.far,o[11]=m+h,o[48]=-s;let c=i[r];if(o[49]=n&&e.projection===S?c.reflectionStrength:0,o[50]=c.reflectionDistance,o[51]=c.reflectionSteps,!Number.isFinite(a)||a<.08||a>.8)throw Error(`[water-reflection] surfaceRoughness must be inside [0.08, 0.8]`);o[47]=o[49]===0?0:a,o[49]!==0&&(this.relativeWorld.set(t),this.relativeWorld[12]=0,this.relativeWorld[14]=0,y.invert(this.view,this.relativeWorld),y.perspectiveReverseZ(this.projection,e.fov,e.aspect,e.near,e.far),y.multiply(this.viewProjection,this.projection,this.view),y.invert(this.inverse,this.viewProjection),o.set(this.viewProjection,12),o.set(this.inverse,28),o[44]=0,o[45]=t[13],o[46]=0)}},se=`02642f73-b2b1-569f-9231-38bdf7a112cf`,I=`ai-weapon-spirit::shared-readability-depth-edge`,ce=`forgeax::standard`;function L(e){if(e instanceof Error)return e.message;if(e&&typeof e==`object`){let t=e;if(typeof t.hint==`string`)return t.hint;if(typeof t.code==`string`)return t.code}return String(e)}function le(e){if(!e||typeof e!=`object`)throw Error(`[presentation-pipeline] loaded asset is not an object`);let t=e;if(t.kind!==`render-pipeline`)throw Error(`[presentation-pipeline] expected render-pipeline, received ${String(t.kind)}`);if(t.pipelineId!==ce)throw Error(`[presentation-pipeline] expected ${ce}, received ${String(t.pipelineId)}`);let n=t.config?.postEffects;if(!Array.isArray(n)||n.length!==1||n[0]!==`ai-weapon-spirit::shared-readability-depth-edge`)throw Error(`[presentation-pipeline] authored postEffects contract drifted`)}async function R(e){let t=[];if(e.resources.paramsEntity!==void 0){let n=e.world.despawn(e.resources.paramsEntity);n.ok?e.resources.paramsEntity=void 0:t.push(n.error)}if(e.resources.featureLease)try{let n=await e.resources.featureLease.release();n.ok?e.resources.featureLease=void 0:t.push(n.error)}catch(e){t.push(e)}if(t.length>0)throw AggregateError(t,`[presentation-pipeline] failed to dispose ${e.label}`)}async function ue(e){let t=b.parse(se);if(!t.ok)throw t.error;let n=await a(e.assets,t.value,`render-pipeline`);if(!n.ok)throw Error(`[presentation-pipeline] failed to load authored pipeline: ${L(n.error)}`);le(n.value);let r={};try{let t=await e.renderFeatureHost.installFeature(v({identity:I,source:e.shaderSource,reads:[{key:`sceneColor`},{key:`depth`,sampleType:`depth`}],params:{byteSize:e.params.byteLength,defaultValue:e.params}}));if(!t.ok)throw Error(`[presentation-pipeline] feature install failed: ${L(t.error)}`);r.featureLease=t.value;let n=e.world.spawn({component:D,data:{shader:I,data:e.params}});if(!n.ok)throw Error(`[presentation-pipeline] params entity spawn failed: ${L(n.error)}`);r.paramsEntity=n.value}catch(t){try{await R({world:e.world,resources:r,label:`failed acquisition`})}catch(e){throw AggregateError([t,e],`[presentation-pipeline] acquisition rollback failed`)}throw t}let i=r.paramsEntity,o=new Uint8Array(e.params),s=!1;return{paramsEntity:i,get disposed(){return s},setParams(t){if(s)throw Error(`[presentation-pipeline] cannot update a disposed lease`);if(t.byteLength!==o.byteLength)throw Error(`[presentation-pipeline] params byte size differs from the installed shader`);let n=!1;for(let e=0;e<t.byteLength;e++)if(t[e]!==o[e]){n=!0;break}if(!n)return;let r=e.world.set(i,D,{shader:I,data:t});if(!r.ok)throw Error(`[presentation-pipeline] params update failed: ${L(r.error)}`);o.set(t)},async dispose(){s||=(await R({world:e.world,resources:r,label:`presentation pipeline lease`}),!0)}}}var de={hash:`b50b96ff`,wgsl:`struct FullscreenOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
}

struct ReadabilityParams {
    depth: vec4<f32>,
    edge: vec4<f32>,
    caseStyle: vec4<f32>,
    viewProjection: mat4x4<f32>,
    inverseViewProjection: mat4x4<f32>,
    eye: vec4<f32>,
    water: vec4<f32>,
}

@group(1) @binding(0) 
var sceneTexture: texture_2d<f32>;
@group(1) @binding(1) 
var sceneSampler: sampler;
@group(1) @binding(2) 
var<uniform> p: ReadabilityParams;
@group(1) @binding(3) 
var depthTexture: texture_depth_2d;
@group(1) @binding(4) 
var depthSampler: sampler;

fn linearDepth(ndcDepth: f32) -> f32 {
    let nearPlane = p.depth.x;
    let farPlane = p.depth.y;
    return ((nearPlane * farPlane) / max(0.00001f, (nearPlane + (ndcDepth * (farPlane - nearPlane)))));
}

fn sceneDepth(pixel: vec2<i32>) -> f32 {
    let _e3 = textureLoad(depthTexture, pixel, 0i);
    return _e3;
}

fn outlineDepth(pixel_1: vec2<i32>) -> f32 {
    let _e3 = textureLoad(depthTexture, pixel_1, 0i);
    return _e3;
}

fn outlineSampleCoverage(pixel_2: vec2<i32>, foreground: f32) -> f32 {
    return 1f;
}

fn sampleLinearDepth(pixel_3: vec2<i32>, dimensions: vec2<i32>) -> f32 {
    let safePixel = clamp(pixel_3, vec2(0i), (dimensions - vec2(1i)));
    let _e8 = outlineDepth(safePixel);
    let _e9 = linearDepth(_e8);
    return _e9;
}

fn inkResolutionScale(dimensions_1: vec2<i32>) -> f32 {
    return clamp((f32(min(dimensions_1.x, dimensions_1.y)) / 900f), 0.625f, 2f);
}

fn inkHash(cell: vec2<f32>) -> f32 {
    var q: vec3<f32>;

    q = fract((vec3<f32>(cell.x, cell.y, cell.x) * 0.1031f));
    let _e9 = q;
    let _e10 = q;
    let _e11 = q;
    q = (_e9 + vec3(dot(_e10, (_e11.yzx + vec3(33.33f)))));
    let _e20 = q.x;
    let _e22 = q.y;
    let _e25 = q.z;
    return fract(((_e20 + _e22) * _e25));
}

fn inkGrain(point: vec2<f32>) -> f32 {
    let cell_1 = floor(point);
    let fraction = fract(point);
    let weight = ((fraction * fraction) * (vec2(3f) - (2f * fraction)));
    let _e10 = inkHash(cell_1);
    let _e15 = inkHash((cell_1 + vec2<f32>(1f, 0f)));
    let _e22 = inkHash((cell_1 + vec2<f32>(0f, 1f)));
    let _e26 = inkHash((cell_1 + vec2(1f)));
    return mix(mix(_e10, _e15, weight.x), mix(_e22, _e26, weight.x), weight.y);
}

fn surfaceDepthSlope(pixel_4: vec2<i32>, dimensions_2: vec2<i32>, center: f32) -> vec2<f32> {
    var slope: vec2<f32>;

    let reciprocal = (1f / center);
    let _e9 = sampleLinearDepth((pixel_4 - vec2<i32>(1i, 0i)), dimensions_2);
    let _e17 = sampleLinearDepth((pixel_4 - vec2<i32>(0i, 1i)), dimensions_2);
    let backward = vec2<f32>((reciprocal - (1f / _e9)), (reciprocal - (1f / _e17)));
    let _e26 = sampleLinearDepth((pixel_4 + vec2<i32>(1i, 0i)), dimensions_2);
    let _e34 = sampleLinearDepth((pixel_4 + vec2<i32>(0i, 1i)), dimensions_2);
    let forward = vec2<f32>(((1f / _e26) - reciprocal), ((1f / _e34) - reciprocal));
    slope = select(forward, backward, (abs(backward) < abs(forward)));
    let _e44 = slope;
    slope = select(_e44, forward, (pixel_4 == vec2(0i)));
    let _e49 = slope;
    slope = select(_e49, backward, (pixel_4 == (dimensions_2 - vec2(1i))));
    let _e55 = slope;
    return clamp(_e55, vec2((-(reciprocal) * 0.05f)), vec2((reciprocal * 0.05f)));
}

fn outerInk(pixel_5: vec2<i32>, offset: vec2<i32>, dimensions_3: vec2<i32>, center_1: f32, slope_1: vec2<f32>, referenceRadius: f32) -> f32 {
    let samplePixel = clamp((pixel_5 + offset), vec2(0i), (dimensions_3 - vec2(1i)));
    let _e10 = sampleLinearDepth(samplePixel, dimensions_3);
    let _e14 = p.depth.y;
    let predicted = (1f / max((1f / _e14), ((1f / center_1) + dot(slope_1, vec2<f32>((samplePixel - pixel_5))))));
    let gap = max(0f, min((center_1 - _e10), (predicted - _e10)));
    let _e36 = p.depth.z;
    let _e40 = p.depth.w;
    let threshold = (_e36 + (_e10 * _e40));
    let _e46 = p.caseStyle.z;
    let edge_1 = smoothstep(threshold, (threshold * max(1.05f, _e46)), gap);
    if (edge_1 <= 0f) {
        return 0f;
    }
    let distanceFade = smoothstep(24f, 70f, _e10);
    let support = (referenceRadius * mix(1f, 0.48f, distanceFade));
    let width = (support * 0.6f);
    let distance_ = max(0f, (length(vec2<f32>(offset)) - 0.5f));
    let coverage = (1f - smoothstep(max(0f, (width - 0.75f)), (width + 0.75f), distance_));
    let _e80 = outlineSampleCoverage(samplePixel, _e10);
    return (((edge_1 * coverage) * _e80) * mix(1f, 0.3f, distanceFade));
}

fn crossInk(pixel_6: vec2<i32>, step_1: i32, dimensions_4: vec2<i32>, center_2: f32, slope_2: vec2<f32>, referenceRadius_1: f32) -> f32 {
    let _e9 = outerInk(pixel_6, vec2<i32>(-(step_1), 0i), dimensions_4, center_2, slope_2, referenceRadius_1);
    let _e12 = outerInk(pixel_6, vec2<i32>(step_1, 0i), dimensions_4, center_2, slope_2, referenceRadius_1);
    let _e16 = outerInk(pixel_6, vec2<i32>(0i, -(step_1)), dimensions_4, center_2, slope_2, referenceRadius_1);
    let _e19 = outerInk(pixel_6, vec2<i32>(0i, step_1), dimensions_4, center_2, slope_2, referenceRadius_1);
    return max(max(_e9, _e12), max(_e16, _e19));
}

fn worldAt(uv: vec2<f32>, depth: f32) -> vec3<f32> {
    let _e3 = p.inverseViewProjection;
    let world = (_e3 * vec4<f32>(((uv.x * 2f) - 1f), (1f - (uv.y * 2f)), depth, 1f));
    return (world.xyz / vec3(world.w));
}

fn reflectionColour(hitUV: vec2<f32>, hitDepth: f32, dimensions_5: vec2<i32>, roughness: f32) -> vec3<f32> {
    var sum: vec3<f32>;
    var side: i32 = -1i;
    var local_2: bool;
    var local_3: bool;
    var sample: vec3<f32>;

    let _e5 = textureSampleLevel(sceneTexture, sceneSampler, hitUV, 0f);
    let center_3 = _e5.xyz;
    let offset_1 = ((vec2<f32>(1f, 0.35f) / vec2<f32>(dimensions_5)) * mix(0.25f, 2.5f, roughness));
    let _e19 = linearDepth(hitDepth);
    sum = (center_3 * 0.5f);
    loop {
        let _e24 = side;
        if (_e24 <= 1i) {
        } else {
            break;
        }
        {
            let _e27 = side;
            let uv_2 = clamp((hitUV + (offset_1 * f32(_e27))), vec2(0.003f), vec2(0.997f));
            let pixel_7 = clamp(vec2<i32>((uv_2 * vec2<f32>(dimensions_5))), vec2(0i), (dimensions_5 - vec2(1i)));
            let _e45 = sceneDepth(pixel_7);
            if (_e45 > 0.000001f) {
                let _e48 = worldAt(uv_2, _e45);
                let _e53 = p.water.x;
                let _e57 = p.caseStyle.w;
                local_2 = (_e48.y > (_e53 + _e57));
            } else {
                local_2 = false;
            }
            let _e63 = local_2;
            if _e63 {
                let _e64 = linearDepth(_e45);
                local_3 = (abs((_e64 - _e19)) < max(0.25f, (_e19 * 0.03f)));
            } else {
                local_3 = false;
            }
            let sameSurface = local_3;
            sample = center_3;
            if sameSurface {
                let _e80 = textureSampleLevel(sceneTexture, sceneSampler, uv_2, 0f);
                sample = _e80.xyz;
            }
            let _e82 = sum;
            let _e83 = sample;
            sum = (_e82 + (_e83 * 0.25f));
        }
        continuing {
            let _e87 = side;
            side = (_e87 + 2i);
        }
    }
    let _e90 = sum;
    return _e90;
}

fn waterReflection(scene_1: vec3<f32>, uv_1: vec2<f32>, rawDepth: f32, dimensions_6: vec2<i32>, surfaceNormal: vec3<f32>) -> vec3<f32> {
    var local_4: bool;
    var previousDistance: f32 = 0.035f;
    var i: u32 = 0u;
    var local_5: bool;
    var local_6: bool;
    var local_7: bool;
    var low: f32;
    var high: f32;
    var hitUV_1: vec2<f32>;
    var hitDepth_1: f32;
    var hitDistance: f32;
    var refine: u32;
    var local_8: bool;
    var local_9: bool;

    let _e5 = p.water.y;
    if (_e5 <= 0f) {
        return scene_1;
    }
    let _e11 = worldAt(uv_1, rawDepth);
    let _e16 = p.water.x;
    let _e22 = p.caseStyle.w;
    if !((abs((_e11.y - _e16)) > _e22)) {
        let _e28 = p.eye.y;
        local_4 = (_e28 <= _e11.y);
    } else {
        local_4 = true;
    }
    let _e34 = local_4;
    if _e34 {
        return scene_1;
    }
    let _e37 = p.eye;
    let incident = normalize((_e11 - _e37.xyz));
    let normal = (surfaceNormal * select(-1f, 1f, (surfaceNormal.y >= 0f)));
    if (normal.y < 0.75f) {
        return scene_1;
    }
    let direction = reflect(incident, normal);
    let start = (_e11 + vec3<f32>(0f, 0.025f, 0f));
    let _e61 = p.water.w;
    let count = u32(_e61);
    loop {
        let _e64 = i;
        if (_e64 < 40u) {
        } else {
            break;
        }
        {
            let _e67 = i;
            if (_e67 >= count) {
                break;
            }
            let _e69 = i;
            let fraction_1 = (f32((_e69 + 1u)) / f32(count));
            let _e78 = p.water.z;
            let distance_1 = (0.035f + ((_e78 * fraction_1) * fraction_1));
            let point_1 = (start + (direction * distance_1));
            let _e87 = p.viewProjection;
            let clip = (_e87 * vec4<f32>(point_1, 1f));
            if (clip.w <= 0f) {
                break;
            }
            let projected = vec2<f32>((((clip.x / clip.w) * 0.5f) + 0.5f), (0.5f - ((clip.y / clip.w) * 0.5f)));
            if !(any((projected <= vec2(0.003f)))) {
                local_5 = any((projected >= vec2(0.997f)));
            } else {
                local_5 = true;
            }
            let _e121 = local_5;
            if _e121 {
                break;
            }
            let pixel_8 = clamp(vec2<i32>((projected * vec2<f32>(dimensions_6))), vec2(0i), (dimensions_6 - vec2(1i)));
            let _e132 = sceneDepth(pixel_8);
            let sampleUV = ((vec2<f32>(pixel_8) + vec2(0.5f)) / vec2<f32>(dimensions_6));
            let _e139 = worldAt(sampleUV, _e132);
            if (_e132 > 0.000001f) {
                let _e146 = p.water.x;
                let _e150 = p.caseStyle.w;
                local_6 = (_e139.y > (_e146 + _e150));
            } else {
                local_6 = false;
            }
            let _e156 = local_6;
            if _e156 {
                let _e158 = linearDepth(_e132);
                local_7 = (clip.w >= _e158);
            } else {
                local_7 = false;
            }
            let _e163 = local_7;
            if _e163 {
                let _e165 = previousDistance;
                low = _e165;
                high = distance_1;
                hitUV_1 = projected;
                hitDepth_1 = _e132;
                hitDistance = clip.w;
                refine = 0u;
                loop {
                    let _e174 = refine;
                    if (_e174 < 5u) {
                    } else {
                        break;
                    }
                    {
                        let _e177 = low;
                        let _e178 = high;
                        let mid = ((_e177 + _e178) * 0.5f);
                        let _e184 = p.viewProjection;
                        let midClip = (_e184 * vec4<f32>((start + (direction * mid)), 1f));
                        let midUV = vec2<f32>((((midClip.x / midClip.w) * 0.5f) + 0.5f), (0.5f - ((midClip.y / midClip.w) * 0.5f)));
                        let midPixel = clamp(vec2<i32>((midUV * vec2<f32>(dimensions_6))), vec2(0i), (dimensions_6 - vec2(1i)));
                        let _e214 = sceneDepth(midPixel);
                        let _e216 = linearDepth(_e214);
                        if (midClip.w >= _e216) {
                            high = mid;
                            hitUV_1 = midUV;
                            hitDepth_1 = _e214;
                            hitDistance = midClip.w;
                        } else {
                            low = mid;
                        }
                    }
                    continuing {
                        let _e219 = refine;
                        refine = (_e219 + 1u);
                    }
                }
                let _e222 = hitDistance;
                let _e223 = hitDepth_1;
                let _e224 = linearDepth(_e223);
                let separation = (_e222 - _e224);
                let _e226 = hitUV_1;
                let _e227 = hitDepth_1;
                let _e228 = worldAt(_e226, _e227);
                if (separation >= 0f) {
                    local_8 = (separation < 0.35f);
                } else {
                    local_8 = false;
                }
                let _e236 = local_8;
                if _e236 {
                    let _e241 = p.water.x;
                    let _e245 = p.caseStyle.w;
                    local_9 = (_e228.y > (_e241 + _e245));
                } else {
                    local_9 = false;
                }
                let _e251 = local_9;
                if _e251 {
                    let _e253 = hitUV_1.x;
                    let _e255 = hitUV_1.x;
                    let _e260 = hitUV_1.y;
                    let _e262 = hitUV_1.y;
                    let edge_2 = min(min(_e253, (1f - _e255)), min(_e260, (1f - _e262)));
                    let _e273 = p.water.z;
                    let _e279 = p.water.z;
                    let _e280 = high;
                    let confidence = (smoothstep(0.015f, 0.08f, edge_2) * (1f - smoothstep((_e273 * 0.7f), _e279, _e280)));
                    let _e288 = p.eye.w;
                    let roughness_1 = clamp(_e288, 0.08f, 0.8f);
                    let fresnel = (0.48f + (0.52f * pow((1f - clamp(dot(-(incident), normal), 0f, 1f)), 5f)));
                    let _e305 = hitUV_1;
                    let _e306 = hitDepth_1;
                    let _e307 = reflectionColour(_e305, _e306, dimensions_6, roughness_1);
                    let _e316 = p.water.y;
                    return mix(scene_1, ((_e307 * 0.88f) + (scene_1 * 0.12f)), (((_e316 * confidence) * fresnel) * (1f - (0.3f * roughness_1))));
                }
                return scene_1;
            }
            previousDistance = distance_1;
        }
        continuing {
            let _e325 = i;
            i = (_e325 + 1u);
        }
    }
    return scene_1;
}

@vertex 
fn vs_main(@builtin(vertex_index) index: u32) -> FullscreenOutput {
    var x: f32 = -1f;
    var y: f32 = -1f;
    var out: FullscreenOutput;

    if (index == 1u) {
        x = 3f;
    }
    if (index == 2u) {
        y = 3f;
    }
    let _e12 = x;
    let _e13 = y;
    out.position = vec4<f32>(_e12, _e13, 0f, 1f);
    let _e18 = x;
    let _e23 = y;
    out.uv = vec2<f32>(((_e18 + 1f) * 0.5f), (1f - ((_e23 + 1f) * 0.5f)));
    let _e31 = out;
    return _e31;
}

@fragment 
fn fs_main(in: FullscreenOutput) -> @location(0) vec4<f32> {
    var scene: vec3<f32>;
    var local: bool;
    var edge: f32 = 0f;
    var step_: i32 = 1i;
    var local_1: bool;

    let _e6 = textureSample(sceneTexture, sceneSampler, in.uv);
    scene = _e6.xyz;
    let dimensionsU = textureDimensions(depthTexture);
    let dimensions_7 = vec2<i32>(dimensionsU);
    let centerPixel = clamp(vec2<i32>((in.uv * vec2<f32>(dimensionsU))), vec2(0i), (dimensions_7 - vec2(1i)));
    let _e22 = sceneDepth(centerPixel);
    let _e24 = worldAt(in.uv, _e22);
    let _e25 = dpdx(_e24);
    let _e26 = dpdy(_e24);
    let surfaceNormal_1 = normalize(cross(_e25, _e26));
    let _e34 = p.caseStyle.x;
    if (in.uv.x < _e34) {
        let _e36 = scene;
        return vec4<f32>(_e36, 1f);
    }
    if (_e22 > 0.000001f) {
        let _e41 = scene;
        let _e43 = waterReflection(_e41, in.uv, _e22, dimensions_7, surfaceNormal_1);
        scene = _e43;
    }
    let _e47 = p.caseStyle.y;
    if !((_e47 < 0.5f)) {
        let _e54 = p.edge.w;
        local = (_e54 <= 0f);
    } else {
        local = true;
    }
    let _e60 = local;
    if _e60 {
        let _e61 = scene;
        return vec4<f32>(_e61, 1f);
    }
    let _e64 = inkResolutionScale(dimensions_7);
    let _e65 = outlineDepth(centerPixel);
    let _e66 = linearDepth(_e65);
    let _e70 = p.caseStyle.y;
    let referenceRadius_2 = (_e70 * _e64);
    let reach = ((referenceRadius_2 * 0.6f) + 1.25f);
    let radius = i32(floor(reach));
    let diagonalRadius = i32(floor((reach * 0.707107f)));
    let _e82 = surfaceDepthSlope(centerPixel, dimensions_7, _e66);
    loop {
        let _e84 = step_;
        if (_e84 <= 12i) {
        } else {
            break;
        }
        {
            let _e87 = step_;
            if (_e87 > radius) {
                break;
            }
            let _e90 = edge;
            let _e91 = step_;
            let _e92 = crossInk(centerPixel, _e91, dimensions_7, _e66, _e82, referenceRadius_2);
            edge = max(_e90, _e92);
            let diagonal = step_;
            if (diagonal <= diagonalRadius) {
                let _e97 = outerInk(centerPixel, vec2<i32>(diagonal, diagonal), dimensions_7, _e66, _e82, referenceRadius_2);
                let _e100 = outerInk(centerPixel, vec2<i32>(diagonal, -(diagonal)), dimensions_7, _e66, _e82, referenceRadius_2);
                let _e103 = outerInk(centerPixel, vec2<i32>(-(diagonal), diagonal), dimensions_7, _e66, _e82, referenceRadius_2);
                let _e107 = outerInk(centerPixel, vec2<i32>(-(diagonal), -(diagonal)), dimensions_7, _e66, _e82, referenceRadius_2);
                let _e108 = edge;
                edge = max(_e108, max(max(_e97, _e100), max(_e103, _e107)));
            }
            let _e113 = step_;
            if ((_e113 % 2i) == 0i) {
                let _e118 = step_;
                local_1 = ((f32(_e118) * 1.118034f) < reach);
            } else {
                local_1 = false;
            }
            let _e126 = local_1;
            if _e126 {
                let _e127 = step_;
                let half = (_e127 / 2i);
                let _e130 = edge;
                let _e131 = step_;
                let _e133 = outerInk(centerPixel, vec2<i32>(_e131, half), dimensions_7, _e66, _e82, referenceRadius_2);
                edge = max(_e130, _e133);
                let _e135 = edge;
                let _e136 = step_;
                let _e139 = outerInk(centerPixel, vec2<i32>(_e136, -(half)), dimensions_7, _e66, _e82, referenceRadius_2);
                edge = max(_e135, _e139);
                let _e141 = edge;
                let _e142 = step_;
                let _e145 = outerInk(centerPixel, vec2<i32>(-(_e142), half), dimensions_7, _e66, _e82, referenceRadius_2);
                edge = max(_e141, _e145);
                let _e147 = edge;
                let _e148 = step_;
                let _e152 = outerInk(centerPixel, vec2<i32>(-(_e148), -(half)), dimensions_7, _e66, _e82, referenceRadius_2);
                edge = max(_e147, _e152);
                let _e154 = edge;
                let _e155 = step_;
                let _e157 = outerInk(centerPixel, vec2<i32>(half, _e155), dimensions_7, _e66, _e82, referenceRadius_2);
                edge = max(_e154, _e157);
                let _e159 = edge;
                let _e160 = step_;
                let _e163 = outerInk(centerPixel, vec2<i32>(half, -(_e160)), dimensions_7, _e66, _e82, referenceRadius_2);
                edge = max(_e159, _e163);
                let _e165 = edge;
                let _e167 = step_;
                let _e169 = outerInk(centerPixel, vec2<i32>(-(half), _e167), dimensions_7, _e66, _e82, referenceRadius_2);
                edge = max(_e165, _e169);
                let _e171 = edge;
                let _e173 = step_;
                let _e176 = outerInk(centerPixel, vec2<i32>(-(half), -(_e173)), dimensions_7, _e66, _e82, referenceRadius_2);
                edge = max(_e171, _e176);
            }
            let _e178 = edge;
            if (_e178 >= 1f) {
                break;
            }
        }
        continuing {
            let _e181 = step_;
            step_ = (_e181 + 1i);
        }
    }
    let _e184 = edge;
    if (_e184 <= 0f) {
        let _e187 = scene;
        return vec4<f32>(_e187, 1f);
    }
    let paper = (vec2<f32>(centerPixel) / vec2(_e64));
    let _e196 = inkGrain((paper / vec2(18f)));
    let density = mix(0.92f, 1f, _e196);
    let _e200 = edge;
    let _e205 = p.edge.w;
    let coverage_1 = ((_e200 * density) * _e205);
    let _e209 = p.edge;
    let ink = (_e209.xyz * mix(0.88f, 1.06f, _e196));
    let _e215 = scene;
    let outlined = mix(_e215, ink, coverage_1);
    return vec4<f32>(outlined, 1f);
}
`},fe=/Android|iPhone|iPad|iPod|Mobile|HarmonyOS|OpenHarmony/i,pe=/^arm$|mali|imagination|powervr|samsung|xclipse|mediatek|immortalis|hisilicon|maleoon/i,me=/swiftshader|llvmpipe|softpipe|microsoft basic|warp/i,he=/radeon\(tm\) graphics|radeon graphics|vega \d|\b(6[0-9]0|7[0-9]0|8[0-9]0)m\b|apu/i,ge=/alchemist|battlemage|xe-?hpg|\barc\s*(a|b)\d{3}/i,_e=/tegra|orin/i,z=[`performance`,`balanced`,`quality`];function ve(e,t){return z.indexOf(e)<=z.indexOf(t)?e:t}function ye(e){let t=e.adapter??void 0;if(!e.webgpu||!t)return{preset:`performance`,reason:`no-webgpu-adapter`};if(t.isFallbackAdapter)return{preset:`performance`,reason:`fallback-adapter`};let n=(t.vendor??``).toLowerCase(),r=`${t.architecture??``} ${t.device??``} ${t.description??``}`.toLowerCase();if(me.test(`${n} ${r}`))return{preset:`performance`,reason:`software-adapter`};if(fe.test(e.userAgent??``)||e.coarsePointer)return{preset:`performance`,reason:`mobile-device`};if(pe.test(n))return{preset:`performance`,reason:`mobile-gpu:${n}`};let i,a;n.includes(`nvidia`)?[i,a]=_e.test(r)?[`balanced`,`nvidia-integrated`]:[`quality`,`nvidia-discrete`]:n.includes(`amd`)||n===`ati`?[i,a]=he.test(r)?[`balanced`,`amd-integrated`]:[`quality`,`amd-discrete`]:n.includes(`intel`)?[i,a]=ge.test(r)?[`quality`,`intel-discrete`]:[`balanced`,`intel-integrated`]:n.includes(`qualcomm`)?[i,a]=[`balanced`,`qualcomm-laptop`]:n.includes(`apple`)?[i,a]=(e.hardwareConcurrency??0)>=11?[`quality`,`apple-pro`]:[`balanced`,`apple-base`]:[i,a]=[`balanced`,`unknown-vendor:${n||`hidden`}`];let o=e.deviceMemoryGiB,s=e.hardwareConcurrency;if(o!==void 0&&o>0&&o<=2)return{preset:`performance`,reason:`${a}+low-memory`};if(o!==void 0&&o>0&&o<=4||s!==void 0&&s>0&&s<=4){let e=ve(i,`balanced`);if(e!==i)return{preset:e,reason:`${a}+limited-host`}}return{preset:i,reason:a}}async function be(e=typeof navigator>`u`?void 0:navigator,t=typeof matchMedia==`function`&&matchMedia(`(pointer:coarse)`).matches,n=400){let r={coarsePointer:t,userAgent:e?.userAgent,deviceMemoryGiB:e?.deviceMemory,hardwareConcurrency:e?.hardwareConcurrency};if(!e?.gpu)return{...r,webgpu:!1};let i;try{let t=await Promise.race([e.gpu.requestAdapter(),new Promise(e=>{i=setTimeout(()=>e(`timeout`),n)})]);if(t===`timeout`)return{...r,webgpu:!0,adapter:{vendor:`unknown-timeout`}};if(!t)return{...r,webgpu:!0,adapter:null};let a=t.info??{};return{...r,webgpu:!0,adapter:{vendor:a.vendor,architecture:a.architecture,device:a.device,description:a.description,isFallbackAdapter:a.isFallbackAdapter??t.isFallbackAdapter}}}catch{return{...r,webgpu:!0,adapter:{vendor:`unknown-error`}}}finally{i!==void 0&&clearTimeout(i)}}var xe=`ai-weapon-spirit:presentation-settings:v1`,Se=`forgeax:presentation-settings-change`,Ce=1;function we(e){let t=[e.removeKeydown,e.removeMessage,e.disposePanel,e.disposePipeline,e.restoreShadows,e.restoreDataset],n=new Uint8Array(t.length),r=!1;return async()=>{if(r)return;let e=[];for(let r=0;r<t.length;r+=1)if(n[r]!==1)try{await t[r](),n[r]=1}catch(t){t instanceof AggregateError?e.push(...t.errors):e.push(t)}if(e.length>0)throw AggregateError(e,`[presentation-settings] failed to dispose presentation settings`);r=!0}}var B=Object.freeze({outlineEnabled:!0,outlineRadius:2,outlineColor:`#162A2E`,outlineStrength:.75,waterReflectionsEnabled:!0,qualityPreset:`quality`,qualityPresetSource:`auto`,fpsOverlayEnabled:!1}),Te=[{label:`墨青`,color:B.outlineColor},{label:`墨黑`,color:`#101817`},{label:`暖灰`,color:`#4A4034`},{label:`银白`,color:`#D1F0E0`}];function Ee(e,t){return U({...e,qualityPreset:t,qualityPresetSource:`player`})}var De=new Set,V;function H(e,t,n,r){let i=typeof e==`number`?e:Number(e);return Number.isFinite(i)?Math.max(n,Math.min(r,i)):t}function Oe(e){return typeof e==`string`&&/^#[0-9a-f]{6}$/i.test(e)?e.toUpperCase():B.outlineColor}function U(e){let t=e&&typeof e==`object`?e:{},n=t.qualityPreset;return Object.freeze({outlineEnabled:typeof t.outlineEnabled==`boolean`?t.outlineEnabled:B.outlineEnabled,outlineRadius:Math.round(H(t.outlineRadius,B.outlineRadius,0,6)),outlineColor:Oe(t.outlineColor),waterReflectionsEnabled:typeof t.waterReflectionsEnabled==`boolean`?t.waterReflectionsEnabled:B.waterReflectionsEnabled,outlineStrength:H(t.outlineStrength,B.outlineStrength,0,1),qualityPreset:r(n)?n:B.qualityPreset,qualityPresetSource:t.qualityPresetSource===`player`?`player`:`auto`,fpsOverlayEnabled:typeof t.fpsOverlayEnabled==`boolean`?t.fpsOverlayEnabled:B.fpsOverlayEnabled})}var W,G;function K(){return typeof matchMedia==`function`&&matchMedia(`(pointer:coarse)`).matches}function q(){if(V)return V;let e=K();try{V=J(JSON.parse(l().getItem(`ai-weapon-spirit:presentation-settings:v1`)??`null`),e,W?.preset)}catch{V=J(null,e,W?.preset)}return t(V.qualityPreset),V}function ke(){return G??=be().then(ye).then(e=>(W=e,V?.qualityPresetSource===`auto`&&V.qualityPreset!==e.preset&&X.announce({...V,qualityPreset:e.preset}),e)),G}function J(e,t,n){let i=n??(t?`performance`:B.qualityPreset),a={...B,qualityPreset:i};if(!e||typeof e!=`object`)return U(a);let o=e;return U(r(o.qualityPreset)&&o.qualityPresetSource!==`auto`?{...a,...o,qualityPresetSource:`player`}:{...a,...o,qualityPreset:i,qualityPresetSource:`auto`})}var Y=new c,X=j({apply(e){return V=U(e),t(V.qualityPreset),V},broadcast(e){for(let t of De)t(e);typeof window<`u`&&window.dispatchEvent(new CustomEvent(Se,{detail:e}))},persist(e){let t=JSON.stringify(e);return Y.save(()=>l().writePreference(xe,t),`画面设置已生效，但未能保存；本次仅在内存中生效。`)}});function Ae(e){return[Number.parseInt(e.slice(1,3),16)/255,Number.parseInt(e.slice(3,5),16)/255,Number.parseInt(e.slice(5,7),16)/255]}function Z(e){let t=O(e)?.entity,n;for(let r of e.query({read:[C]}).unwrap()){let e=r.get(C),i={entity:r.entity,near:Number(e.near),far:Number(e.far),depthMultisampled:Number(e.antialias)===x};if(n??=i,r.entity===t)return i}return n??{near:.1,far:180,depthMultisampled:!1}}function je(e,t=de.wgsl){return M(e,t)}function Q(e,t,n){let r=Ae(e.outlineColor),i=new Float32Array(52);return i.set([t,n,p,.003],0),i.set([r[0],r[1],r[2],e.outlineStrength],4),i.set([0,e.outlineEnabled?e.outlineRadius:0,2,0],8),new Uint8Array(i.buffer)}function $(t,n){let r=document.documentElement;r.dataset.forgeaxPresentationSettings=`shared-v1`,r.dataset.forgeaxPresentationPanel=n?`open`:`closed`,r.dataset.forgeaxPresentationShortcut=`F8`,r.dataset.forgeaxPresentationOutlineRadius=String(t.outlineRadius),r.dataset.forgeaxPresentationOutlineColor=t.outlineColor.slice(1).toLowerCase(),r.dataset.forgeaxPresentationOutlineStrength=String(Math.round(t.outlineStrength*100)),r.dataset.forgeaxPresentationQuality=t.qualityPreset,r.dataset.forgeaxPresentationQualitySource=t.qualityPresetSource,r.dataset.forgeaxPresentationQualityDetected=W?`${W.preset}:${W.reason}`:`pending`,r.dataset.forgeaxPresentationTargetPixelRatio=String(e(t.qualityPreset,typeof devicePixelRatio==`number`?devicePixelRatio:1)),r.dataset.forgeaxPresentationWaterReflections=t.waterReflectionsEnabled?`screen-space`:`off`,r.dataset.forgeaxPresentationFpsOverlay=t.fpsOverlayEnabled?`toolbar`:`settings`}function Me(e,t,n,r,a=()=>B){let o=document.createElement(`aside`);o.className=`forgeax-presentation-settings`,o.hidden=!0,o.setAttribute(`aria-label`,`画面设置`),o.innerHTML=`
    <style>
      .forgeax-presentation-settings{position:absolute;inset:0;z-index:80;pointer-events:none;color:#edf5ef;font:12px/1.45 Inter,"PingFang SC","Microsoft YaHei",sans-serif}
      .forgeax-presentation-settings[hidden]{display:none}.forgeax-presentation-settings *{box-sizing:border-box}
      .forgeax-presentation-settings__panel{pointer-events:auto;position:absolute;right:16px;top:calc(16px + var(--forgeax-viewport-metrics-inset,0px));width:min(350px,calc(100% - 32px));max-height:calc(100% - 32px - var(--forgeax-viewport-metrics-inset,0px));overflow:auto;padding:14px;border:1px solid rgba(190,225,205,.3);border-radius:10px;background:rgba(8,18,16,.96);box-shadow:0 18px 48px rgba(0,0,0,.42)}
      .forgeax-presentation-settings header{display:flex;align-items:flex-start;justify-content:space-between;gap:12px}.forgeax-presentation-settings h2{margin:0;font-size:15px}.forgeax-presentation-settings header p{margin:3px 0 0;color:#98aaa3;font-size:10px}
      .forgeax-presentation-settings button,.forgeax-presentation-settings select,.forgeax-presentation-settings input{font:inherit}.forgeax-presentation-settings button{border:1px solid rgba(190,225,205,.25);border-radius:5px;background:#1b2925;color:#edf5ef;cursor:pointer}.forgeax-presentation-settings__close{width:30px;height:30px}
      .forgeax-presentation-settings fieldset{display:grid;grid-template-columns:106px minmax(0,1fr) 48px;align-items:center;gap:8px 9px;margin:12px 0 0;padding:11px;border:1px solid rgba(190,225,205,.16);border-radius:8px}.forgeax-presentation-settings legend{padding:0 5px;color:#bde1cd;font-weight:700}.forgeax-presentation-settings output{text-align:right;color:#a9bbb4;font-variant-numeric:tabular-nums}.forgeax-presentation-settings input[type=range]{width:100%;accent-color:#bfe5c8}.forgeax-presentation-settings input[type=color]{width:100%;height:25px;padding:0;border:1px solid #8aa99b;border-radius:4px;background:transparent}.forgeax-presentation-settings select{min-width:0;height:28px;border:1px solid rgba(190,225,205,.25);border-radius:5px;background:#17231f;color:#edf5ef}.forgeax-presentation-settings__check{justify-self:start;width:16px;height:16px;accent-color:#8cd7ad}.forgeax-presentation-settings__foot{display:flex;align-items:center;justify-content:space-between;gap:10px;margin-top:11px;color:#81958d;font-size:10px}.forgeax-presentation-settings__reset{padding:6px 9px}
      .forgeax-presentation-settings__colors{grid-column:1/-1;display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:6px}
      .forgeax-presentation-settings__colors button{display:flex;align-items:center;justify-content:center;gap:7px;min-width:0;min-height:44px;padding:6px;border-radius:var(--ui-corner,2px);color:var(--ui-text,#edf5ef);background:var(--ui-surface,#1b2925);border:1px solid var(--ui-line,#587565);touch-action:manipulation}
      .forgeax-presentation-settings__colors button::before{content:'';flex:none;width:14px;height:14px;border:1px solid #ffffff70;background:var(--outline-swatch)}
      .forgeax-presentation-settings__colors button[aria-pressed=true]{border-color:var(--ui-jade,#8cd7ad);box-shadow:inset 0 -2px var(--ui-jade,#8cd7ad)}
      .forgeax-presentation-settings__colors button:focus-visible,html[data-forgeax-input-device="gamepad"] .forgeax-presentation-settings__colors button:focus{outline:2px solid var(--ui-jade,#8cd7ad);outline-offset:3px}
    </style>
    <section class="forgeax-presentation-settings__panel">
      <header><div><h2>画面 <small>F8</small></h2><p>轮廓随分辨率调整，边缘平滑，保留本体颜色。</p></div><button class="forgeax-presentation-settings__close" type="button" aria-label="关闭">×</button></header>
      <fieldset>
        <legend>轮廓可读性</legend>
        <label for="shared-outline-enabled">启用轮廓</label><input class="forgeax-presentation-settings__check" id="shared-outline-enabled" data-setting="outlineEnabled" type="checkbox"><output></output>
        <label for="shared-outline-radius">基准粗细</label><input id="shared-outline-radius" data-setting="outlineRadius" type="range" min="0" max="6" step="1" title="以此为基准，小分辨率适当收细，高分辨率加粗"><output data-output="outlineRadius"></output>
        <div class="forgeax-presentation-settings__colors" role="group" aria-label="轮廓颜色预设">${Te.map(({label:e,color:t})=>`<button type="button" data-outline-color="${t}" style="--outline-swatch:${t}" title="轮廓颜色：${e}">${e}</button>`).join(``)}</div>
        <label for="shared-outline-color">自定义颜色</label><input id="shared-outline-color" data-setting="outlineColor" type="color"><output data-output="outlineColor"></output>
        <label for="shared-outline-strength">边缘强度</label><input id="shared-outline-strength" data-setting="outlineStrength" type="range" min="0" max="100" step="1"><output data-output="outlineStrength"></output>
      </fieldset>
      <fieldset>
        <legend>画质</legend>
        <label for="shared-quality-preset">画质档位</label><select id="shared-quality-preset" data-setting="qualityPreset">${Object.entries(i).map(([e,t])=>`<option value="${e}">${t.label}</option>`).join(``)}</select><output data-output="qualityPresetSource" title="自动：按设备显卡推荐；手动：保留你的选择"></output>
        <label for="shared-water-reflections">水面倒影</label><input class="forgeax-presentation-settings__check" id="shared-water-reflections" data-setting="waterReflectionsEnabled" type="checkbox"><output></output>
      </fieldset>
      <p>阴影与水面倒影精度即时生效；飞剑等程序化几何精度在下次载入地图或出征时生效。各档均保留完整场景、动态阴影和战斗特效；超高档预留未来引擎光追。</p>
      <div class="forgeax-presentation-settings__foot"><span data-presentation-save role="status">设置即时生效，自动保存。</span><button class="forgeax-presentation-settings__reset" type="button" style="flex:none;white-space:nowrap">恢复默认</button></div>
    </section>
  `;let s=_(e),c=r?.addToolbarAction(s.shortcut);o.querySelector(`fieldset`).before(s.settings),r&&s.settings.insertAdjacentHTML(`beforeend`,`<label for="shared-fps-overlay">显示帧率</label><input class="forgeax-presentation-settings__check" id="shared-fps-overlay" data-setting="fpsOverlayEnabled" type="checkbox" title="在右上按钮下方常驻显示 FPS / 帧间隔 / P95，便于截图调试"><output></output>`);let l=e=>o.querySelector(`[data-setting="${e}"]`),u=e=>o.querySelector(`[data-output="${e}"]`),d=t,f=r?e.querySelector(`:scope > [data-forgeax-viewport-metrics]`):null,p=document.createElement(`section`);p.className=`spirit-menu__diagnostics`,p.innerHTML=`<h3>运行诊断</h3><p data-diagnostics-pinned hidden>帧率已显示在右上按钮下方，并避开关卡提示。</p>`;let m=p.querySelector(`[data-diagnostics-pinned]`),h=`--game-hud-right-top`,g=e.style.getPropertyValue(h),v=e.style.getPropertyPriority(h),y=()=>{let t=s.shortcut.parentElement,n=e.getBoundingClientRect(),r=Math.max(t?.getBoundingClientRect().bottom??0,f?.dataset.placement===`toolbar`?f.getBoundingClientRect().bottom:0);e.style.setProperty(h,`${Math.max(0,r-n.top)}px`)},b=r?new ResizeObserver(y):void 0;b&&(b.observe(e),f&&b.observe(f),s.shortcut.parentElement&&b.observe(s.shortcut.parentElement));let ee=()=>{if(!f)return;let e=d.fpsOverlayEnabled&&!!s.shortcut.parentElement;e&&f.nextElementSibling!==s.shortcut?s.shortcut.before(f):!e&&f.parentElement!==p&&p.append(f),f.dataset.placement=e?`toolbar`:`settings`,m.hidden=!e,y()},x=()=>{o.querySelector(`.forgeax-presentation-settings__reset`).disabled=Y.pending,o.querySelector(`[data-presentation-save]`).textContent=Y.message||`设置即时生效，自动保存。`,r&&(l(`fpsOverlayEnabled`).checked=d.fpsOverlayEnabled),ee(),l(`outlineEnabled`).checked=d.outlineEnabled,l(`waterReflectionsEnabled`).checked=d.waterReflectionsEnabled,l(`outlineRadius`).value=String(d.outlineRadius),l(`outlineColor`).value=d.outlineColor.toLowerCase(),l(`outlineStrength`).value=String(Math.round(d.outlineStrength*100)),l(`qualityPreset`).value=d.qualityPreset,u(`outlineRadius`).value=`${d.outlineRadius}px`,u(`outlineColor`).value=d.outlineColor,u(`outlineStrength`).value=`${Math.round(d.outlineStrength*100)}%`,u(`qualityPresetSource`).value=d.qualityPresetSource===`auto`?`自动`:`手动`;for(let e of o.querySelectorAll(`[data-outline-color]`))e.setAttribute(`aria-pressed`,String(e.dataset.outlineColor===d.outlineColor))},S=e=>{let t=U({...d,...e});if(JSON.stringify(t)===JSON.stringify(d)&&!Y.warning)return;d=t;let r=n(d);x(),r.then(()=>{M||x()})},C=e=>{let t=e.target,n=t.dataset.setting;if(n){if(n===`outlineEnabled`)S({outlineEnabled:t.checked});else if(n===`fpsOverlayEnabled`)S({fpsOverlayEnabled:t.checked});else if(n===`waterReflectionsEnabled`)S({waterReflectionsEnabled:t.checked});else if(n===`outlineRadius`)S({outlineRadius:Number(t.value)});else if(n===`outlineColor`)S({outlineColor:t.value});else if(n===`outlineStrength`)S({outlineStrength:Number(t.value)/100});else if(n===`qualityPreset`){let e=t.value;S(Ee(d,e))}}},w=e=>{o.hidden=!e,$(d,e)},T=()=>{r?r.toggle(`presentation`):w(o.hidden===!0)},E=o.querySelector(`.forgeax-presentation-settings__close`),D=o.querySelector(`.forgeax-presentation-settings__reset`);o.addEventListener(`input`,C),o.addEventListener(`change`,C);let O=e=>{let t=e.target.closest(`[data-outline-color]`)?.dataset.outlineColor;t&&S({outlineColor:t})};o.addEventListener(`click`,O);let k=()=>{r?r.dismiss():w(!1)},A=()=>{Y.pending||S(a())};E.addEventListener(`click`,k),D.addEventListener(`click`,A),x(),$(d,!1),e.appendChild(o),f&&o.querySelector(`.forgeax-presentation-settings__panel`).append(p);let j=r?.register(`presentation`,{element:o,onVisibility:e=>$(d,e)}),M=!1;return{root:o,toggle:T,dispose:()=>{M||=(b?.disconnect(),g?e.style.setProperty(h,g,v):e.style.removeProperty(h),f?.isConnected&&e.append(f),j?.(),o.removeEventListener(`input`,C),o.removeEventListener(`change`,C),o.removeEventListener(`click`,O),E.removeEventListener(`click`,k),D.removeEventListener(`click`,A),c?.(),s.dispose(),o.remove(),!0)}}}async function Ne(e,t,n,r){if(!t)return;if(!(t.renderer??t.app?.renderer))throw Error(`[presentation-settings] ForgeAX Renderer is required`);if(!t.renderFeatureHost)throw Error(`[presentation-settings] ForgeAX RenderFeatureHost is required`);let i=t.assets;if(!i)throw Error(`[presentation-settings] ForgeAX AssetRegistry is required`);if(!t.uiRoot)throw Error(`[presentation-settings] ctx.uiRoot is required`);if(!t.registerCleanup)throw Error(`[presentation-settings] ctx.registerCleanup is required`);q();let a=ke(),s=Z(e),c=Q(q(),s.near,s.far),[l]=await Promise.all([ue({assets:i,renderFeatureHost:t.renderFeatureHost,world:e,shaderSource:je(s.depthMultisampled),params:c}),a]),m=q(),h=new oe;h.setStyle(c);let _=new o(e),v=m,y,b=te(e),x,S,w,T=document.documentElement.dataset,E=[`forgeaxPresentationSettings`,`forgeaxPresentationPanel`,`forgeaxPresentationShortcut`,`forgeaxPresentationOutlineRadius`,`forgeaxPresentationEffectiveOutlineRadius`,`forgeaxPresentationOutlineColor`,`forgeaxPresentationOutlineStrength`,`forgeaxPresentationQuality`,`forgeaxPresentationQualitySource`,`forgeaxPresentationQualityDetected`,`forgeaxPresentationTargetPixelRatio`,`forgeaxPresentationResolutionScale`,`forgeaxPresentationDepthSampling`,`forgeaxPresentationWaterReflections`],D=new Map(E.map(e=>[e,T[e]])),j=()=>{for(let e of E){let t=D.get(e);t===void 0?delete T[e]:T[e]=t}},M=e=>{let t=String(b.sync(e,v.qualityPreset,window.devicePixelRatio));T.forgeaxPresentationResolutionScale!==t&&(T.forgeaxPresentationResolutionScale=t)},N=A(e),P=()=>{let t=e.hasResource(d),r=(v.outlineEnabled?n?.page===`arsenal`?Math.min(v.outlineRadius,Ce):v.outlineRadius:0)*(t?f:1);h.setOutlineRadius(r),h.setOutlineStrength(v.outlineStrength*(t?u:1)),h.setOutlineDepthThreshold(e.hasResource(`weapon-spirit.meadow-outline`)?e.getResource(d):p),l.setParams(h.bytes);let i=String(r);T.forgeaxPresentationEffectiveOutlineRadius!==i&&(T.forgeaxPresentationEffectiveOutlineRadius=i)},F=we({removeKeydown:()=>{S&&window.removeEventListener(`keydown`,S)},removeMessage:()=>{w&&window.removeEventListener(`message`,w)},disposePanel:()=>x?.dispose(),disposePipeline:async()=>{_.dispose(),await l.dispose()},restoreDataset:j,restoreShadows:()=>{N.dispose(),b.dispose(),y?.dispose()}});try{y=re(e),y.apply(m.qualityPreset),M(Z(e).entity),_.addSystem(ee,{name:`ai-weapon-spirit-water-reflection-camera`,after:[`propagateTransforms`],queries:[{read:[C,k]}],fn:(t,[n])=>{let i=O(e)?.entity,a;for(let e of n)if(a===void 0&&(a=e.entity),e.entity===i){a=e.entity;break}if(N.sync(a,e.hasResource(d)),M(a),a===void 0)return;let o=g(e);h.update(e.get(a,C).unwrap(),e.get(a,k).unwrap().world,(r?.waterReflectionsEnabled??v.waterReflectionsEnabled)&&!(e.hasResource(`weapon-spirit.title-state`)&&e.getResource(`weapon-spirit.title-state`).active)&&o!==void 0,v.qualityPreset,typeof o?.values.surfaceRoughness==`number`?o.values.surfaceRoughness:void 0),P(),T.forgeaxPresentationWaterReflections=r?.waterReflectionsEnabled??v.waterReflectionsEnabled?`screen-space`:`off`}}),x=Me(t.uiRoot,m,t=>{let n=Z(e);v=t,y.apply(t.qualityPreset),M(n.entity),h.setStyle(Q(t,n.near,n.far)),P();let r=X.save(t);return $(t,x?.root.hidden===!1),r},n,()=>J(null,K(),W?.preset)),document.documentElement.dataset.forgeaxPresentationDepthSampling=s.depthMultisampled?`multisampled`:`single-sample`,S=e=>{n||e.repeat||(e.code===`F8`?(e.preventDefault(),x?.toggle()):e.code===`Escape`&&x?.root.hidden===!1&&x.toggle())},w=e=>{let t=new URLSearchParams(window.location.search).get(`parentOrigin`)||window.location.origin;e.origin===t&&e.data?.source===`forgeax-presentation-settings`&&e.data.type===`toggle`&&x?.toggle()},window.addEventListener(`keydown`,S),window.addEventListener(`message`,w),X.announce(m),$(m,!1),t.registerCleanup(F)}catch(e){try{await F()}catch(t){throw AggregateError([e,t],`[presentation-settings] installation rollback failed`)}throw e}}export{I as n,ie as r,Ne as t};