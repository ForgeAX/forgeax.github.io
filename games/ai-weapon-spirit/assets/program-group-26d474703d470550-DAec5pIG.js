import{t as e}from"./program-group-85e042aa0af104cd-XSkNvu-A.js";import{n as t,r as n}from"./program-group-05e25d2443f7787f-YHCAnjCK.js";import{createFullscreenRenderFeature as r}from"./app-B9G2oASD.js";import{mat4 as i}from"./math-Dtdjytof.js";import{AssetGuid as a}from"./guid-B9bWGx5t.js";import{PostProcessParams as o}from"./render-ljZkdv98.js";function s(e,t){if(!e.values)throw Error(`[magic] missing authored material values`);let n=e.values,r=Object.create(null),i=[],a=Object.create(null),o=0,s=0;function c(e){a[e]||(a[e]=!0,i.push(e))}return{vec4(e,t,i,a,o){let l=n[e];if(Array.isArray(l)&&l.length===4&&l[0]===t&&l[1]===i&&l[2]===a&&l[3]===o)return;let u=r[e];!u||u!==l?(u=r[e]=[t,i,a,o],s++):(u[0]=t,u[1]=i,u[2]=a,u[3]=o),n[e]=u,c(e)},scalar(e,t){n[e]!==t&&(n[e]=t,c(e))},flush(){if(i.length){t(i),o++;for(let e=0;e<i.length;e++)a[i[e]]=!1;i.length=0}},get publications(){return o},get allocations(){return s}}}var c={hash:`553dc4d9`,wgsl:`struct Out {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
}

struct SeedEffect {
    centerRadius: vec4<f32>,
    eyeStrength: vec4<f32>,
    clock: vec4<f32>,
}

struct Params {
    inverseViewProjection: mat4x4<f32>,
    effects: array<SeedEffect, 6>,
}

@group(1) @binding(0) 
var sceneColor: texture_2d<f32>;
@group(1) @binding(1) 
var sceneSampler: sampler;
@group(1) @binding(2) 
var<uniform> p: Params;
@group(1) @binding(3) 
var sceneDepth: texture_depth_2d;
@group(1) @binding(4) 
var depthSampler: sampler;

fn worldAt(uv_1: vec2<f32>, depth: f32) -> vec3<f32> {
    let _e3 = p.inverseViewProjection;
    let w = (_e3 * vec4<f32>(((uv_1.x * 2f) - 1f), (1f - (uv_1.y * 2f)), depth, 1f));
    return (w.xyz / vec3(w.w));
}

@vertex 
fn vs_main(@builtin(vertex_index) index: u32) -> Out {
    var o: Out;

    let x = select(-1f, 3f, (index == 1u));
    let y = select(-1f, 3f, (index == 2u));
    o.position = vec4<f32>(x, y, 0f, 1f);
    o.uv = vec2<f32>(((x + 1f) * 0.5f), (1f - ((y + 1f) * 0.5f)));
    let _e28 = o;
    return _e28;
}

@fragment 
fn fs_main(i: Out) -> @location(0) vec4<f32> {
    var local: bool;
    var uv: vec2<f32>;
    var highlight: vec3<f32> = vec3(0f);
    var index_1: u32 = 0u;
    var local_1: bool;
    var local_2: bool;

    let original = textureSampleLevel(sceneColor, sceneSampler, i.uv, 0f);
    let _e14 = p.effects[0].eyeStrength.w;
    if (_e14 <= 0f) {
        let _e22 = p.effects[0].clock.z;
        local = (_e22 <= 0f);
    } else {
        local = false;
    }
    let _e28 = local;
    if _e28 {
        return original;
    }
    let dimensions = textureDimensions(sceneDepth);
    let pixel = clamp(vec2<i32>((i.uv * vec2<f32>(dimensions))), vec2(0i), (vec2<i32>(dimensions) - vec2(1i)));
    let _e45 = textureLoad(sceneDepth, pixel, 0i);
    let _e46 = worldAt(i.uv, _e45);
    let _e51 = p.effects[0].eyeStrength;
    let ray = normalize((_e46 - _e51.xyz));
    uv = i.uv;
    loop {
        let _e58 = index_1;
        if (_e58 < 6u) {
        } else {
            break;
        }
        {
            let _e63 = index_1;
            let effect = p.effects[_e63];
            if (effect.eyeStrength.w <= 0f) {
                local_1 = (effect.clock.z <= 0f);
            } else {
                local_1 = false;
            }
            let _e77 = local_1;
            if _e77 {
                break;
            }
            let toCentre = (_e46.xz - effect.centerRadius.xz);
            let proximity = (1f - smoothstep((effect.centerRadius.w * 0.4f), (effect.centerRadius.w * 2.8f), length(toCentre)));
            let kick = ((sin((effect.clock.x * 96f)) * effect.clock.z) * proximity);
            let _e103 = uv;
            uv = clamp((_e103 + (vec2<f32>((kick * 0.25f), (-(kick) * 0.65f)) / vec2<f32>(dimensions))), vec2(0.001f), vec2(0.999f));
            let offset = (effect.eyeStrength.xyz - effect.centerRadius.xyz);
            let b = dot(offset, ray);
            let d = (((b * b) - dot(offset, offset)) + (effect.centerRadius.w * effect.centerRadius.w));
            if (d <= 0f) {
                continue;
            }
            let distance_ = (-(b) - sqrt(d));
            if !((distance_ <= 0f)) {
                local_2 = (length((_e46 - effect.eyeStrength.xyz)) < distance_);
            } else {
                local_2 = true;
            }
            let _e149 = local_2;
            if _e149 {
                continue;
            }
            let hit = (effect.eyeStrength.xyz + (ray * distance_));
            if (hit.y < effect.clock.y) {
                continue;
            }
            let normal = normalize((hit - effect.centerRadius.xyz));
            let facing = abs(dot(normal, -(ray)));
            let rim = pow((1f - facing), 2f);
            let ripple = sin(((((hit.y * 21f) + (hit.x * 13f)) - (hit.z * 17f)) - (effect.clock.x * 38f)));
            let azimuth = atan2(normal.z, normal.x);
            let tearPattern = clamp((((0.1f + (0.58f * (1f - normal.y))) + (0.13f * sin(((azimuth * 3f) + (normal.y * 4f))))) + (0.07f * sin(((azimuth * 7f) - (normal.y * 3f))))), 0.075f, 0.94f);
            let shell = (1f - smoothstep((tearPattern - 0.055f), (tearPattern + 0.085f), effect.clock.w));
            let shift = (((((vec2<f32>((normal.x + (normal.z * 0.35f)), -(normal.y)) * effect.eyeStrength.w) * (0.25f + (rim * 0.75f))) * (1f + (ripple * 0.35f))) * shell) / vec2<f32>(dimensions));
            let _e252 = uv;
            uv = clamp((_e252 + shift), vec2(0.001f), vec2(0.999f));
            let stroke = smoothstep(0.18f, 0.85f, (0.5f + (0.5f * sin((((normal.x * 8f) + (normal.z * 6f)) - (effect.clock.x * 11f))))));
            let rimTint = mix(vec3<f32>(0.07f, 0.17f, 0.018f), vec3<f32>(0.24f, 0.34f, 0.035f), stroke);
            let tearEdge = ((1f - smoothstep(0.018f, 0.085f, abs((effect.clock.w - tearPattern)))) * smoothstep(0f, 0.12f, effect.clock.w));
            let _e304 = highlight;
            highlight = (_e304 + (((((((rimTint * rim) * (0.15f + (0.85f * stroke))) * effect.eyeStrength.w) / vec3(9f)) * shell) + ((((vec3<f32>(0.12f, 0.19f, 0.015f) * tearEdge) * shell) * effect.eyeStrength.w) / vec3(9f))) + (((vec3<f32>(0.035f, 0.045f, 0.012f) * proximity) * effect.clock.z) / vec3(9f))));
        }
        continuing {
            let _e345 = index_1;
            index_1 = (_e345 + 1u);
        }
    }
    let _e347 = uv;
    let _e351 = textureSampleLevel(sceneColor, sceneSampler, _e347, 0f);
    let _e353 = highlight;
    return vec4<f32>((_e351.xyz + _e353), original.w);
}
`},l=class{data=new Float32Array(88);bytes=new Uint8Array(this.data.buffer);published=new Float32Array(this.data.length);projection=i.create();view=i.create();vp=i.create();inverse=i.create();count=0;strength=0;sync(e,r,a,o,s,c,l=.1,u=100){let d=this.data;d.fill(0),this.count=0,this.strength=0;for(let i of e){let e=t(i),a=n(i);if(e<=0&&a<=0)continue;if(this.count===6)throw Error(`[seed-distortion] visible casts exceed equipment capacity`);let o=i.tier.seedStrike,s=16+this.count++*12;d[s]=i.end[0],d[s+1]=i.end[1]+.15,d[s+2]=i.end[2],d[s+3]=i.tier.radiusMeters*o.distortionRadiusScale*(.35+.65*Math.min(1,i.phaseElapsed/o.sproutSeconds)),d[s+4]=r[0],d[s+5]=r[1],d[s+6]=r[2],d[s+7]=e*o.distortionPixels,d[s+8]=i.phaseElapsed,d[s+9]=i.end[1],d[s+10]=a*o.distortionPixels,d[s+11]=Math.max(0,(i.phaseElapsed-o.sproutSeconds)/o.visual.domeSeconds),this.strength=Math.max(this.strength,e,a)}this.count&&(i.perspectiveReverseZ(this.projection,s,c,l,u),i.lookAt(this.view,r,a,o),i.multiply(this.vp,this.projection,this.view),i.invert(this.inverse,this.vp),d.set(this.inverse));let f=!1;for(let e=0;!f&&e<d.length;e++)f=d[e]!==this.published[e];return f&&this.published.set(d),f}},u=`ai-weapon-spirit::seed-distortion`,d=[0,0,0],f=[0,1,0];async function p(t,n,i){if(!n.assets||!n.renderFeatureHost)throw Error(`[seed-distortion] native host unavailable`);let s=a.parse(i);if(!s.ok)throw s.error;let p=await e(n.assets,s.value,`render-pipeline`);if(!p.ok)throw Error(`[seed-distortion] pipeline asset unavailable`,{cause:p.error});let m=p.value.config;if(p.value.kind!==`render-pipeline`||p.value.pipelineId!==`forgeax::standard`||!Array.isArray(m?.postEffects)||m.postEffects[0]!==u)throw Error(`[seed-distortion] invalid authored pipeline`);let h=new l,g=h.bytes,_=await n.renderFeatureHost.installFeature(r({identity:u,source:c.wgsl,reads:[{key:`sceneColor`},{key:`depth`,sampleType:`depth`}],params:{byteSize:g.byteLength,defaultValue:g}}));if(!_.ok)throw Error(`[seed-distortion] native feature rejected`,{cause:_.error});let v=t.spawn({component:o,data:{shader:u,data:g}});if(!v.ok)throw await _.value.release(),v.error;let y=!1,b=!1,x={shader:u,data:g};return{sync(e,n,r,i,a,s,c=.1,l=100){h.sync(e,n,r,i,a,s,c,l)&&t.set(v.value,o,x).unwrap()},get strength(){return h.strength},get activeCount(){return h.count},reset(){h.sync([],d,d,f,1,1)&&t.set(v.value,o,x).unwrap()},async dispose(){if(y)return;b||=(t.despawn(v.value).unwrap(),!0);let e=await _.value.release();if(!e.ok)throw e.error;y=!0}}}export{s as n,p as t};