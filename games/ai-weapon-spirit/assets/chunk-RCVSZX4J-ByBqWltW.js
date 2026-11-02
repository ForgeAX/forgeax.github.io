import{Kn as e,Mn as t,Tt as n,dr as r,in as i,on as a,sn as o,tr as s}from"./dist-D9RV5GJM.js";import{d as c}from"./dist-CJDaW-_c.js";import{o as l}from"./dist-DX-ZK7Di.js";import{D as u,_ as d,t as f,v as p,y as m}from"./dist-CBFsCtPD.js";import{$a as h,Bo as g,Bt as _,Da as v,Fc as y,Hi as b,Ho as x,Jc as S,Lr as C,Na as w,Nn as T,Po as E,Xa as D,Xr as O,Ya as k,Yn as A,_r as j,aa as ee,d as M,ia as te,j as ne,oi as N,s as re,tt as ie,xt as ae,yr as oe}from"./chunk-T4S7JPRG-DmGnbPM8.js";import{$i as se,$t as ce,Ai as le,An as ue,B as de,Bi as fe,Bt as pe,Cn as me,Dr as he,Er as ge,Ft as _e,Gr as ve,Ht as ye,Ir as be,Kr as xe,Lt as Se,Ni as Ce,Nt as we,Oa as Te,Oi as Ee,Pa as De,Sn as Oe,Sr as ke,Tn as Ae,Tr as je,V as Me,Vt as Ne,Xa as Pe,an as Fe,ao as Ie,ar as Le,c as Re,cn as P,dn as ze,do as Be,dr as F,ea as Ve,fn as He,in as Ue,jo as We,jt as Ge,ki as Ke,ln as I,mo as qe,nn as Je,on as Ye,p as Xe,pn as Ze,po as Qe,r as $e,ra as et,rn as tt,sn as nt,so as rt,ta as it,un as L,wn as at,xn as R,z as ot,zo as z,zt as st}from"./chunk-BGGZXJPZ-Xi3PZNJS.js";function B(e){return new l({code:`rhi-not-available`,expected:`${e} compute pipeline to be available`,hint:`construct the renderer through a backend pack with shader module support`})}function ct(e,t,n,r,i){let a=e.runtime?.shaderModuleFactory;if(a===void 0)throw B(`${n} shader module`);let o=a.createShaderModule({code:t,label:n});if(!o.ok)throw o.error;let s=e.runtime.device;return lt(s,o.value,n,r,i)}function lt(e,t,n,r,i){let a=e.createBindGroupLayout({label:`${n}.bind-group-layout`,entries:r});if(!a.ok)throw a.error;let o=e.createPipelineLayout({label:`${n}.pipeline-layout`,bindGroupLayouts:[a.value]});if(!o.ok)throw o.error;let s=e.createComputePipeline({label:n,layout:o.value,compute:{module:t,entryPoint:i}});if(!s.ok)throw s.error;return{label:n,pipeline:s.value,layout:a.value,bindGroups:new WeakMap}}function ut(e,t,n){let r=e.runtime.device;return D(t.bindGroups,n.map(({resource:e})=>e.kind===`buffer`?e.value.buffer:e.value),t.label,()=>r.createBindGroup({layout:t.layout,entries:n}).unwrap(),e.bindGroupCounts)}function V(e,t){let n=e.textureView(t);if(!n.ok)throw n.error;return n.value}function dt(e,t){let n=e.buffer(t);if(!n.ok)throw n.error;return n.value}var ft=`r32float`;function pt(e){return Number.isInteger(e.width)&&Number.isInteger(e.height)&&e.width>0&&e.height>0}function mt(e){if(!pt(e))throw RangeError(`Depth pyramid extent must contain positive integer width and height`)}function ht(e){return mt(e),{width:Math.max(1,Math.floor(e.width/2)),height:Math.max(1,Math.floor(e.height/2))}}function gt(e){mt(e);let t=[],n={width:e.width,height:e.height},r=0;for(;t.push({level:r,...n}),n.width!==1||n.height!==1;)n=ht(n),r+=1;return Object.freeze({extent:Object.freeze({width:e.width,height:e.height}),format:ft,mipLevelCount:t.length,levels:Object.freeze(t.map(e=>Object.freeze(e))),graphSize:Object.freeze({width:e.width,height:e.height})})}var _t=new WeakMap;function vt(){let e;return(t,n,r,i)=>{let a=i===`reduce`||i===`reduce_furthest`?`reduce`:`seed`,o=t.runtime,s=o?.shaderModuleFactory;if(s===void 0)throw B(`depth_pyramid_${a} shader module`);let{device:c}=o,l=o.deviceScope,u;if(l===void 0)e?.device!==c&&(e={device:c,entries:new Map}),u=e;else{if(!l.isAlive())throw B(`depth pyramid live device scope`);let e=_t.get(l);if(e===void 0){e={device:c,entries:new Map},_t.set(l,e);let t=e;l._adopt(`pipeline`,t,()=>{t.entries.clear(),_t.get(l)===t&&_t.delete(l)})}if(e.device!==c)throw B(`depth pyramid current device`);u=e}let d=JSON.stringify(r),f=s.createShaderModule,p=f.call(s,{code:n,label:`depth_pyramid_${a}`});if(!p.ok)throw p.error;if(l!==void 0&&(!l.isAlive()||_t.get(l)!==u))throw B(`depth pyramid live device scope`);let m=u.entries.get(i);if(m!==void 0&&m.source===n&&m.factory===s&&m.createModule===f&&m.module===p.value&&m.layout===d)return m.state;let h=lt(c,p.value,`depth_pyramid_${a}`,r,`depth_pyramid_${i}`);if(l!==void 0&&(!l.isAlive()||_t.get(l)!==u))throw B(`depth pyramid live device scope`);return s.createShaderModule===f&&u.entries.set(i,{source:n,factory:s,createModule:f,module:p.value,layout:d,state:h}),h}}var yt={closest:{graph:`depth-pyramid`,entry:``},furthest:{graph:`occlusion-depth-pyramid`,entry:`_furthest`}},bt=[{binding:0,visibility:4,texture:{sampleType:`depth`,viewDimension:`2d`}},{binding:1,visibility:4,storageTexture:{access:`write-only`,format:ft,viewDimension:`2d`}},{binding:2,visibility:4,buffer:{type:`uniform`}}],xt=3,St=[{binding:xt,visibility:4,texture:{sampleType:`depth`,viewDimension:`2d`,multisampled:!0}},bt[1],bt[2]],Ct=[{binding:0,visibility:4,texture:{sampleType:`unfilterable-float`,viewDimension:`2d`}},{binding:1,visibility:4,storageTexture:{access:`write-only`,format:ft,viewDimension:`2d`}}];function wt(e,t){return e.depthPyramidShaders?.[t]}function Tt(e){return{width:Math.max(1,Math.floor(e.width/2)),height:Math.max(1,Math.floor(e.height/2))}}function Et(e){return gt(Tt(e))}function Dt(e,t,n){let r=Et(t),i=e.createTexture(n,{format:ft,size:r.graphSize,mipLevelCount:r.mipLevelCount});if(!i.ok)return i;let a=[];for(let t of r.levels){let r=e.view(i.value,{label:`${n}.mip-${t.level}.view`,dimension:`2d`,baseMipLevel:t.level,mipLevelCount:1});if(!r.ok)return r;a.push(r.value)}let s=e.view(i.value,{label:`${n}.view`,dimension:`2d`});return s.ok?o({plan:r,texture:i.value,levels:Object.freeze(a),pyramid:s.value}):s}function Ot(e,t){let n=yt[t.reduction??`closest`],r=t.reduction===`furthest`&&t.multisampled===!0,i=`${n.graph}-seed`,a=`${n.graph}-reduce-chain`,s=Dt(e,{width:t.width,height:t.height},n.graph);if(!s.ok)return s;let c=s.value,{depth:l,view:u}=t,d=c.levels[0],f=[],p=vt(),m=e.addComputePass(i,{accesses:[{resource:l,usage:`sampled-read`},{resource:d,usage:`storage-write`},...u===void 0?[]:[{resource:u,usage:`uniform-read`}]],encode:({pass:e,frame:t,resources:i})=>{let a=wt(t,`seed`);if(a===void 0||u===void 0)return;let o=p(t,a,r?St:bt,`seed${n.entry}${r?`_multisampled`:``}`);e.setPipeline(o.pipeline),e.setBindGroup(0,ut(t,o,[{binding:r?xt:0,resource:{kind:`textureView`,value:V(i,l)}},{binding:1,resource:{kind:`textureView`,value:V(i,d)}},{binding:2,resource:{kind:`buffer`,value:{buffer:dt(i,u),size:N}}}])),e.dispatchWorkgroups(Math.ceil(c.plan.extent.width/8),Math.ceil(c.plan.extent.height/8),1)}});if(!m.ok)return m;f.push(i);let h=c.levels;if(h.length>1){let t=e.addComputePass(a,{accesses:h.map((e,t)=>({resource:e,usage:t===0?`sampled-read`:t===h.length-1?`storage-write`:`sampled-storage-write`})),encode:({pass:e,frame:t,resources:r})=>{let i=wt(t,`reduce`);if(i===void 0)return;let a=p(t,i,Ct,`reduce${n.entry}`);e.setPipeline(a.pipeline);for(let n=1;n<h.length;n++){let i=h[n-1],o=h[n],s=c.plan.levels[n];if(i===void 0||o===void 0||s===void 0)throw B(`depth pyramid mip chain`);e.setBindGroup(0,ut(t,a,[{binding:0,resource:{kind:`textureView`,value:V(r,i)}},{binding:1,resource:{kind:`textureView`,value:V(r,o)}}])),e.dispatchWorkgroups(Math.ceil(s.width/8),Math.ceil(s.height/8),1)}}});if(!t.ok)return t;f.push(a)}return o({pyramid:c,passNames:Object.freeze(f)})}var kt=`rgba16float`;function At(e){return{width:Math.max(1,Math.floor(e.width)),height:Math.max(1,Math.floor(e.height))}}function jt(e,t,n,r){let i=e.createTexture(t,{format:n,size:{width:r.width,height:r.height},domain:`linear-hdr`});if(!i.ok)return i;let a=e.view(i.value,{label:`${t}.view`,dimension:`2d`});return a.ok?o({texture:i.value,view:a.value,width:r.width,height:r.height,format:n}):a}function Mt(e,t){let n=At(t),r=jt(e,`ssr-trace`,kt,n);if(!r.ok)return r;let i=e.createTexture(`ssr-hit-reactivity`,{format:`r32float`,size:n});if(!i.ok)return i;let a=e.view(i.value,{label:`ssr-hit-reactivity.view`,dimension:`2d`});return a.ok?o({trace:r.value,hitReactivity:a.value}):a}function Nt(e,t=!1){if(e===void 0)return!1;let n=e.motionBlur;return t||e.antialias===`taa`||n!==void 0&&x({...n,targetFps:n.targetFps??60})}function Pt(e){let t=[...e.taa?[`taa`]:[],...e.motionBlur?[`motion-blur`]:[],...e.ssr?[`ssr`]:[],...e.visibleSurface?[`visible-surface`]:[]],n=t.length>0;return Object.freeze({consumerIds:Object.freeze(t),targetCount:+!!n,producerPassCount:+!!n,historyCount:+!!e.taa})}function Ft(e){return e.demand.targetCount===0?{status:`unavailable`,reason:`no-demand`}:e.capabilities.producerPresent===!1?{status:`unavailable`,reason:`producer-missing`}:!e.capabilities.rgba16floatRenderable||e.capabilities.filterable===!1||e.capabilities.copy===!1||e.capabilities.readback===!1?{status:`unavailable`,reason:`capability-missing`}:{status:`available`,schema:`forgeax::scene-data::temporal-v1`,producerId:`forgeax::standard::scene-data`,structuralOnly:e.lane===`rhi-null`,format:`rgba16float`}}function It(e){let t=e.compute?`clustered`:`cpu-webgl2`,r=Ft({lane:t,demand:e.demand,capabilities:{compute:e.compute,storageBuffer:e.storageBuffer,rgba16floatRenderable:e.rgba16floatRenderable}});return r.status===`available`||r.reason===`no-demand`?o(void 0):n(new oe({featureIdentity:`forgeax::standard`,schema:`forgeax::scene-data::temporal-v1`,lane:t,reason:r.reason,missingContributorIds:[],omittedMissingContributorCount:0,recovery:`enable-capability`}))}var Lt={format:st,size:`surface`,sampleCount:1};function Rt(e,t){let n=F(e,`standard-scene-temporal`,{...Lt,size:t===void 0?Lt.size:se(t,`internal`)});return n.ok?o({temporal:n.value}):n}function zt(e,t,n,r,i=`opaque`){let a=ie,o=i===`forward-only-opaque`?ae:void 0;return L(e,{name:`standard-scene-data`,executeIf:i===`opaque`?void 0:e=>Pe(e,a,`opaque`,o)?.size!==0||r?.hasWork(i,`fs_temporal`)===!0,gpuDrivenFilter:i,...r===void 0?{}:{gpuDriven:r},color:t,depth:n,selector:a,...o===void 0?{}:{excludeSelector:o},recordMode:`opaque`,passKind:`temporal`,clearColor:[0,0,-1,1],colorLoadOp:i===`opaque`?`clear`:`load`,depthLoadOp:`load`})}var Bt=`rgba8unorm`,Vt=`rgba16float`,Ht=`rgba16float`,Ut=4,Wt=1728;function Gt(e,t=64,n=4){let r=Math.max(2,Math.floor(n/2));return{width:Math.max(1,Math.ceil(e.width/r)),height:Math.max(1,Math.ceil(e.height/r)),depth:Math.max(1,t)}}function Kt(e,t=4){return Gt(e,1,t===4?8:Math.max(1,t))}function qt(e,t={}){let n=e.resources.filter(e=>e.label===`volume-froxel`||e.label===`volume-resolved-current`||e.label===`volume-history`||e.label===`volume-temporal`||e.label===`volume-params`),r=e=>n.filter(t=>t.label===e).reduce((e,t)=>e+(t.byteSize??0),0),i=n.filter(e=>e.label===`volume-params`).length,a=Math.max(0,Math.floor(t.parameterBufferCount??i)),o=n.find(e=>e.label===`volume-froxel`)?.extent,s=n.find(e=>e.label===`volume-resolved-current`)?.extent,c=r(`volume-resolved-current`),l=r(`volume-history`)+r(`volume-temporal`),u=r(`volume-froxel`),d=a*Wt,f=new Set;for(let e of n)e.label!==`volume-params`&&f.add(e.physicalAllocationKey??e.label);let p=c+l+u+d;return Object.freeze({generation:e.generation,liveResourceCount:n.length-i+a,currentBytes:c,historyBytes:l,scratchBytes:u,bufferBytes:d,totalBytes:p,physicalResourceCount:f.size+a,sampleCount:o===void 0?0:o.width*o.height*o.depthOrArrayLayers*Ut,resolvedPixelCount:s===void 0?0:s.width*s.height})}function Jt(e,t){return{format:e,size:{width:t.width,height:t.height,depthOrArrayLayers:Math.ceil(t.depth/Ut)},dimension:`2d`}}function Yt(e){return{format:Ht,size:{width:e.width,height:e.height,depthOrArrayLayers:1},dimension:`2d`}}function Xt(e,t={width:64,height:64,depth:64},n){let r=n??{width:t.width,height:t.height,depth:1},i=e.createTexture(`volume-froxel`,Jt(Bt,t));if(!i.ok)return i;let a=e.view(i.value,{label:`volume-froxel.view`,dimension:`2d-array`,baseArrayLayer:0,arrayLayerCount:Math.ceil(t.depth/Ut)});if(!a.ok)return a;let s=e.createTexture(`volume-resolved-current`,Yt(r));if(!s.ok)return s;let c=e.view(s.value,{label:`volume-resolved-current.view`,dimension:`2d`});if(!c.ok)return c;let l=e.createTexture(`volume-history`,Yt(r));if(!l.ok)return l;let u=e.view(l.value,{label:`volume-history.view`,dimension:`2d`});if(!u.ok)return u;let d=e.createTexture(`volume-temporal`,Yt(r));if(!d.ok)return d;let f=e.view(d.value,{label:`volume-temporal.view`,dimension:`2d`});return f.ok?o({extent:t,resolvedExtent:r,froxel:i.value,froxelView:a.value,resolved:s.value,resolvedView:c.value,history:l.value,historyView:u.value,temporal:d.value,temporalView:f.value}):f}var Zt=new WeakMap;function H(e){return new l({code:`rhi-not-available`,expected:`volumetric fog ${e} preparation remains current`,hint:`await renderer initialization on the active device generation before drawing`})}function Qt(e){let{deviceScope:t,device:n}=e;if(!t.isAlive())throw H(`device scope`);let r=Zt.get(t);r===void 0&&(r=new WeakMap,Zt.set(t,r),t._adopt(`pipeline`,r,()=>{Zt.delete(t)}));let i=r.get(n);return i===void 0&&(i={compute:new Map,composite:new Map},r.set(n,i)),i}function $t(e){return e<7?18+e:20+e}var en={volume_inject:[{binding:0,visibility:4,buffer:{type:`uniform`}},{binding:3,visibility:4,texture:{sampleType:`depth`,viewDimension:`2d-array`}},{binding:4,visibility:4,sampler:{type:`comparison`}},{binding:5,visibility:4,buffer:{type:`uniform`}},{binding:6,visibility:4,storageTexture:{access:`write-only`,format:Bt,viewDimension:`2d-array`}},{binding:7,visibility:4,buffer:{type:`read-only-storage`}},{binding:8,visibility:4,buffer:{type:`uniform`}},{binding:9,visibility:4,texture:{sampleType:`depth`,viewDimension:`2d-array`}}],volume_integrate:[{binding:0,visibility:4,texture:{sampleType:`float`,viewDimension:`2d-array`}},{binding:1,visibility:4,texture:{sampleType:`depth`,viewDimension:`2d`}},{binding:2,visibility:4,storageTexture:{access:`write-only`,format:Ht,viewDimension:`2d`}},{binding:3,visibility:4,buffer:{type:`uniform`}},{binding:4,visibility:4,buffer:{type:`uniform`}},{binding:5,visibility:4,sampler:{type:`filtering`}},{binding:6,visibility:4,texture:{sampleType:`float`,viewDimension:`3d`}},{binding:7,visibility:4,sampler:{type:`filtering`}},{binding:8,visibility:4,storageTexture:{access:`write-only`,format:Vt,viewDimension:`2d`}},{binding:9,visibility:4,storageTexture:{access:`write-only`,format:Vt,viewDimension:`2d`}},{binding:10,visibility:4,buffer:{type:`read-only-storage`}},{binding:11,visibility:4,buffer:{type:`uniform`}},{binding:12,visibility:4,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:13,visibility:4,sampler:{type:`filtering`}},{binding:16,visibility:4,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:17,visibility:4,sampler:{type:`filtering`}},{binding:25,visibility:4,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:26,visibility:4,sampler:{type:`filtering`}},...Array.from({length:10},(e,t)=>({binding:$t(t),visibility:4,texture:{sampleType:`float`,viewDimension:`3d`}}))],volume_temporal:[{binding:0,visibility:4,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:1,visibility:4,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:2,visibility:4,storageTexture:{access:`write-only`,format:Vt,viewDimension:`2d`}},{binding:3,visibility:4,buffer:{type:`uniform`}},{binding:4,visibility:4,buffer:{type:`uniform`}}]};function tn(e,t,n){let r=e.shaderModuleFactory,i=r.createShaderModule,a=i.call(r,{code:t,label:n});if(!a.ok)throw a.error;return{source:t,factory:r,factoryMethod:i,module:a.value}}function nn(e,t){return e?.source===t.source&&e.factory===t.factory&&e.factoryMethod===t.factoryMethod&&e.module===t.module}function rn(e,t,n){let r=Qt(e),i=tn(e,t,n),a=r.compute.get(n);return a!==void 0&&nn(a,i)||(a=i,r.compute.set(n,a)),a}function an(e,t,n,r){let i=Qt(e),a=tn(e,t,`volume_composite`),o=i.composite.get(r);return o!==void 0&&nn(o,a)&&o.format===n||(o={...a,format:n},i.composite.set(r,o)),o}function on(e,t,n,r=!1){let i=e.device.createBindGroupLayout({...r?{label:`${t}.bind-group-layout`}:{},entries:n});if(!i.ok)throw i.error;let a=e.device.createPipelineLayout({label:`${t}.layout`,bindGroupLayouts:[i.value]});if(!a.ok)throw a.error;return{layout:i.value,pipelineLayout:a.value}}function sn(e,t,n){let{layout:r,pipelineLayout:i}=on(e,n,en[n]);return{layout:r,descriptor:{label:n,layout:i,compute:{module:t.module,entryPoint:n}}}}function cn(e,t,n){let{layout:r,pipelineLayout:i}=on(e,`volume_composite`,[{binding:0,visibility:3,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:1,visibility:3,sampler:{type:`filtering`}},{binding:2,visibility:3,texture:{sampleType:`depth`,viewDimension:`2d`}},{binding:3,visibility:3,buffer:{type:`uniform`}}],!0);return{layout:r,descriptor:{label:`volume_composite`,layout:i,vertex:{module:t.module,entryPoint:`volume_vs`,buffers:[]},fragment:{module:t.module,entryPoint:`volume_fs`,constants:{VOLUME_COMPOSITE_NEIGHBORS:n},targets:[{format:t.format,blend:{color:{srcFactor:`one`,dstFactor:`one-minus-src-alpha`,operation:`add`},alpha:{srcFactor:`one`,dstFactor:`one-minus-src-alpha`,operation:`add`}}}]},primitive:{topology:`triangle-list`}}}}function ln(e,t,n){let r=rn(e,t,n);if(r.state!==void 0)return r.state;if(r.pending!==void 0)throw H(`${n} pending`);let{layout:i,descriptor:a}=sn(e,r,n),o=e.device.createComputePipeline(a);if(!o.ok)throw o.error;return r.state={layout:i,pipeline:o.value},r.state}function un(e,t,n,r){let i=an(e,t,n,r);if(i.state!==void 0)return i.state;if(i.pending!==void 0)throw H(`volume_composite pending`);let{layout:a,descriptor:o}=cn(e,i,r),s=e.device.createRenderPipeline(o);if(!s.ok)throw s.error;return i.state={layout:a,pipeline:s.value},i.state}async function dn(e,t,n){if(!e.deviceScope.isAlive())throw H(`retired device scope`);if(t.state!==void 0)return;t.pending??=n();let r=t.pending;try{let n=await r;if(!e.deviceScope.isAlive())throw H(`retired device scope`);t.state=n}finally{t.pending===r&&delete t.pending}}async function fn(e,t,n){let r=[],i=[];for(let[n,a]of[[`inject`,`volume_inject`],[`integrate`,`volume_integrate`],[`temporal`,`volume_temporal`]]){let o=rn(e,t[n],a);r.push({label:a,entry:o}),i.push(()=>dn(e,o,async()=>{let{layout:t,descriptor:n}=sn(e,o,a),r=e.device.createComputePipelineAsync===void 0?e.device.createComputePipeline(n):await e.device.createComputePipelineAsync(n);if(!r.ok)throw r.error;return{layout:t,pipeline:r.value}}))}for(let a of[2,4,8]){let o=an(e,t.composite,n,a);a===2&&r.push({label:`volume_composite`,entry:o}),i.push(()=>dn(e,o,async()=>{let{layout:t,descriptor:n}=cn(e,o,a),r=e.device.createRenderPipelineAsync===void 0?e.device.createRenderPipeline(n):await e.device.createRenderPipelineAsync(n);if(!r.ok)throw r.error;return{layout:t,pipeline:r.value}}))}if(await Promise.all(i.map(e=>e())),!e.deviceScope.isAlive())throw H(`retired device scope`);for(let{label:t,entry:n}of r)if(!nn(n,tn(e,n.source,t)))throw H(`${t} module changed during preparation`)}var pn=`forgeax.single-layer-medium-raw-depth`,mn=`forgeax.single-layer-medium-msaa-paired-color`,hn=`forgeax.single-layer-medium-msaa-raw-depth`;function gn(e){let t=e.label??`single-layer-medium-raw-depth`;if(e.sourceDepth.sampleCount!==1)return n(new z({code:`resource-descriptor-invalid`,expected:`single-layer medium raw-depth producer has a single-sample source depth`,hint:`select a resolved 1x depth producer; MSAA depth resolve is not admitted yet`,detail:{resourceLabel:t,field:`sourceDepth.sampleCount`,expected:`1`,actual:String(e.sourceDepth.sampleCount)}}));let r=F(e.graph,t,{format:`r32float`,size:e.size,sampleCount:1});if(!r.ok)return r;let i=P(e.graph,{name:`${t}-producer`,shader:pn,input:e.sourceColor,outputs:[r.value],depth:e.sourceDepth});return i.ok?o(r.value):i}function _n(e){if(e.sourceColor.sampleCount!==4||e.sourceDepth.sampleCount!==4)return n(new z({code:`resource-descriptor-invalid`,expected:`single-layer medium paired MSAA producer has 4x color and depth inputs`,hint:`route 1x inputs through the single-sample raw-depth producer`,detail:{resourceLabel:e.label,field:`source.sampleCount`,expected:`color=4,depth=4`,actual:`color=${e.sourceColor.sampleCount},depth=${e.sourceDepth.sampleCount}`}}));let t=F(e.graph,`${e.label}-color`,{format:e.sourceColor.format,size:e.size,sampleCount:1,...e.sourceColor.domain===void 0?{}:{domain:e.sourceColor.domain}});if(!t.ok)return t;let r=F(e.graph,`${e.label}-depth`,{format:`r32float`,size:e.size,sampleCount:1});if(!r.ok)return r;let i=P(e.graph,{name:`${e.label}-color-producer`,shader:mn,input:e.sourceColor,outputs:[t.value],depth:e.sourceDepth});if(!i.ok)return i;let a=P(e.graph,{name:`${e.label}-depth-producer`,shader:hn,input:e.sourceColor,outputs:[r.value],depth:e.sourceDepth});return a.ok?o({color:t.value,depth:r.value}):a}function vn(e,t){return e===void 0||t===void 0?n(new z({code:`resource-descriptor-invalid`,expected:`single-layer medium graph has nearest targets and an opaque backdrop`,hint:`keep the shared transmission backdrop copy ahead of the Surface passes`,detail:{resourceLabel:`single-layer-medium`,field:`backdrop`,expected:`resolved graph texture view`,actual:`missing`}})):o({nearestTargets:e,backdrop:t})}function yn(e){let t=e.surfacePair;if(t.rawDepth.status===`unavailable`)return n(new z({code:`resource-descriptor-invalid`,expected:`single-layer medium consumes a graph-paired sampled raw depth`,hint:`enable an owner-approved depth-copy producer before admitting the Surface passes`,detail:{resourceLabel:`single-layer-medium`,field:`surfacePair.rawDepth`,expected:`available sampled depth view`,actual:t.rawDepth.reason}}));let r=e.sampled??[],i=L(e.graph,{name:`single-layer-medium-nearest-layer`,color:e.nearestLayer,depth:e.nearestDepth,sampled:r,...e.directionalShadow===void 0?{}:{directionalShadow:e.directionalShadow},...e.spotShadow===void 0?{}:{spotShadow:e.spotShadow},...e.cloudShadow===void 0?{}:{cloudShadow:e.cloudShadow},...e.ssao===void 0?{}:{ssao:e.ssao},selector:_,colorLoadOp:`clear`,depthLoadOp:`clear`,recordMode:`single-layer-medium-nearest-layer`,transmissionBackdrop:t.opaqueColor,surfacePair:t,gpuDrivenFilter:`single-layer-medium`,...e.extraAccesses===void 0?{}:{extraAccesses:e.extraAccesses},...e.gpuDriven===void 0?{}:{gpuDriven:e.gpuDriven}});if(!i.ok)return i;let a=e.nearestLayer.sampleCount===4?_n({graph:e.graph,label:`single-layer-medium-nearest-resolve`,sourceColor:e.nearestLayer,sourceDepth:e.nearestDepth,size:e.size}):(()=>{let t=gn({graph:e.graph,label:`single-layer-medium-nearest-depth-sampled`,sourceColor:e.nearestLayer,sourceDepth:e.nearestDepth,size:e.size});return t.ok?o({color:e.nearestLayer,depth:t.value}):t})();if(!a.ok)return a;let s=[...r,a.value.color],c=L(e.graph,{name:`single-layer-medium-color`,color:e.color,...e.colorResolve===void 0?{}:{resolve:e.colorResolve},depth:e.depth,sampled:s,...e.directionalShadow===void 0?{}:{directionalShadow:e.directionalShadow},...e.spotShadow===void 0?{}:{spotShadow:e.spotShadow},...e.cloudShadow===void 0?{}:{cloudShadow:e.cloudShadow},...e.ssao===void 0?{}:{ssao:e.ssao},selector:_,colorLoadOp:`load`,depthLoadOp:`load`,recordMode:`single-layer-medium-color`,transmissionBackdrop:t.opaqueColor,surfacePair:t,surfaceNearestLayer:a.value.color.view,surfaceNearestDepth:a.value.depth.view,gpuDrivenFilter:`single-layer-medium`,...e.extraAccesses===void 0?{}:{extraAccesses:e.extraAccesses},...e.gpuDriven===void 0?{}:{gpuDriven:e.gpuDriven}});return c.ok?o(void 0):c}function bn(e){e.registerBuiltinPostProcess(pn,{source:m,reads:[`input`,{key:`scene-depth`,sampleType:`depth`}]});let t=[{key:`input`,sampleType:`multisampled-float`},{key:`scene-depth`,sampleType:`depth`}];e.registerBuiltinPostProcess(mn,{source:d,reads:t}),e.registerBuiltinPostProcess(hn,{source:p,reads:t})}function xn(e){if(e.length>64)throw new M(`count`,`at most 64 visible decals across all Worlds`);return e.map(e=>e.textures.map(e=>{if(e===void 0)return;let t=v(e).unwrap();return{format:t.format,size:t.physicalExtent,mipLevelCount:t.mipLevelCount,usage:t.usage}}))}var Sn=288,Cn=512;function wn(e){let t=new Float32Array(Sn/4),n=e.material,r=n.paramSnapshot,i=r?.baseColor,a=r?.normalScale;return t.set(e.inverse,0),t.set(e.transform,16),t.set([...n.baseColor,Array.isArray(i)?i[3]??1:1],32),t.set([e.colorOpacity,e.normalOpacity,e.roughnessOpacity,e.opacity],36),t.set([n.roughness,Array.isArray(a)?a[0]??1:1,Array.isArray(a)?a[1]??1:1,e.normalThreshold],40),t.set([e.textures[1]===void 0?0:1,Number(r?.roughnessChannel??1),Number(r?.alphaCutoff??0),0],44),re.forEach((e,r)=>{let i=n.textureCoordinates?.get(e),a=i?.transform,o=a?.scale??[1,1],s=a?.offset??[0,0],c=a?.rotation??0,l=i?.physicalUvScale??[1,1],u=Math.cos(c),d=Math.sin(c);t.set([u*o[0]*l[0],-d*o[1]*l[0],s[0]*l[0],0,d*o[0]*l[1],u*o[1]*l[1],s[1]*l[1],0],48+r*8)}),t}function Tn(e,t){let n=e.camera.projectedDecals?.[t];if(n===void 0)throw new M(`frame`,`the decal count used to compile this graph`);let r=e,i=r.resourceScopes?.[n.worldId]??(n.worldId===0?r.world:void 0);if(i===void 0)throw new M(`world`,`a live source resource scope`);return{decal:n,internal:r,scope:i}}function En(e,t,n){if(t.length===0)return o(n);let r=[],i=[];for(let t of[`color`,`normal`,`roughness`]){let i=F(e,`decal-${t}`,{format:`rgba16float`,size:n.size});if(!i.ok)return i;r.push(i.value)}for(let t of[`normal`,`albedo`,`f0`]){let r=F(e,`decal-surface-${t}`,{format:t===`f0`?`rg32uint`:`r32uint`,size:n.size});if(!r.ok)return r;i.push(r.value)}let a=e.createBuffer(`decal-params`,{size:t.length*Cn});if(!a.ok)return a;let s=e.importBuffer(`decal-view`,{size:N,usage:72},e=>e.pipelineState.viewUniformBuffer);if(!s.ok)return s;let c=[];for(let[n,r]of t.entries()){let t=[];for(let[i,a]of r.entries()){if(a===void 0){t.push(void 0);continue}let r=e=>{let{decal:t,internal:r,scope:a}=Tn(e,n),o=t.textures[i],s=t.material.textureHandles?.get(re[i]);if(o===void 0||s===void 0)throw new M(`texture`,`the declared texture slot`);return r.store.ensureResident(s,o,a).unwrap()},o=e.importTexture(`decal-${n}-texture-${i}`,a,e=>r(e).texture.handle);if(!o.ok)return o;let s=e.importView(o.value,{dimension:`2d`},e=>r(e).view);if(!s.ok)return s;t.push(s.value)}c.push(t)}let l=e.addCopyPass(`decal-prepare`,{accesses:[{resource:a.value,usage:`copy-dst`}],encode:({frame:e,resources:n})=>{let r=n.buffer(a.value).unwrap();t.forEach((t,n)=>{e.runtime.device.queue.writeBuffer(r,n*Cn,wn(Tn(e,n).decal)).unwrap()})}});if(!l.ok)return l;let u,d=[n.depth,n.normal.view,...c.flat().filter(e=>e!==void 0)],f=e.addRasterPass(`decal-project`,{accesses:[...d.map(e=>({resource:e,usage:`sampled-read`})),...r.map(({view:e})=>({resource:e,usage:`color-attachment`})),{resource:a.value,usage:`uniform-read`},{resource:s.value,usage:`uniform-read`}],colorAttachments:r.map(({view:e})=>({view:e,loadOp:`clear`,storeOp:`store`,clearValue:{r:0,g:0,b:0,a:0}})),encode:({pass:e,frame:t,resources:i})=>{let o=t,s=t.runtime.device;if(u===void 0){let e=o.runtime.standardDeferredShaders?.decalProject,n=t.runtime.shaderModuleFactory;if(e===void 0||n===void 0)throw new M(`shader`,`cooked decal projection shader`);let i=n.createShaderModule({code:e,label:`forgeax::engine-decal-project`}).unwrap(),a=s.createBindGroupLayout({entries:[{binding:0,visibility:3,buffer:{type:`uniform`,hasDynamicOffset:!0,minBindingSize:Sn}},...[`depth`,`uint`,`float`,`float`,`float`].map((e,t)=>({binding:t+1,visibility:2,texture:{sampleType:e,viewDimension:`2d`}})),...[6,7,8].map(e=>({binding:e,visibility:2,sampler:{type:`filtering`}}))]}).unwrap();u={pipeline:s.createRenderPipeline({label:`decal-project`,layout:s.createPipelineLayout({bindGroupLayouts:[o.pipelineState.viewBindGroupLayout,a]}).unwrap(),vertex:{module:i,entryPoint:`vs_main`,buffers:[]},fragment:{module:i,entryPoint:`fs_main`,targets:r.map(({format:e})=>({format:e,blend:{color:{operation:`add`,srcFactor:`src-alpha`,dstFactor:`one-minus-src-alpha`},alpha:{operation:`add`,srcFactor:`one`,dstFactor:`one-minus-src-alpha`}}}))},primitive:{topology:`triangle-list`}}).unwrap(),layout:a,groups:new WeakMap}}if(e.setPipeline(u.pipeline),o.viewBindGroup===null)throw new M(`view`,`a prepared camera bind group`);e.setBindGroup(0,o.viewBindGroup,[o.viewBindGroupDynamicOffset??0,0]);let l=i.buffer(a.value).unwrap();for(let[r,a]of c.entries()){let{decal:c,scope:d}=Tn(t,r),f=[i.textureView(n.depth).unwrap(),i.textureView(n.normal.view).unwrap(),...a.map((e,n)=>e===void 0?n===1?o.pipelineState.defaultNormalTextureView:t.pipelineState.defaultWhiteTextureView:i.textureView(e).unwrap())],p=re.map((e,n)=>{let r=c.material.samplerHandles?.get(e),i=c.samplers[n];return r===void 0||i===void 0?t.pipelineState.defaultSampler:o.store.ensureSamplerResident(r,i,d).unwrap()}),m=u.layout,h=D(u.groups,[l,...f,...p],`decal-project`,()=>s.createBindGroup({layout:m,entries:[{binding:0,resource:{kind:`buffer`,value:{buffer:l,offset:0,size:Sn}}},...f.map((e,t)=>({binding:t+1,resource:{kind:`textureView`,value:e}})),...p.map((e,t)=>({binding:t+6,resource:{kind:`sampler`,value:e}}))]}).unwrap(),o.bindGroupCounts);e.setBindGroup(1,h,[r*Cn]),e.draw(6)}}});if(!f.ok)return f;let p,m=[n.normal.view,n.albedo.view,n.f0.view,...r.map(({view:e})=>e)],h=e.addRasterPass(`decal-apply`,{accesses:[...m.map(e=>({resource:e,usage:`sampled-read`})),...i.map(({view:e})=>({resource:e,usage:`color-attachment`}))],colorAttachments:i.map(({view:e})=>({view:e,loadOp:`clear`,storeOp:`store`})),encode:({pass:e,frame:t,resources:n})=>{let r=t,a=t.runtime.device;if(p===void 0){let e=r.runtime.standardDeferredShaders?.decalApply,n=t.runtime.shaderModuleFactory;if(e===void 0||n===void 0)throw new M(`shader`,`cooked decal composition shader`);let o=n.createShaderModule({code:e,label:`forgeax::engine-decal-apply`}).unwrap(),s=a.createBindGroupLayout({entries:m.map((e,t)=>({binding:t,visibility:2,texture:{sampleType:t<3?`uint`:`unfilterable-float`,viewDimension:`2d`}}))}).unwrap();p={pipeline:a.createRenderPipeline({label:`decal-apply`,layout:a.createPipelineLayout({bindGroupLayouts:[s]}).unwrap(),vertex:{module:o,entryPoint:`vs_main`,buffers:[]},fragment:{module:o,entryPoint:`fs_main`,targets:i.map(({format:e})=>({format:e}))},primitive:{topology:`triangle-list`}}).unwrap(),layout:s,groups:new WeakMap}}let o=m.map(e=>n.textureView(e).unwrap()),s=p.layout,c=D(p.groups,o,`decal-apply`,()=>a.createBindGroup({layout:s,entries:o.map((e,t)=>({binding:t,resource:{kind:`textureView`,value:e}}))}).unwrap(),r.bindGroupCounts);e.setPipeline(p.pipeline),e.setBindGroup(0,c),e.draw(3)}});return h.ok?o({...n,normal:i[0],albedo:i[1],f0:i[2]}):h}function Dn(e,t,n,r){let i=Ke(64),a=e.importTexture(`atmosphere-irradiance`,{format:`rgba16float`,size:{width:16,height:16,depthOrArrayLayers:6},usage:20},e=>R(e).irradiance);if(!a.ok)return a;let s=e.importTexture(`atmosphere-prefilter`,{format:`rgba16float`,size:Ee(64),usage:23},e=>R(e).prefilter);if(!s.ok)return s;let c=e.importTexture(`atmosphere-prefilter-scratch`,{format:`rgba16float`,size:Ee(64),usage:23},e=>R(e).prefilterScratch);if(!c.ok)return c;let u=e.view(a.value,{dimension:`cube`,arrayLayerCount:6});if(!u.ok)return u;let d=e.view(s.value,{dimension:`2d`});if(!d.ok)return d;let f=e.view(c.value,{dimension:`2d`});if(!f.ok)return f;let p=e.importBuffer(`atmosphere-ibl-params`,{size:i*6*256,usage:72},e=>R(e).iblParams);if(!p.ok)return p;let m=e.addCopyPass(`atmosphere-ibl-prepare`,{accesses:[{resource:p.value,usage:`copy-dst`}],executeIf:r,encode:({frame:e,resources:t})=>{We(e.runtime.device,t.buffer(p.value).unwrap(),64).unwrap()}});if(!m.ok)return m;let h,g=e=>{if(h!==void 0)return h;let t=e.runtime.device,n=e.runtime.shaderModuleFactory,r=e.atmosphereShaders?.ibl,i=e.atmosphereShaders?.prefilter;if(n===void 0||r===void 0||i===void 0)throw new l({code:`shader-compile-failed`,expected:`compiled Atmosphere irradiance and shared PMREM programs`,hint:`rebuild the Engine shader manifest before selecting Atmosphere lighting`});let a=n.createShaderModule({code:r,label:`atmosphere_ibl`}).unwrap(),o=n.createShaderModule({code:i,label:`ibl-prefilter`}).unwrap(),s=t.createBindGroupLayout({entries:[{binding:0,visibility:2,texture:{sampleType:`float`,viewDimension:`cube`}},{binding:1,visibility:2,sampler:{type:`filtering`}}]}).unwrap();return h={diffuseInputs:s,irradiance:t.createRenderPipeline({label:`atmosphere_irradiance_fs`,layout:t.createPipelineLayout({bindGroupLayouts:[s]}).unwrap(),vertex:{module:a,entryPoint:`atmosphere_ibl_vs`,buffers:[{arrayStride:12,attributes:[{shaderLocation:0,offset:0,format:`float32x3`}]}]},fragment:{module:a,entryPoint:`atmosphere_irradiance_fs`,targets:[{format:`rgba16float`}]},primitive:{topology:`triangle-list`}}).unwrap(),prefilter:Le(t,o,`rgba16float`).unwrap(),sampler:t.createSampler({magFilter:`linear`,minFilter:`linear`,mipmapFilter:`linear`}).unwrap(),parameters:[]},h};for(let i=0;i<6;i++){let o=e.view(a.value,{dimension:`2d`,baseArrayLayer:i,arrayLayerCount:1});if(!o.ok)return o;let s=e.addRasterPass(`atmosphere-irradiance-${i}`,{accesses:[{resource:t,usage:`sampled-read`},{resource:n,usage:`vertex-read`},{resource:o.value,usage:`color-attachment`}],colorAttachments:[{view:o.value,loadOp:`clear`,storeOp:`store`}],executeIf:r,encode:({frame:e,resources:r,pass:a})=>{let o=g(e),s=e.runtime.device.createBindGroup({layout:o.diffuseInputs,entries:[{binding:0,resource:{kind:`textureView`,value:r.textureView(t).unwrap()}},{binding:1,resource:{kind:`sampler`,value:o.sampler}}]}).unwrap();a.setPipeline(o.irradiance),a.setBindGroup(0,s),a.setVertexBuffer(0,r.buffer(n).unwrap()),a.draw(3,1,i*3)}});if(!s.ok)return s}for(let n=0;n<i;n++){let a=e.addRasterPass(`atmosphere-prefilter-${n}`,{accesses:[{resource:t,usage:`sampled-read`},{resource:f.value,usage:`sampled-read`},{resource:p.value,usage:`uniform-read`},{resource:d.value,usage:`color-attachment`}],colorAttachments:[{view:d.value,loadOp:n===0?`clear`:`load`,storeOp:`store`}],executeIf:r,encode:({frame:e,resources:r,pass:i})=>{let a=g(e),o=e.runtime.device.createBindGroup({layout:a.prefilter.inputLayout,entries:[{binding:0,resource:{kind:`textureView`,value:r.textureView(t).unwrap()}},{binding:1,resource:{kind:`sampler`,value:a.sampler}},{binding:2,resource:{kind:`textureView`,value:r.textureView(f.value).unwrap()}}]}).unwrap();i.setPipeline(a.prefilter.pipeline),i.setBindGroup(1,o);for(let t=0;t<6;t++){let o=n*6+t;a.parameters[o]??=e.runtime.device.createBindGroup({layout:a.prefilter.parametersLayout,entries:ve(r.buffer(p.value).unwrap(),n,t)}).unwrap();let s=a.parameters[o],c=le(64,n,t);i.setBindGroup(0,s),i.setViewport(c.x,c.y,c.width,c.height,0,1),i.setScissorRect(c.x,c.y,c.width,c.height),i.draw(3)}}});if(!a.ok)return a;let o=e.addCopyPass(`atmosphere-prefilter-copy-${n}`,{accesses:[{resource:d.value,usage:`copy-src`},{resource:f.value,usage:`copy-dst`}],executeIf:r,encode:({frame:e,encoder:t,resources:r})=>{for(let e=0;e<6;e++){let i=le(64,n,e);t.copyTextureToTexture({texture:r.texture(s.value).unwrap(),origin:[i.x,i.y,0]},{texture:r.texture(c.value).unwrap(),origin:[i.x,i.y,0]},{width:i.width,height:i.height,depthOrArrayLayers:1})}n===i-1&&(R(e).recordedEncoder=e.encoder)}});if(!o.ok)return o}return o({sky:t,irradiance:u.value,prefilter:d.value})}var On=128;function kn(e){return e.createBindGroupLayout({entries:[{binding:0,visibility:2,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:1,visibility:2,sampler:{type:`filtering`}},{binding:2,visibility:2,buffer:{type:`uniform`,minBindingSize:N}},{binding:3,visibility:2,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:4,visibility:2,texture:{sampleType:`float`,viewDimension:`2d`}}]}).unwrap()}function An(e,t,n){return e.createBindGroup({layout:t,entries:[{binding:0,resource:{kind:`textureView`,value:n.sky}},{binding:1,resource:{kind:`sampler`,value:n.sampler}},{binding:2,resource:{kind:`buffer`,value:{buffer:n.viewBuffer,offset:n.viewOffset,size:N}}},{binding:3,resource:{kind:`textureView`,value:n.transmittance}},{binding:4,resource:{kind:`textureView`,value:n.multiple}}]}).unwrap()}function jn(e,t,n={}){let r=e.importTexture(`atmosphere-sky`,{format:`rgba16float`,size:{width:On,height:On,depthOrArrayLayers:6},usage:20},e=>R(e).sky);if(!r.ok)return r;let i=e.view(r.value,{dimension:`cube`,arrayLayerCount:6});if(!i.ok)return i;let a=e.importBuffer(`atmosphere-params`,{size:N,usage:72},e=>R(e).params);if(!a.ok)return a;let s=e.importBuffer(`atmosphere-face-vertices`,{size:216,usage:40},e=>R(e).vertices);if(!s.ok)return s;let c=e.importBuffer(`atmosphere-view`,{size:N,usage:72},e=>e.pipelineState.viewUniformBuffer);if(!c.ok)return c;let u,d=e=>e,f=e=>d(e).frameState.environmentFrame?.environmentSignature!==R(e).submittedSignature&&R(e).recordedEncoder!==e.encoder,p=e.addCopyPass(`atmosphere-prepare`,{accesses:[{resource:a.value,usage:`copy-dst`},{resource:s.value,usage:`copy-dst`}],executeIf:f,encode:({frame:e,resources:t})=>{let n=d(e).frameState.environmentFrame,r=n?.sun;if(n?.source.kind!==`atmosphere`||r===void 0)throw new l({code:`webgpu-runtime-error`,expected:`selected Atmosphere frame carries its directional sun`,hint:`publish the validated resource-owner environment frame before graph recording`});let i=n.source.atmosphere,o=new Float32Array(N/4);o.set(r.direction.map(e=>-e),16),o.set(r.color.map(e=>e*r.intensity),20),o.set(i.capturePosition,24),S(o,292,i,96e3),e.runtime.device.queue.writeBuffer(t.buffer(a.value).unwrap(),0,o).unwrap();let c=new Float32Array(54);for(let e=0;e<6;e+=1)c.set([-1,-1,e+1,3,-1,e+1,-1,3,e+1],e*9);e.runtime.device.queue.writeBuffer(t.buffer(s.value).unwrap(),0,c).unwrap()}});if(!p.ok)return p;let m=Je(e,a.value,f,n);if(!m.ok)return m;let h=e=>{if(u!==void 0)return u;let n=e.atmosphereShaders,r=e.runtime.shaderModuleFactory;if(n===void 0||r===void 0)throw new l({code:`shader-compile-failed`,expected:`shader manifest includes the Atmosphere cube and background programs`,hint:`rebuild the Engine shader manifest with the package-owned Atmosphere entries`});let i=e.runtime.device,a=r.createShaderModule({code:n.cube,label:`atmosphere_cube`}).unwrap(),o=r.createShaderModule({code:n.background,label:`atmosphere_background`}).unwrap(),s=i.createBindGroupLayout({entries:[{binding:0,visibility:2,buffer:{type:`uniform`,minBindingSize:N}},{binding:1,visibility:2,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:3,visibility:2,sampler:{type:`filtering`}}]}).unwrap(),c=kn(i);return u={cubePipeline:i.createRenderPipeline({label:`atmosphere_cube`,layout:i.createPipelineLayout({bindGroupLayouts:[s]}).unwrap(),vertex:{module:a,entryPoint:`atmosphere_cubemap_vs`,buffers:[{arrayStride:12,attributes:[{shaderLocation:0,offset:0,format:`float32x3`}]}]},fragment:{module:a,entryPoint:`atmosphere_cubemap_fs`,targets:[{format:`rgba16float`}]},primitive:{topology:`triangle-list`,cullMode:`none`}}).unwrap(),cubeLayout:s,backgroundPipeline:i.createRenderPipeline({label:`atmosphere_background`,layout:i.createPipelineLayout({bindGroupLayouts:[c,Ae(i)]}).unwrap(),vertex:{module:o,entryPoint:`atmosphere_background_vs`,buffers:[]},fragment:{module:o,entryPoint:`atmosphere_background_fs`,targets:[{format:t.format}]},primitive:{topology:`triangle-list`,cullMode:`none`},multisample:{count:t.sampleCount}}).unwrap(),backgroundLayout:c,sampler:i.createSampler({minFilter:`linear`,magFilter:`linear`,mipmapFilter:`linear`}).unwrap()},u};for(let t=0;t<6;t+=1){let n=e.view(r.value,{dimension:`2d`,baseArrayLayer:t,arrayLayerCount:1});if(!n.ok)return n;let i=e.addRasterPass(`atmosphere-cube-${t}`,{accesses:[{resource:n.value,usage:`color-attachment`},{resource:a.value,usage:`uniform-read`},{resource:s.value,usage:`vertex-read`},{resource:m.value.captureSky,usage:`sampled-read`}],colorAttachments:[{view:n.value,loadOp:`clear`,storeOp:`store`}],executeIf:f,encode:({pass:e,frame:n,resources:r})=>{let i=h(n);if(i.cubeGroup=n.runtime.device.createBindGroup({layout:i.cubeLayout,entries:[{binding:0,resource:{kind:`buffer`,value:{buffer:r.buffer(a.value).unwrap(),size:N}}},{binding:1,resource:{kind:`textureView`,value:r.textureView(m.value.captureSky).unwrap()}},{binding:3,resource:{kind:`sampler`,value:i.sampler}}]}).unwrap(),e.setPipeline(i.cubePipeline),e.setBindGroup(0,i.cubeGroup),e.setVertexBuffer(0,r.buffer(s.value).unwrap()),e.draw(3,1,t*3,0),t===5){let e=d(n).frameState.environmentFrame?.environmentSignature,t=R(n);Be(d(n).frameState,()=>{t.submittedSignature=e})}}});if(!i.ok)return i}let g=Dn(e,i.value,s.value,f);if(!g.ok)return g;let _=e.addRasterPass(`atmosphere-background`,{accesses:[...me(n),{resource:m.value.skyView,usage:`sampled-read`},{resource:m.value.transmittance,usage:`sampled-read`},{resource:m.value.multipleScattering,usage:`sampled-read`},{resource:c.value,usage:`uniform-read`},{resource:t.view,usage:`color-attachment`}],colorAttachments:[{view:t.view,loadOp:`clear`,storeOp:`store`}],encode:({pass:e,frame:t,resources:r})=>{let i=h(t);i.backgroundGroup=An(t.runtime.device,i.backgroundLayout,{sky:r.textureView(m.value.skyView).unwrap(),sampler:i.sampler,viewBuffer:r.buffer(c.value).unwrap(),viewOffset:0,transmittance:r.textureView(m.value.transmittance).unwrap(),multiple:r.textureView(m.value.multipleScattering).unwrap()}),e.setPipeline(i.backgroundPipeline),e.setBindGroup(0,i.backgroundGroup),e.setBindGroup(1,at(t,r.buffer(c.value).unwrap(),0,n.directional===void 0?void 0:r.textureView(n.directional).unwrap(),n.cloud===void 0?void 0:r.textureView(n.cloud).unwrap())),e.draw(3)}});return _.ok?o({...g.value,atmosphere:m.value}):_}function Mn(e,t){let n,r=[t.radiance,t.fallback,t.response,t.normal];return e.addRasterPass(`ssr-compose`,{accesses:[...r.map(e=>({resource:e,usage:`sampled-read`})),{resource:t.view,usage:`uniform-read`},{resource:t.scene.view,usage:`color-attachment`}],colorAttachments:[{view:t.scene.view,loadOp:`load`,storeOp:`store`}],encode:({pass:e,frame:i,resources:a})=>{let o=i.ssrShaders?.compose;if(o===void 0)return;let s=i.runtime.device;if(n===void 0){let e=i.runtime.shaderModuleFactory;if(e===void 0)throw new l({code:`rhi-not-available`,expected:`SSR composition shader module factory`,hint:`construct the renderer through a backend pack with shader module support`});let a=e.createShaderModule({code:o,label:`ssr_compose`}).unwrap(),c=s.createBindGroupLayout({entries:[...r.map((e,t)=>({binding:t,visibility:2,texture:{sampleType:t===0?`float`:t===3?`uint`:`unfilterable-float`,viewDimension:`2d`}})),{binding:4,visibility:2,sampler:{type:`filtering`}},{binding:5,visibility:2,buffer:{type:`uniform`}}]}).unwrap(),u=s.createPipelineLayout({bindGroupLayouts:[c]}).unwrap();n={pipeline:s.createRenderPipeline({label:`ssr_compose`,layout:u,vertex:{module:a,entryPoint:`vs_ssr_compose`,buffers:[]},fragment:{module:a,entryPoint:`fs_ssr_compose`,targets:[{format:t.scene.format,blend:{color:{operation:`add`,srcFactor:`one`,dstFactor:`one`},alpha:{operation:`add`,srcFactor:`zero`,dstFactor:`one`}}}]},primitive:{topology:`triangle-list`}}).unwrap(),layout:c,sampler:s.createSampler({addressModeU:`clamp-to-edge`,addressModeV:`clamp-to-edge`,minFilter:`linear`,magFilter:`linear`,mipmapFilter:`linear`}).unwrap(),groups:new WeakMap}}let c=r.map(e=>a.textureView(e).unwrap()),u=a.buffer(t.view).unwrap(),d=n.layout,f=n.sampler,p=D(n.groups,[...c,f,u],`ssr-compose`,()=>s.createBindGroup({layout:d,entries:[...c.map((e,t)=>({binding:t,resource:{kind:`textureView`,value:e}})),{binding:4,resource:{kind:`sampler`,value:f}},{binding:5,resource:{kind:`buffer`,value:{buffer:u,size:N}}}]}).unwrap(),i.bindGroupCounts);e.setPipeline(n.pipeline),e.setBindGroup(0,p),e.draw(3)}})}var Nn=48,Pn=5;function Fn(){return Object.freeze({resolution:`full`,coarseSteps:Nn,refineSteps:Pn})}function In(e){return n(new z({code:`resource-descriptor-invalid`,expected:`admitted SSR spatial graph input '${e}'`,hint:`provide the Standard '${e}' graph view before building SSR`,detail:{resourceLabel:`forgeax::ssr`,field:e,expected:`typed graph view`,actual:`missing`}}))}function Ln(e,t){return e.ssrShaders?.[t]}function Rn(e,t,n,r=()=>void 0){return e.addComputePass(t,{accesses:n,encode:r})}function zn(e,t){if(t.admission.status!==`admitted`)return o({enabled:!1,passNames:Object.freeze([]),resources:void 0,trace:void 0,reactivity:void 0,reactivitySurface:void 0});let n=t.depth,r=t.normal,s=t.scene,c=t.fallback,l=t.temporal;if(n===void 0)return In(`depth`);if(r===void 0)return In(`normal`);if(s===void 0)return In(`scene`);if(c===void 0)return In(`fallback`);let u=t.currentTemporal;if(u===void 0)return In(`currentTemporal`);let d=t.depthPyramid;if(d===void 0)return In(`depthPyramid`);let f=Mt(e,{width:t.width,height:t.height});if(!f.ok)return f;let{trace:p,hitReactivity:m}=f.value,h=l?.outputSurface??m,g,_,v=[];if(l!==void 0){let n=Math.max(1,Math.floor(t.width)),r=Math.max(1,Math.floor(t.height)),i=e.createTexture(`ssr-resolved`,{format:`rgba16float`,size:{width:n,height:r},domain:`linear-hdr`,mipLevelCount:a({width:n,height:r})});if(!i.ok)return i;let o=e.view(i.value,{label:`ssr-resolved.view`,dimension:`2d`,baseMipLevel:0,mipLevelCount:1});if(!o.ok)return o;v.push(o.value);for(let t=1;t<a({width:n,height:r});t++){let n=e.view(i.value,{label:`ssr-resolved.mip-${t}.view`,dimension:`2d`,baseMipLevel:t,mipLevelCount:1});if(!n.ok)return n;v.push(n.value)}let s=e.view(i.value,{label:`ssr-resolved.pyramid.view`,dimension:`2d`});if(!s.ok)return s;_=s.value,g={texture:i.value,view:o.value,width:n,height:r,format:`rgba16float`}}let y=[],b,x,S,C={trace:[{binding:0,visibility:4,texture:{sampleType:`depth`,viewDimension:`2d`}},{binding:1,visibility:4,texture:{sampleType:`uint`,viewDimension:`2d`}},{binding:2,visibility:4,texture:{sampleType:`unfilterable-float`,viewDimension:`2d`}},{binding:3,visibility:4,texture:{sampleType:`unfilterable-float`,viewDimension:`2d`}},{binding:4,visibility:4,storageTexture:{access:`write-only`,format:`rgba16float`,viewDimension:`2d`}},{binding:5,visibility:4,buffer:{type:`uniform`}},{binding:6,visibility:4,texture:{sampleType:`unfilterable-float`,viewDimension:`2d`}},{binding:7,visibility:4,texture:{sampleType:`unfilterable-float`,viewDimension:`2d`}},{binding:8,visibility:4,storageTexture:{access:`write-only`,format:`r32float`,viewDimension:`2d`}}],temporal:[{binding:0,visibility:4,texture:{sampleType:`unfilterable-float`,viewDimension:`2d`}},{binding:1,visibility:4,texture:{sampleType:`depth`,viewDimension:`2d`}},{binding:2,visibility:4,texture:{sampleType:`uint`,viewDimension:`2d`}},{binding:3,visibility:4,texture:{sampleType:`unfilterable-float`,viewDimension:`2d`}},{binding:4,visibility:4,texture:{sampleType:`unfilterable-float`,viewDimension:`2d`}},{binding:5,visibility:4,storageTexture:{access:`write-only`,format:`rgba16float`,viewDimension:`2d`}},{binding:6,visibility:4,buffer:{type:`uniform`}},{binding:7,visibility:4,storageTexture:{access:`write-only`,format:`rgba16float`,viewDimension:`2d`}},{binding:8,visibility:4,buffer:{type:`uniform`}},{binding:9,visibility:4,texture:{sampleType:`unfilterable-float`,viewDimension:`2d`}},{binding:10,visibility:4,storageTexture:{access:`write-only`,format:`rgba8unorm`,viewDimension:`2d`}},{binding:11,visibility:4,texture:{sampleType:`unfilterable-float`,viewDimension:`2d`}}]},w=Rn(e,`ssr-trace`,[{resource:n,usage:`sampled-read`},{resource:r,usage:`sampled-read`},{resource:s,usage:`sampled-read`},{resource:c,usage:`sampled-read`},{resource:d.pyramid,usage:`sampled-read`},{resource:p.view,usage:`storage-write`},{resource:u,usage:`sampled-read`},{resource:m,usage:`storage-write`},...t.view===void 0?[]:[{resource:t.view,usage:`uniform-read`}]],({pass:e,frame:i,resources:a})=>{let o=Ln(i,`trace`);o!==void 0&&t.view!==void 0&&(b??=ct(i,o,`ssr_trace`,C.trace,`ssr_trace`),e.setPipeline(b.pipeline),e.setBindGroup(0,ut(i,b,[{binding:7,resource:{kind:`textureView`,value:V(a,u)}},{binding:8,resource:{kind:`textureView`,value:V(a,m)}},{binding:6,resource:{kind:`textureView`,value:V(a,c)}},{binding:0,resource:{kind:`textureView`,value:V(a,n)}},{binding:1,resource:{kind:`textureView`,value:V(a,r)}},{binding:2,resource:{kind:`textureView`,value:V(a,s)}},{binding:3,resource:{kind:`textureView`,value:V(a,d.pyramid)}},{binding:4,resource:{kind:`textureView`,value:V(a,p.view)}},{binding:5,resource:{kind:`buffer`,value:{buffer:dt(a,t.view),size:N}}}])),e.dispatchWorkgroups(Math.ceil(t.width/8),Math.ceil(t.height/8),1))});if(!w.ok)return w;if(y.push(`ssr-trace`),l!==void 0){if(w=Rn(e,`ssr-temporal`,[{resource:p.view,usage:`sampled-read`},{resource:n,usage:`sampled-read`},{resource:r,usage:`sampled-read`},{resource:l.previousHistory,usage:`sampled-read`},{resource:u,usage:`sampled-read`},{resource:m,usage:`sampled-read`},{resource:l.outputHistory,usage:`storage-write`},{resource:l.previousSurface,usage:`sampled-read`},{resource:l.outputSurface,usage:`storage-write`},{resource:l.params,usage:`uniform-read`},...t.view===void 0?[]:[{resource:t.view,usage:`uniform-read`}],...g===void 0?[]:[{resource:g.view,usage:`storage-write`}]],({pass:e,frame:i,resources:a})=>{let o=Ln(i,`temporal`);o!==void 0&&t.view!==void 0&&(x??=ct(i,o,`ssr_temporal`,C.temporal,`ssr_temporal`),e.setPipeline(x.pipeline),e.setBindGroup(0,ut(i,x,[{binding:11,resource:{kind:`textureView`,value:V(a,m)}},{binding:9,resource:{kind:`textureView`,value:V(a,l.previousSurface)}},{binding:10,resource:{kind:`textureView`,value:V(a,l.outputSurface)}},{binding:8,resource:{kind:`buffer`,value:{buffer:dt(a,t.view),size:N}}},{binding:0,resource:{kind:`textureView`,value:V(a,p.view)}},{binding:1,resource:{kind:`textureView`,value:V(a,n)}},{binding:2,resource:{kind:`textureView`,value:V(a,r)}},{binding:3,resource:{kind:`textureView`,value:V(a,l.previousHistory)}},{binding:4,resource:{kind:`textureView`,value:V(a,u)}},{binding:5,resource:{kind:`textureView`,value:V(a,l.outputHistory)}},{binding:6,resource:{kind:`buffer`,value:{buffer:dt(a,l.params)}}},...g===void 0?[]:[{binding:7,resource:{kind:`textureView`,value:V(a,g.view)}}]])),e.dispatchWorkgroups(Math.ceil(Math.max(1,t.width)/8),Math.ceil(Math.max(1,t.height)/8),1))}),!w.ok)return w;y.push(`ssr-temporal`)}if(v.length>1&&g!==void 0){let t=g,n=`ssr-reflection-mip-chain`,r=Rn(e,n,v.map((e,t)=>({resource:e,usage:t===0?`sampled-read`:t===v.length-1?`storage-write`:`sampled-storage-write`})),({pass:e,frame:n,resources:r})=>{let a=Ln(n,`temporal`);if(a!==void 0){S??=ct(n,a,`ssr_temporal`,[{binding:0,visibility:4,texture:{sampleType:`unfilterable-float`,viewDimension:`2d`}},{binding:7,visibility:4,storageTexture:{access:`write-only`,format:`rgba16float`,viewDimension:`2d`}}],`ssr_reflection_mip`),e.setPipeline(S.pipeline);for(let a=1;a<v.length;a++){let o=v[a-1],s=v[a];if(o===void 0||s===void 0)throw B(`SSR reflection mip chain`);e.setBindGroup(0,ut(n,S,[{binding:0,resource:{kind:`textureView`,value:V(r,o)}},{binding:7,resource:{kind:`textureView`,value:V(r,s)}}])),e.dispatchWorkgroups(Math.ceil(i(t.width,a)/8),Math.ceil(i(t.height,a)/8),1)}}});if(!r.ok)return r;y.push(n)}return o({enabled:!0,passNames:Object.freeze(y),resources:{...f.value,...g===void 0?{}:{resolved:g},..._===void 0?{}:{radiancePyramid:_}},trace:Fn(),reactivity:h,reactivitySurface:{width:Math.max(1,Math.floor(t.width/2)),height:Math.max(1,Math.floor(t.height/2)),format:l===void 0?`r32float`:`rgba8unorm`}})}function Bn(e,t){let n=Math.min(64,t.size.height),r=e.createTexture(`subsurface-delta`,{size:{width:t.size.width,height:n},format:`rgba32float`,domain:`linear-hdr`});if(!r.ok)return r;let i=e.view(r.value,{dimension:`2d`});if(!i.ok)return i;let a=[t.diffuse.view,t.profiles,t.normal,t.depth,i.value],s,c;for(let r=0;r<t.size.height;r+=n){let o=r===0?``:`-${r}`,u=Math.min(n,t.size.height-r),d=e.createBuffer(`subsurface-params-${r}`,{size:32});if(!d.ok)return d;let f=e.addCopyPass(`subsurface-prepare${o}`,{accesses:[{resource:d.value,usage:`copy-dst`}],encode:({frame:e,resources:n})=>{let i=e.camera;e.runtime.device.queue.writeBuffer(n.buffer(d.value).unwrap(),0,new Float32Array([i.near,i.far,+(i.projection===`orthographic`),t.quality===`low`?2:3,t.scale[0],t.scale[1],r,u])).unwrap()}});if(!f.ok)return f;let p=e.addComputePass(`subsurface-diffusion${o}`,{accesses:[...a.slice(0,4).map(e=>({resource:e,usage:`sampled-read`})),{resource:i.value,usage:`storage-write`},{resource:d.value,usage:`uniform-read`}],encode:({pass:e,frame:n,resources:r})=>{let i=n,o=n.runtime.device;if(s===void 0){let e=i.runtime.standardDeferredShaders?.subsurface;if(e===void 0)throw new l({code:`shader-compile-failed`,expected:`cooked Standard subsurface diffusion shader`,hint:`rebuild shared shader inputs and initialize the Renderer`});let t=n.runtime.shaderModuleFactory?.createShaderModule({code:e,label:`forgeax::engine-subsurface-diffusion`}).unwrap();if(t===void 0)throw new l({code:`rhi-not-available`,expected:`subsurface shader module factory`,hint:`initialize the Renderer backend`});let r=o.createBindGroupLayout({entries:[...[0,1,2,3].map(e=>({binding:e,visibility:4,texture:{sampleType:e===1||e===2?`uint`:e===3?`depth`:`unfilterable-float`,viewDimension:`2d`}})),{binding:4,visibility:4,buffer:{type:`uniform`,minBindingSize:32}},{binding:5,visibility:4,storageTexture:{access:`write-only`,format:`rgba32float`,viewDimension:`2d`}}]}).unwrap();s={pipeline:o.createComputePipeline({label:`subsurface-diffusion`,layout:o.createPipelineLayout({bindGroupLayouts:[r]}).unwrap(),compute:{module:t,entryPoint:`cs_subsurface`}}).unwrap(),layout:r,groups:new WeakMap}}let c=a.map(e=>r.textureView(e).unwrap()),f=r.buffer(d.value).unwrap(),p=s,m=D(p.groups,[...c,f],`subsurface`,()=>o.createBindGroup({layout:p.layout,entries:[...c.map((e,t)=>({binding:t<4?t:5,resource:{kind:`textureView`,value:e}})),{binding:4,resource:{kind:`buffer`,value:{buffer:f}}}]}).unwrap(),i.bindGroupCounts);e.setPipeline(p.pipeline),e.setBindGroup(0,m),e.dispatchWorkgroups(Math.ceil(t.size.width/8),Math.ceil(u/8),1)}});if(!p.ok)return p;let m=e.addRasterPass(`subsurface-compose${o}`,{accesses:[{resource:i.value,usage:`sampled-read`},{resource:d.value,usage:`uniform-read`},{resource:t.scene.view,usage:`color-attachment`}],colorAttachments:[{view:t.scene.view,loadOp:`load`,storeOp:`store`}],encode:({pass:e,frame:n,resources:a})=>{let o=n,s=n.runtime.device;if(c===void 0){let e=o.runtime.standardDeferredShaders?.subsurface,r=n.runtime.shaderModuleFactory;if(e===void 0||r===void 0)throw new l({code:`shader-compile-failed`,expected:`cooked Standard subsurface composition shader and module factory`,hint:`rebuild shared shader inputs and initialize the Renderer`});let i=r.createShaderModule({code:e,label:`forgeax::engine-subsurface-diffusion`}).unwrap(),a=s.createBindGroupLayout({entries:[{binding:4,visibility:2,buffer:{type:`uniform`,minBindingSize:32}},{binding:6,visibility:2,texture:{sampleType:`unfilterable-float`,viewDimension:`2d`}}]}).unwrap();c={pipeline:s.createRenderPipeline({label:`subsurface-compose`,layout:s.createPipelineLayout({bindGroupLayouts:[a]}).unwrap(),vertex:{module:i,entryPoint:`vs_subsurface`,buffers:[]},fragment:{module:i,entryPoint:`fs_subsurface`,targets:[{format:t.scene.format,blend:{color:{operation:`add`,srcFactor:`one`,dstFactor:`one`},alpha:{operation:`add`,srcFactor:`zero`,dstFactor:`one`}}}]},primitive:{topology:`triangle-list`}}).unwrap(),layout:a,groups:new WeakMap}}let f=a.textureView(i.value).unwrap(),p=a.buffer(d.value).unwrap(),m=c,h=D(m.groups,[f,p],`subsurface-compose`,()=>s.createBindGroup({layout:m.layout,entries:[{binding:4,resource:{kind:`buffer`,value:{buffer:p,size:32}}},{binding:6,resource:{kind:`textureView`,value:f}}]}).unwrap(),o.bindGroupCounts);e.setPipeline(m.pipeline),e.setBindGroup(0,h),e.setScissorRect(0,r,t.size.width,u),e.draw(3)}});if(!m.ok)return m}return o(void 0)}var Vn={format:`rgba16float`,size:`surface`,sampleCount:1,usage:1},Hn={format:`depth32float-stencil8`,size:`surface`,sampleCount:1};function Un(e,t){let n=F(e,`standard-scene-coverage`,{...Vn,size:{width:t.outputWidth,height:t.outputHeight}});if(!n.ok)return n;let r=F(e,`standard-scene-coverage-depth`,{...Hn,size:{width:t.outputWidth,height:t.outputHeight}});return r.ok?o({coverage:n.value,depth:r.value,outputWidth:t.outputWidth,outputHeight:t.outputHeight}):r}function Wn(e,t,n){return L(e,{name:`standard-scene-coverage`,...n===void 0?{}:{gpuDriven:n,gpuDrivenFilter:`opaque`},color:t.coverage,colorTargets:[t.coverage],depth:t.depth,selector:ie,recordMode:`opaque`,passKind:`temporal`,clearColor:[0,0,-1,3],depthLoadOp:`clear`})}function Gn(e){return e.transmissionDemand??{activeCount:0,needsRoughMips:!1}}function Kn(e,t){let n=Gn(e),r={activeCount:n.activeCount+ +(e.singleLayerMedium===!0),needsRoughMips:n.needsRoughMips},i=qn({demand:n,sourceSampleCount:t}).active;return{demand:n,backdropDemand:r,transmissionActive:i,backdropActive:qn({demand:r,sourceSampleCount:t}).active,sorted:i&&e.transparency?.weightedBlended!==!0&&e.singleLayerMedium!==!0}}function qn(e){if(e.demand.activeCount===0)return{active:!1,sourceSampleCount:e.sourceSampleCount,copyCount:0,mipCount:0,submitCount:1,aliasCount:0,phases:[]};let t=[`opaque-resolve`,`transmission-backdrop-copy`];return e.demand.needsRoughMips&&t.push(`transmission-backdrop-mip`),t.push(`transmission-forward`,`transparent`,`temporal`),{active:!0,sourceSampleCount:e.sourceSampleCount,copyCount:1,mipCount:+!!e.demand.needsRoughMips,submitCount:1,aliasCount:0,phases:t}}function Jn(e,t=`rgba16float`){let n=t===`rgba16float`?e.caps.rgba16floatRenderable:t===`rgba32float`&&e.caps.float32Filterable&&e.features.has(`float32-filterable`)&&e.features.has(`float32-blendable`),r=n?e.createTexture({label:`transmission-capability-probe`,size:{width:2,height:2,depthOrArrayLayers:1},format:t,usage:21,mipLevelCount:2,sampleCount:1,dimension:`2d`,textureBindingViewDimension:`2d`}):void 0,i=!1,a=!1,o=!1,s=!1,c=!1,l=!1,u=!1;if(r?.ok===!0){i=!0,o=!0;let t=e.createTextureView(r.value,{baseMipLevel:0,mipLevelCount:1}),n=e.createTextureView(r.value,{baseMipLevel:1,mipLevelCount:1});a=t.ok,s=t.ok,c=n.ok,l=e.createSampler({minFilter:`linear`,magFilter:`linear`,mipmapFilter:`linear`}).ok,u=e.createBindGroupLayout({label:`transmission-capability-probe`,entries:[{binding:0,visibility:2,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:1,visibility:2,sampler:{type:`filtering`}}]}).ok,e.destroyTexture(r.value)}return{format:t,renderAttachment:n&&a,copySrc:o,textureBinding:s,mipView:c,filteringSampler:l,bindGroupLayout:u,msaaResolve:n&&a,resourceCreation:i}}function Yn(e){let t=[];e.format!==`rgba16float`&&e.format!==`rgba32float`&&t.push(`format`);for(let n of[`renderAttachment`,`copySrc`,`textureBinding`,`mipView`,`filteringSampler`,`bindGroupLayout`,`msaaResolve`,`resourceCreation`])e[n]||t.push(n);return t.length===0?{ok:!0,missing:[]}:{ok:!1,missing:t}}function Xn(e,t){return e.activeCount===t.activeCount&&e.needsRoughMips===t.needsRoughMips&&e.needsBackPass===t.needsBackPass}function Zn(e){return{...e,extent:{...e.extent}}}function Qn(e,t){return t===void 0||e!==void 0&&e.deviceGeneration===t.deviceGeneration&&e.format===t.format&&e.mipCount===t.mipCount&&e.extent.width===t.extent.width&&e.extent.height===t.extent.height}var $n=class{generation=0;demand={activeCount:0,needsRoughMips:!1};capability={ok:!0,missing:[]};lifecycle=`inactive`;lastKnownGood=!1;recovery=`idle`;resource;admit(e,t,n){let r=Yn(t);if(this.capability=r,!r.ok){let t=this.lastKnownGood&&Xn(this.demand,e)&&Qn(this.resource,n);return!t&&this.lastKnownGood&&(this.resource=void 0,this.lastKnownGood=!1),this.lifecycle=t?`resident`:`failed`,this.recovery=t?`compatible-lkg`:`rebuild-required`,{ok:!1,published:!1,generation:this.generation,demand:this.demand,missing:r.missing}}return this.generation+=1,this.demand=e,this.resource=n===void 0?void 0:Zn(n),this.lastKnownGood=e.activeCount>0&&n!==void 0,this.lifecycle=e.activeCount>0?`resident`:`inactive`,this.recovery=this.generation===1?`idle`:`recovered`,{ok:!0,published:!0,generation:this.generation,demand:e}}inspect(){return{generation:this.generation,demand:this.demand}}markDeviceLost(){this.resource=void 0,this.lastKnownGood=!1,this.lifecycle=this.demand.activeCount>0?`device-lost`:`inactive`,this.recovery=this.demand.activeCount>0?`rebuild-required`:`idle`}markRecoveryStarted(){this.resource=void 0,this.lastKnownGood=!1,this.lifecycle=this.demand.activeCount>0?`recovering`:`inactive`,this.recovery=this.demand.activeCount>0?`rebuild-required`:`idle`}inspectLifecycle(){return{generation:this.generation,demand:{...this.demand},capability:this.capability.ok?{ok:!0,missing:[]}:{ok:!1,missing:[...this.capability.missing]},lifecycle:this.lifecycle,lastKnownGood:this.lastKnownGood,recovery:this.recovery,...this.resource===void 0?{}:{resource:Zn(this.resource)}}}};function er(){return new z({code:`resource-descriptor-invalid`,expected:`rough transmission mip generation to use the existing fullscreen/downsample owner`,hint:`provide encodeRoughMip from the renderer-owned downsample path before enabling rough transmission`,detail:{resourceLabel:`transmission-backdrop`,field:`roughMipEncoder`,expected:`renderer-owned fullscreen/downsample encoder`,actual:`missing`}})}function tr(e){let t=qn({demand:e.demand,sourceSampleCount:e.source.sampleCount});if(!t.active)return o({topology:t,backdrop:void 0,mipViews:[]});if(t.mipCount>0&&e.encodeRoughMip===void 0)return n(er());let r=e.name??`transmission-backdrop`,s=t.mipCount===0?1:a(e.copySize),c=F(e.graph,r,{format:e.source.format,size:e.surfaceSize,sampleCount:1,mipLevelCount:s});if(!c.ok)return c;let l=e.graph.view(c.value.texture,{label:`${r}.mip-0`,baseMipLevel:0,mipLevelCount:1});if(!l.ok)return l;let u=[l.value];for(let t=1;t<s;t+=1){let n=e.graph.view(c.value.texture,{label:`${r}.mip-${t}`,baseMipLevel:t,mipLevelCount:1});if(!n.ok)return n;u.push(n.value)}let d=e.graph.addCopyPass(`${r}-copy`,{accesses:[{resource:e.source.view,usage:`copy-src`},{resource:l.value,usage:`copy-dst`}],encode:({encoder:t,resources:n})=>{let r=n.texture(e.source.texture),i=n.texture(c.value.texture);if(!r.ok)throw r.error;if(!i.ok)throw i.error;t.copyTextureToTexture({texture:r.value,mipLevel:0,origin:{x:0,y:0,z:0}},{texture:i.value,mipLevel:0,origin:{x:0,y:0,z:0}},{...e.copySize,depthOrArrayLayers:1})}});if(!d.ok)return d;if(t.mipCount>0){let t=e.encodeRoughMip;if(t===void 0)return n(er());let a=t=>({width:i(e.surfaceSize.width,t),height:i(e.surfaceSize.height,t)}),o=e.graph.createTexture(`${r}-scratch`,{format:c.value.format,size:a(1),sampleCount:1,mipLevelCount:s-1});if(!o.ok)return o;for(let i=1;i<u.length;i+=1){let s=u[i-1],l=u[i];if(s===void 0||l===void 0)return n(new z({code:`resource-descriptor-invalid`,expected:`every rough transmission mip level to have a graph view`,hint:`rebuild the backdrop mip chain before adding its raster passes`,detail:{resourceLabel:r,field:`mipViews`,expected:`mip views for level ${i-1} and ${i}`,actual:`missing`}}));let d=e.graph.view(o.value,{label:`${r}-scratch.mip-${i-1}`,baseMipLevel:i-1,mipLevelCount:1});if(!d.ok)return d;let f=e.graph.addRasterPass(i===1?`${r}-mip`:`${r}-mip-${i}`,{accesses:[{resource:s,usage:`sampled-read`},{resource:d.value,usage:`color-attachment`}],colorAttachments:[{view:d.value,clearValue:{r:0,g:0,b:0,a:1},loadOp:`clear`,storeOp:`store`}],encode:({pass:e,frame:n,resources:r})=>t({pass:e,frame:n,resources:r,source:s,destination:d.value,format:c.value.format,level:i})});if(!f.ok)return f;let p=e.graph.addCopyPass(`${r}-mip-copy-${i}`,{accesses:[{resource:d.value,usage:`copy-src`},{resource:l,usage:`copy-dst`}],encode:({encoder:e,resources:t})=>{let n=t.texture(o.value),r=t.texture(c.value.texture);if(!n.ok)throw n.error;if(!r.ok)throw r.error;e.copyTextureToTexture({texture:n.value,mipLevel:i-1,origin:{x:0,y:0,z:0}},{texture:r.value,mipLevel:i,origin:{x:0,y:0,z:0}},{...a(i),depthOrArrayLayers:1})}});if(!p.ok)return p}}if(e.includeConsumerPasses!==!1){let t=e.graph.addRasterPass(`transmission-forward`,{accesses:[{resource:l.value,usage:`sampled-read`},{resource:e.source.view,usage:`color-attachment`}],colorAttachments:[{view:e.source.view,loadOp:`load`,storeOp:`store`}],encode:()=>void 0});if(!t.ok)return t;for(let t of[`transparent`,`temporal`]){let n=e.graph.addRasterPass(t,{accesses:[{resource:e.source.view,usage:`color-attachment`}],colorAttachments:[{view:e.source.view,loadOp:`load`,storeOp:`store`}],encode:()=>void 0});if(!n.ok)return n}}return o({topology:t,backdrop:c.value,mipViews:u})}function nr(e,t){return e.addRasterPass(`temporal`,{accesses:[{resource:t.view,usage:`color-attachment`}],colorAttachments:[{view:t.view,loadOp:`load`,storeOp:`store`}],encode:()=>void 0})}function rr(e,t,n){if(t.length===0)return o(void 0);let r=Math.max(...t.map(e=>e.size)),i=`shadow-variance`,a={format:`rg16float`,size:{width:r,height:r,depthOrArrayLayers:8},usage:we},s=n===void 0?e.createTexture(i,a):e.importTexture(i,a,()=>n.texture(i,r,8,`rg16float`));if(!s.ok)return s;let c=e.view(s.value,{dimension:`2d-array`,arrayLayerCount:8});if(!c.ok)return c;let u={texture:s.value,view:c.value,format:`rg16float`,sampleCount:1},d=e.createBuffer(`shadow-variance-params`,{size:t.length*256});if(!d.ok)return d;let f=(e,t)=>{let n=e.shadowUpdatePolicy?.(t),i=n?.viewport??[t.size,t.size],a=n?.blur?.radius??1,o=n?.blur?.samples??8;if(!Number.isInteger(o)||o<1||o>64||!Number.isFinite(a)||a<0)throw new l({code:`webgpu-runtime-error`,expected:`variance shadow radius >= 0 and blur samples integer in [1,64]`,hint:`repair the light shadow filter parameters`});let s=new ArrayBuffer(32);return new Float32Array(s).set([i[0],i[1],a]),new Uint32Array(s)[3]=o,new Float32Array(s)[4]=t.size/r,new Uint8Array(s)},p=e.addCopyPass(`shadow-variance-prepare`,{accesses:[{resource:d.value,usage:`copy-dst`}],encode:({frame:e,resources:n})=>{if(e.pipelineState.extendedLightingAvailable!==!0)throw new l({code:`webgpu-runtime-error`,expected:`variance shadow sampled-texture capacity`,hint:`use a device with the extended lighting texture budget`});let r=n.buffer(d.value).unwrap();for(let[n,i]of t.entries())e.runtime.device.queue.writeBuffer(r,n*256,f(e,i)).unwrap()}});if(!p.ok)return p;let m;for(let[r,a]of t.entries()){let t=a.kind===`directional`?a.index:a.index+4,o=e.view(s.value,{dimension:`2d`,baseArrayLayer:t,arrayLayerCount:1});if(!o.ok)return o;let c=F(e,`shadow-variance-${t}-vertical`,{format:`rg16float`,size:{width:a.size,height:a.size}});if(!c.ok)return c;let u=!0,f=!1;for(let s of[`vertical`,`horizontal`]){let p=s===`vertical`?c.value.view:o.value,h=e.addRasterPass(`shadow-variance-${t}-${s}`,{accesses:[{resource:a.depth.view,usage:`sampled-read`},...s===`horizontal`?[{resource:c.value.view,usage:`sampled-read`}]:[],{resource:d.value,usage:`uniform-read`},{resource:p,usage:`color-attachment`}],colorAttachments:[{view:p,loadOp:`clear`,storeOp:`store`,clearValue:{r:1,g:0,b:0,a:1}}],executeIf:e=>(s===`vertical`&&(f=(n===void 0?u:!n.retained(i,t))||a.rastered()||e.shadowUpdatePolicy?.(a)?.auto===!0,u=!1),f),encode:({pass:e,frame:o,resources:u})=>{let f=o,p=o.runtime.device;if(m===void 0){let e=f.runtime.standardDeferredShaders?.shadowVariance,t=o.runtime.shaderModuleFactory;if(e===void 0||t===void 0)throw new l({code:`webgpu-runtime-error`,expected:`cooked variance shadow shader`,hint:`rebuild the Engine shader manifest`});let n=t.createShaderModule({code:e,label:`forgeax::engine-shadow-variance`}).unwrap(),r=p.createBindGroupLayout({entries:[{binding:0,visibility:2,buffer:{type:`uniform`,hasDynamicOffset:!0,minBindingSize:32}},{binding:1,visibility:2,texture:{sampleType:`depth`,viewDimension:`2d`}},{binding:2,visibility:2,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:3,visibility:2,sampler:{type:`filtering`}}]}).unwrap(),a=p.createPipelineLayout({bindGroupLayouts:[r]}).unwrap(),s=e=>p.createRenderPipeline({label:`${i}-${e}`,layout:a,vertex:{module:n,entryPoint:`vs_main`,buffers:[]},fragment:{module:n,entryPoint:`fs_${e}`,targets:[{format:`rg16float`}]},primitive:{topology:`triangle-list`}}).unwrap();m={layout:r,vertical:s(`vertical`),horizontal:s(`horizontal`),groups:new WeakMap}}let h=u.buffer(d.value).unwrap(),g=u.textureView(a.depth.view).unwrap(),_=s===`horizontal`?u.textureView(c.value.view).unwrap():o.pipelineState.defaultWhiteTextureView,v=o.pipelineState.defaultSampler,y=m.layout,b=D(m.groups,[h,g,_,v],i,()=>p.createBindGroup({layout:y,entries:[{binding:0,resource:{kind:`buffer`,value:{buffer:h,size:32}}},{binding:1,resource:{kind:`textureView`,value:g}},{binding:2,resource:{kind:`textureView`,value:_}},{binding:3,resource:{kind:`sampler`,value:v}}]}).unwrap(),f.bindGroupCounts);e.setPipeline(m[s]),e.setBindGroup(0,b,[r*256]),e.draw(3,1,0,0),s===`horizontal`&&n?.rastered(i,t)}});if(!h.ok)return h}}return o(u)}function ir(e,t){let n=e,r=n.gpuDrivenShadowViews;if(t.terrainReceiver!==void 0){let e={kind:`directional`,index:t.index},i=r?.invalidationReason(e);if(i!==void 0)return i;let a=r?.invalidationReason({...e,layer:`static`});return(a===`uncached`?void 0:a)??n.directionalShadowCacheMiss}if(r!==void 0)return r.invalidationReason(t);if(t.kind!==`directional`)return`uncached`;let i=n.directionalShadowCascadeMiss;return i!==void 0&&t.index<i.length?i[t.index]:n.directionalShadowCacheMiss}var ar=new WeakMap;function or(e){let t=ar.get(e);return t==null?void 0:(e,n)=>t.get(Ie(n))?.(e)??!0}function sr(e,t,n){let r=ar.get(e);r!==null&&(t.terrainReceiver===void 0?(r===void 0&&(r=new Map,ar.set(e,r)),r.set(Ie(t),n)):ar.set(e,null))}function cr(e,t,n,r){let i=!0,a=-1,o,s,c=(e,a)=>{let o=r===void 0?i:!r.retained(),s=e,c=t===void 0?void 0:s.shadowUpdatePolicy?.(t);if(!(t?.kind===`point`&&c?.auto===!1&&s.frameState.shadowRaster.hasRevision(t,c.revision))){if(!o&&t!==void 0&&c!==void 0){if(!s.frameState.shadowRaster.hasRevision(t,c.revision))return`source-changed`;if(!c.auto)return}return o||i&&t?.layer!==`static`?`graph-compiled`:t===void 0?void 0:n===void 0?ir(e,t)??a:`feature-draws`}};return t!==void 0&&sr(e,t,e=>c(e)!==void 0),{reasonFor:c,dirtyRects:()=>s,reason:()=>o,executeIf:(e,n)=>{let l=c(e,n);i=!1,o=l,l!==void 0&&r?.rastered();let u=e;return s=t===void 0||t.terrainReceiver!==void 0||l===void 0||l===`graph-compiled`?void 0:u.gpuDrivenShadowViews?.dirtyRects(t),a=t===void 0?-1:u.frameState.shadowRaster.evaluate(t,l,u.gpuDrivenShadowViews?.texelCulled(t),u.gpuDrivenShadowViews?.cameraCulled(t),s?.length,u.shadowUpdatePolicy?.(t)?.revision),l!==void 0},encode:(e,t,n,r)=>{a<0?n(t):e.frameState.shadowRaster.encode(a,t,n,r)}}}var lr=2,ur=4;function dr(e,t,n,r){return F(e,t,{format:`depth32float`,size:{width:n,height:n,depthOrArrayLayers:r}},{dimension:`2d-array`,aspect:`depth-only`,arrayLayerCount:r})}function fr(e,t,n,r,i){let a={label:n,dimension:`2d`,aspect:`depth-only`,baseArrayLayer:r,arrayLayerCount:1},s=i===void 0?e.view(t.texture,a):e.importView(t.texture,a,i);return s.ok?o({texture:t.texture,view:s.value,format:t.format,sampleCount:1}):s}function pr(e,t,n,r,i){if(t===void 0)return dr(e,n,r,i);let a=e.importTexture(n,{format:`depth32float`,size:{width:r,height:r,depthOrArrayLayers:i},usage:we},()=>t.texture(n,r,i));if(!a.ok)return a;let s=e.importView(a.value,{label:`${n}.view`,dimension:`2d-array`,aspect:`depth-only`,arrayLayerCount:i},()=>t.view(n));return s.ok?o({texture:a.value,view:s.value,format:`depth32float`,sampleCount:1}):s}function U(e,t,n,r,i,a=[],o=`clear`){return e.addRasterPass(t,{accesses:[{resource:n.view,usage:`depth-stencil-write`},...a],colorAttachments:[],depthStencilAttachment:{view:n.view,depthLoadOp:o,depthStoreOp:`store`,depthClearValue:0},executeIf:r.executeIf,encode:({pass:e,frame:n,resources:a})=>r.encode(n,e,e=>i(e,n,a),t)})}function mr(e){return e?.ok===!0&&e.value?.graphResources!==void 0?rt(e.value.graphResources):[]}function hr(e,t,n,r,i,a,s,c,l,u,d,f,p,m=!1){let h=Object.freeze({...n,layer:`static`}),g=t(h);if(!g.ok)return g;let _=fr(e,a,`${r}-static-layer`,l,s===void 0?void 0:()=>s.view(c,l));if(!_.ok)return _;let v=cr(e,h,void 0,gr(s,c,l));sr(e,n,e=>d.reasonFor(e,v.reasonFor(e)===`graph-compiled`?`static-layer-changed`:void 0)!==void 0);let y=U(e,`${r}.static`,_.value,{executeIf:e=>v.executeIf(e)&&v.dirtyRects()===void 0,encode:v.encode},(e,t)=>he(t,e,n,void 0,m),mr(g));if(!y.ok)return y;let b=U(e,`${r}.static-partial`,_.value,{executeIf:()=>v.dirtyRects()!==void 0,encode:v.encode},(e,t)=>he(t,e,n,{rects:v.dirtyRects()??[],size:u},m),mr(g),`load`);if(!b.ok)return b;let x=!1,S=e.addCopyPass(`${r}.static-copy`,{accesses:[{resource:_.value.view,usage:`copy-src`},{resource:i.view,usage:`copy-dst`}],executeIf:e=>(x=d.executeIf(e,v.reason()===`graph-compiled`?`static-layer-changed`:void 0),x),encode:({encoder:e,resources:t})=>{let n=t.texture(a.texture);if(!n.ok)throw n.error;let r=t.texture(i.texture);if(!r.ok)throw r.error;e.copyTextureToTexture({texture:n.value,mipLevel:0,origin:{x:0,y:0,z:l}},{texture:r.value,mipLevel:0,origin:{x:0,y:0,z:l}},{width:u,height:u,depthOrArrayLayers:1})}});if(!S.ok)return S;let C=U(e,r,i,{executeIf:()=>x,encode:d.encode},f,p,`load`);return C.ok?o(v):C}function gr(e,t,n){if(e!==void 0)return{retained:()=>e.retained(t,n),rastered:()=>e.rastered(t,n)}}function _r(e,t,n,r){return e===void 0?void 0:i=>e.encode(t,n,r,i)}function vr(e,t){return[...mr(e),...t?.accesses??[]]}function yr(e,t,n,r,i,a){return t.projectGpuDrivenShadow===void 0||!n?o(void 0):pr(e,t.staticLayers,r,i,a)}function br(e,t,n,r,i,a,s,c){let{projectGpuDrivenShadow:l,shadowFeatures:u,reuseAdjacentShadow:d}=t,f=Object.freeze({kind:`directional`,index:a}),p=l?.(f,t.cameraPyramid);if(p!==void 0&&!p.ok)return p;let m=fr(e,n,`directional-shadow-cascade-${a}`,a);if(!m.ok)return m;let h=cr(e,f,u,gr(t.depthLayers,`directional-shadow-depth`,a));c&&s.push({kind:`directional`,index:a,depth:m.value,size:i,rastered:()=>h.reason()!==void 0});let g=(e,t,n)=>ke(t,e,a,_r(u,e,t,n),void 0,d),_=vr(p,u),v=l!==void 0&&r!==void 0?hr(e,l,f,`shadowCascade${a}`,m.value,r,t.staticLayers,`directional-shadow-static`,a,i,h,g,_,d):U(e,`shadowCascade${a}`,m.value,h,g,_);return v.ok?o({accesses:_,staticRaster:v.value??void 0}):v}function xr(e,t,n,r,i,a,o,s,c){let{shadowFeatures:l,reuseAdjacentShadow:u}=t,d=`shadowCascade${s}.terrain-${a.worldId}-${a.entityKey}`,f=fr(e,n,`${d}.depth`,o);if(!f.ok)return f;let p=cr(e,Object.freeze({kind:`directional`,index:s,terrainReceiver:a}),l,gr(t.depthLayers,`directional-shadow-depth`,o)),m=(e,t,n)=>ke(t,e,s,_r(l,e,t,n),a,u);if(r===void 0)return U(e,d,f.value,p,m,c?.accesses??[]);let h=!1,g=fr(e,r,`${d}.gpu-static`,s);if(!g.ok)return g;let _=e.addCopyPass(`${d}.static-copy`,{accesses:[{resource:g.value.view,usage:`copy-src`},{resource:f.value.view,usage:`copy-dst`}],executeIf:e=>{let t=c?.staticRaster?.reason()!==void 0;return h=p.executeIf(e,t?`static-layer-changed`:void 0),h},encode:({encoder:e,resources:t})=>{let a=t.texture(r.texture);if(!a.ok)throw a.error;let c=t.texture(n.texture);if(!c.ok)throw c.error;e.copyTextureToTexture({texture:a.value,origin:{x:0,y:0,z:s}},{texture:c.value,origin:{x:0,y:0,z:o}},{width:i,height:i,depthOrArrayLayers:1})}});return _.ok?U(e,d,f.value,{executeIf:()=>h,encode:p.encode},m,c?.accesses??[],`load`):_}function Sr(e,t){return e.addCopyPass(`directional-shadow-observation`,{accesses:[{resource:t.view,usage:`copy-src`}],encode:({frame:e,resources:n})=>{let r=e,i=n.texture(t.texture);if(!i.ok)throw i.error;r.pipelineState.perPassResources.shadowTexture=i.value}})}function Cr(e,t,n,r,i){let{mapSize:a,cascadeCount:s,staticLayer:c=!0,terrainReceivers:l=[]}=n,u=pr(e,r.depthLayers,`directional-shadow-depth`,a,Math.max(lr,s*(1+l.length)));if(!u.ok)return u;let d=u.value,f=yr(e,r,c,`directional-shadow-static`,a,Math.max(lr,s));if(!f.ok)return f;let p=f.value,m=t.variance?.directional===!0,h=[];for(let t=0;t<s;t+=1){let n=br(e,r,d,p,a,t,i,m);if(!n.ok)return n;h.push(n.value)}for(let[t,n]of l.entries())for(let i=0;i<s;i+=1){let o=xr(e,r,d,p,a,n,s*(t+1)+i,i,h[i]);if(!o.ok)return o}let g=Sr(e,d);return g.ok?o(d):g}function wr(e,t){return e.importTexture(`point-shadow-atlas`,{format:`depth32float`,size:{width:t,height:t,depthOrArrayLayers:24},usage:22},e=>{let t=e.frameState.pointShadowAtlas?.getTexture();if(t==null)throw new T;return t})}function Tr(e,t,n,r,i,a,o){let{projectGpuDrivenShadow:s,shadowFeatures:c,reuseAdjacentShadow:l}=t,u=s?.({kind:`point`,index:a,face:o});if(u!==void 0&&!u.ok)return u;let d=Object.freeze({kind:`point`,index:a,face:o}),f=e.view(n,{label:`point-shadow-${a}-${o}`,dimension:`2d`,aspect:`depth-only`,baseArrayLayer:a*6+o,arrayLayerCount:1});if(!f.ok)return f;let p={texture:n,view:f.value},m=cr(e,d,c),h=(e,t,n)=>je(t,e,a,o,_r(c,e,t,n),l),g=vr(u,c),_=`point-shadow-${a}-${o}`;return s!==void 0&&r!==void 0?hr(e,s,d,_,p,r,t.staticLayers,`point-shadow-static`,a*6+o,i,m,h,g,l):U(e,_,p,m,h,g)}function Er(e,t,n){let r=wr(e,t.pointFaceSize);if(!r.ok)return r;let i=e.view(r.value,{label:`point-shadow-atlas.cube-array`,dimension:`cube-array`,aspect:`depth-only`,arrayLayerCount:24});if(!i.ok)return i;let a={texture:r.value,view:i.value,format:`depth32float`,sampleCount:1},s=yr(e,n,!0,`point-shadow-static`,t.pointFaceSize,t.pointCount*6);if(!s.ok)return s;for(let i=0;i<t.pointCount;i+=1)for(let a=0;a<6;a+=1){let o=Tr(e,n,r.value,s.value,t.pointFaceSize,i,a);if(!o.ok)return o}return o(a)}function Dr(e,t,n,r,i,a,o){let{projectGpuDrivenShadow:s,shadowFeatures:c,reuseAdjacentShadow:l}=n,u=Object.freeze({kind:`spot`,index:a}),d=s?.(u,n.cameraPyramid);if(d!==void 0&&!d.ok)return d;let f=fr(e,r,`spot-shadow-layer-${a}`,a);if(!f.ok)return f;let p=t.spotCount===0?`spot-shadow`:`spot-shadow-${a}`,m=cr(e,t.spotCount>0?u:void 0,c,gr(n.depthLayers,`spot-shadow-depth`,a));t.variance?.spots.includes(a)&&o.push({kind:`spot`,index:a,depth:f.value,size:t.spotMapSize,rastered:()=>m.reason()!==void 0});let h=(e,t,n)=>ge(t,e,a,_r(c,e,t,n),l),g=vr(d,c);return s!==void 0&&i!==void 0?hr(e,s,u,p,f.value,i,n.staticLayers,`spot-shadow-static`,a,t.spotMapSize,m,h,g,l):U(e,p,f.value,m,h,g)}function Or(e,t,n,r){let i=pr(e,n.depthLayers,`spot-shadow-depth`,t.spotCount===0?1:t.spotMapSize,ur);if(!i.ok)return i;let a=yr(e,n,t.spotCount>0,`spot-shadow-static`,t.spotMapSize,ur);if(!a.ok)return a;for(let o=0;o<Math.max(1,t.spotCount);o+=1){let s=Dr(e,t,n,i.value,a.value,o,r);if(!s.ok)return s}return i}function kr(e,t,n={}){let r=[],i;if(t.shadow.directional!==`disabled`){let a=Cr(e,t.shadow,t.shadow.directional,n,r);if(!a.ok)return a;i=a.value}let a;if(t.shadow.pointCount>0){let r=Er(e,t.shadow,n);if(!r.ok)return r;a=r.value}let s=Or(e,t.shadow,n,r);if(!s.ok)return s;let c=rr(e,r,n.depthLayers);return c.ok?o({directional:i,spot:s.value,point:a,moments:c.value}):c}function Ar(e,t,n,r){let i=e.importBuffer(`atmosphere-composition-view`,{size:N,usage:72},e=>e.pipelineState.viewUniformBuffer);if(!i.ok)return i;let a=[n,r.transmittance,r.multipleScattering,r.aerialPerspective,r.aerialTransmittance,r.distantSkyLight],s,c=e.addRasterPass(`atmosphere-opaque-composition`,{accesses:[...me(r.visibility),{resource:i.value,usage:`uniform-read`},...a.map(e=>({resource:e,usage:`sampled-read`})),{resource:t.view,usage:`color-attachment`}],colorAttachments:[{view:t.view,loadOp:`load`,storeOp:`store`}],encode:({frame:e,pass:n,resources:o})=>{let c=e.runtime.device;if(s===void 0){let n=e.atmosphereShaders?.compose,r=e.runtime.shaderModuleFactory;if(n===void 0||r===void 0)throw new l({code:`shader-compile-failed`,expected:`atmosphere composition program`,hint:`rebuild the shader manifest`});let i=r.createShaderModule({code:n,label:`atmosphere_compose`}).unwrap(),o=c.createBindGroupLayout({entries:[{binding:0,visibility:2,buffer:{type:`uniform`,minBindingSize:N}},...a.map((e,t)=>({binding:t+1,visibility:2,texture:{sampleType:t===0?`depth`:`float`,viewDimension:t===3||t===4?`3d`:`2d`}})),{binding:7,visibility:2,sampler:{type:`filtering`}}]}).unwrap(),u=c.createPipelineLayout({bindGroupLayouts:[o,Ae(c)]}).unwrap();s={layout:o,pipelines:[`extinction`,`inscatter`].map(e=>c.createRenderPipeline({label:`atmosphere-${e}`,layout:u,vertex:{module:i,entryPoint:`atmosphere_compose_vs`,buffers:[]},fragment:{module:i,entryPoint:`atmosphere_${e}_fs`,targets:[{format:t.format,blend:{color:{operation:`add`,srcFactor:e===`extinction`?`zero`:`one`,dstFactor:e===`extinction`?`src`:`one`},alpha:{operation:`add`,srcFactor:`zero`,dstFactor:`one`}}}]},primitive:{topology:`triangle-list`}}).unwrap()),sampler:c.createSampler({minFilter:`linear`,magFilter:`linear`}).unwrap()}}let u=c.createBindGroup({layout:s.layout,entries:[{binding:0,resource:{kind:`buffer`,value:{buffer:o.buffer(i.value).unwrap(),size:N}}},...a.map((e,t)=>({binding:t+1,resource:{kind:`textureView`,value:o.textureView(e).unwrap()}})),{binding:7,resource:{kind:`sampler`,value:s.sampler}}]}).unwrap();for(let t of s.pipelines)n.setPipeline(t),n.setBindGroup(0,u),n.setBindGroup(1,at(e,o.buffer(i.value).unwrap(),0,r.visibility.directional===void 0?void 0:o.textureView(r.visibility.directional).unwrap(),r.visibility.cloud===void 0?void 0:o.textureView(r.visibility.cloud).unwrap())),n.draw(3)}});return c.ok?o(void 0):c}var jr=[0,1,2,3];function Mr(e,t,n){if(e.length===0||t.length!==16||n.length!==3||!Array.from(n).every(Number.isFinite))return;let r=Array.from(t);if(!r.every(Number.isFinite))return;let i=1/0,a=1/0,o=-1/0,s=-1/0,c=[0,0,0,0],l=[0,0,0,0];for(let t of e){if(!t.min.every(Number.isFinite)||!t.max.every(Number.isFinite)||t.max.some((e,n)=>e<=(t.min[n]??e))||t.min.every((e,t)=>e<=(n[t]??e))&&t.max.every((e,t)=>e>=(n[t]??e)))return;for(let e=0;e<8;e++){let n=t[e&1?`max`:`min`][0],u=t[e&2?`max`:`min`][1],d=t[e&4?`max`:`min`][2],f=0;for(let e of jr){let t=0,i=0;for(let a=0;a<4;a++){let o=(r[a*4+e]??NaN)*(a===0?n:a===1?u:a===2?d:1);t+=o,i+=Math.abs(o)}if(i>3402823e32)return;c[f]=t,l[f++]=8*2**-23*(i+1)}let p=c[3]??NaN,m=l[3]??1/0;if(!(p>m)||!c.every(Number.isFinite)||p-(c[2]??1/0)<=m+(l[2]??1/0))return;let h=(c[0]??NaN)/p,g=(c[1]??NaN)/p,_=((l[0]??1/0)+Math.abs(h)*m)/(p-m),v=((l[1]??1/0)+Math.abs(g)*m)/(p-m);i=Math.min(i,(h-_)*.5+.5),o=Math.max(o,(h+_)*.5+.5),a=Math.min(a,.5-(g+v)*.5),s=Math.max(s,.5-(g-v)*.5)}}if([i,a,o,s].every(Number.isFinite))return[i,a,o,s]}function Nr(e,t,n,r,i){if(e===void 0||![t,n,r,i].every(e=>Number.isSafeInteger(e)&&e>0)||!e.every(Number.isFinite))return;let a=3*t/r+2,o=3*n/i+2,s=Math.max(0,Math.floor(e[0]*t-a)),c=Math.max(0,Math.floor(e[1]*n-o)),l=Math.min(t,Math.ceil(e[2]*t+a)),u=Math.min(n,Math.ceil(e[3]*n+o));if(!(l<=s||u<=c||s===0&&c===0&&l===t&&u===n))return[s,c,l-s,u-c]}function W(e){return new l({code:`rhi-not-available`,expected:`volumetric fog ${e} pipeline to be available`,hint:`construct the renderer through a backend pack with shader module support`})}function Pr(e,t){let n=e.volumetricFogShaders?.[t];if(n===void 0)throw W(`${t} shader source`);return n}function Fr(e){let t=e.runtime;if(t.shaderModuleFactory===void 0)throw W(`shader module factory`);return{device:t.device,deviceScope:t.deviceScope,shaderModuleFactory:t.shaderModuleFactory}}function Ir(e,t,n){let r=e.runtime.device.createBindGroup({layout:t,entries:n});if(!r.ok)throw r.error;return r.value}function Lr(e,t,r,i,a,s,c,l,u){let d=t.volumetricFog;if(d?.enabled!==!0||d.format===void 0||d.extent===void 0)return o(void 0);if(l===null||l.kind!==`storage`)return n(new z({code:`resource-descriptor-invalid`,expected:`volumetric fog consumes the Standard Cluster light buffers`,hint:`enable the storage-backed Standard Cluster transport before enabling volumetric fog`,detail:{resourceLabel:`volumetric-fog`,field:`clusterBuffers`,expected:`StandardClusterGraphBuffers`,actual:`missing`}}));let f=e.importTexture(`volume-density`,{format:d.format,size:{width:d.extent.width,height:d.extent.height,depthOrArrayLayers:d.extent.depth},dimension:`3d`,usage:4},e=>{let t=e.volumetricFog;if(t===void 0)throw W(`density residency`);return t.densityTexture});if(!f.ok)return f;let p=e.importView(f.value,{label:`volume-density.view`,dimension:`3d`},e=>{let t=e.volumetricFog;if(t===void 0)throw W(`density view residency`);return t.densityView});if(!p.ok)return p;let m=[];for(let[t,n]of(d.additional??[]).entries()){let r=e.importTexture(`volume-density-${t+1}`,{format:n.format,size:{width:n.extent.width,height:n.extent.height,depthOrArrayLayers:n.extent.depth},dimension:`3d`,usage:4},e=>{let n=e.volumetricFog?.additional?.[t];if(n===void 0)throw W(`local density residency`);return n.densityTexture});if(!r.ok)return r;let i=e.importView(r.value,{label:`volume-density-${t+1}.view`,dimension:`3d`},e=>{let n=e.volumetricFog?.additional?.[t];if(n===void 0)throw W(`local density view residency`);return n.densityView});if(!i.ok)return i;m.push(i.value)}let h=e.importBuffer(`volume-params`,{size:Wt,usage:72},e=>{let t=e.volumetricFog;if(t===void 0)throw W(`parameter residency`);return t.paramsBuffer});if(!h.ok)return h;let g=e.importBuffer(`volume-view`,{size:N,usage:72},e=>e.pipelineState.viewUniformBuffer);if(!g.ok)return g;let _;if(d.projector!==void 0){let t=e.importTexture(`spot-projector`,{format:`rgba8unorm-srgb`,size:{width:128,height:128,depthOrArrayLayers:1},dimension:`2d`,usage:4},e=>{let t=e.volumetricFog;if(t?.projectorTexture===void 0)throw W(`projector residency`);return t.projectorTexture});if(!t.ok)return t;let n=e.importView(t.value,{label:`spot-projector.view`,dimension:`2d`},e=>{let t=e.volumetricFog;if(t?.projectorView===void 0)throw W(`projector view residency`);return t.projectorView});if(!n.ok)return n;_=n.value}return o({linearHdr:r,sceneDepth:i,density:p.value,additionalDensities:m,params:h.value,view:g.value,...a===void 0?{}:{directionalShadow:a},spotShadow:s,lightData:l.lightData,clusterUniform:l.clusterUniform,selectedLightKind:c??`directional`,..._===void 0?{}:{projector:_},...u===void 0?{}:{cloudShadow:u}})}function Rr(e,t,n,r,i,a,s,c,l){let u=Lr(e,t,n,r,i,a,t.volumetricFog?.spotLightEntity===void 0?t.volumetricFog?.lightKind:`spot`,s,c);if(!u.ok)return u;if(u.value===void 0)return o(void 0);let d=Xt(e,t.volumetricFog?.froxelExtent??{width:64,height:64,depth:64},t.volumetricFog?.resolvedExtent);return d.ok?zr(e,{...u.value,compositeNeighbors:De(t.standardProfile??{}).quality===`low`?4:8,atmosphereTransmittance:l,resources:d.value}):d}function zr(e,t){let n=Math.ceil(t.resources.extent.width/8),r=Math.ceil(t.resources.extent.height/8),i=Math.ceil(t.resources.extent.depth/Ut),a=Math.ceil(t.resources.resolvedExtent.width/8),o=Math.ceil(t.resources.resolvedExtent.height/8),s=t.directionalShadow??t.spotShadow,c,l,u,d,f,p,m,h,g,_=e.addComputePass(`volume-inject`,{accesses:[{resource:t.params,usage:`uniform-read`},{resource:t.view,usage:`uniform-read`},{resource:s,usage:`sampled-read`},{resource:t.lightData,usage:`storage-read`},{resource:t.clusterUniform,usage:`uniform-read`},...t.projector===void 0?[]:[{resource:t.projector,usage:`sampled-read`}],{resource:t.resources.froxelView,usage:`storage-write`},{resource:t.spotShadow,usage:`sampled-read`}],encode:({pass:e,frame:a,resources:o})=>{c??=ln(Fr(a),Pr(a,`inject`),`volume_inject`);let l=o.textureView(s),u=o.textureView(t.spotShadow);if(!u.ok)throw u.error;let d=o.buffer(t.params),f=o.buffer(t.view),m=o.buffer(t.lightData),h=o.buffer(t.clusterUniform),g=o.textureView(t.resources.froxelView);if(!l.ok)throw l.error;if(!d.ok)throw d.error;if(!f.ok)throw f.error;if(!m.ok)throw m.error;if(!h.ok)throw h.error;if(!g.ok)throw g.error;p??=a.runtime.device.createSampler({compare:`greater`}).unwrap();let _=Ir(a,c.layout,[{binding:0,resource:{kind:`buffer`,value:{buffer:f.value,size:N}}},{binding:3,resource:{kind:`textureView`,value:l.value}},{binding:4,resource:{kind:`sampler`,value:p}},{binding:5,resource:{kind:`buffer`,value:{buffer:d.value}}},{binding:6,resource:{kind:`textureView`,value:g.value}},{binding:7,resource:{kind:`buffer`,value:{buffer:m.value}}},{binding:8,resource:{kind:`buffer`,value:{buffer:h.value}}},{binding:9,resource:{kind:`textureView`,value:u.value}}]);e.setPipeline(c.pipeline),e.setBindGroup(0,_),e.dispatchWorkgroups(n,r,i)}});if(!_.ok)return _;let v=e.addComputePass(`volume-integrate`,{accesses:[...t.atmosphereTransmittance===void 0?[]:[{resource:t.atmosphereTransmittance,usage:`sampled-read`}],{resource:t.resources.froxelView,usage:`sampled-read`},{resource:t.sceneDepth,usage:`sampled-read`},{resource:t.density,usage:`sampled-read`},...(t.additionalDensities??[]).map(e=>({resource:e,usage:`sampled-read`})),{resource:t.resources.resolvedView,usage:`storage-write`},{resource:t.resources.historyView,usage:`storage-write`},{resource:t.resources.temporalView,usage:`storage-write`},{resource:t.params,usage:`uniform-read`},{resource:t.view,usage:`uniform-read`},{resource:t.lightData,usage:`storage-read`},{resource:t.clusterUniform,usage:`uniform-read`},...t.projector===void 0?[]:[{resource:t.projector,usage:`sampled-read`}],...t.cloudShadow===void 0?[]:[{resource:t.cloudShadow,usage:`sampled-read`}]],encode:({pass:e,frame:n,resources:r})=>{l??=ln(Fr(n),Pr(n,`integrate`),`volume_integrate`);let i=r.textureView(t.resources.froxelView),s=r.textureView(t.sceneDepth),c=r.textureView(t.density),u=r.textureView(t.resources.resolvedView),d=r.textureView(t.resources.historyView),f=r.textureView(t.resources.temporalView),p=r.buffer(t.params),g=r.buffer(t.view),_=r.buffer(t.lightData),v=r.buffer(t.clusterUniform),y=t.projector===void 0?void 0:r.textureView(t.projector),b=t.cloudShadow===void 0?void 0:r.textureView(t.cloudShadow);if(!i.ok)throw i.error;if(!s.ok)throw s.error;if(!c.ok)throw c.error;if(!u.ok)throw u.error;if(!d.ok)throw d.error;if(!f.ok)throw f.error;if(!p.ok)throw p.error;if(!g.ok)throw g.error;if(!_.ok)throw _.error;if(!v.ok)throw v.error;if(y!==void 0&&!y.ok)throw y.error;if(b!==void 0&&!b.ok)throw b.error;m??=n.runtime.device.createSampler({minFilter:`linear`,magFilter:`linear`}).unwrap(),h??=n.runtime.device.createSampler({minFilter:`linear`,magFilter:`linear`,addressModeU:`repeat`,addressModeV:`repeat`,addressModeW:`repeat`}).unwrap();let x=Ir(n,l.layout,[{binding:25,resource:{kind:`textureView`,value:t.atmosphereTransmittance===void 0?n.pipelineState.defaultWhiteTextureView:r.textureView(t.atmosphereTransmittance).unwrap()}},{binding:26,resource:{kind:`sampler`,value:n.pipelineState.defaultSampler}},{binding:0,resource:{kind:`textureView`,value:i.value}},{binding:1,resource:{kind:`textureView`,value:s.value}},{binding:2,resource:{kind:`textureView`,value:u.value}},{binding:3,resource:{kind:`buffer`,value:{buffer:p.value}}},{binding:4,resource:{kind:`buffer`,value:{buffer:g.value,size:N}}},{binding:5,resource:{kind:`sampler`,value:m}},{binding:6,resource:{kind:`textureView`,value:c.value}},{binding:7,resource:{kind:`sampler`,value:h}},{binding:8,resource:{kind:`textureView`,value:d.value}},{binding:9,resource:{kind:`textureView`,value:f.value}},{binding:10,resource:{kind:`buffer`,value:{buffer:_.value}}},{binding:11,resource:{kind:`buffer`,value:{buffer:v.value}}},{binding:12,resource:{kind:`textureView`,value:y===void 0?n.pipelineState.defaultWhiteTextureView:y.value}},{binding:13,resource:{kind:`sampler`,value:n.volumetricFog?.projectorSampler??n.pipelineState.defaultSampler}},{binding:16,resource:{kind:`textureView`,value:b===void 0?n.pipelineState.defaultWhiteTextureView:b.value}},{binding:17,resource:{kind:`sampler`,value:n.pipelineState.defaultSampler}},...Array.from({length:10},(e,n)=>{let i=r.textureView(t.additionalDensities?.[n]??t.density);if(!i.ok)throw i.error;return{binding:$t(n),resource:{kind:`textureView`,value:i.value}}})]);e.setPipeline(l.pipeline),e.setBindGroup(0,x),e.dispatchWorkgroups(a,o,1)}});if(!v.ok)return v;let y=e.addComputePass(`volume-temporal`,{accesses:[{resource:t.resources.resolvedView,usage:`sampled-read`},{resource:t.resources.historyView,usage:`sampled-storage-read-write`},{resource:t.resources.temporalView,usage:`sampled-storage-read-write`},{resource:t.params,usage:`uniform-read`},{resource:t.view,usage:`uniform-read`}],encode:({pass:e,frame:n,resources:r})=>{u??=ln(Fr(n),Pr(n,`temporal`),`volume_temporal`);let i=r.textureView(t.resources.resolvedView),s=r.textureView(n.volumetricFog?.historyReadSlot===0?t.resources.historyView:t.resources.temporalView),c=r.textureView(n.volumetricFog?.historyWriteSlot===0?t.resources.historyView:t.resources.temporalView),l=r.buffer(t.params),d=r.buffer(t.view);if(!i.ok)throw i.error;if(!s.ok)throw s.error;if(!c.ok)throw c.error;if(!l.ok)throw l.error;if(!d.ok)throw d.error;let f=Ir(n,u.layout,[{binding:0,resource:{kind:`textureView`,value:i.value}},{binding:1,resource:{kind:`textureView`,value:s.value}},{binding:2,resource:{kind:`textureView`,value:c.value}},{binding:3,resource:{kind:`buffer`,value:{buffer:l.value}}},{binding:4,resource:{kind:`buffer`,value:{buffer:d.value,size:N}}}]);e.setPipeline(u.pipeline),e.setBindGroup(0,f),e.dispatchWorkgroups(a,o,1)}});return y.ok?e.addRasterPass(`volume-composite`,{accesses:[{resource:t.resources.historyView,usage:`sampled-read`},{resource:t.resources.temporalView,usage:`sampled-read`},{resource:t.sceneDepth,usage:`sampled-read`},{resource:t.view,usage:`uniform-read`},{resource:t.linearHdr.view,usage:`color-attachment`}],colorAttachments:[{view:t.linearHdr.view,loadOp:`load`,storeOp:`store`,clearValue:{r:0,g:0,b:0,a:1}}],encode:({pass:e,frame:n,resources:r})=>{if(d===void 0){let e=un(Fr(n),Pr(n,`composite`),t.linearHdr.format,t.compositeNeighbors??8);d=e.pipeline,f=e.layout}let i=r.textureView(n.volumetricFog?.historyWriteSlot===0?t.resources.historyView:t.resources.temporalView),a=r.textureView(t.sceneDepth),o=r.buffer(t.view);if(!i.ok)throw i.error;if(!a.ok)throw a.error;if(!o.ok)throw o.error;g??=n.runtime.device.createSampler({label:`volume_composite.sampler`,minFilter:`linear`,magFilter:`linear`}).unwrap();let s=n.runtime.device.createBindGroup({layout:f,entries:[{binding:0,resource:{kind:`textureView`,value:i.value}},{binding:1,resource:{kind:`sampler`,value:g}},{binding:2,resource:{kind:`textureView`,value:a.value}},{binding:3,resource:{kind:`buffer`,value:{buffer:o.value,size:N}}}]});if(!s.ok)throw s.error;e.setPipeline(d),e.setBindGroup(0,s.value);let c,l;if(n.volumetricFog?.compositeProjectedBounds!==void 0&&n.camera.captureProjection===void 0&&n.camera.target===void 0&&n.camera.view===void 0){let i=r.textureViewExtent(t.linearHdr.view);if(!i.ok)throw i.error;l=i.value,c=Nr(n.volumetricFog.compositeProjectedBounds,i.value.width,i.value.height,t.resources.resolvedExtent.width,t.resources.resolvedExtent.height),c!==void 0&&e.setScissorRect(...c)}e.draw(3),c!==void 0&&l!==void 0&&e.setScissorRect(0,0,l.width,l.height)}}):y}var Br=`forgeax.analytic-fog`;function Vr(){return new z({code:`resource-resolution-failed`,expected:`analytic fog receives single-sample scene depth`,hint:`select FXAA, TAA or no AA for analytic fog`,detail:{resourceLabel:`scene-depth`}})}function Hr(e,t){if(t.color.sampleCount!==1)return n(Vr());let r=e.importBuffer(`analytic-fog-view`,{size:N,usage:72},e=>e.pipelineState.viewUniformBuffer);if(!r.ok)return r;let i,a,s,c=e.addRasterPass(`analytic-fog`,{accesses:[{resource:t.depth,usage:`sampled-read`},{resource:r.value,usage:`uniform-read`},{resource:t.color.view,usage:`color-attachment`}],colorAttachments:[{view:t.color.view,loadOp:`load`,storeOp:`store`,clearValue:{r:0,g:0,b:0,a:1}}],encode:({pass:e,frame:n,resources:o})=>{if(i===void 0||a===void 0){let e=n.runtime.lookupPostProcess?.(Br)?.source,r=n.runtime.shaderModuleFactory;if(e===void 0||r===void 0)throw new z({code:`resource-resolution-failed`,expected:`the registered forgeax.analytic-fog shader and a shader module factory`,hint:`include forgeax::analytic-fog in the engine shader manifest`,detail:{resourceLabel:`analytic-fog`}});let o=r.createShaderModule({code:e,label:Ce(e)}).unwrap(),s=n.runtime.device;a=s.createBindGroupLayout({label:`analytic-fog.bind-group-layout`,entries:[{binding:0,visibility:2,buffer:{type:`uniform`}},{binding:1,visibility:2,texture:{sampleType:`depth`,viewDimension:`2d`}}]}).unwrap();let c=s.createPipelineLayout({label:`analytic-fog.layout`,bindGroupLayouts:[a]}).unwrap();i=s.createRenderPipeline({label:`analytic-fog`,layout:c,vertex:{module:o,entryPoint:`vs_main`,buffers:[]},fragment:{module:o,entryPoint:`fs_main`,targets:[{format:t.color.format,blend:{color:{srcFactor:`one`,dstFactor:`one-minus-src-alpha`,operation:`add`},alpha:{srcFactor:`zero`,dstFactor:`one`,operation:`add`}}}]},primitive:{topology:`triangle-list`}}).unwrap()}let c=o.textureView(t.depth),l=o.buffer(r.value);if(!c.ok)throw c.error;if(!l.ok)throw l.error;if(s?.depth!==c.value||s.uniform!==l.value){let e=n.runtime.device.createBindGroup({label:`analytic-fog.bind-group`,layout:a,entries:[{binding:0,resource:{kind:`buffer`,value:{buffer:l.value,size:N}}},{binding:1,resource:{kind:`textureView`,value:c.value}}]}).unwrap();s={depth:c.value,uniform:l.value,group:e}}e.setPipeline(i),e.setBindGroup(0,s.group),e.draw(3)}});return c.ok?o(void 0):c}function Ur(e,t,r){return t.sampleCount===1?e.view(t.texture,{label:r,dimension:`2d`,aspect:`depth-only`}):n(Vr())}function Wr(e,t){let n=t.topology.analyticFog===!0;if(!n&&t.atmosphere===void 0)return o(void 0);let r=Ur(e,t.depth,`scene-depth.sample`);if(!r.ok)return r;if(t.atmosphere!==void 0){let n=Ar(e,t.color,r.value,t.atmosphere);if(!n.ok)return n}if(n&&t.atmosphere===void 0){let n=Hr(e,{color:t.color,depth:r.value});if(!n.ok)return n}return o(void 0)}function Gr(e,t){if(t.topology.volumetricFog?.enabled!==!0)return o(void 0);let n=Ur(e,t.depth,`local-volume-scene-depth`);return n.ok?Rr(e,t.topology,t.color,n.value,t.directionalShadow,t.spotShadow,t.clusterBuffers,t.cloudShadow,t.atmosphere?.transmittance):n}function Kr(e){let t;return()=>{if(t!==void 0)return o(t);let n=e.importBuffer(`scene-view`,{size:N,usage:72},e=>e.pipelineState.viewUniformBuffer);return n.ok&&(t=n.value),n}}function qr(e,t){let n=t.gpuDriven?.addLateOcclusion;if(n===void 0)return o(void 0);let r=t.view();if(!r.ok)return r;let i=Ot(e,{depth:t.depth,width:t.width,height:t.height,view:r.value,reduction:`furthest`,multisampled:t.multisampled});if(!i.ok)return i;let a=n(i.value.pyramid.pyramid);return a.ok?o(i.value.pyramid.pyramid):a}function Jr(e,t,n){return t?F(e.graph,`cloud-layer-scene-color`,{...n,sampleCount:1,usage:21}):o(void 0)}function Yr(e,t){let n=e.cloudShadowResolution;return!t||n===void 0?o(void 0):F(e.graph,`cloud-layer-shadow`,{format:`rgba16float`,size:{width:n,height:n,depthOrArrayLayers:1},sampleCount:1,domain:`linear-hdr`,usage:21})}function Xr(e,t){let{color:n,depth:r,cloudShadow:i}=t,a=[{name:`linear-hdr`,kind:`scene-color`,texture:n.texture,view:n.view,format:n.format,sampleCount:1},{kind:`scene-depth`,texture:r.texture,view:r.view,format:r.format,sampleCount:r.sampleCount},...i===void 0?[]:[{name:`cloud-shadow`,kind:`scene-color`,texture:i.texture,view:i.view,format:i.format,sampleCount:1}],...e.cloudHistory===void 0?[]:et(e.cloudHistory)],s=e.contributeFeatures({targets:a,semanticTargets:[],namedTargets:i===void 0?{}:{"cloud-shadow":i},standardSurfaceAccesses:[],placement:`scene`,passNames:[`cloud-layer-density-cache`,`cloud-layer-shadow`]});return s.ok?o(a):s}function Zr(e,t,n,r,i){let a=e.cloudHistory;return e.contributeFeatures({targets:t,semanticTargets:[],namedTargets:{"motion-input":n.input,"motion-output":n.output,...n.cloudShadow===void 0?{}:{"cloud-shadow":n.cloudShadow},...a===void 0?{}:{"cloud-history-radiance-current":a.currentRadiance,"cloud-history-radiance-previous":a.previousRadiance,"cloud-history-transmittance-current":a.currentTransmittance,"cloud-history-transmittance-previous":a.previousTransmittance,"cloud-history-depth-current":a.currentDepth,"cloud-history-depth-previous":a.previousDepth}},standardSurfaceAccesses:r,placement:`scene`,passNames:[`cloud-layer-transport`,`cloud-layer-resolve`],atmosphere:i})}var Qr={capsuleCount:0,droppedCapsules:0,tileCount:0,tileOverflow:0};function $r(e,t){if(e.shadowCaster===!1||e.authorVisible===!1)return!1;let n=e=>{let n=t?.get(e);if(n===void 0)throw Error(`Capsule shadow requires the accepted material frame`);return n.passes.some(e=>e.tags.LightMode===`ShadowCaster`)};return e.materials.length===0?n(e.material):e.materials.some(n)}function ei(e,t,n,r,i,a){let o=0,s=0,c={};for(let i of e){let e=a(i);if(e===void 0)continue;o+=1;let l;e.status===`ready`?$r(i,t)?r?n||(l=`forward-path`):l=`no-directional-shadow`:l=`no-shadow-caster-pass`:l=e.status,l===void 0?s+=1:c[l]=(c[l]??0)+1}if(o!==0)return Object.freeze({requested:o,admitted:s,...i??Qr,fallbacks:Object.freeze(c)})}var G=8,ti=1024,ni=16,ri=32,ii=65536,ai=6,oi=8,si=.25,ci=Math.PI/180,li=Math.PI/6;function ui(e,t){return Math.ceil(e/ni)*Math.ceil(t/ni)+ii}function di(e){let t=e?.kind===`pcss`?e.angularRadiusRadians:0;return Math.min(li,Math.max(ci,5*t))}function fi(e,t,n){return Math.min(oi,1.5*(e+2*t)/Math.max(n,si))}function pi(e,t,n,r,i,a,o,s){let l=-(r[0]??0),u=-(r[1]??-1),d=-(r[2]??0),f=Math.hypot(l,u,d)||1,p=[l/f,u/f,d/f],m=n.position[0]??0,h=n.position[1]??0,g=n.position[2]??0,_=[];for(let n of e){let e=s(n);if(e?.status===`ready`&&$r(n,t))for(let t=0;t<e.capsules.length;t+=G){let n=e.capsules,r=(n[t]+n[t+4])/2-m,i=(n[t+1]+n[t+5])/2-h,a=(n[t+2]+n[t+6])/2-g;_.push({source:n,offset:t,distance:r*r+i*i+a*a})}}_.sort((e,t)=>e.distance-t.distance);let v=Math.min(_.length,ti),y=new Float32Array(v*G);for(let e=0;e<v;e++){let{source:t,offset:n}=_[e];y.set(t.subarray(n,n+G),e*G);let r=e*G,i=Math.hypot(y[r+4]-y[r],y[r+5]-y[r+1],y[r+6]-y[r+2]);y[r+7]=fi(i,y[r+3],p[1])}let b=Math.ceil(a/ni),x=Math.ceil(o/ni),S=b*x,C=te(n),w=c.create();c.multiply(w,C,ee(n));let T=new Int32Array(v*4),E=new Uint16Array(S),D=Math.tan(i),O=0;for(let e=0;e<v;e++){let t=mi(y,e,p,D,w,b,x);if(T.set(t??[1,1,0,0],e*4),t!==void 0){O+=1;for(let e=t[1];e<=t[3];e++)for(let n=t[0];n<=t[2];n++){let t=e*b+n;E[t]=E[t]+1}}}let k=new Uint32Array(S+ii),A=new Uint32Array(S),j=0,M=0,ne=0;for(let e=0;e<S;e++){let t=E[e];if(t===0)continue;let n=Math.min(t,ri,ii-j);M+=1,n<t&&(ne+=1),k[e]=S+j<<ai|n,A[e]=n,j+=n}let N=new Uint32Array(S);for(let e=0;e<v&&O>0;e++){let t=T[e*4],n=T[e*4+1],r=T[e*4+2],i=T[e*4+3];for(let a=n;a<=i;a++)for(let n=t;n<=r;n++){let t=a*b+n,r=N[t];r>=A[t]||(k[(k[t]>>>ai)+r]=e,N[t]=r+1)}}return{capsules:y,tiles:k.subarray(0,S+j),tilesX:b,tilesY:x,coneHalfAngle:i,submission:{capsuleCount:v,droppedCapsules:_.length-v,tileCount:M,tileOverflow:ne}}}function mi(e,t,n,r,i,a,o){let s=t*G,c=e[s+7],l=e[s+3]+c*r,u=[1/0,1/0,1/0],d=[-1/0,-1/0,-1/0];for(let t of[0,4])for(let r of[0,c])for(let i=0;i<3;i++){let a=e[s+t+i]-n[i]*r;u[i]=Math.min(u[i],a-l),d[i]=Math.max(d[i],a+l)}let f=1/0,p=1/0,m=-1/0,h=-1/0,g=0;for(let e=0;e<8;e++){let t=e&1?d[0]:u[0],n=e&2?d[1]:u[1],r=e&4?d[2]:u[2],a=i,o=a[3]*t+a[7]*n+a[11]*r+a[15];if(o<=1e-4){g+=1;continue}let s=(a[0]*t+a[4]*n+a[8]*r+a[12])/o,c=(a[1]*t+a[5]*n+a[9]*r+a[13])/o;f=Math.min(f,s),m=Math.max(m,s),p=Math.min(p,c),h=Math.max(h,c)}if(g===8)return;if(g>0)return[0,0,a-1,o-1];if(m<-1||f>1||h<-1||p>1)return;let _=(e,t)=>Math.min(t-1,Math.max(0,Math.floor((e+1)/2*t)));return[_(f,a),_(-h,o),_(m,a),_(-p,o)]}var hi=8*Float32Array.BYTES_PER_ELEMENT,gi=new WeakMap;function _i(e,t,n,r){let i=gi.get(e);i===void 0&&(i=new WeakMap,gi.set(e,i),e._adopt(`pipeline`,i,()=>{gi.delete(e)}));let a=i.get(t);a===void 0&&(a=new WeakMap,i.set(t,a));let o=a.get(n);o===void 0&&(o=new Map,a.set(n,o));let s=o.get(r);return s===void 0&&(s=new Map,o.set(r,s)),s}function vi(e,t){let n=e.createBuffer(`deferred-lighting-params`,{size:hi});if(!n.ok)return n;let r=ti*G*4,i=ui(t.size.width,t.size.height)*4,a=e.createBuffer(`capsule-shadow-capsules`,{size:r});if(!a.ok)return a;let o=e.createBuffer(`capsule-shadow-tiles`,{size:i});if(!o.ok)return o;let s=e.importBuffer(`deferred-probe-records`,{size:256,usage:136},e=>{let t=e.frameState.probeBlendRecordBuffer;if(t===void 0)throw new l({code:`rhi-not-available`,expected:`prepared Standard probe records`,hint:`prepare the deferred frame before recording lighting`});return t.handle});if(!s.ok)return s;let c=e.addCopyPass(`deferred-lighting-prepare`,{accesses:[{resource:n.value,usage:`copy-dst`},{resource:a.value,usage:`copy-dst`},{resource:o.value,usage:`copy-dst`}],encode:({frame:e,resources:s,encoder:c})=>{let l=e,u=l.frameState.installedPipelineConfig?.ssao,d=e.runtime.device.queue,f=(e.camera.temporal?.temporalFrameIndex??0)%64,p=l.capsuleShadowLight,m=p===void 0?void 0:pi(p.renderables,l.materialFrame,e.camera,p.direction,p.coneHalfAngle,t.size.width,t.size.height,l.runtime.demandCapsuleShadow??(()=>void 0));m!==void 0&&(e.camera.captureProjection===void 0&&(l.frameState.capsuleShadowSubmission=m.submission),m.capsules.length>0&&(d.writeBuffer(s.buffer(a.value).unwrap(),0,m.capsules).unwrap(),d.writeBuffer(s.buffer(o.value).unwrap(),0,m.tiles).unwrap()));let h=(m?.capsules.length??0)>0;for(let[e,t,n]of[[a.value,r,h?m?.capsules.byteLength??0:0],[o.value,i,h?m?.tiles.byteLength??0:0]])n<t&&c.clearBuffer(s.buffer(e).unwrap(),n,t-n);d.writeBuffer(s.buffer(n.value).unwrap(),0,new Float32Array([t.ssao===void 0?0:1,f,m?.submission.capsuleCount??0,m?.coneHalfAngle??0,t.ssao===void 0?0:u?.directLightingStrength??0,0,0,0])).unwrap()}});if(!c.ok)return c;let u=[t.color,...t.reflectionFallback===void 0?[]:[t.reflectionFallback],...t.response===void 0?[]:[t.response],...t.diffuse===void 0?[]:[t.diffuse]],d=[...t.gbuffer.map(e=>e.view),t.receiverGeometry.view,t.depth,...[t.ssao,t.directionalShadow,t.spotShadow,t.shadowMoments,t.pointShadow,t.cloudShadow].flatMap(e=>e===void 0?[]:[e.view]),...t.environment===void 0?[]:[t.environment.irradiance,t.environment.prefilter,...t.environment.atmosphere===void 0?[]:Oe(t.environment.atmosphere)]],f=new Map,p=t.diffuse!==void 0&&t.reflectionFallback===void 0?`fs_standard_deferred_subsurface`:u.length===1?`fs_standard_deferred`:`fs_standard_deferred_reflections`,m=JSON.stringify(u.map(e=>e.format));return e.addRasterPass(`lighting`,{accesses:[...d.map(e=>({resource:e,usage:`sampled-read`})),...u.map(e=>({resource:e.view,usage:`color-attachment`})),{resource:n.value,usage:`uniform-read`},{resource:s.value,usage:`storage-read`},{resource:a.value,usage:`storage-read`},{resource:o.value,usage:`storage-read`},...t.extraAccesses],colorAttachments:u.map((e,t)=>({view:e.view,loadOp:t===0?`load`:`clear`,storeOp:`store`,clearValue:{r:0,g:0,b:0,a:0}})),encode:({pass:e,frame:r,resources:i})=>{let c=r,d=r.runtime.device,h=(c.validatedOrdered??[]).some(e=>e.source.materials.some(e=>E(e.snapshot.materialParamSchema))),g=t.cluster===null?h?c.runtime.standardDeferredShaders?.unclusteredLut:c.runtime.standardDeferredShaders?.unclustered:h?c.runtime.standardDeferredShaders?.clusteredLut:c.runtime.standardDeferredShaders?.clustered;if(g===void 0)throw new l({code:`shader-compile-failed`,expected:`cooked Standard deferred lighting program`,hint:`rebuild the Engine shader manifest and reinitialize the Renderer`});let _=c.runtime.deviceScope;if(!_.isAlive())throw new l({code:`rhi-not-available`,expected:`a live device scope for deferred lighting`,hint:`recreate the Renderer after device retirement`});let v=c.pipelineState.viewBindGroupLayout,y=f.get(h);if(y===void 0||y.scope!==_||y.device!==d||y.viewLayout!==v||y.source!==g){let e=_i(_,d,v,g),n=`${t.cluster!==null}:${h}:${p}:${m}`,i=e.get(n);if(i===void 0){let a=r.runtime.shaderModuleFactory?.createShaderModule({code:g,label:`standard_deferred_${t.cluster!==null}_${h}`}).unwrap();if(a===void 0)throw new l({code:`rhi-not-available`,expected:`deferred shader module factory`,hint:`initialize the Renderer backend`});let o=d.createBindGroupLayout({label:`deferred-surface-environment`,entries:[...Array.from({length:6},(e,t)=>({binding:t,visibility:2,texture:{sampleType:t<4?`uint`:t===4?`depth`:`float`,viewDimension:`2d`}})),{binding:6,visibility:2,sampler:{type:`filtering`}},{binding:7,visibility:2,buffer:{type:`uniform`,minBindingSize:hi}},...[8,9,10,11].map(e=>({binding:e,visibility:2,texture:{sampleType:`float`,viewDimension:e===8?`cube`:`2d`}})),{binding:12,visibility:2,buffer:{type:`uniform`,minBindingSize:80}},{binding:13,visibility:2,buffer:{type:`read-only-storage`}},{binding:14,visibility:2,buffer:{type:`read-only-storage`}},{binding:15,visibility:2,texture:{sampleType:`uint`,viewDimension:`2d`}},...h?[{binding:16,visibility:2,texture:{sampleType:`float`,viewDimension:`2d`}}]:[]]}).unwrap(),s=d.createBindGroupLayout({entries:t.cluster===null?[]:[3,4,5,6].map(e=>({binding:e,visibility:2,buffer:{type:e===6?`uniform`:`read-only-storage`}}))}).unwrap(),c=d.createBindGroupLayout({entries:[{binding:0,visibility:2,buffer:{type:`read-only-storage`,minBindingSize:256}}]}).unwrap(),f=d.createPipelineLayout({bindGroupLayouts:[v,o,s,c]}).unwrap();i={scope:_,device:d,viewLayout:v,source:g,pipeline:d.createRenderPipeline({label:`standard-deferred-lighting`,layout:f,vertex:{module:a,entryPoint:`vs_standard_deferred`,buffers:[]},fragment:{module:a,entryPoint:p,targets:u.map((e,t)=>({format:e.format,...t===0?{blend:{color:{operation:`add`,srcFactor:`one`,dstFactor:`one`},alpha:{operation:`add`,srcFactor:`zero`,dstFactor:`one`}}}:{}}))},primitive:{topology:`triangle-list`,cullMode:`none`}}).unwrap(),material:o,cluster:s,probe:c},e.set(n,i)}y={...i,groups:new WeakMap},f.set(h,y)}let b=y,x=h?k(d,c.runtime.deviceScope).unwrap():void 0,S=e=>e===void 0?void 0:i.textureView(e.view).unwrap(),C=ue(c.runtime,c.frameState,c.pipelineState,!0,c.bindGroupCounts,{atmosphere:t.environment?.atmosphere===void 0?void 0:{transmittance:i.textureView(t.environment.atmosphere.transmittance).unwrap(),distantSkyLight:i.textureView(t.environment.atmosphere.distantSkyLight).unwrap(),multipleScattering:i.textureView(t.environment.atmosphere.multipleScattering).unwrap(),aerialPerspective:i.textureView(t.environment.atmosphere.aerialPerspective).unwrap(),aerialTransmittance:i.textureView(t.environment.atmosphere.aerialTransmittance).unwrap()},directionalShadow:S(t.directionalShadow),spotShadow:S(t.spotShadow),shadowMoments:S(t.shadowMoments),cloudShadow:S(t.cloudShadow),projector:c.spotLightProjector?.view,projectorSampler:c.spotLightProjector?.sampler},!0,c.standardLighting);if(C.viewBindGroup===null)throw new l({code:`rhi-not-available`,expected:`Standard view/shadow resources`,hint:`repair the frame lighting resources`});if(e.setPipeline(y.pipeline),e.setBindGroup(0,C.viewBindGroup,[0,0]),t.cluster?.kind===`texture`)throw new l({code:`rhi-not-available`,expected:`Deferred lighting requires storage-buffer capabilities`,hint:`use the Standard Forward path on this device`});let w=t.cluster===null?[]:[t.cluster.lightData,t.cluster.clusterGrid,t.cluster.lightIndexList,t.cluster.clusterUniform].map(e=>i.buffer(e).unwrap()),T=D(y.groups,[y.cluster,...w],`deferred-cluster`,()=>d.createBindGroup({layout:b.cluster,entries:w.map((e,t)=>({binding:t+3,resource:{kind:`buffer`,value:{buffer:e}}}))}).unwrap(),c.bindGroupCounts);e.setBindGroup(2,T);let O=i.buffer(s.value).unwrap(),A=D(y.groups,[y.probe,O],`deferred-probe`,()=>d.createBindGroup({layout:b.probe,entries:[{binding:0,resource:{kind:`buffer`,value:{buffer:O}}}]}).unwrap(),c.bindGroupCounts);e.setBindGroup(3,A);let j=t.environment===void 0?c:{...c,environmentIbl:{irradiance:i.textureView(t.environment.irradiance).unwrap(),prefilter:i.textureView(t.environment.prefilter).unwrap()}},ee=fe(j).skylightResources,M=[ee];for(let e of c.reflectionProbes?.table.rows??[])if(e.filteredView!==void 0&&e.sampler!==void 0&&e.uniformBuffer!==void 0){if(e.index>=255)throw new l({code:`rhi-descriptor-invalid`,expected:`at most 255 deferred reflection environments`,hint:`reduce the resident reflection-probe roster`});M.push({...ee,prefilterView:e.filteredView,prefilterSampler:e.sampler,skylightPrefilterView:ee.prefilterView,intensityBuffer:e.uniformBuffer})}let te=[...t.gbuffer.map(e=>i.textureView(e.view).unwrap()),i.textureView(t.depth).unwrap(),S(t.ssao)??c.pipelineState.defaultWhiteTextureView],ne=i.buffer(n.value).unwrap(),N=i.textureView(t.receiverGeometry.view).unwrap(),re=[a.value,o.value].map(e=>i.buffer(e).unwrap());for(let t of M){let n=[...te,N,t.irradianceSampler,ne,...re,t.irradianceView,t.prefilterView,t.brdfLutView,t.skylightPrefilterView??t.prefilterView,t.intensityBuffer,...x===void 0?[]:[x.view]],r=D(y.groups,n,`deferred-environment`,()=>d.createBindGroup({layout:b.material,entries:[{binding:15,resource:{kind:`textureView`,value:N}},...te.map((e,t)=>({binding:t,resource:{kind:`textureView`,value:e}})),{binding:6,resource:{kind:`sampler`,value:t.irradianceSampler}},{binding:7,resource:{kind:`buffer`,value:{buffer:ne}}},{binding:8,resource:{kind:`textureView`,value:t.irradianceView}},{binding:9,resource:{kind:`textureView`,value:t.prefilterView}},{binding:10,resource:{kind:`textureView`,value:t.brdfLutView}},{binding:11,resource:{kind:`textureView`,value:t.skylightPrefilterView??t.prefilterView}},{binding:12,resource:{kind:`buffer`,value:{buffer:t.intensityBuffer}}},...re.map((e,t)=>({binding:13+t,resource:{kind:`buffer`,value:{buffer:e}}})),...x===void 0?[]:[{binding:16,resource:{kind:`textureView`,value:x.view}}]]}).unwrap(),c.bindGroupCounts);e.setBindGroup(1,r),e.draw(3)}}})}function yi(e){let{directional:t,spot:n,point:r,moments:i}=e.shadows,{cloudShadow:a,ssao:o}=e;return{sampled:[t,n,r,i,a,o].filter(e=>e!==void 0),...t===void 0?{}:{directionalShadow:t},spotShadow:n,...i===void 0?{}:{shadowMoments:i},...a===void 0?{}:{cloudShadow:a},...o===void 0?{}:{ssao:o},extraAccesses:e.clusterReads}}function bi(e){return[...e.extraAccesses,...e.sampled.map(e=>({resource:e.view,usage:`sampled-read`}))]}function xi(e){let{x:t,y:n,z:r}=e.prepared.layout.grid;return{grid:{x:t,y:n,z:r}}}function Si(e,t){let n=be(e.runtime,t.grid);if(n===null)throw Error(`Standard persistent buffer allocation failed`);return n}function Ci(e){let t=e.standardLighting;return t?.kind===`clustered`&&t.transport.kind===`compute-storage`&&t.prepared.local.length>0}function wi(e,t){if(t.kind!==`clustered`)return o(null);let n=t.prepared.layout,r=xi(t);if(t.transport.kind===`cpu-texture`){let t=qe(n),i=e.importTexture(`standard-cluster-tables`,{size:{width:t.width,height:t.height,depthOrArrayLayers:1},format:`rgba32uint`,usage:6},e=>{let t=Si(e,r);if(t.kind!==`texture`)throw Error(`Standard texture transport changed`);return t.texture});if(!i.ok)return i;let a=e.importView(i.value,{dimension:`2d`},e=>{let t=Si(e,r);if(t.kind!==`texture`)throw Error(`Standard texture transport changed`);return t.view});if(!a.ok)return a;let s=e.importBuffer(`hdrp-cluster-uniform`,{size:32,usage:72},e=>Si(e,r).clusterUniformBuffer);return s.ok?o({kind:`texture`,texture:a.value,clusterUniform:s.value}):s}let i=e=>{let t=Si(e,r);if(t.kind!==`storage`)throw Error(`Standard storage transport changed`);return t},a=e.importBuffer(`hdrp-light-data`,{size:n.lightDataSlotCount*96,usage:136},e=>i(e).lightDataBuffer);if(!a.ok)return a;let s=e.importBuffer(`hdrp-cluster-grid`,{size:n.clusterGridU32Length*4,usage:136},e=>i(e).clusterGridBuffer);if(!s.ok)return s;let c=e.importBuffer(`hdrp-light-index-list`,{size:n.lightIndexListCapacity*4,usage:136},e=>i(e).lightIndexListBuffer);if(!c.ok)return c;let l=e.importBuffer(`hdrp-cluster-uniform`,{size:32,usage:72},e=>Si(e,r).clusterUniformBuffer);if(!l.ok)return l;let u=e.importBuffer(`hdrp-light-bounds`,{size:n.lightBoundsInt32Length*4,usage:136},e=>i(e).lightBoundsBuffer);return u.ok?o({kind:`storage`,lightData:a.value,clusterGrid:s.value,lightIndexList:c.value,clusterUniform:l.value,lightBounds:u.value}):u}function Ti(e){return e.kind===`texture`?[{resource:e.texture,usage:`sampled-read`},{resource:e.clusterUniform,usage:`uniform-read`}]:[{resource:e.lightData,usage:`storage-read`},{resource:e.clusterGrid,usage:`storage-read`},{resource:e.lightIndexList,usage:`storage-read`},{resource:e.clusterUniform,usage:`uniform-read`}]}function Ei(e,t,n){if(t.kind!==`clustered`||t.transport.kind!==`compute-storage`)return o(void 0);if(n.kind!==`storage`)throw Error(`GPU membership requires storage transport`);let r=xi(t);return e.addComputePass(`cluster-membership-producer`,{accesses:[{resource:n.clusterGrid,usage:`storage-read`},{resource:n.clusterUniform,usage:`uniform-read`},{resource:n.lightBounds,usage:`storage-read`},{resource:n.lightIndexList,usage:`storage-write`}],executeIf:Ci,encode:({pass:e,frame:t})=>{let n=t,i=n.pipelineState.hdrpClusterMembershipPipeline,a=n.hdrpClusterMembershipBindGroup;if(i===null||a===null)throw Error(`standard-cluster-transport-unavailable: selected compute Cluster producer is not ready`);let{x:o,y:s,z:c}=r.grid;e.setPipeline(i),e.setBindGroup(0,a),e.dispatchWorkgroups(Math.ceil(o*s*c/64))}})}function Di(e,t){return e.addRasterPass(`debug-overlay`,{accesses:[{resource:t.view,usage:`color-attachment`}],colorAttachments:[{view:t.view,loadOp:`load`,storeOp:`store`}],executeIf:e=>{let t=e.runtime.debugOverlay;return t!==void 0&&(t.hasWork?.()??!0)},encode:({pass:e,frame:n})=>{let r=b(n.camera),i=c.invert(c.create(),n.camera.world),a=n.runtime.debugOverlay?.encode(e,c.multiply(c.create(),r,i),t.format);if(a!==void 0&&!a.ok)throw a.error}})}var Oi=`forgeax.dof.coc`,ki=`forgeax.dof.prefilter`,Ai=`forgeax.dof.prefilter.metadata`,ji=`forgeax.dof.gather`,Mi=`forgeax.dof.composite`,Ni=Object.freeze([Oi,ki,Ai,ji,Mi]),Pi=Object.freeze(Ni.map(e=>`${e}.msaa`));function Fi(e,t){return t?`${e}.msaa`:e}function Ii(e){if(!(e===void 0||e.maxRadiusPixels<=0))return{blurSide:e.blurSide,useNear:e.blurSide===`near`||e.blurSide===`both`,useFar:e.blurSide===`far`||e.blurSide===`both`}}function K(e,t,n){return F(e,t,n)}function Li(e,t){return P(e,t)}function Ri(e,t,n,r){let i=e.camera.depthOfField,a=Ii(i);if(i===void 0||a===void 0)return o(t);let s=n.sampleCount===4,c=e.graph,l=e.extent===void 0?void 0:se(e.extent,e.temporalTaa?`output`:`internal`),u=l??`surface`,d=l===void 0?`half-surface`:{width:Math.max(1,Math.ceil(l.width/2)),height:Math.max(1,Math.ceil(l.height/2))},f=K(c,`dof-coc`,{format:`rgba16float`,size:u,domain:`linear-hdr`});if(!f.ok)return f;let p=Li(c,{name:`dof-coc`,shader:Fi(Oi,s),fragmentEntryPoint:`fs_coc`,input:t,depth:n,outputs:[f.value],additionalReads:[{key:`scene-temporal`,target:e.temporalTaa&&r!==void 0?r:t}]});if(!p.ok)return p;let m=a.useNear?K(c,`dof-near`,{format:`rgba16float`,size:d}):void 0;if(m!==void 0&&!m.ok)return m;let h=a.useFar?K(c,`dof-far`,{format:`rgba16float`,size:d}):void 0;if(h!==void 0&&!h.ok)return h;let g=a.useNear?K(c,`dof-background`,{format:`rgba16float`,size:d}):void 0;if(g!==void 0&&!g.ok)return g;let _=new Map;for(let i of[`near`,`far`]){if(!(i===`near`?a.useNear:a.useFar))continue;let o=K(c,`dof-prefilter-${i}`,{format:`rgba16float`,size:d});if(!o.ok)return o;let l=Li(c,{name:`dof-prefilter-${i}`,shader:Fi(ki,s),fragmentEntryPoint:i===`near`?`fs_prefilter_near`:`fs_prefilter_far`,input:t,depth:n,outputs:[o.value],additionalReads:[{key:`dof-coc`,target:f.value}]});if(!l.ok)return l;let u=K(c,`dof-prefilter-${i}-metadata`,{format:`rgba16float`,size:d});if(!u.ok)return u;let p=Li(c,{name:`dof-prefilter-${i}-metadata`,shader:Fi(Ai,s),fragmentEntryPoint:i===`near`?`fs_prefilter_metadata_near`:`fs_prefilter_metadata_far`,input:t,depth:n,outputs:[u.value],additionalReads:[{key:`scene-temporal`,target:e.temporalTaa&&r!==void 0?r:t},{key:`dof-coc`,target:f.value}]});if(!p.ok)return p;_.set(i,{color:o.value,metadata:u.value})}let v=m?.ok===!0?m.value:t,y=h?.ok===!0?h.value:t,b=g?.ok===!0?g.value:t,x=a.useNear?[v,...a.useFar?[y]:[],b]:[y],S=Li(c,{name:`dof-gather-${a.blurSide}`,shader:Fi(ji,s),fragmentEntryPoint:`fs_gather_${a.blurSide}`,input:_.get(`near`)?.color??t,depth:n,outputs:x,additionalReads:[{key:`scene-temporal`,target:e.temporalTaa&&r!==void 0?r:t},{key:`dof-coc`,target:f.value},{key:`dof-near-metadata`,target:_.get(`near`)?.metadata??t},{key:`dof-far-metadata`,target:_.get(`far`)?.metadata??t},{key:`dof-prefilter-far`,target:_.get(`far`)?.color??t},{key:`scene-color`,target:t}]});if(!S.ok)return S;let C=K(c,`dof-composite`,{format:t.format,size:u,domain:t.domain});if(!C.ok)return C;let w=Li(c,{name:`dof-composite`,shader:Fi(Mi,s),fragmentEntryPoint:`fs_composite`,input:t,depth:n,outputs:[C.value],additionalReads:[{key:`scene-temporal`,target:e.temporalTaa&&r!==void 0?r:t},{key:`dof-coc`,target:f.value},{key:`dof-near`,target:v},{key:`dof-far`,target:y},{key:`dof-background`,target:b}]});return w.ok?o(C.value):w}function zi(e){let t=[`dof-coc`];return e.useNear&&t.push(`dof-prefilter-near`,`dof-prefilter-near-metadata`),e.useFar&&t.push(`dof-prefilter-far`,`dof-prefilter-far-metadata`),t.push(`dof-gather-${e.blurSide}`,`dof-composite`),Object.freeze(t)}var Bi=`forgeax.lens-effects`,Vi=`
struct Params {
  vignette: vec4<f32>,
  grainIntensity: f32,
  grainSize: f32,
  frame: u32,
  chromaticAngle: f32,
  color: vec4<f32>,
};
struct Output {
  @builtin(position) position: vec4<f32>,
  @location(0) uv: vec2<f32>,
};
@group(1) @binding(0) var scene: texture_2d<f32>;
@group(1) @binding(1) var sceneSampler: sampler;
@group(1) @binding(2) var<uniform> params: Params;
@vertex fn vs_main(@builtin(vertex_index) index: u32) -> Output {
  let uv = vec2<f32>(f32((index << 1u) & 2u), f32(index & 2u));
  return Output(vec4<f32>(uv.x * 2.0 - 1.0, 1.0 - uv.y * 2.0, 0.0, 1.0), uv);
}
fn grain_hash(pixel: vec2<u32>, frame: u32) -> f32 {
  var h = (pixel.x * 1597334677u) ^ (pixel.y * 3812015801u) ^ (frame * 2798796415u);
  h = (h ^ (h >> 16u)) * 2246822519u;
  h = (h ^ (h >> 13u)) * 3266489917u;
  h = h ^ (h >> 16u);
  return f32(h & 0x00ffffffu) / 16777216.0;
}
@fragment fn fs_main(input: Output) -> @location(0) vec4<f32> {
  let dimensions = vec2<f32>(textureDimensions(scene));
  // Input and output extents match; preserve the center channels without resampling.
  let center = textureLoad(scene, vec2<i32>(input.position.xy), 0);
  var color = center.rgb;
  if (params.vignette.w > 0.0) {
    // Three.js uses bottom-left UVs; negate Y for this top-left texture domain.
    let direction = vec2<f32>(cos(params.chromaticAngle), -sin(params.chromaticAngle));
    let offset = direction * params.vignette.w / dimensions;
    let halfTexel = 0.5 / dimensions;
    let redUv = clamp(input.uv + offset, halfTexel, 1.0 - halfTexel);
    let blueUv = clamp(input.uv - offset, halfTexel, 1.0 - halfTexel);
    color.r = textureSampleLevel(scene, sceneSampler, redUv, 0.0).r;
    color.b = textureSampleLevel(scene, sceneSampler, blueUv, 0.0).b;
  }
  let radius = length((input.uv - 0.5) * 2.0) / sqrt(2.0);
  let vignette = smoothstep(params.vignette.y, params.vignette.y + params.vignette.z, radius);
  color = mix(color, params.color.rgb, params.vignette.x * vignette);
  if (params.grainIntensity > 0.0) {
    let pixel = vec2<u32>(floor(input.position.xy / params.grainSize));
    let noise = clamp(0.1 + grain_hash(pixel, params.frame), 0.0, 1.0);
    color = mix(color, color + color * noise, params.grainIntensity);
  }
  return vec4<f32>(color, center.a);
}
`;function Hi(){return{identity:Bi,requiredCapabilities:[`rgba16floatRenderable`],requiredFullscreenPostProcesses:[{identity:Bi,source:Vi}],extract:e=>o(e.views.filter(e=>e.render&&e.selectedCamera?.lensEffects!==void 0).map(e=>e.identity)),plan:e=>o({work:e.map(e=>({scope:{view:e},resources:[{kind:`fullscreen-program`,name:Bi,source:Vi,reads:[`scene-color`],params:{byteSize:48,defaultValue:Ui(void 0,0)}}],passes:[]}))})}}function Ui(e,t){let n=new Float32Array([e?.vignetteIntensity??0,e?.vignetteRadius??.5,e?.vignetteSoftness??.5,e?.chromaticAberration??0,e?.grainIntensity??0,e?.grainSize??1,0,e?.chromaticAberrationAngle??0,e?.vignetteColor[0]??0,e?.vignetteColor[1]??0,e?.vignetteColor[2]??0,0]);return new DataView(n.buffer).setUint32(24,t>>>0,!0),new Uint8Array(n.buffer)}var Wi=`forgeax.lens-flare`,Gi=`forgeax.lens-flare.prefilter`,Ki=`forgeax.lens-flare.blur`,qi=`forgeax.lens-flare.composite`,Ji=160,Yi=64,Xi=1.25,Zi=`
const GUARD_BAND: f32 = ${Xi};
struct Params {
  control: vec4<f32>,
  tint: vec4<f32>,
  ghosts: array<vec4<f32>, 8>,
};
struct Output {
  @builtin(position) position: vec4<f32>,
  @location(0) uv: vec2<f32>,
};
@group(1) @binding(0) var source: texture_2d<f32>;
@group(1) @binding(1) var linearSampler: sampler;
@group(1) @binding(2) var<uniform> params: Params;
@vertex fn vs_main(@builtin(vertex_index) index: u32) -> Output {
  let uv = vec2<f32>(f32((index << 1u) & 2u), f32(index & 2u));
  return Output(vec4<f32>(uv.x * 2.0 - 1.0, 1.0 - uv.y * 2.0, 0.0, 1.0), uv);
}
fn disc_mask(x: vec2<f32>) -> f32 {
  let r = saturate(1.0 - dot(x, x));
  return r * r;
}
`,Qi=`${Zi}
@fragment fn fs_main(input: Output) -> @location(0) vec4<f32> {
  let x = (input.uv * 2.0 - 1.0) * GUARD_BAND;
  let sceneUv = x * 0.5 + 0.5;
  if (any(sceneUv < vec2<f32>(0.0)) || any(sceneUv > vec2<f32>(1.0))) {
    return vec4<f32>(0.0, 0.0, 0.0, 1.0);
  }
  let texel = 1.0 / vec2<f32>(textureDimensions(source));
  var sum = vec3<f32>(0.0);
  for (var j = 0u; j < 4u; j += 1u) {
    for (var i = 0u; i < 4u; i += 1u) {
      let offset = (vec2<f32>(f32(i), f32(j)) - 1.5) * 2.0 * texel;
      let uv = clamp(sceneUv + offset, texel * 0.5, 1.0 - texel * 0.5);
      let color = min(textureSampleLevel(source, linearSampler, uv, 0.0).rgb, vec3<f32>(65504.0));
      let luminance = color.r + color.g + color.b;
      sum += color * (max(luminance - params.control.x, 0.0) / max(luminance, 1e-4));
    }
  }
  return vec4<f32>(sum * (disc_mask(x * 0.5) / 16.0), 1.0);
}
`,$i=`${Zi}
@fragment fn fs_main(input: Output) -> @location(0) vec4<f32> {
  let dimensions = vec2<f32>(textureDimensions(source));
  let radius = params.control.y * dimensions.x / GUARD_BAND;
  var sum = vec3<f32>(0.0);
  for (var i = 0u; i < ${Yi}u; i += 1u) {
    let r = sqrt((f32(i) + 0.5) / ${Yi}.0) * radius;
    let theta = f32(i) * 2.39996323;
    let uv = input.uv + vec2<f32>(cos(theta), sin(theta)) * r / dimensions;
    sum += textureSampleLevel(source, linearSampler, uv, 0.0).rgb;
  }
  return vec4<f32>(sum / ${Yi}.0, 1.0);
}
`,ea=`${Zi}
@group(1) @binding(3) var bokeh: texture_2d<f32>;
// Small, bright bokeh texels amplify fixed-precision hardware filter weights.
// Interpolate in f32 to keep ghost energy consistent across backends.
fn sample_bokeh(uv: vec2<f32>) -> vec3<f32> {
  let size = vec2<i32>(textureDimensions(bokeh));
  let p = uv * vec2<f32>(size) - 0.5;
  let base = vec2<i32>(floor(p));
  let f = fract(p);
  let a = textureLoad(bokeh, clamp(base, vec2<i32>(0), size - 1), 0).rgb;
  let b = textureLoad(bokeh, clamp(base + vec2<i32>(1, 0), vec2<i32>(0), size - 1), 0).rgb;
  let c = textureLoad(bokeh, clamp(base + vec2<i32>(0, 1), vec2<i32>(0), size - 1), 0).rgb;
  let d = textureLoad(bokeh, clamp(base + vec2<i32>(1, 1), vec2<i32>(0), size - 1), 0).rgb;
  return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}
@fragment fn fs_main(input: Output) -> @location(0) vec4<f32> {
  let center = textureLoad(source, vec2<i32>(input.position.xy), 0);
  let p = input.uv * 2.0 - 1.0;
  let border = disc_mask(p) * disc_mask(p * 0.8);
  if (border <= 0.0) {
    return center;
  }
  var flare = vec3<f32>(0.0);
  for (var i = 0u; i < 8u; i += 1u) {
    let ghost = params.ghosts[i];
    if (abs(ghost.w) < 1e-4) {
      continue;
    }
    let g = p / (ghost.w * 2.0 * GUARD_BAND) + 0.5;
    if (any(g < vec2<f32>(0.0)) || any(g > vec2<f32>(1.0))) {
      continue;
    }
    flare += ghost.rgb * sample_bokeh(g);
  }
  return vec4<f32>(center.rgb + flare * params.tint.rgb * border, center.a);
}
`,ta=[{kind:`fullscreen-program`,name:Gi,source:Qi,reads:[`scene-color`],params:{byteSize:Ji,defaultValue:ia(void 0)}},{kind:`fullscreen-program`,name:Ki,source:$i,reads:[`lens-flare-prefilter`],params:{byteSize:Ji,defaultValue:ia(void 0)}},{kind:`fullscreen-program`,name:qi,source:ea,reads:[`scene-color`,`lens-flare-bokeh`],params:{byteSize:Ji,defaultValue:ia(void 0)}}];function na(){return{identity:Wi,requiredCapabilities:[`rgba16floatRenderable`],requiredFullscreenPostProcesses:ta.map(e=>({identity:e.name,source:e.source})),extract:e=>o(e.views.filter(e=>e.render&&e.selectedCamera?.lensFlare!==void 0).map(e=>e.identity)),plan:e=>o({work:e.map(e=>({scope:{view:e},resources:ta,passes:[]}))})}}function ra(e){return e===Wi||ta.some(t=>t.name===e)}function ia(e){let t=new Float32Array(Ji/4);t[0]=e?.threshold??8,t[1]=(e?.bokehSize??3)/100;let n=e?.intensity??0;for(let r=0;r<3;r+=1)t[4+r]=(e?.tint[r]??1)*n;for(let n=0;n<8;n+=1){for(let r=0;r<3;r+=1)t[8+n*4+r]=e?.ghostTints[n*3+r]??0;t[8+n*4+3]=e?.ghostScales[n]??0}return new Uint8Array(t.buffer)}function aa(e){return{width:Math.max(1,Math.ceil(e.width*Xi/8)),height:Math.max(1,Math.ceil(e.height*Xi/8))}}function oa(e,t,n){let r=aa(n),i=F(e,`standard-lens-flare-prefilter`,{format:`rgba16float`,size:r,domain:`linear-hdr`});if(!i.ok)return i;let a=F(e,`standard-lens-flare-bokeh`,{format:`rgba16float`,size:r,domain:`linear-hdr`});if(!a.ok)return a;let s=F(e,`standard-lens-flare`,{format:`rgba16float`,size:{width:n.width,height:n.height},domain:`linear-hdr`});if(!s.ok)return s;let c=P(e,{name:`standard-lens-flare-prefilter`,shader:Gi,clearColor:[0,0,0,1],input:t,outputs:[i.value]});if(!c.ok)return c;let l=P(e,{name:`standard-lens-flare-bokeh`,shader:Ki,clearColor:[0,0,0,1],input:i.value,outputs:[a.value]});if(!l.ok)return l;let u=P(e,{name:`standard-lens-flare`,shader:qi,input:t,outputs:[s.value],additionalReads:[{key:`lens-flare-bokeh`,target:a.value}]});return u.ok?o(s.value):u}var sa=`forgeax.motion-blur`;function ca(e,t,n,r){return P(e,{name:`motion-blur`,shader:sa,input:t,additionalReads:[{key:`scene-temporal`,target:n}],outputs:[r]})}var la=`struct MotionBlurComputeParams {
  shutterAngle : f32,
  maxRadiusPixels : f32,
  sampleCount : u32,
  reset : u32,
  targetFps : f32,
  exposureScale : f32,
  frameDeltaSeconds : f32,
  flags : u32,
};

struct MotionBlurTileSummary {
  // The two motion lanes retain the source pixel that supplied the direction.
  // Those anchors let a bounded midpoint tap hit a sparse source without
  // adding a color read or growing the 32-byte per-tile summary.
  maxMotionAndLength : vec4<f32>,
  secondaryMotionAndDepth : vec4<f32>,
};

struct TemporalSample {
  motion : vec2<f32>,
  depth : f32,
  reactive : f32,
  validDepth : bool,
  motionValid : bool,
};

struct MotionBlurSupport {
  primaryMotion : vec2<f32>,
  secondaryMotion : vec2<f32>,
  primaryAnchor : vec2<i32>,
  secondaryAnchor : vec2<i32>,
  primaryRadius : f32,
  secondaryRadius : f32,
  valid : bool,
  longVector : bool,
};

struct MotionBlurTap {
  pixel : vec2<i32>,
  fallbackPixel : vec2<i32>,
  valid : bool,
  fallbackValid : bool,
};

struct MotionBlurFilter {
  color0 : vec4<f32>,
  color1 : vec4<f32>,
  color2 : vec4<f32>,
  color3 : vec4<f32>,
  depth0 : f32,
  depth1 : f32,
  depth2 : f32,
  depth3 : f32,
  coverage0 : f32,
  coverage1 : f32,
  coverage2 : f32,
  coverage3 : f32,
  receiver : vec2<i32>,
  motion : vec2<f32>,
  radius : f32,
  receiverMask : u32,
  validMask : u32,
  valid : bool,
};

struct MotionBlurCacheSample {
  color : vec4<f32>,
  coverage : f32,
  valid : bool,
};

struct MotionBlurSource {
  pixel : vec2<i32>,
  motion : vec2<f32>,
  depth : f32,
  radius : f32,
  coverage0 : f32,
  coverage1 : f32,
  coverage2 : f32,
  coverage3 : f32,
  receiverMask : u32,
  valid : bool,
};

@group(0) @binding(0) var currentColor : texture_2d<f32>;
@group(0) @binding(1) var sceneTemporal : texture_2d<f32>;
@group(0) @binding(2) var<storage, read_write> tileSummary : array<MotionBlurTileSummary>;
@group(0) @binding(3) var outputColor : texture_storage_2d<rgba16float, write>;
@group(0) @binding(4) var<uniform> params : MotionBlurComputeParams;

// Reconstruct a bounded part of a partially covered opaque edge and fund it
// by attenuating the matching empty-background trail. The fixed factor keeps
// the work and the energy adjustment independent of the blur radius.
const EDGE_FILL_FACTOR : f32 = 0.99;

// One 8x8 workgroup covers a 16x16 tile. Each invocation reads a 2x2
// footprint, then the workgroup reduction combines the values without
// write contention or a serial 256-pixel loop.
var<workgroup> tileMotionScratch : array<vec2<f32>, 64>;
var<workgroup> tileLengthScratch : array<f32, 64>;
var<workgroup> tileSourceScratch : array<vec2<i32>, 64>;
var<workgroup> tileSecondaryMotionScratch : array<vec2<f32>, 64>;
var<workgroup> tileSecondaryLengthScratch : array<f32, 64>;
var<workgroup> tileSecondarySourceScratch : array<vec2<i32>, 64>;
// The reconstruction workgroup owns a 4x4 half-resolution result cache for
// its 8x8 output footprint. Each owner computes the complete bounded support
// filter once. Full-resolution lanes only select a depth-compatible cached
// result after the uniform barrier, with no cross-workgroup dependency.
// Four quadrants are kept per half-cell. Each owner pays four receiver
// center-color reads and at most supportCount (<=15) accepted source-color
// reads; midpoint anchor recovery reuses an existing slot and adds no read
// budget. The shared result retains odd/even coverage instead of spreading an
// odd row across both rows.
var<workgroup> halfFilteredColor : array<vec4<f32>, 64>;
var<workgroup> halfFilteredDepth : array<f32, 64>;
var<workgroup> halfFilteredCoverage : array<f32, 64>;
var<workgroup> halfFilteredReceiver : array<vec2<i32>, 16>;
var<workgroup> halfFilteredMotion : array<vec2<f32>, 16>;
var<workgroup> halfFilteredRadius : array<f32, 16>;
var<workgroup> halfFilteredValid : array<u32, 64>;
var<workgroup> longVectorScratch : array<u32, 64>;
// A reconstruct workgroup covers one 8x8 output footprint. Its first lane
// derives the complete bounded tile neighbourhood once and publishes the top
// two source directions for all lanes and all designated half-resolution
// owners. This keeps summary work O(P/T^2), rather than repeating a tile walk
// per output pixel.
var<workgroup> neighbourhoodPrimaryMotion : vec2<f32>;
var<workgroup> neighbourhoodPrimaryLength : f32;
var<workgroup> neighbourhoodPrimaryAnchor : vec2<i32>;
var<workgroup> neighbourhoodSecondaryMotion : vec2<f32>;
var<workgroup> neighbourhoodSecondaryLength : f32;
var<workgroup> neighbourhoodSecondaryAnchor : vec2<i32>;

// maxRadiusPixels is authored at [0,64], so a 16-pixel tile support reaches
// at most four tiles. The fixed 9x9 lattice is geometrically derived from its
// index, then intersected with the circular/AABB support. It is a constant
// bounded metadata walk: no loop scales with the requested radius and no
// radius-squared per-pixel storage or write path is introduced.
const MAX_TILE_REACH : i32 = 4;
const TILE_NEIGHBORHOOD_SIDE : u32 = 9u;
const TILE_NEIGHBORHOOD_COUNT : u32 = 81u;

fn finite(value : f32) -> bool {
  return value == value && abs(value) < 3.402823e+38;
}

fn pixelInBounds(pixel : vec2<i32>, dimensions : vec2<i32>) -> bool {
  return pixel.x >= 0 && pixel.y >= 0 && pixel.x < dimensions.x && pixel.y < dimensions.y;
}

fn decodeDepth(packed : f32) -> f32 {
  if (packed < 0.0) { return 0.0; }
  return exp2(packed) - 1.0;
}

fn temporalAt(pixel : vec2<i32>, dimensions : vec2<i32>) -> TemporalSample {
  let samplePixel = clamp(pixel, vec2<i32>(0), dimensions - vec2<i32>(1));
  let packed = textureLoad(sceneTemporal, samplePixel, 0);
  let invalidMotion = packed.w >= 2.0;
  return TemporalSample(
    packed.xy,
    decodeDepth(packed.z),
    clamp(packed.w - select(0.0, 2.0, invalidMotion), 0.0, 1.0),
    packed.z >= 0.0,
    !invalidMotion,
  );
}

fn depthReject(center : f32, sample : f32) -> bool {
  return sample > center + max(0.01, center * 0.01);
}

fn distinctDirection(a : vec2<f32>, b : vec2<f32>) -> bool {
  let aLength = length(a);
  let bLength = length(b);
  if (aLength <= 1e-5 || bLength <= 1e-5) { return false; }
  // Keep only genuinely different directions. Opposite signs still carry
  // separate source segments, while nearly parallel candidates do not spend
  // the bounded second-direction slot.
  return abs(dot(a / aLength, b / bLength)) < 0.94;
}

fn sourceVelocitySegmentCovers(
  receiverPixel : vec2<i32>,
  sourcePixel : vec2<i32>,
  motionPixels : vec2<f32>,
  radius : f32,
) -> bool {
  let delta = vec2<f32>(receiverPixel - sourcePixel);
  let motionLength = length(motionPixels);
  if (motionLength <= 1e-5 || radius <= 1e-5) { return false; }
  let direction = motionPixels / motionLength;
  let along = dot(delta, direction);
  let perpendicular = abs(delta.x * direction.y - delta.y * direction.x);
  // A source segment owns a one-pixel coverage tube. This is a bounded
  // geometric test, not a radius-sized source scan, and lets a sparse mover
  // cover a static receiver without accepting a far/orthogonal source.
  return abs(along) <= radius + 0.75 && perpendicular <= 0.75;
}

fn symmetricOffset(index : u32, count : u32, motion : vec2<f32>) -> vec2<f32> {
  let denominator = max(f32(count), 1.0);
  return motion * (2.0 * (f32(index) + 0.5) / denominator - 1.0);
}

fn tileNeighborhoodOffset(index : u32) -> vec2<i32> {
  let x = i32(index % TILE_NEIGHBORHOOD_SIDE) - MAX_TILE_REACH;
  let y = i32(index / TILE_NEIGHBORHOOD_SIDE) - MAX_TILE_REACH;
  return vec2<i32>(x, y);
}

fn tileOffsetWithinSupport(offset : vec2<i32>, tileReach : i32) -> bool {
  if (offset.x == 0 && offset.y == 0) { return false; }
  let boundedReach = min(max(tileReach, 1), MAX_TILE_REACH);
  // The bounded lattice is a square around the receiver tile. The precise
  // AABB/circle intersection below decides whether a diagonal tile really
  // intersects the support; a circular pre-filter here would drop the
  // (±2,±2) and boundary cases before that exact test can run.
  return abs(offset.x) <= boundedReach && abs(offset.y) <= boundedReach;
}

fn tileIntersectsSupport(
  receiverPixel : vec2<i32>,
  candidateTile : vec2<i32>,
  dimensions : vec2<i32>,
  supportRadius : f32,
) -> bool {
  // Use the receiver-to-tile-AABB lower bound. This includes every tile whose
  // contents can intersect the support, including signs and diagonals, while
  // rejecting an outside-support tile before loading its summary.
  let tileMin = vec2<f32>(candidateTile * 16);
  let tileMax = min(tileMin + vec2<f32>(16.0), vec2<f32>(dimensions));
  let receiver = vec2<f32>(receiverPixel) + vec2<f32>(0.5);
  let dx = max(max(tileMin.x - receiver.x, 0.0), receiver.x - tileMax.x);
  let dy = max(max(tileMin.y - receiver.y, 0.0), receiver.y - tileMax.y);
  let distance = vec2<f32>(dx, dy);
  return dot(distance, distance) <= supportRadius * supportRadius + 1.0;
}

fn tileIntersectsWorkgroupSupport(
  workgroupBase : vec2<i32>,
  candidateTile : vec2<i32>,
  dimensions : vec2<i32>,
  supportRadius : f32,
) -> bool {
  // A workgroup's 8x8 rectangle is the conservative receiver domain for one
  // shared metadata walk. The AABB lower bound includes every pixel in that
  // rectangle that can reach the candidate tile, including diagonal/sign
  // variants, while rejecting a tile fully outside the support.
  let tileMin = vec2<f32>(candidateTile * 16);
  let tileMax = min(tileMin + vec2<f32>(16.0), vec2<f32>(dimensions));
  let groupMin = vec2<f32>(workgroupBase) + vec2<f32>(0.5);
  let groupMax = min(groupMin + vec2<f32>(8.0), vec2<f32>(dimensions));
  let dx = max(max(tileMin.x - groupMax.x, 0.0), groupMin.x - tileMax.x);
  let dy = max(max(tileMin.y - groupMax.y, 0.0), groupMin.y - tileMax.y);
  let distance = vec2<f32>(dx, dy);
  return dot(distance, distance) <= supportRadius * supportRadius + 1.0;
}

fn scanTileNeighbourhood(
  workgroupBase : vec2<i32>,
  dimensions : vec2<i32>,
) {
  let tiles = (vec2<u32>(dimensions) + vec2<u32>(15)) / vec2<u32>(16);
  let tileCoordinate = workgroupBase / vec2<i32>(16);
  let currentIndex = u32(tileCoordinate.y) * tiles.x + u32(tileCoordinate.x);
  let current = tileSummary[currentIndex];
  var primary = current.maxMotionAndLength.xy * vec2<f32>(dimensions) * params.exposureScale;
  var primaryLength = length(primary);
  var primaryAnchor = vec2<i32>(
    i32(current.maxMotionAndLength.z),
    i32(current.maxMotionAndLength.w),
  );
  var secondary = current.secondaryMotionAndDepth.xy * vec2<f32>(dimensions) * params.exposureScale;
  var secondaryLength = length(secondary);
  var secondaryAnchor = vec2<i32>(
    i32(current.secondaryMotionAndDepth.z),
    i32(current.secondaryMotionAndDepth.w),
  );
  let supportRadius = min(max(params.maxRadiusPixels, 1.0), 64.0);
  let tileReach = min(MAX_TILE_REACH, max(1, i32(ceil(supportRadius / 16.0))));
  for (var tileCandidateIndex = 0u; tileCandidateIndex < TILE_NEIGHBORHOOD_COUNT; tileCandidateIndex += 1u) {
    let offset = tileNeighborhoodOffset(tileCandidateIndex);
    if (!tileOffsetWithinSupport(offset, tileReach)) { continue; }
    let candidateTile = tileCoordinate + offset;
    if (
      candidateTile.x < 0 ||
      candidateTile.y < 0 ||
      candidateTile.x >= i32(tiles.x) ||
      candidateTile.y >= i32(tiles.y) ||
      !tileIntersectsWorkgroupSupport(workgroupBase, candidateTile, dimensions, supportRadius)
    ) { continue; }
    let candidate = tileSummary[u32(candidateTile.y) * tiles.x + u32(candidateTile.x)];
    let candidatePrimary = candidate.maxMotionAndLength.xy * vec2<f32>(dimensions) * params.exposureScale;
    let candidatePrimaryLength = length(candidatePrimary);
    let candidatePrimaryAnchor = vec2<i32>(
      i32(candidate.maxMotionAndLength.z),
      i32(candidate.maxMotionAndLength.w),
    );
    if (candidatePrimaryLength > primaryLength) {
      let previousPrimary = primary;
      let previousLength = primaryLength;
      let previousAnchor = primaryAnchor;
      primary = candidatePrimary;
      primaryLength = candidatePrimaryLength;
      primaryAnchor = candidatePrimaryAnchor;
      if (previousLength > 1e-5 && distinctDirection(primary, previousPrimary) && previousLength > secondaryLength) {
        secondary = previousPrimary;
        secondaryLength = previousLength;
        secondaryAnchor = previousAnchor;
      }
    } else if (
      candidatePrimaryLength > secondaryLength &&
      distinctDirection(primary, candidatePrimary)
    ) {
      secondary = candidatePrimary;
      secondaryLength = candidatePrimaryLength;
      secondaryAnchor = candidatePrimaryAnchor;
    }
    let candidateSecondary = candidate.secondaryMotionAndDepth.xy * vec2<f32>(dimensions) * params.exposureScale;
    let candidateSecondaryLength = length(candidateSecondary);
    let candidateSecondaryAnchor = vec2<i32>(
      i32(candidate.secondaryMotionAndDepth.z),
      i32(candidate.secondaryMotionAndDepth.w),
    );
    if (candidateSecondaryLength > secondaryLength && distinctDirection(primary, candidateSecondary)) {
      secondary = candidateSecondary;
      secondaryLength = candidateSecondaryLength;
      secondaryAnchor = candidateSecondaryAnchor;
    }
  }
  neighbourhoodPrimaryMotion = primary;
  neighbourhoodPrimaryLength = primaryLength;
  neighbourhoodPrimaryAnchor = primaryAnchor;
  neighbourhoodSecondaryMotion = secondary;
  neighbourhoodSecondaryLength = secondaryLength;
  neighbourhoodSecondaryAnchor = secondaryAnchor;
}

fn validMotionParameters() -> bool {
  return
    finite(params.frameDeltaSeconds) &&
    params.frameDeltaSeconds > 0.0 &&
    params.frameDeltaSeconds <= 0.1 &&
    finite(params.exposureScale) &&
    params.exposureScale > 0.0 &&
    finite(params.targetFps) &&
    params.targetFps >= 0.0 &&
    params.targetFps <= 240.0 &&
    params.targetFps == floor(params.targetFps) &&
    params.sampleCount >= 4u &&
    params.maxRadiusPixels > 0.0 &&
    finite(params.maxRadiusPixels) &&
    params.shutterAngle > 0.0;
}

fn sourceMotionPixels(sample : TemporalSample, dimensions : vec2<i32>) -> vec2<f32> {
  return sample.motion * vec2<f32>(dimensions) * params.exposureScale;
}

fn sourceRadius(motionPixels : vec2<f32>, shutter : f32) -> f32 {
  return min(length(motionPixels) * shutter * 0.5, params.maxRadiusPixels);
}

fn resolveMotionBlurSupport(
  pixel : vec2<i32>,
  dimensions : vec2<i32>,
) -> MotionBlurSupport {
  var empty = MotionBlurSupport(
    vec2<f32>(0.0),
    vec2<f32>(0.0),
    vec2<i32>(0),
    vec2<i32>(0),
    0.0,
    0.0,
    false,
    false,
  );
  if (!pixelInBounds(pixel, dimensions) || !validMotionParameters() || params.reset != 0u) {
    return empty;
  }
  let center = temporalAt(pixel, dimensions);
  if (!center.validDepth || !center.motionValid) { return empty; }
  let shutter = clamp(params.shutterAngle / 360.0, 0.0, 1.0);
  let centerMotion = sourceMotionPixels(center, dimensions);
  let centerLength = length(centerMotion);
  var primaryMotion = centerMotion;
  var primaryLength = centerLength;
  var primaryAnchor = pixel;
  var secondaryMotion = neighbourhoodSecondaryMotion;
  var secondaryLength = neighbourhoodSecondaryLength;
  var secondaryAnchor = neighbourhoodSecondaryAnchor;
  if (neighbourhoodPrimaryLength > primaryLength) {
    if (distinctDirection(primaryMotion, neighbourhoodPrimaryMotion)) {
      secondaryMotion = primaryMotion;
      secondaryLength = primaryLength;
      secondaryAnchor = pixel;
    }
    primaryMotion = neighbourhoodPrimaryMotion;
    primaryLength = neighbourhoodPrimaryLength;
    primaryAnchor = neighbourhoodPrimaryAnchor;
  } else if (
    neighbourhoodPrimaryLength > secondaryLength &&
    distinctDirection(primaryMotion, neighbourhoodPrimaryMotion)
  ) {
    secondaryMotion = neighbourhoodPrimaryMotion;
    secondaryLength = neighbourhoodPrimaryLength;
    secondaryAnchor = neighbourhoodPrimaryAnchor;
  }
  if (
    secondaryLength <= 1e-5 ||
    !distinctDirection(primaryMotion, secondaryMotion)
  ) {
    secondaryMotion = vec2<f32>(0.0);
    secondaryLength = 0.0;
  }
  empty.primaryMotion = primaryMotion;
  empty.secondaryMotion = secondaryMotion;
  empty.primaryAnchor = primaryAnchor;
  empty.secondaryAnchor = secondaryAnchor;
  empty.primaryRadius = sourceRadius(primaryMotion, shutter);
  empty.secondaryRadius = sourceRadius(secondaryMotion, shutter);
  empty.valid = empty.primaryRadius > 1e-5 || empty.secondaryRadius > 1e-5;
  empty.longVector = max(empty.primaryRadius, empty.secondaryRadius) > 8.0;
  return empty;
}

fn sourceAnchorForReceiver(
  receiverPixel : vec2<i32>,
  anchor : vec2<i32>,
  motion : vec2<f32>,
  dimensions : vec2<i32>,
) -> vec2<i32> {
  // A tile summary has one source anchor, while a horizontal source may span
  // the tile's perpendicular axis. Project that anchor onto the receiver's
  // motion line before the midpoint read. The following source footprint
  // validates the projected pixel, so a thin or off-axis source cannot be
  // invented by the projection.
  let motionLength = length(motion);
  if (motionLength <= 1e-5) { return anchor; }
  let direction = motion / motionLength;
  let delta = vec2<f32>(receiverPixel - anchor);
  let perpendicular = delta - direction * dot(delta, direction);
  let projected = vec2<f32>(anchor) + perpendicular;
  let candidate = vec2<i32>(floor(projected + vec2<f32>(0.5)));
  return clamp(candidate, vec2<i32>(0), dimensions - vec2<i32>(1));
}

fn supportTap(
  receiverPixel : vec2<i32>,
  index : u32,
  count : u32,
  motion : vec2<f32>,
  radius : f32,
  anchor : vec2<i32>,
  dimensions : vec2<i32>,
) -> MotionBlurTap {
  // Preserve the geometric midpoint as the primary sample. The source anchor
  // is a recovery coordinate for a sparse tile summary, not a replacement for
  // the receiver's authored support. It is tried only when this midpoint has
  // no valid source, and therefore never adds a color read or a tap.
  var fallbackPixel = vec2<i32>(0);
  var fallbackValid = false;
  if (index == count / 2u) {
    fallbackPixel = sourceAnchorForReceiver(receiverPixel, anchor, motion, dimensions);
    fallbackValid = pixelInBounds(fallbackPixel, dimensions);
  }
  let direction = motion / max(length(motion), 1e-5);
  let offset = symmetricOffset(index, count, direction * radius);
  let dimensionsF = vec2<f32>(dimensions);
  let uv = (vec2<f32>(receiverPixel) + vec2<f32>(0.5) + offset) / dimensionsF;
  if (uv.x < 0.0 || uv.y < 0.0 || uv.x >= 1.0 || uv.y >= 1.0) {
    return MotionBlurTap(vec2<i32>(0), fallbackPixel, false, fallbackValid);
  }
  let candidate = vec2<i32>(floor(uv * dimensionsF));
  return MotionBlurTap(candidate, fallbackPixel, pixelInBounds(candidate, dimensions), fallbackValid);
}

fn sourceAt(
  receiverPixel : vec2<i32>,
  sourcePixel : vec2<i32>,
  centerDepth : f32,
  shutter : f32,
  dimensions : vec2<i32>,
) -> MotionBlurSource {
  let empty = MotionBlurSource(
    vec2<i32>(0),
    vec2<f32>(0.0),
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0u,
    false,
  );
  if (!pixelInBounds(sourcePixel, dimensions)) { return empty; }
  let source = temporalAt(sourcePixel, dimensions);
  if (!source.validDepth || !source.motionValid || depthReject(centerDepth, source.depth)) {
    return empty;
  }
  let motionPixels = sourceMotionPixels(source, dimensions);
  let radius = sourceRadius(motionPixels, shutter);
  if (!sourceVelocitySegmentCovers(receiverPixel, sourcePixel, motionPixels, radius)) {
    return empty;
  }
  return MotionBlurSource(
    sourcePixel,
    motionPixels,
    source.depth,
    radius,
    1.0,
    1.0,
    1.0,
    1.0,
    0u,
    true,
  );
}

// A half-resolution owner represents a complete 2x2 receiving footprint. The
// source motion test is evaluated against every receiving pixel in that
// footprint, so odd/even rows and columns remain visible without a second
// filter pass or an unbounded neighbourhood walk.
fn sourceAtFootprint(
  receiverPixel : vec2<i32>,
  sourcePixel : vec2<i32>,
  centerDepth : f32,
  shutter : f32,
  dimensions : vec2<i32>,
) -> MotionBlurSource {
  var selected = MotionBlurSource(
    vec2<i32>(0),
    vec2<f32>(0.0),
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0u,
    false,
  );
  var selectedDepth = 3.402823e+38;
  var coverage0 = 0.0;
  var coverage1 = 0.0;
  var coverage2 = 0.0;
  var coverage3 = 0.0;
  var selectedReceiverMask = 0u;
  for (var y = 0u; y < 2u; y += 1u) {
    for (var x = 0u; x < 2u; x += 1u) {
      let candidatePixel = sourcePixel + vec2<i32>(i32(x), i32(y));
      if (!pixelInBounds(candidatePixel, dimensions)) { continue; }
      let temporal = temporalAt(candidatePixel, dimensions);
      if (!temporal.validDepth || !temporal.motionValid || depthReject(centerDepth, temporal.depth)) {
        continue;
      }
      let motionPixels = sourceMotionPixels(temporal, dimensions);
      let radius = sourceRadius(motionPixels, shutter);
      var receiverMask = 0u;
      // A source half-cell and a receiver half-cell share the same integer
      // displacement. This one-to-one correspondence keeps a diagonal source
      // from being counted for all four receiver quadrants just because its
      // tube crosses the quadrant. The segment test still supplies the motion
      // support and depth/validity checks remain source-owned.
      let receiver = receiverPixel + vec2<i32>(i32(x), i32(y));
      if (
        pixelInBounds(receiver, dimensions) &&
        sourceVelocitySegmentCovers(receiver, candidatePixel, motionPixels, radius)
      ) {
        receiverMask = receiverMask | (1u << (y * 2u + x));
      }
      if (receiverMask == 0u) { continue; }
      if (!selected.valid || temporal.depth < selectedDepth) {
        selected = MotionBlurSource(
          candidatePixel,
          motionPixels,
          temporal.depth,
          radius,
          0.0,
          0.0,
          0.0,
          0.0,
          receiverMask,
          true,
        );
        selectedDepth = temporal.depth;
        coverage0 = 0.0;
        coverage1 = 0.0;
        coverage2 = 0.0;
        coverage3 = 0.0;
        selectedReceiverMask = receiverMask;
      }
      if (abs(temporal.depth - selectedDepth) <= 1e-4) {
        // The common integer displacement above gives each source cell one
        // receiver quadrant. The matching footprint therefore contributes its
        // full unit overlap to that one owner.
        if ((receiverMask & 1u) != 0u) { coverage0 += 1.0; }
        if ((receiverMask & 2u) != 0u) { coverage1 += 1.0; }
        if ((receiverMask & 4u) != 0u) { coverage2 += 1.0; }
        if ((receiverMask & 8u) != 0u) { coverage3 += 1.0; }
        selectedReceiverMask = selectedReceiverMask | receiverMask;
      }
    }
  }
  if (selected.valid) {
    // The owner samples a 2x2 source footprint but pays for one color read.
    // Each receiving quadrant keeps the fraction of that footprint that is
    // covered at the selected depth. This preserves energy at boundaries and
    // carries a one-pixel odd-row feature into its real row only.
    selected.coverage0 = min(coverage0, 1.0) * select(0.0, 1.0, (selectedReceiverMask & 1u) != 0u);
    selected.coverage1 = min(coverage1, 1.0) * select(0.0, 1.0, (selectedReceiverMask & 2u) != 0u);
    selected.coverage2 = min(coverage2, 1.0) * select(0.0, 1.0, (selectedReceiverMask & 4u) != 0u);
    selected.coverage3 = min(coverage3, 1.0) * select(0.0, 1.0, (selectedReceiverMask & 8u) != 0u);
    selected.receiverMask = selectedReceiverMask;
  }
  return selected;
}

fn midpointTileOwnership(
  receiverPixel : vec2<i32>,
  source : MotionBlurSource,
) -> f32 {
  // A recovered tile anchor represents one two-pixel source footprint. The
  // footprint is split across the finite, geometrically derived tile bands of
  // the support segment. One half-cell owner per band claims the represented
  // midpoint slot, rather than painting every receiver in the interval.
  let sourcePixel = source.pixel;
  let motionLength = length(source.motion);
  if (motionLength <= 1e-5 || source.radius <= 1e-5) { return 0.0; }
  let receiverTile = receiverPixel / vec2<i32>(16);
  let sourceTile = sourcePixel / vec2<i32>(16);
  let tileDelta = vec2<f32>(sourceTile - receiverTile);
  let direction = source.motion / motionLength;
  let along = abs(dot(tileDelta, direction));
  let perpendicular = abs(tileDelta.x * direction.y - tileDelta.y * direction.x);
  let tileReach = min(4, max(1, i32(ceil(source.radius / 16.0))));
  if (along < 1.0 || ceil(along) > f32(tileReach) || perpendicular > 1.0) { return 0.0; }
  let groupBase = (receiverPixel / vec2<i32>(8)) * vec2<i32>(8);
  let local = receiverPixel - groupBase;
  let ownerX = select(
    clamp(((sourcePixel.x - groupBase.x) / 2) * 2, 0, 6),
    select(0, 6, sourcePixel.x > receiverPixel.x),
    sourcePixel.x != receiverPixel.x,
  );
  let ownerY = select(
    clamp(((sourcePixel.y - groupBase.y) / 2) * 2, 0, 6),
    select(0, 6, sourcePixel.y > receiverPixel.y),
    sourcePixel.y != receiverPixel.y,
  );
  if (local.x != ownerX || local.y != ownerY) { return 0.0; }
  let sourceFootprintLength = 2.0;
  let supportLength = max(2.0 * source.radius, sourceFootprintLength);
  // Divide the finite footprint ownership over every reachable tile band.
  // This keeps the total recovery mass bounded when the support grows from
  // 32 to 64 pixels while retaining a nonzero owner at any in-view band.
  return min(1.0, sourceFootprintLength / (supportLength * f32(tileReach)));
}

fn integrateLongColor(
  filtered : vec4<f32>,
  validCount : f32,
  hasAcceptedSource : bool,
  uncovered : f32,
  count : u32,
  supportCount : u32,
  centerColor : vec4<f32>,
  centerMoving : bool,
) -> vec4<f32> {
  // Uncovered ownership is decremented at the same time as validCount is incremented
  // for both geometric and midpoint-recovered samples. Keep the derived cap
  // as a guard against floating point accumulation and make the ownership
  // transfer explicit instead of adding an independent brightness term.
  let conservedUncovered = min(
    max(uncovered, 0.0),
    max(f32(supportCount) - validCount, 0.0),
  );
  // A moving receiver can be partially covered at a silhouette edge. Use the
  // accepted foreground only for the receiver's missing current coverage; a
  // fully covered receiver keeps the original center contribution and the
  // Dawn energy contract remains unchanged for uniform opaque surfaces.
  let acceptedColor = select(
    vec3<f32>(0.0),
    filtered.rgb / max(validCount, 1.0),
    hasAcceptedSource && validCount > 0.0,
  );
  // Preserve the color target's authored alpha as the output floor. It is
  // separate from the RGB test below, which identifies an empty background
  // receiver without treating alpha as a scene-coverage attachment.
  let missingForeground = 1.0 - clamp(centerColor.a, 0.0, 1.0);
  let edgeCoverage = select(missingForeground, 1.0, centerMoving);
  let edgeFill = acceptedColor * edgeCoverage * EDGE_FILL_FACTOR;
  let movingFallback = select(centerColor.rgb, edgeFill, hasAcceptedSource && validCount > 0.0);
  let background = select(vec3<f32>(0.0), movingFallback, centerMoving);
  // The accepted colour can come from a transparent receiver's moving
  // foreground. Carry the same bounded support coverage into alpha so that
  // RGB written outside the current silhouette is not composited as black.
  // Preserve the receiver's authored coverage as a floor: blur must not make
  // an already visible pixel disappear.
  let acceptedAlpha = select(
    0.0,
    filtered.a / max(validCount, 1.0),
    validCount > 0.0,
  );
  let acceptedCoverage = validCount + missingForeground * conservedUncovered;
  let reconstructedAlpha = acceptedAlpha * acceptedCoverage / max(f32(count), 1.0);
  let outputAlpha = clamp(max(centerColor.a, reconstructedAlpha), 0.0, 1.0);
  let emptyReceiver =
    !centerMoving &&
    hasAcceptedSource &&
    max(max(abs(centerColor.r), abs(centerColor.g)), abs(centerColor.b)) < 1e-4;
  let sourceScale = select(1.0, 1.0 - EDGE_FILL_FACTOR, emptyReceiver);
  let sourceContribution = filtered.rgb * sourceScale;
  let trailScale = select(1.0, 1.0 - EDGE_FILL_FACTOR, emptyReceiver);
  let trailContribution = background * conservedUncovered * trailScale;
  return vec4<f32>(
    (sourceContribution + centerColor.rgb + trailContribution) / max(f32(count), 1.0),
    outputAlpha,
  );
}

fn longSupportFilter(
  receiverPixel : vec2<i32>,
  support : MotionBlurSupport,
  centerDepth : f32,
  dimensions : vec2<i32>,
) -> MotionBlurFilter {
  var empty = MotionBlurFilter(
    vec4<f32>(0.0),
    vec4<f32>(0.0),
    vec4<f32>(0.0),
    vec4<f32>(0.0),
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    receiverPixel,
    vec2<f32>(0.0),
    0.0,
    0u,
    0u,
    false,
  );
  if (!support.valid) { return empty; }
  let count = min(params.sampleCount, 16u);
  // The authored tier is the total source colour-read budget. Reserve one slot
  // for the receiver/background contribution; the remaining bounded taps
  // (at most 15) are split between the two source directions when needed.
  let supportCount = max(count - 1u, 1u);
  let useSecondDirection = support.secondaryRadius > 1e-5 && distinctDirection(support.primaryMotion, support.secondaryMotion);
  let primaryCount = select(supportCount, max(supportCount / 2u, 1u), useSecondDirection);
  let secondaryCount = max(supportCount - primaryCount, 1u);
  let shutter = clamp(params.shutterAngle / 360.0, 0.0, 1.0);
  let center = temporalAt(receiverPixel, dimensions);
  // Keep each receiving quadrant's own center color. Reusing the owner
  // pixel for all four quadrants causes a one-pixel parity shift to duplicate
  // a bright source (or erase a bright receiver) in the half-resolution cache.
  var centerColor0 = colorAt(receiverPixel, dimensions);
  var centerColor1 = colorAt(receiverPixel + vec2<i32>(1, 0), dimensions);
  var centerColor2 = colorAt(receiverPixel + vec2<i32>(0, 1), dimensions);
  var centerColor3 = colorAt(receiverPixel + vec2<i32>(1, 1), dimensions);
  var filtered0 = vec4<f32>(0.0);
  var filtered1 = vec4<f32>(0.0);
  var filtered2 = vec4<f32>(0.0);
  var filtered3 = vec4<f32>(0.0);
  var validCount0 = 0.0;
  var validCount1 = 0.0;
  var validCount2 = 0.0;
  var validCount3 = 0.0;
  var hasAcceptedSource0 = false;
  var hasAcceptedSource1 = false;
  var hasAcceptedSource2 = false;
  var hasAcceptedSource3 = false;
  var uncovered0 = f32(supportCount);
  var uncovered1 = f32(supportCount);
  var uncovered2 = f32(supportCount);
  var uncovered3 = f32(supportCount);
  var midpointFallbackPixel = vec2<i32>(0);
  var midpointFallbackValid = false;
  var midpointFallbackRadius = 0.0;
  var nearestDepth0 = 3.402823e+38;
  var nearestDepth1 = 3.402823e+38;
  var nearestDepth2 = 3.402823e+38;
  var nearestDepth3 = 3.402823e+38;
  for (var index = 0u; index < 16u; index += 1u) {
    if (index >= supportCount) { break; }
    let secondDirection = useSecondDirection && index >= primaryCount;
    let localIndex = select(index, index - primaryCount, secondDirection);
    let localCount = select(primaryCount, secondaryCount, secondDirection);
    let selectedMotion = select(support.primaryMotion, support.secondaryMotion, secondDirection);
    let selectedRadius = select(support.primaryRadius, support.secondaryRadius, secondDirection);
    let tap = supportTap(
      receiverPixel,
      localIndex,
      localCount,
      selectedMotion,
      selectedRadius,
      select(support.primaryAnchor, support.secondaryAnchor, secondDirection),
      dimensions,
    );
    if (!tap.valid) {
      if (tap.fallbackValid && selectedRadius > midpointFallbackRadius) {
        midpointFallbackPixel = tap.fallbackPixel;
        midpointFallbackValid = true;
        midpointFallbackRadius = selectedRadius;
      }
      continue;
    }
    let source = sourceAtFootprint(
      receiverPixel,
      tap.pixel,
      centerDepth,
      shutter,
      dimensions,
    );
    if (!source.valid) {
      if (tap.fallbackValid && selectedRadius > midpointFallbackRadius) {
        midpointFallbackPixel = tap.fallbackPixel;
        midpointFallbackValid = true;
        midpointFallbackRadius = selectedRadius;
      }
      continue;
    }
    let sampleColor = colorAt(source.pixel, dimensions);
    // Keep the receiver's own color as the center contribution. A source
    // footprint may cover an adjacent receiver quadrant without being the
    // receiver itself; substituting its color here creates odd/even-alignment
    // brightening at thin-object boundaries.
    if ((source.receiverMask & 1u) != 0u) {
      filtered0 += sampleColor * source.coverage0;
      validCount0 += source.coverage0;
      hasAcceptedSource0 = true;
      uncovered0 = max(uncovered0 - source.coverage0, 0.0);
      nearestDepth0 = min(nearestDepth0, source.depth);
    }
    if ((source.receiverMask & 2u) != 0u) {
      filtered1 += sampleColor * source.coverage1;
      validCount1 += source.coverage1;
      hasAcceptedSource1 = true;
      uncovered1 = max(uncovered1 - source.coverage1, 0.0);
      nearestDepth1 = min(nearestDepth1, source.depth);
    }
    if ((source.receiverMask & 4u) != 0u) {
      filtered2 += sampleColor * source.coverage2;
      validCount2 += source.coverage2;
      hasAcceptedSource2 = true;
      uncovered2 = max(uncovered2 - source.coverage2, 0.0);
      nearestDepth2 = min(nearestDepth2, source.depth);
    }
    if ((source.receiverMask & 8u) != 0u) {
      filtered3 += sampleColor * source.coverage3;
      validCount3 += source.coverage3;
      hasAcceptedSource3 = true;
      uncovered3 = max(uncovered3 - source.coverage3, 0.0);
      nearestDepth3 = min(nearestDepth3, source.depth);
    }
  }
  // A tile anchor recovers a sparse source only for the widest support tier,
  // where the fixed geometric lattice can leave a source between taps. It
  // spends the represented midpoint ownership of the finite support segment;
  // every accepted colour, coverage and depth contribution uses that same
  // bounded ownership, so the fallback cannot create an opaque stripe. The
  // shorter tiers keep their exact geometric energy and do not need recovery.
  if (midpointFallbackValid && max(support.primaryRadius, support.secondaryRadius) > 32.0) {
    let fallbackSource = sourceAtFootprint(
      receiverPixel,
      midpointFallbackPixel,
      centerDepth,
      shutter,
      dimensions,
    );
    if (fallbackSource.valid) {
      let midpointWeight = midpointTileOwnership(receiverPixel, fallbackSource);
      if (
        midpointWeight > 0.0
      ) {
        let fallbackColor = colorAt(fallbackSource.pixel, dimensions);
        let fallbackWeight0 = fallbackSource.coverage0 * midpointWeight;
        let fallbackWeight1 = fallbackSource.coverage1 * midpointWeight;
        let fallbackWeight2 = fallbackSource.coverage2 * midpointWeight;
        let fallbackWeight3 = fallbackSource.coverage3 * midpointWeight;
        if (validCount0 <= 0.0 && (fallbackSource.receiverMask & 1u) != 0u) {
          let ownedWeight0 = min(fallbackWeight0, uncovered0);
          if (ownedWeight0 > 0.0) {
            filtered0 += fallbackColor * ownedWeight0;
            validCount0 += ownedWeight0;
            hasAcceptedSource0 = true;
            uncovered0 = max(uncovered0 - ownedWeight0, 0.0);
            nearestDepth0 = min(nearestDepth0, fallbackSource.depth);
          }
        }
        if (validCount1 <= 0.0 && (fallbackSource.receiverMask & 2u) != 0u) {
          let ownedWeight1 = min(fallbackWeight1, uncovered1);
          if (ownedWeight1 > 0.0) {
            filtered1 += fallbackColor * ownedWeight1;
            validCount1 += ownedWeight1;
            hasAcceptedSource1 = true;
            uncovered1 = max(uncovered1 - ownedWeight1, 0.0);
            nearestDepth1 = min(nearestDepth1, fallbackSource.depth);
          }
        }
        if (validCount2 <= 0.0 && (fallbackSource.receiverMask & 4u) != 0u) {
          let ownedWeight2 = min(fallbackWeight2, uncovered2);
          if (ownedWeight2 > 0.0) {
            filtered2 += fallbackColor * ownedWeight2;
            validCount2 += ownedWeight2;
            hasAcceptedSource2 = true;
            uncovered2 = max(uncovered2 - ownedWeight2, 0.0);
            nearestDepth2 = min(nearestDepth2, fallbackSource.depth);
          }
        }
        if (validCount3 <= 0.0 && (fallbackSource.receiverMask & 8u) != 0u) {
          let ownedWeight3 = min(fallbackWeight3, uncovered3);
          if (ownedWeight3 > 0.0) {
            filtered3 += fallbackColor * ownedWeight3;
            validCount3 += ownedWeight3;
            hasAcceptedSource3 = true;
            uncovered3 = max(uncovered3 - ownedWeight3, 0.0);
            nearestDepth3 = min(nearestDepth3, fallbackSource.depth);
          }
        }
      }
    }
  }
  let moving0 = temporalAt(receiverPixel, dimensions);
  let moving1 = temporalAt(receiverPixel + vec2<i32>(1, 0), dimensions);
  let moving2 = temporalAt(receiverPixel + vec2<i32>(0, 1), dimensions);
  let moving3 = temporalAt(receiverPixel + vec2<i32>(1, 1), dimensions);
  let motion0 = sourceMotionPixels(moving0, dimensions);
  let motion1 = sourceMotionPixels(moving1, dimensions);
  let motion2 = sourceMotionPixels(moving2, dimensions);
  let motion3 = sourceMotionPixels(moving3, dimensions);
  let centerMoving0 = moving0.validDepth && moving0.motionValid && sourceRadius(motion0, shutter) > 1e-5;
  let centerMoving1 = moving1.validDepth && moving1.motionValid && sourceRadius(motion1, shutter) > 1e-5;
  let centerMoving2 = moving2.validDepth && moving2.motionValid && sourceRadius(motion2, shutter) > 1e-5;
  let centerMoving3 = moving3.validDepth && moving3.motionValid && sourceRadius(motion3, shutter) > 1e-5;
  empty.color0 = integrateLongColor(filtered0, validCount0, hasAcceptedSource0, uncovered0, count, supportCount, centerColor0, centerMoving0);
  empty.color1 = integrateLongColor(filtered1, validCount1, hasAcceptedSource1, uncovered1, count, supportCount, centerColor1, centerMoving1);
  empty.color2 = integrateLongColor(filtered2, validCount2, hasAcceptedSource2, uncovered2, count, supportCount, centerColor2, centerMoving2);
  empty.color3 = integrateLongColor(filtered3, validCount3, hasAcceptedSource3, uncovered3, count, supportCount, centerColor3, centerMoving3);
  empty.depth0 = select(centerDepth, nearestDepth0, validCount0 > 0.0);
  empty.depth1 = select(centerDepth, nearestDepth1, validCount1 > 0.0);
  empty.depth2 = select(centerDepth, nearestDepth2, validCount2 > 0.0);
  empty.depth3 = select(centerDepth, nearestDepth3, validCount3 > 0.0);
  empty.coverage0 = validCount0 / max(f32(supportCount), 1.0);
  empty.coverage1 = validCount1 / max(f32(supportCount), 1.0);
  empty.coverage2 = validCount2 / max(f32(supportCount), 1.0);
  empty.coverage3 = validCount3 / max(f32(supportCount), 1.0);
  empty.motion = select(support.primaryMotion, support.secondaryMotion, support.primaryRadius <= 1e-5);
  empty.radius = max(support.primaryRadius, support.secondaryRadius);
  empty.receiverMask =
    select(0u, 1u, validCount0 > 0.0 || centerMoving0) |
    select(0u, 2u, validCount1 > 0.0 || centerMoving1) |
    select(0u, 4u, validCount2 > 0.0 || centerMoving2) |
    select(0u, 8u, validCount3 > 0.0 || centerMoving3);
  empty.validMask =
    select(0u, 1u, validCount0 > 0.0 || centerMoving0) |
    select(0u, 2u, validCount1 > 0.0 || centerMoving1) |
    select(0u, 4u, validCount2 > 0.0 || centerMoving2) |
    select(0u, 8u, validCount3 > 0.0 || centerMoving3);
  empty.valid = empty.validMask != 0u;
  return empty;
}

fn colorAt(pixel : vec2<i32>, dimensions : vec2<i32>) -> vec4<f32> {
  return textureLoad(currentColor, clamp(pixel, vec2<i32>(0), dimensions - vec2<i32>(1)), 0);
}

fn cacheFootprintContains(receiverPixel : vec2<i32>, ownerPixel : vec2<i32>) -> bool {
  return
    receiverPixel.x >= ownerPixel.x && receiverPixel.x <= ownerPixel.x + 1 &&
    receiverPixel.y >= ownerPixel.y && receiverPixel.y <= ownerPixel.y + 1;
}

fn cachedSupportCovers(
  receiverPixel : vec2<i32>,
  ownerPixel : vec2<i32>,
  motion : vec2<f32>,
  radius : f32,
) -> bool {
  if (!cacheFootprintContains(receiverPixel, ownerPixel)) { return false; }
  let motionLength = length(motion);
  if (motionLength <= 1e-5 || radius <= 1e-5) { return false; }
  let direction = motion / motionLength;
  let delta = vec2<f32>(receiverPixel - ownerPixel);
  let along = dot(delta, direction);
  let perpendicular = abs(delta.x * direction.y - delta.y * direction.x);
  return abs(along) <= radius + 1.0 && perpendicular <= 1.0;
}

fn cachedDirectionMatches(support : MotionBlurSupport, motion : vec2<f32>) -> bool {
  let motionLength = length(motion);
  if (motionLength <= 1e-5) { return false; }
  let direction = motion / motionLength;
  if (support.primaryRadius > 1e-5 && abs(dot(normalize(support.primaryMotion), direction)) >= 0.94) {
    return true;
  }
  return support.secondaryRadius > 1e-5 && abs(dot(normalize(support.secondaryMotion), direction)) >= 0.94;
}

fn depthGuidedHalfResolutionColor(
  localId : vec3<u32>,
  receiverPixel : vec2<i32>,
  support : MotionBlurSupport,
  centerDepth : f32,
) -> MotionBlurCacheSample {
  let cell = vec2<i32>(localId.xy / vec2<u32>(2));
  let quadrant = (localId.y % 2u) * 2u + (localId.x % 2u);
  var selected = MotionBlurCacheSample(vec4<f32>(0.0), 0.0, false);
  var selectedDelta = 3.402823e+38;
  // Search the bounded adjacent cache cells, but accept only a cell whose
  // authored 2x2 footprint and direction actually cover this receiver.
  for (var y = -1; y <= 1; y += 1) {
    for (var x = -1; x <= 1; x += 1) {
      let candidateCell = cell + vec2<i32>(x, y);
      if (candidateCell.x < 0 || candidateCell.y < 0 || candidateCell.x >= 4 || candidateCell.y >= 4) { continue; }
      let cacheCellIndex = u32(candidateCell.y * 4 + candidateCell.x);
      let index = cacheCellIndex * 4u + quadrant;
      if (
        halfFilteredValid[index] == 0u ||
        depthReject(centerDepth, halfFilteredDepth[index]) ||
        !cachedDirectionMatches(support, halfFilteredMotion[cacheCellIndex]) ||
        !cachedSupportCovers(
          receiverPixel,
          halfFilteredReceiver[cacheCellIndex],
          halfFilteredMotion[cacheCellIndex],
          halfFilteredRadius[cacheCellIndex],
        )
      ) { continue; }
      let delta = abs(halfFilteredDepth[index] - centerDepth);
      if (!selected.valid || delta < selectedDelta) {
        selected.color = halfFilteredColor[index];
        selected.coverage = halfFilteredCoverage[index];
        selectedDelta = delta;
        selected.valid = true;
      }
    }
  }
  return selected;
}

@compute @workgroup_size(8, 8)
fn tile_summary(
  @builtin(global_invocation_id) id : vec3<u32>,
  @builtin(local_invocation_id) localId : vec3<u32>,
  @builtin(local_invocation_index) localIndex : u32,
  @builtin(workgroup_id) workgroupId : vec3<u32>,
) {
  let dimensions = textureDimensions(sceneTemporal);
  let tiles = (dimensions + vec2<u32>(15)) / vec2<u32>(16);
  let tile = workgroupId.xy;
  let inTile = tile.x < tiles.x && tile.y < tiles.y;
  var maxMotion = vec2<f32>(0.0);
  var maxLength = 0.0;
  var maxSource = vec2<i32>(0);
  var secondaryMotion = vec2<f32>(0.0);
  var secondaryLength = 0.0;
  var secondarySource = vec2<i32>(0);
  for (var localY = 0u; localY < 2u; localY += 1u) {
    for (var localX = 0u; localX < 2u; localX += 1u) {
      let pixel = tile * vec2<u32>(16) + localId.xy * vec2<u32>(2) + vec2<u32>(localX, localY);
      if (!inTile || pixel.x >= dimensions.x || pixel.y >= dimensions.y) { continue; }
      let sample = temporalAt(vec2<i32>(pixel), vec2<i32>(dimensions));
      if (!sample.validDepth || !sample.motionValid) { continue; }
      let motionLength = length(sample.motion * vec2<f32>(dimensions));
      if (motionLength > maxLength) {
        if (distinctDirection(maxMotion, sample.motion)) {
          secondaryMotion = maxMotion;
          secondaryLength = maxLength;
          secondarySource = maxSource;
        }
        maxLength = motionLength;
        maxMotion = sample.motion;
        maxSource = vec2<i32>(pixel);
      } else if (
        motionLength > secondaryLength &&
        distinctDirection(maxMotion, sample.motion)
      ) {
        secondaryLength = motionLength;
        secondaryMotion = sample.motion;
        secondarySource = vec2<i32>(pixel);
      }
    }
  }
  tileMotionScratch[localIndex] = maxMotion;
  tileLengthScratch[localIndex] = maxLength;
  tileSourceScratch[localIndex] = maxSource;
  tileSecondaryMotionScratch[localIndex] = secondaryMotion;
  tileSecondaryLengthScratch[localIndex] = secondaryLength;
  tileSecondarySourceScratch[localIndex] = secondarySource;
  workgroupBarrier();
  for (var stride = 32u; stride > 0u; stride = stride / 2u) {
    if (localIndex < stride) {
      let otherIndex = localIndex + stride;
      let otherLength = tileLengthScratch[otherIndex];
      if (otherLength > tileLengthScratch[localIndex]) {
        let oldMotion = tileMotionScratch[localIndex];
        let oldLength = tileLengthScratch[localIndex];
        let oldSource = tileSourceScratch[localIndex];
        tileLengthScratch[localIndex] = otherLength;
        tileMotionScratch[localIndex] = tileMotionScratch[otherIndex];
        tileSourceScratch[localIndex] = tileSourceScratch[otherIndex];
        if (
          oldLength > 1e-5 &&
          distinctDirection(tileMotionScratch[localIndex], oldMotion) &&
          oldLength > tileSecondaryLengthScratch[localIndex]
        ) {
          tileSecondaryLengthScratch[localIndex] = oldLength;
          tileSecondaryMotionScratch[localIndex] = oldMotion;
          tileSecondarySourceScratch[localIndex] = oldSource;
        }
      }
      if (
        tileSecondaryLengthScratch[otherIndex] > tileSecondaryLengthScratch[localIndex] &&
        distinctDirection(
          tileMotionScratch[localIndex],
          tileSecondaryMotionScratch[otherIndex],
        )
      ) {
        tileSecondaryLengthScratch[localIndex] = tileSecondaryLengthScratch[otherIndex];
        tileSecondaryMotionScratch[localIndex] = tileSecondaryMotionScratch[otherIndex];
        tileSecondarySourceScratch[localIndex] = tileSecondarySourceScratch[otherIndex];
      }
      if (
        tileLengthScratch[otherIndex] > tileSecondaryLengthScratch[localIndex] &&
        distinctDirection(tileMotionScratch[localIndex], tileMotionScratch[otherIndex])
      ) {
        tileSecondaryLengthScratch[localIndex] = tileLengthScratch[otherIndex];
        tileSecondaryMotionScratch[localIndex] = tileMotionScratch[otherIndex];
        tileSecondarySourceScratch[localIndex] = tileSourceScratch[otherIndex];
      }
    }
    workgroupBarrier();
  }
  if (localIndex == 0u && inTile) {
    let tileIndex = tile.y * tiles.x + tile.x;
    tileSummary[tileIndex] = MotionBlurTileSummary(
      vec4<f32>(
        tileMotionScratch[0],
        f32(tileSourceScratch[0].x),
        f32(tileSourceScratch[0].y),
      ),
      vec4<f32>(
        tileSecondaryMotionScratch[0],
        f32(tileSecondarySourceScratch[0].x),
        f32(tileSecondarySourceScratch[0].y),
      ),
    );
  }
}

@compute @workgroup_size(8, 8)
fn reconstruct(
  @builtin(global_invocation_id) id : vec3<u32>,
  @builtin(local_invocation_id) localId : vec3<u32>,
  @builtin(workgroup_id) workgroupId : vec3<u32>,
) {
  let dimensions = textureDimensions(currentColor);
  let colorDimensions = vec2<i32>(dimensions);
  let pixel = vec2<i32>(id.xy);
  let inBounds = id.x < dimensions.x && id.y < dimensions.y;
  let workgroupBase = vec2<i32>(workgroupId.xy * vec2<u32>(8));
  let ownsHalfCell = (localId.x % 2u == 0u) && (localId.y % 2u == 0u);
  let halfIndex = (localId.y / 2u) * 4u + (localId.x / 2u);
  let localIndex = localId.y * 8u + localId.x;
  if (localIndex == 0u) {
    scanTileNeighbourhood(workgroupBase, colorDimensions);
  }
  workgroupBarrier();
  let support = resolveMotionBlurSupport(pixel, colorDimensions);
  let longVector = support.valid && support.longVector;

  longVectorScratch[localId.y * 8u + localId.x] = select(0u, 1u, longVector);
  workgroupBarrier();
  for (var longStride = 32u; longStride > 0u; longStride = longStride / 2u) {
    let localIndex = localId.y * 8u + localId.x;
    if (localIndex < longStride) {
      longVectorScratch[localIndex] = max(
        longVectorScratch[localIndex],
        longVectorScratch[localIndex + longStride],
      );
    }
    workgroupBarrier();
  }
  let anyLongVector = longVectorScratch[0] != 0u;
  if (anyLongVector && ownsHalfCell) {
    // Every designated owner evaluates the full support exactly once. The
    // cached result includes filtered color, nearest accepted depth, and
    // coverage; no 2x2 prefilter is substituted for the long gather.
    let sourcePixel = workgroupBase + vec2<i32>(localId.xy);
    let sourceSupport = resolveMotionBlurSupport(sourcePixel, colorDimensions);
    let filtered = longSupportFilter(
      sourcePixel,
      sourceSupport,
      temporalAt(sourcePixel, colorDimensions).depth,
      colorDimensions,
    );
    halfFilteredReceiver[halfIndex] = sourcePixel;
    halfFilteredMotion[halfIndex] = filtered.motion;
    halfFilteredRadius[halfIndex] = filtered.radius;
    let cacheBase = halfIndex * 4u;
    halfFilteredColor[cacheBase] = filtered.color0;
    halfFilteredColor[cacheBase + 1u] = filtered.color1;
    halfFilteredColor[cacheBase + 2u] = filtered.color2;
    halfFilteredColor[cacheBase + 3u] = filtered.color3;
    halfFilteredDepth[cacheBase] = filtered.depth0;
    halfFilteredDepth[cacheBase + 1u] = filtered.depth1;
    halfFilteredDepth[cacheBase + 2u] = filtered.depth2;
    halfFilteredDepth[cacheBase + 3u] = filtered.depth3;
    halfFilteredCoverage[cacheBase] = filtered.coverage0;
    halfFilteredCoverage[cacheBase + 1u] = filtered.coverage1;
    halfFilteredCoverage[cacheBase + 2u] = filtered.coverage2;
    halfFilteredCoverage[cacheBase + 3u] = filtered.coverage3;
    halfFilteredValid[cacheBase] = select(0u, 1u, (filtered.validMask & 1u) != 0u);
    halfFilteredValid[cacheBase + 1u] = select(0u, 1u, (filtered.validMask & 2u) != 0u);
    halfFilteredValid[cacheBase + 2u] = select(0u, 1u, (filtered.validMask & 4u) != 0u);
    halfFilteredValid[cacheBase + 3u] = select(0u, 1u, (filtered.validMask & 8u) != 0u);
  }
  workgroupBarrier();
  // No invocation can return before both uniform barriers above. This keeps
  // odd extents and out-of-bounds lanes from allowing a long source to read a
  // cache entry that another invocation has not published yet.
  if (!inBounds) {
    return;
  }
  if (!support.valid) {
    textureStore(outputColor, pixel, colorAt(pixel, colorDimensions));
    return;
  }
  if (longVector) {
    let cached = depthGuidedHalfResolutionColor(
      localId,
      pixel,
      support,
      temporalAt(pixel, colorDimensions).depth,
    );
    if (cached.valid) {
      textureStore(outputColor, pixel, cached.color);
    } else {
      textureStore(outputColor, pixel, colorAt(pixel, colorDimensions));
    }
    return;
  }
  let useSecondDirection = support.secondaryRadius > 1e-5 && distinctDirection(support.primaryMotion, support.secondaryMotion);
  let count = min(params.sampleCount, 16u);
  let supportCount = max(count - 1u, 1u);
  let primaryCount = select(supportCount, max(supportCount / 2u, 1u), useSecondDirection);
  let secondaryCount = max(supportCount - primaryCount, 1u);
  let shutter = clamp(params.shutterAngle / 360.0, 0.0, 1.0);
  let center = temporalAt(pixel, colorDimensions);
  let centerMotion = sourceMotionPixels(center, colorDimensions);
  let centerMoving = center.validDepth && center.motionValid && sourceRadius(centerMotion, shutter) > 1e-5;
  let centerColor = colorAt(pixel, colorDimensions);
  var accum = vec4<f32>(0.0);
  var weight = 0.0;
  for (var index = 0u; index < 16u; index += 1u) {
    if (index >= supportCount) { break; }
    let secondDirection = useSecondDirection && index >= primaryCount;
    let localIndex = select(index, index - primaryCount, secondDirection);
    let localCount = select(primaryCount, secondaryCount, secondDirection);
    let selectedMotion = select(support.primaryMotion, support.secondaryMotion, secondDirection);
    let selectedRadius = select(support.primaryRadius, support.secondaryRadius, secondDirection);
    let tap = supportTap(
      pixel,
      localIndex,
      localCount,
      selectedMotion,
      selectedRadius,
      select(support.primaryAnchor, support.secondaryAnchor, secondDirection),
      colorDimensions,
    );
    if (!tap.valid) { continue; }
    let source = sourceAt(pixel, tap.pixel, center.depth, shutter, colorDimensions);
    if (!source.valid) { continue; }
    let sampleColor = colorAt(source.pixel, colorDimensions);
    accum += sampleColor;
    weight += 1.0;
  }
  let uncovered = max(f32(supportCount) - weight, 0.0);
  let acceptedColor = select(vec3<f32>(0.0), accum.rgb / max(weight, 1.0), weight > 0.0);
  let missingForeground = 1.0 - clamp(centerColor.a, 0.0, 1.0);
  let edgeCoverage = select(missingForeground, 1.0, centerMoving);
  let edgeFill = acceptedColor * edgeCoverage * EDGE_FILL_FACTOR;
  let movingFallback = select(centerColor.rgb, edgeFill, weight > 0.0);
  let uncoveredColor = select(vec3<f32>(0.0), movingFallback, centerMoving);
  let acceptedAlpha = select(0.0, accum.a / max(weight, 1.0), weight > 0.0);
  let acceptedCoverage = weight + missingForeground * uncovered;
  let reconstructedAlpha = acceptedAlpha * acceptedCoverage / max(f32(count), 1.0);
  let outputAlpha = clamp(max(centerColor.a, reconstructedAlpha), 0.0, 1.0);
  let emptyReceiver =
    !centerMoving &&
    weight > 0.0 &&
    max(max(abs(centerColor.r), abs(centerColor.g)), abs(centerColor.b)) < 1e-4;
  let sourceScale = select(1.0, 1.0 - EDGE_FILL_FACTOR, emptyReceiver);
  let sourceContribution = accum.rgb * sourceScale;
  let trailScale = select(1.0, 1.0 - EDGE_FILL_FACTOR, emptyReceiver);
  let trailContribution = uncoveredColor * uncovered * trailScale;
  textureStore(
    outputColor,
    pixel,
    vec4<f32>((sourceContribution + centerColor.rgb + trailContribution) / max(f32(count), 1.0), outputAlpha),
  );
}
`;function ua(e,t=1/60,n=!1){let r=new Uint8Array(32),i=new DataView(r.buffer),a=Number.isFinite(t)?t:0;return i.setFloat32(0,e.shutterAngle,!0),i.setFloat32(4,e.maxRadiusPixels,!0),i.setUint32(8,w(e.sampleCount),!0),i.setUint32(12,+!!n,!0),i.setFloat32(16,e.targetFps,!0),i.setFloat32(20,g(a,e.targetFps),!0),i.setFloat32(24,a,!0),i.setUint32(28,0,!0),r}function da(e){return Number.isFinite(e)&&e>0?Math.ceil(e):1}function fa(e,t,r={frameDeltaSeconds:1/60,reset:!1}){if(!x(e))return o({resources:[],passes:[]});try{let n=t.sceneData.require(Ge),i=t.targets.find(e=>e.name===`motion-output`)?.format??`rgba16float`,a={kind:`fullscreen-program`,name:`motion-blur`,source:`forgeax::shader::motion-blur`,reads:[`scene-color`,`scene-temporal`],params:{byteSize:32,defaultValue:new Uint8Array(32)}};if(t.caps.compute===!0&&t.caps.storageBuffer===!0&&t.caps.storageTexture===!0&&t.caps.rgba16floatRenderable===!0&&i===`rgba16float`){let i=da(t.frame.width),a=da(t.frame.height),s=Math.max(1,Math.ceil(i/16)),c=Math.max(1,Math.ceil(a/16));return o({resources:[{kind:`compute-program`,name:`motion-blur-compute`,program:{wgsl:la,entryPoints:[`tile_summary`,`reconstruct`],bindings:[{entries:[{binding:0,visibility:4,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:1,visibility:4,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:2,visibility:4,buffer:{type:`storage`}},{binding:3,visibility:4,storageTexture:{access:`write-only`,format:`rgba16float`,viewDimension:`2d`}},{binding:4,visibility:4,buffer:{type:`uniform`}}]}]}},{kind:`buffer`,name:`motion-blur-tile-summary`,size:s*c*32,usage:[`storage`]},{kind:`buffer`,name:`motion-blur-compute-params`,size:32,usage:[`uniform`],data:ua(e,r.frameDeltaSeconds,r.reset)},{kind:`prepared-gpu-resource`,name:`motion-blur-input`,resource:{kind:`texture-view`,value:void 0},logicalTarget:`motion-input`},{kind:`prepared-gpu-resource`,name:`motion-blur-temporal`,resource:{kind:`texture-view`,value:void 0},logicalTarget:n},{kind:`prepared-gpu-resource`,name:`motion-blur-output`,resource:{kind:`texture-view`,value:void 0},logicalTarget:`motion-output`},{kind:`compute-bindings`,name:`motion-blur-compute-bindings`,program:`motion-blur-compute`,entries:[{binding:0,resource:`motion-blur-input`},{binding:1,resource:`motion-blur-temporal`},{binding:2,resource:`motion-blur-tile-summary`},{binding:3,resource:`motion-blur-output`},{binding:4,resource:`motion-blur-compute-params`}]}],passes:[{kind:`compute`,name:`motion-blur-tile-summary`,program:`motion-blur-compute`,bindings:`motion-blur-compute-bindings`,dispatches:[{kind:`direct`,entryPoint:`tile_summary`,workgroups:[s,c,1]}]},{kind:`compute`,name:`motion-blur`,program:`motion-blur-compute`,bindings:`motion-blur-compute-bindings`,dispatches:[{kind:`direct`,entryPoint:`reconstruct`,workgroups:[Math.max(1,Math.ceil(i/8)),Math.max(1,Math.ceil(a/8)),1]}]}]})}return o({resources:[a,{kind:`graphics-program`,name:`motion-blur-pipeline`,program:{shader:sa,vertexLayout:`none`,colorFormats:[i],sampleCount:1}},{kind:`graphics-bindings`,name:`motion-blur-bindings`,program:`motion-blur-pipeline`,values:{group:1,fullscreen:!0,shader:sa,input:`motion-input`,temporal:n},logicalTargets:{input:`motion-input`}}],passes:[{kind:`raster`,name:`motion-blur`,colorAttachments:[{target:`motion-output`,loadOp:`clear`,storeOp:`store`}],sampledTargets:[`motion-input`,n],draws:[{program:`motion-blur-pipeline`,bindings:[`motion-blur-bindings`],vertexData:[],vertexLayout:`none`,draw:{kind:`draw`,vertexCount:3,instanceCount:1}}]}]})}catch(e){return n(e)}}function pa(){return Object.freeze({identity:sa,shaderModuleMode:`immediate`,extract:e=>{let t=Object.create(null);for(let r of e.views){if(!r.render)continue;let e=r.motionBlur,i=y(e?.params);if(!i.ok)return n(i.error);let a=e?.params===void 0?void 0:i.value;t[r.identity]={params:a,demanded:x(a),frameDeltaSeconds:e?.frameDeltaSeconds??1/60,reset:e?.reset===!0}}return o(t)},plan:(e,t)=>{let n=[];for(let r of t.views){let i=e[r.identity];if(!r.render||i?.params===void 0)continue;let a=fa(i.params,{...r,caps:t.caps},i);if(!a.ok)return a;n.push({scope:{view:r.identity},...a.value})}return o({work:n})}})}function ma(e,t){let n=t.camera.outline,r=new Float32Array(8);return n!==void 0&&(r.set(n.visibleColor,0),r[3]=n.width,r.set(n.hiddenColor,4),r[7]=n.occlusion),new Uint8Array(r.buffer)}function ha(e,t,n){let r=t=>F(e,t,{format:`rgba16float`,size:`surface`}),i=r(`outline-coverage`);if(!i.ok)return i;let a=F(e,`outline-depth`,{format:`depth32float-stencil8`,size:`surface`});if(!a.ok)return a;let s=L(e,{name:`outline-selection`,color:i.value,depth:a.value,selector:ie,passKind:`temporal`,coverageOnly:!0,clearColor:[0,0,0,0],selectEntities:e=>({worldId:e.camera.worldId??0,entities:e.camera.outline?.entities??[]})});if(!s.ok)return s;let c=r(`outline-selected-depth`);if(!c.ok)return c;let l=P(e,{name:`outline-depth-copy`,shader:`forgeax.outline.depth`,input:i.value,outputs:[c.value],depth:a.value,paramsTransform:ma});if(!l.ok)return l;let u=r(`outline-mask`);if(!u.ok)return u;let d=P(e,{name:`outline-classify`,shader:n.sampleCount===4?`forgeax.outline.classify.msaa`:`forgeax.outline.classify`,input:c.value,outputs:[u.value],depth:n,paramsTransform:ma});if(!d.ok)return d;let f=r(`outline-expanded`);if(!f.ok)return f;let p=P(e,{name:`outline-horizontal`,shader:`forgeax.outline.horizontal`,input:u.value,outputs:[f.value],paramsTransform:ma});if(!p.ok)return p;let m=F(e,`outline-color`,{format:`rgba16float`,size:`surface`,domain:`linear-ldr`});if(!m.ok)return m;let h=P(e,{name:`outline-composite`,shader:`forgeax.outline.composite`,input:t,outputs:[m.value],additionalReads:[{key:`outline-mask`,target:u.value},{key:`outline-expanded`,target:f.value}],paramsTransform:ma});return h.ok?o(m.value):h}var ga=`
struct Output { @builtin(position) position: vec4<f32>, @location(0) uv: vec2<f32> };
@vertex fn vs_main(@builtin(vertex_index) i: u32) -> Output {
  let p = vec2<f32>(f32((i << 1u) & 2u), f32(i & 2u));
  return Output(vec4<f32>(p * 2.0 - 1.0, 0.0, 1.0), vec2<f32>(p.x, 1.0 - p.y));
}
struct Params { visible: vec4<f32>, hidden: vec4<f32> };
@group(1) @binding(0) var source: texture_2d<f32>;
@group(1) @binding(1) var sourceSampler: sampler;
@group(1) @binding(2) var<uniform> params: Params;
`,_a=`${ga}
@group(1) @binding(3) var depth: texture_depth_2d;
@fragment fn fs_main(in: Output) -> @location(0) vec4<f32> {
  let z = textureLoad(depth, vec2<i32>(in.position.xy), 0);
  // Integer bytes are exact in rgba16float, including distant subnormal depths.
  // The consumer uses textureLoad, so the raw float bits are never filtered.
  let bits = bitcast<u32>(z);
  return vec4<f32>(vec4<u32>(bits, bits >> 8u, bits >> 16u, bits >> 24u) & vec4<u32>(255u));
}`;function va(e){return`${ga}
@group(1) @binding(3) var depth: ${e?`texture_depth_multisampled_2d`:`texture_depth_2d`};
@fragment fn fs_main(in: Output) -> @location(0) vec4<f32> {
  let p = vec2<i32>(in.position.xy);
  let packed = vec4<u32>(textureLoad(source, p, 0));
  let selected = bitcast<f32>(packed.x | (packed.y << 8u) | (packed.z << 16u) | (packed.w << 24u));
  if (selected <= 0.0) { return vec4<f32>(0.0); }
  let q = min(vec2<i32>(in.uv * vec2<f32>(textureDimensions(depth))), vec2<i32>(textureDimensions(depth)) - vec2<i32>(1));
  var scene = textureLoad(depth, q, 0);
  ${e?`for (var s = 1; s < 4; s++) { scene = max(scene, textureLoad(depth, q, s)); }`:``}
  let visible = select(0.0, 1.0, selected >= scene - max(scene * 0.000002, 1e-12));
  return vec4<f32>(visible, 1.0 - visible, 1.0, 1.0);
}`}var ya=`${ga}
@fragment fn fs_main(in: Output) -> @location(0) vec4<f32> {
  let p = vec2<i32>(in.position.xy);
  let size = vec2<i32>(textureDimensions(source));
  var edge = vec2<f32>(0.0);
  for (var x = -i32(params.visible.w); x <= i32(params.visible.w); x++) {
    let q = p + vec2<i32>(x, 0);
    if (all(q >= vec2<i32>(0)) && all(q < size)) { edge = max(edge, textureLoad(source, q, 0).rg); }
  }
  return vec4<f32>(edge, 0.0, 1.0);
}`,ba=`${ga}
@group(1) @binding(3) var mask: texture_2d<f32>;
@group(1) @binding(4) var expanded: texture_2d<f32>;
@fragment fn fs_main(in: Output) -> @location(0) vec4<f32> {
  let p = vec2<i32>(in.position.xy);
  let size = vec2<i32>(textureDimensions(source));
  let color = textureLoad(source, p, 0);
  if (textureLoad(mask, p, 0).b > 0.5) { return color; }
  var edge = vec2<f32>(0.0);
  for (var y = -i32(params.visible.w); y <= i32(params.visible.w); y++) {
    let q = p + vec2<i32>(0, y);
    if (all(q >= vec2<i32>(0)) && all(q < size)) { edge = max(edge, textureLoad(expanded, q, 0).rg); }
  }
  if (edge.x > 0.5 && params.hidden.w != 1.0) { return vec4<f32>(params.visible.rgb, color.a); }
  if (edge.y > 0.5 && params.hidden.w != 0.0) { return vec4<f32>(params.hidden.rgb, color.a); }
  return color;
}`,xa={key:`scene-depth`,sampleType:`depth`},Sa=[{kind:`fullscreen-program`,name:`forgeax.outline.depth`,source:_a,reads:[`scene-color`,xa]},{kind:`fullscreen-program`,name:`forgeax.outline.classify`,source:va(!1),reads:[`scene-color`,xa]},{kind:`fullscreen-program`,name:`forgeax.outline.classify.msaa`,source:va(!0),reads:[`scene-color`,xa]},{kind:`fullscreen-program`,name:`forgeax.outline.horizontal`,source:ya,reads:[`scene-color`]},{kind:`fullscreen-program`,name:`forgeax.outline.composite`,source:ba,reads:[`scene-color`,`outline-mask`,`outline-expanded`]}].map(e=>({...e,params:{byteSize:32,defaultValue:new Uint8Array(32)}}));function Ca(){return{identity:`forgeax.outline`,requiredCapabilities:[`rgba16floatRenderable`],requiredFullscreenPostProcesses:Sa.map(e=>({identity:e.name,source:e.source})),extract:e=>o(e.views.some(e=>e.render&&e.selectedCamera?.outline!==void 0)),plan:e=>o({work:e?[{scope:`frame`,resources:Sa,passes:[]}]:[]})}}function wa(e){return e===`forgeax.outline`||Sa.some(t=>t.name===e)}var Ta=`AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD8ACgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD8ACgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABmAD8AAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABmAD8AAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAcgBcAC0AAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAcgBcAC0AAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHgAagBIACIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHgAagBIACIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB6AHEAWQA6ABsAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB6AHEAWQA6ABsAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAfAB1AGMASgAwABYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAfAB1AGMASgAwABYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHwAeABqAFYAPwAoABMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHwAeABqAFYAPwAoABMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB9AHkAbgBeAEsANwAjABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB9AHkAbgBeAEsANwAjABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAfQB6AHIAZABUAEIAMAAfAA4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAfQB6AHIAZABUAEIAMAAfAA4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAH4AewB0AGkAWwBLADsAKwAbAA0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAH4AewB0AGkAWwBLADsAKwAbAA0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB+AHwAdgBt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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA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`,Ea=`AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQEAAQEAAAEBAAEBAAAAAAAAAAAAAQEAAQEAAAEBAAEBAQEAAAAAAAEBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQEAAQEAAAEBAAEBAAAAAAAAAAAAAQEAAQEAAAEBAAEBAQEAAAAAAAEBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQEAAQEAAAEBAAEBAAAAAAAAAAAAAQEAAQEAAAEBAAEBAQEAAAAAAAEBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQEAAQEAAAEBAAEBAAAAAAAAAAAAAQEAAQEAAAEBAAEBAQEAAAAAAAEBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgIAAQEAAAICAAEBAAAAAAAAAAAAAQEAAQEAAAEBAAEBAgEAAAAAAAEBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgIAAQEAAAICAAEBAAAAAAAAAAAAAQEAAQEAAAEBAAEBAgEAAAAAAAEBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgIAAQEAAAICAAEBAAAAAAAAAAAAAQEAAQEAAAEBAAEBAgEAAAAAAAEBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgIAAQEAAAICAAEBAAAAAAAAAAAAAQEAAQEAAAEBAAEBAgEAAAAAAAEBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA`;function Da(){let e=e=>Uint8Array.from(atob(e),e=>e.charCodeAt(0));return{area:e(Ta),search:e(Ea)}}function Oa(e,t){let n=F(e,`smaa-area`,{format:`rg8unorm`,size:{width:80,height:80}});if(!n.ok)return n;let r=F(e,`smaa-search`,{format:`r8unorm`,size:{width:66,height:33}});if(!r.ok)return r;let i=Da();for(let t of[{target:n.value,bytes:i.area,width:80,height:80,stride:160},{target:r.value,bytes:i.search,width:66,height:33,stride:66}]){let r,i=e.addCopyPass(`${t.target===n.value?`smaa-area`:`smaa-search`}-upload`,{accesses:[{resource:t.target.view,usage:`copy-dst`}],encode:({frame:e,resources:n})=>{let i=n.texture(t.target.texture).unwrap();i!==r&&(e.runtime.device.queue.writeTexture({texture:i},t.bytes,{bytesPerRow:t.stride,rowsPerImage:t.height},{width:t.width,height:t.height,depthOrArrayLayers:1}).unwrap(),r=i)}});if(!i.ok)return i}let a=F(e,`smaa-edges`,{format:`rg8unorm`,size:`surface`});if(!a.ok)return a;let s=F(e,`smaa-weights`,{format:`rgba8unorm`,size:`surface`});if(!s.ok)return s;let c=F(e,`smaa-color`,{format:`rgba16float`,size:`surface`,domain:`linear-ldr`});if(!c.ok)return c;let l=P(e,{name:`smaa-edges`,shader:`forgeax.smaa.edges`,clearColor:[0,0,0,0],input:t,outputs:[a.value]});if(!l.ok)return l;let u=P(e,{name:`smaa-weights`,shader:`forgeax.smaa.weights`,clearColor:[0,0,0,0],input:a.value,outputs:[s.value],additionalReads:[{key:`smaa-area`,target:n.value},{key:`smaa-search`,target:r.value}]});if(!u.ok)return u;let d=P(e,{name:`smaa-blend`,shader:`forgeax.smaa.blend`,input:t,outputs:[c.value],additionalReads:[{key:`smaa-weights`,target:s.value}]});return d.ok?o(c.value):d}var ka=`
struct Output { @builtin(position) position: vec4<f32>, @location(0) uv: vec2<f32> };
@vertex fn vs_main(@builtin(vertex_index) i: u32) -> Output {
  let p = vec2<f32>(f32((i << 1u) & 2u), f32(i & 2u));
  return Output(vec4<f32>(p * 2.0 - 1.0, 0.0, 1.0), vec2<f32>(p.x, 1.0 - p.y));
}
@group(1) @binding(0) var source: texture_2d<f32>;
@group(1) @binding(1) var sourceSampler: sampler;
`,Aa=`${ka}
fn color(p: vec2<i32>) -> vec3<f32> {
  return textureLoad(source, clamp(p, vec2<i32>(0), vec2<i32>(textureDimensions(source)) - 1), 0).rgb;
}
fn delta(a: vec3<f32>, b: vec3<f32>) -> f32 {
  let d = abs(a - b);
  return max(max(d.r, d.g), d.b);
}
@fragment fn fs_main(in: Output) -> @location(0) vec4<f32> {
  let p = vec2<i32>(in.position.xy);
  let c = color(p);
  let d = vec2<f32>(delta(c, color(p + vec2<i32>(-1, 0))), delta(c, color(p + vec2<i32>(0, -1))));
  var edge = step(vec2<f32>(0.1), d);
  if (dot(edge, vec2<f32>(1.0)) == 0.0) { return vec4<f32>(0.0); }
  let opposite = vec2<f32>(delta(c, color(p + vec2<i32>(1, 0))), delta(c, color(p + vec2<i32>(0, 1))));
  let distant = vec2<f32>(delta(c, color(p + vec2<i32>(-2, 0))), delta(c, color(p + vec2<i32>(0, -2))));
  let contrast = max(max(d, opposite), distant);
  edge *= step(vec2<f32>(0.5 * max(contrast.x, contrast.y)), d);
  return vec4<f32>(edge, 0.0, 0.0);
}`,ja=`${ka}
@group(1) @binding(2) var areaTexture: texture_2d<f32>;
@group(1) @binding(3) var searchTexture: texture_2d<f32>;
fn edge(uv: vec2<f32>) -> vec2<f32> {
  return textureSampleLevel(source, sourceSampler, uv, 0.0).rg;
}
fn searchLength(e: vec2<f32>, positive: bool) -> f32 {
  let uv = vec2<f32>(select(0.0, 0.5, positive) + 0.5 * e.x, e.y);
  let size = vec2<i32>(textureDimensions(searchTexture));
  let p = clamp(vec2<i32>(uv * vec2<f32>(size)), vec2<i32>(0), size - 1);
  return 255.0 * textureLoad(searchTexture, p, 0).r;
}
// Both axes share the same pseudo-gather search; swizzling selects the crossing edge.
fn search(start: vec2<f32>, vertical: bool, positive: bool, pixel: vec2<f32>) -> f32 {
  let axis = select(vec2<f32>(1.0, 0.0), vec2<f32>(0.0, 1.0), vertical);
  let direction = select(-1.0, 1.0, positive);
  var uv = start;
  var e = vec2<f32>(0.0, 1.0);
  for (var i = 0; i < 8; i++) {
    let sampled = edge(uv);
    e = select(sampled, sampled.gr, vertical);
    uv += 2.0 * direction * axis * pixel;
    if (e.y <= 0.8281 || e.x != 0.0) { break; }
  }
  let coordinate = select(uv.x, uv.y, vertical);
  let stepSize = select(pixel.x, pixel.y, vertical);
  return coordinate + direction * stepSize * (searchLength(e, positive) - 3.25);
}
fn area(distance: vec2<f32>, crossing: vec2<f32>) -> vec2<f32> {
  // Only the 80x80 orthogonal, zero-subsample tile is needed for 1x Medium.
  let p = 16.0 * floor(4.0 * crossing + 0.5) + sqrt(abs(distance));
  return textureSampleLevel(areaTexture, sourceSampler, (p + 0.5) / 80.0, 0.0).rg;
}
@fragment fn fs_main(in: Output) -> @location(0) vec4<f32> {
  let pixel = 1.0 / vec2<f32>(textureDimensions(source));
  let uv = in.uv;
  let e = edge(uv);
  var result = vec4<f32>(0.0);
  if (e.g > 0.0) {
    let left = search(uv + pixel * vec2<f32>(-0.25, -0.125), false, false, pixel);
    let right = search(uv + pixel * vec2<f32>(1.25, -0.125), false, true, pixel);
    let y = uv.y - 0.25 * pixel.y;
    let crossing = vec2<f32>(edge(vec2<f32>(left, y)).r, edge(vec2<f32>(right + pixel.x, y)).r);
    let a = area((vec2<f32>(left, right) - uv.x) / pixel.x, crossing);
    result.r = a.x;
    result.g = a.y;
  }
  if (e.r > 0.0) {
    let top = search(uv + pixel * vec2<f32>(-0.125, -0.25), true, false, pixel);
    let bottom = search(uv + pixel * vec2<f32>(-0.125, 1.25), true, true, pixel);
    let x = uv.x - 0.25 * pixel.x;
    let crossing = vec2<f32>(edge(vec2<f32>(x, top)).g, edge(vec2<f32>(x, bottom + pixel.y)).g);
    let a = area((vec2<f32>(top, bottom) - uv.y) / pixel.y, crossing);
    result.b = a.x;
    result.a = a.y;
  }
  return result;
}`,Ma=`${ka}
@group(1) @binding(2) var blendTexture: texture_2d<f32>;
fn weight(p: vec2<i32>) -> vec4<f32> {
  return textureLoad(blendTexture, clamp(p, vec2<i32>(0), vec2<i32>(textureDimensions(blendTexture)) - 1), 0);
}
@fragment fn fs_main(in: Output) -> @location(0) vec4<f32> {
  let p = vec2<i32>(in.position.xy);
  let current = weight(p);
  let a = vec4<f32>(current.r, weight(p + vec2<i32>(0, 1)).g, current.b, weight(p + vec2<i32>(1, 0)).a);
  let color = textureLoad(source, p, 0);
  if (dot(a, vec4<f32>(1.0)) < 0.00001) { return color; }
  var offset = vec2<f32>(select(-a.b, a.a, a.a > a.b), select(-a.r, a.g, a.g > a.r));
  if (abs(offset.x) > abs(offset.y)) { offset.y = 0.0; } else { offset.x = 0.0; }
  let q = clamp(p + vec2<i32>(sign(offset)), vec2<i32>(0), vec2<i32>(textureDimensions(source)) - 1);
  // Standard supplies linear LDR; preserve that domain, including alpha, until its one OETF.
  return mix(color, textureLoad(source, q, 0), max(abs(offset.x), abs(offset.y)));
}`,Na=[{kind:`fullscreen-program`,name:`forgeax.smaa.edges`,source:Aa,reads:[`scene-color`]},{kind:`fullscreen-program`,name:`forgeax.smaa.weights`,source:ja,reads:[`smaa-edges`,`smaa-area`,`smaa-search`]},{kind:`fullscreen-program`,name:`forgeax.smaa.blend`,source:Ma,reads:[`scene-color`,`smaa-weights`]}];function Pa(){return{identity:`forgeax.smaa`,requiredCapabilities:[`rgba16floatRenderable`],requiredFullscreenPostProcesses:Na.map(e=>({identity:e.name,source:e.source})),extract:e=>o(e.views.filter(e=>e.render&&e.selectedCamera?.antialias===`smaa`).map(e=>e.identity)),plan:e=>o({work:e.map(e=>({scope:{view:e},resources:Na,passes:[]}))})}}function Fa(e){return e===`forgeax.smaa`||Na.some(t=>t.name===e)}var Ia=`linear-hdr`,La=`linear-ldr`,Ra=`display-encoded`,za=`
struct VertexOutput { @builtin(position) position: vec4<f32>, @location(0) uv: vec2<f32> };
@vertex fn color_stage_vs(@builtin(vertex_index) index: u32) -> VertexOutput {
  var positions = array<vec2<f32>, 3>(vec2<f32>(-1.0, -3.0), vec2<f32>(3.0, 1.0), vec2<f32>(-1.0, 1.0));
  let p = positions[index];
  return VertexOutput(vec4<f32>(p, 0.0, 1.0), vec2<f32>(p.x * 0.5 + 0.5, 0.5 - p.y * 0.5));
}
@group(0) @binding(0) var source: texture_2d<f32>;
@group(0) @binding(1) var sourceSampler: sampler;
`,Ba=new WeakMap,Va=16;function Ha(e){let t=Ba.get(e);if(t===void 0){t=[],Ba.set(e,t);let n=t;e._adopt(`post-effect`,t,()=>{Ba.delete(e),n.length=0})}return t}function Ua(t,n,i,a,c,l){let u=za+c,d,f,p=t.addRasterPass(n,{accesses:[{resource:i.view,usage:`sampled-read`},...l?.accesses??[],{resource:a.view,usage:`color-attachment`}],colorAttachments:[{view:a.view,loadOp:`clear`,storeOp:`store`,clearValue:{r:0,g:0,b:0,a:1}}],encode:({pass:t,frame:o,resources:c})=>{let p=o.runtime,m=p.device,h=p.deviceScope,g=p.immediateShaderModuleFactory??p.shaderModuleFactory;if(g===void 0)throw Error(`${n} shader factory unavailable`);let _=l?.bind(m,c,o);h===void 0&&(f??=[]);let v=h===void 0?f:h.isAlive()?Ha(h):void 0;d??=v?.find(e=>e.name===n&&e.code===u)?.moduleLabel??`${n}-sha256:${s(e(r(u)))}`;let y=g.createShaderModule({code:u,label:d});if(!y.ok)throw y.error;let b=v?.find(e=>e.device===m&&e.factory===g&&e.createModule===g.createShaderModule&&e.name===n&&e.code===u&&e.module===y.value&&e.format===a.format&&e.sampleCount===a.sampleCount&&e.stageLayout===_?.layout);if(b===void 0){let e=m.createBindGroupLayout({label:`${n}.bgl`,entries:[{binding:0,visibility:2,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:1,visibility:2,sampler:{type:`filtering`}}]});if(!e.ok)throw e.error;let t=e.value,r=m.createSampler({minFilter:`linear`,magFilter:`linear`});if(!r.ok)throw r.error;let i=m.createPipelineLayout({label:`${n}.layout`,bindGroupLayouts:_===void 0?[t]:[t,_.layout]});if(!i.ok)throw i.error;let o=m.createRenderPipeline({label:n,layout:i.value,vertex:{module:y.value,entryPoint:`color_stage_vs`,buffers:[]},fragment:{module:y.value,entryPoint:`color_stage_fs`,targets:[{format:a.format}]},primitive:{topology:`triangle-list`}});if(!o.ok)throw o.error;b={device:m,factory:g,createModule:g.createShaderModule,name:n,code:u,module:y.value,moduleLabel:d,format:a.format,sampleCount:a.sampleCount,stageLayout:_?.layout,layout:t,sampler:r.value,pipeline:o.value},v!==void 0&&(h===void 0||h.isAlive())&&(v.length===Va&&v.shift(),v.push(b))}let x=c.textureView(i.view);if(!x.ok)throw x.error;let S=m.createBindGroup({layout:b.layout,entries:[{binding:0,resource:{kind:`textureView`,value:x.value}},{binding:1,resource:{kind:`sampler`,value:b.sampler}}]});if(!S.ok)throw S.error;t.setPipeline(b.pipeline),t.setBindGroup(0,S.value),_!==void 0&&t.setBindGroup(1,_.bindGroup),t.draw(3,1,0,0)}});return p.ok?o(void 0):p}var Wa=`auto-exposure-meter`,Ga=Object.freeze({x:4,y:8,z:1});function Ka(e){return e.immediateShaderModuleFactory??e.shaderModuleFactory}var qa=1024,Ja=32,Ya=16,Xa=32,Za=4;function Qa(e,t,n,r=128){return e.createBuffer({label:t,size:n,usage:r,mappedAtCreation:!1})}function $a(e,t){if(!e.caps.compute)return n(new ne({capability:`compute`,generation:t}));if(!e.caps.storageBuffer)return n(new ne({capability:`storage-buffer`,generation:t}));let r=Qa(e,`standard-auto-exposure-histogram`,qa);if(!r.ok)return r;let i=Qa(e,`standard-auto-exposure-state`,Ja,136);if(!i.ok)return e.destroyBuffer(r.value),i;let a=e.queue.writeBuffer(i.value,0,new Uint8Array(Ja));if(!a.ok)return e.destroyBuffer(r.value),e.destroyBuffer(i.value),a;let s=Qa(e,`standard-auto-exposure-candidate`,Ya);if(!s.ok)return e.destroyBuffer(r.value),e.destroyBuffer(i.value),s;let c=Qa(e,`standard-auto-exposure-parameters`,Xa,136);return c.ok?o({histogram:r.value,state:i.value,candidate:s.value,parameters:c.value,device:e,generation:t}):(e.destroyBuffer(r.value),e.destroyBuffer(i.value),e.destroyBuffer(s.value),c)}function eo(e,t){let n=new Float32Array([t.compensationEv,t.rangeMinEv,t.rangeMaxEv,t.upRate,t.downRate,t.deltaTime,t.fallback,t.generation]);return e.device.queue.writeBuffer(e.parameters,0,n)}function to(e){e.device.destroyBuffer(e.histogram),e.device.destroyBuffer(e.state),e.device.destroyBuffer(e.candidate),e.device.destroyBuffer(e.parameters)}function no(e){let t=e=>{let t=e.frameState,n=t.pendingAutoExposureGpuResources??t.autoExposureGpuResources;if(n===void 0)throw Error(`auto-exposure GPU resources were not prepared`);return n},n=e.importBuffer(`standard-auto-exposure-histogram`,{size:qa,usage:128},e=>t(e).histogram);if(!n.ok)return n;let r=e.importBuffer(`standard-auto-exposure-state`,{size:Ja,usage:128},e=>t(e).state);if(!r.ok)return r;let i=e.importBuffer(`standard-auto-exposure-candidate`,{size:Ya,usage:128},e=>t(e).candidate);if(!i.ok)return i;let a=e.importBuffer(`standard-auto-exposure-parameters`,{size:Xa,usage:136},e=>t(e).parameters);return a.ok?o({histogram:n.value,state:r.value,candidate:i.value,parameters:a.value}):a}function ro(e){let t=Ka(e.runtime);if(t===void 0)throw Error(`auto-exposure meter shader factory unavailable`);let n=t.createShaderModule({code:f,label:`auto_exposure_meter`});if(!n.ok)throw n.error;let r=e.runtime.device.createBindGroupLayout({entries:[{binding:0,visibility:Za,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:1,visibility:Za,buffer:{type:`storage`}},{binding:2,visibility:Za,buffer:{type:`storage`}},{binding:3,visibility:Za,buffer:{type:`storage`}},{binding:4,visibility:Za,buffer:{type:`read-only-storage`}}]});if(!r.ok)throw r.error;let i=e.runtime.device.createPipelineLayout({label:`auto_exposure_meter.layout`,bindGroupLayouts:[r.value]});if(!i.ok)throw i.error;let a=(t,r)=>{let a=e.runtime.device.createComputePipeline({label:t,layout:i.value,compute:{module:n.value,entryPoint:r}});if(!a.ok)throw a.error;return a.value};return{layout:r.value,clearPipeline:a(`auto_exposure_clear`,`auto_exposure_clear`),histogramPipeline:a(`auto_exposure_histogram`,`auto_exposure_histogram`),adaptPipeline:a(`auto_exposure_adapt`,`auto_exposure_adapt`)}}function io(e,t){let n,r=e.graph.addComputePass(Wa,{accesses:[{resource:t.source.view,usage:`sampled-read`},{resource:t.resources.histogram,usage:`storage-write`},{resource:t.resources.state,usage:`storage-write`},{resource:t.resources.candidate,usage:`storage-write`},{resource:t.resources.parameters,usage:`storage-read`}],encode:({pass:e,frame:r,resources:i})=>{n??=ro(r);let a=i.textureView(t.source.view),o=i.buffer(t.resources.histogram),s=i.buffer(t.resources.state),c=i.buffer(t.resources.candidate),l=i.buffer(t.resources.parameters);if(!a.ok)throw a.error;if(!o.ok)throw o.error;if(!s.ok)throw s.error;if(!c.ok)throw c.error;if(!l.ok)throw l.error;let u=r.runtime.device.createBindGroup({layout:n.layout,entries:[{binding:0,resource:{kind:`textureView`,value:a.value}},{binding:1,resource:{kind:`buffer`,value:{buffer:o.value}}},{binding:2,resource:{kind:`buffer`,value:{buffer:s.value}}},{binding:3,resource:{kind:`buffer`,value:{buffer:c.value}}},{binding:4,resource:{kind:`buffer`,value:{buffer:l.value}}}]});if(!u.ok)throw u.error;e.setBindGroup(0,u.value),e.setPipeline(n.clearPipeline),e.dispatchWorkgroups(1,1,1),e.setPipeline(n.histogramPipeline),e.dispatchWorkgroups(Ga.x,Ga.y,Ga.z),e.setPipeline(n.adaptPipeline),e.dispatchWorkgroups(1,1,1)}});return r.ok?o(void 0):r}function ao(e){return Number.isFinite(e)?e.toFixed(8):`0.0`}function oo(e={temperature:6504,tint:0},t=!0){let n=t?`@group(1) @binding(0) var<storage, read> candidate: array<vec4<f32>>;`:``,r=t?`max(candidate[0].x, 0.0)`:`1.0`;return`
${n}

const WB_TEMPERATURE: f32 = ${ao(e.temperature)};
const WB_TINT: f32 = ${ao(e.tint)};

fn mul_rgb_to_xyz(value: vec3<f32>) -> vec3<f32> {
  return vec3<f32>(
    dot(vec3<f32>(0.4124564, 0.3575761, 0.1804375), value),
    dot(vec3<f32>(0.2126729, 0.7151522, 0.0721750), value),
    dot(vec3<f32>(0.0193339, 0.1191920, 0.9503041), value)
  );
}

// Inverse of mul_rgb_to_xyz: adapted XYZ must return to linear sRGB.
fn mul_xyz_to_rgb(value: vec3<f32>) -> vec3<f32> {
  return vec3<f32>(
    dot(vec3<f32>(3.2404548, -1.5371389, -0.4985315), value),
    dot(vec3<f32>(-0.9692664, 1.8760109, 0.0415561), value),
    dot(vec3<f32>(0.0556434, -0.2040259, 1.0572252), value)
  );
}

fn mul_bradford(value: vec3<f32>) -> vec3<f32> {
  return vec3<f32>(
    dot(vec3<f32>(0.8951, 0.2664, -0.1614), value),
    dot(vec3<f32>(-0.7502, 1.7135, 0.0367), value),
    dot(vec3<f32>(0.0389, -0.0685, 1.0296), value)
  );
}

fn mul_bradford_inverse(value: vec3<f32>) -> vec3<f32> {
  return vec3<f32>(
    dot(vec3<f32>(0.9869929, -0.1470543, 0.1599627), value),
    dot(vec3<f32>(0.4323053, 0.5183603, 0.0492912), value),
    dot(vec3<f32>(-0.0085287, 0.0400428, 0.9684867), value)
  );
}

fn blackbody_white_point(temperature: f32) -> vec3<f32> {
  if (temperature == 6504.0) { return vec3<f32>(0.95047, 1.0, 1.08883); }
  let t = clamp(temperature, 1000.0, 40000.0);
  var x: f32;
  if (t <= 4000.0) {
    x = -0.2661239e9 / (t * t * t) - 0.234358e6 / (t * t) + 0.8776956e3 / t + 0.17991;
  } else {
    x = -3.0258469e9 / (t * t * t) + 2.1070379e6 / (t * t) + 0.2226347e3 / t + 0.24039;
  }
  var y: f32;
  if (t <= 2222.0) {
    y = -1.1063814 * x * x * x - 1.3481102 * x * x + 2.18555832 * x - 0.20219683;
  } else if (t <= 4000.0) {
    y = -0.9549476 * x * x * x - 1.37418593 * x * x + 2.09137015 * x - 0.16748867;
  } else {
    y = 3.081758 * x * x * x - 5.8733867 * x * x + 3.75112997 * x - 0.37001483;
  }
  return vec3<f32>(x / y, 1.0, (1.0 - x - y) / y);
}

fn apply_white_balance(value: vec3<f32>) -> vec3<f32> {
  if (WB_TEMPERATURE == 6504.0 && WB_TINT == 0.0) { return value; }
  let source_lms = mul_bradford(vec3<f32>(0.95047, 1.0, 1.08883));
  let target_lms = mul_bradford(blackbody_white_point(WB_TEMPERATURE));
  let scale = target_lms / source_lms;
  let adapted_lms = mul_bradford(mul_rgb_to_xyz(value)) * scale;
  let adapted_xyz = mul_bradford_inverse(adapted_lms);
  let adapted_rgb = mul_xyz_to_rgb(adapted_xyz);
  return adapted_rgb * vec3<f32>(
    max(0.0, 1.0 + WB_TINT),
    max(0.0, 1.0 - WB_TINT),
    max(0.0, 1.0 + WB_TINT)
  );
}

@fragment fn color_stage_fs(input: VertexOutput) -> @location(0) vec4<f32> {
  let color = textureSampleLevel(source, sourceSampler, input.uv, 0.0);
  let exposed = color.rgb * ${r};
  return vec4<f32>(apply_white_balance(exposed), color.a);
}`}function so(e,t,n,r,i={temperature:6504,tint:0}){let a;return Ua(e.graph,`standard-exposure-white-balance`,t,n,oo(i,r!==void 0),r===void 0?void 0:{accesses:[{resource:r.candidate,usage:`storage-read`}],bind:(e,t)=>{if(a===void 0){let t=e.createBindGroupLayout({label:`standard-exposure-white-balance.candidate.bgl`,entries:[{binding:0,visibility:2,buffer:{type:`read-only-storage`}}]});if(!t.ok)throw t.error;a=t.value}let n=t.buffer(r.candidate);if(!n.ok)throw n.error;let i=e.createBindGroup({layout:a,entries:[{binding:0,resource:{kind:`buffer`,value:{buffer:n.value}}}]});if(!i.ok)throw i.error;return{layout:a,bindGroup:i.value}}})}function co(e){let t=[];return e.temporal&&t.push(`temporal`),e.meter&&t.push(`meter`),e.dof===!0&&t.push(`dof`),e.bloom&&t.push(`bloom`),e.lensFlare===!0&&t.push(`lens-flare`),(e.exposure||e.whiteBalance)&&t.push(`exposure-white-balance`),t.push(`tone`),e.lut&&t.push(`lut`),e.outline===!0&&t.push(`outline`),e.barrelDistortion===!0&&t.push(`barrel-distortion`),e.fxaa&&t.push(`fxaa`),e.lensEffects===!0&&t.push(`lens-effects`),e.smaa===!0&&t.push(`smaa`),t.push(`output-encoding`),t}function lo(e){return e.map(e=>{switch(e){case`temporal`:case`meter`:case`bloom`:case`lens-flare`:case`dof`:case`exposure-white-balance`:return{name:e,input:Ia,output:Ia};case`tone`:return{name:e,input:Ia,output:La};case`lut`:case`outline`:case`barrel-distortion`:case`fxaa`:case`lens-effects`:case`smaa`:return{name:e,input:La,output:La};case`output-encoding`:return{name:e,input:La,output:Ra};default:throw Error(`Unknown Standard output stage: ${e}`)}})}function uo(e){let t=co(e),n=[...e.lensFlare===!0?[`standard-lens-flare-prefilter`,`standard-lens-flare-bokeh`,`standard-lens-flare`]:[],...e.lut?[`standard-color-lut`]:[],...e.barrelDistortion===!0?[`standard-barrel-distortion`]:[],...e.lensEffects===!0?[`standard-lens-effects`]:[]],r=(e.lensFlare===!0?10:0)+(e.lut?2:0)+(e.barrelDistortion===!0?3:0)+(e.lensEffects===!0?3:0);return{features:{temporal:e.temporal,meter:e.meter,bloom:e.bloom,dof:e.dof===!0,lensFlare:e.lensFlare===!0,exposure:e.exposure,whiteBalance:e.whiteBalance,lut:e.lut,outline:e.outline===!0,barrelDistortion:e.barrelDistortion===!0,lensEffects:e.lensEffects===!0,fxaa:e.fxaa,smaa:e.smaa===!0},logicalStages:t,physicalStages:lo(t),incrementalResources:n,incrementalBindings:r}}function fo(){return{addressModeU:`clamp-to-edge`,addressModeV:`clamp-to-edge`,addressModeW:`clamp-to-edge`,magFilter:`linear`,minFilter:`linear`,mipmapFilter:`nearest`}}function po(e,t,r,i){return n({code:e,expected:t,hint:r,detail:i})}function mo(e){let{texture:t}=e;if(t.shape.viewDimension!==`3d`||t.format!==`rgba16float`||t.colorSpace!==`linear`||t.mips.kind===`generate`||t.mips.kind===`packed`&&t.mips.levelCount!==1)return po(`standard-lut-shape-invalid`,`a linear rgba16float 3D texture with one resident mip level`,`re-import the LUT as an ordinary linear 3D TextureAsset without generated mips`,{viewDimension:t.shape.viewDimension,format:t.format,colorSpace:t.colorSpace,mipPolicy:t.mips.kind});let n=t.shape.extent;return n.width!==n.height||n.width!==n.depth?po(`standard-lut-shape-invalid`,`LUT width, height, and depth must be equal`,`produce a cubic 3D LUT`,{width:n.width,height:n.height,depth:n.depth}):!Number.isInteger(e.maxTextureDimension3D)||e.maxTextureDimension3D<=0||n.width>e.maxTextureDimension3D?po(`standard-lut-limit-exceeded`,`the LUT extent must fit the live maxTextureDimension3D limit`,`use a smaller LUT or select a device with a larger 3D texture limit`,{size:n.width,maxTextureDimension3D:e.maxTextureDimension3D}):e.rgba16floatFilterable?e.bind()?o({viewDimension:`3d`,extent:{width:n.width,height:n.height,depth:n.depth},sampler:fo()}):po(`standard-lut-bind-failed`,`the LUT view and sampler must bind on the live device`,`disable the LUT and retain the last known good output`,{size:n.width}):po(`standard-lut-filter-unavailable`,`rgba16float 3D sampling must be filterable on the live device`,`disable the LUT or use a device that exposes rgba16float filtering`,{format:t.format,rgba16floatFilterable:!1})}var ho=new WeakMap;function go(e){}function q(e,t,r,i={}){return n({code:e,expected:t,hint:r,detail:i})}function J(e){if(typeof e!=`object`||!e)return{cause:String(e)};let t=e;return{...typeof t.code==`string`?{causeCode:t.code}:{},...typeof t.expected==`string`?{causeExpected:t.expected}:{},...typeof t.hint==`string`?{causeHint:t.hint}:{}}}function _o(e){if(!Number.isFinite(e.strength)||e.strength<=0)return q(`standard-lut-strength-invalid`,`the LUT blend strength must be finite and positive`,`set Camera.colorLutStrength to a value in (0, 1]`,{strength:String(e.strength)});let t=e.world.resolveAsset(e.handle);if(!t.ok)return q(`standard-lut-residency-failed`,`the authored TextureAsset handle resolves in the active RenderResourceScope`,`register or rebuild the TextureAsset, then retry the same camera generation`,J(t.error));let r=e.world.sourceForAsset(e.handle),i=r?.guid,a=`${e.world.identity}:${e.handle}`,s=r?.sourceKey??a,c=e.gpuStore.getTextureGpuView(e.handle,e.world),l;if(c===void 0){let n=e.gpuStore.ensureResident(e.handle,t.value,e.world);if(!n.ok)return q(`standard-lut-residency-failed`,`the LUT TextureAsset becomes resident through the producer-owned GPU store`,`inspect the structured residency failure and rebuild the source asset before retrying`,J(n.error));if(!(`texture`in n.value))return q(`standard-lut-residency-failed`,`the LUT handle resolves to a resident TextureAsset, not a mesh resource`,`repair the authored handle kind and retry the same source key`,{guid:String(i)});l=n.value}let u=c??l?.view,d=l?.texture.handle??e.gpuStore._getTextureGpuTexture(e.handle,e.world)?.handle;if(u===void 0||d===void 0)return q(`standard-lut-not-resident`,`the LUT has a live GPU texture and view before graph admission`,`retain the current LKG and retry producer-owned residency for the same GUID/sourceKey`,{guid:String(i),sourceKey:s});let f=ho.get(e.device)??(()=>{let t=new Map;return ho.set(e.device,t),t})(),p=f.get(a);if(p!==void 0&&p.texture===d)return o({...p,sourceKey:s,strength:e.strength});let m=e.device.createTextureView(d,{dimension:`3d`});if(!m.ok)return q(`standard-lut-3d-view-unavailable`,`the resident texture creates a live 3D texture view`,`disable the LUT and retain the last known good output on this device`,J(m.error));let h=p===void 0?e.device.createSampler(fo()):o(p.sampler);if(!h.ok)return q(`standard-lut-sampler-failed`,`the live device creates the filtering sampler required by the LUT`,`disable the LUT and retain the last known good output`,J(h.error));let g=p===void 0?e.device.createBindGroupLayout({entries:[{binding:0,visibility:2,texture:{sampleType:`float`,viewDimension:`3d`}},{binding:1,visibility:2,sampler:{type:`filtering`}}]}):o(p.bindGroupLayout);if(!g.ok)return q(`standard-lut-bind-group-layout-failed`,`the live device accepts a filtering float 3D LUT bind-group layout`,`disable the LUT and retain the last known good output`,J(g.error));let _;try{_=e.device.createBindGroup({layout:g.value,entries:[{binding:0,resource:{kind:`textureView`,value:m.value}},{binding:1,resource:{kind:`sampler`,value:h.value}}]})}catch(e){return q(`standard-lut-filter-unavailable`,`the live device binds the rgba16float 3D view with a filtering sampler`,`disable the LUT and retain the last known good output on this device`,{cause:String(e)})}let v=mo({texture:t.value,maxTextureDimension3D:e.device.limits.maxTextureDimension3D,rgba16floatFilterable:_.ok,bind:()=>_.ok});if(!v.ok)return v.error.code===`standard-lut-filter-unavailable`&&!_.ok?n({...v.error,detail:Object.freeze({...v.error.detail,...J(_.error)})}):v;if(!_.ok)return q(`standard-lut-bind-failed`,`the admitted LUT view and sampler bind successfully`,`disable the LUT and retain the last known good output`,J(_.error));let y={texture:d,view:m.value,sampler:h.value,bindGroupLayout:g.value,bindGroup:_.value,size:v.value.extent.width};return f.set(a,y),o({...y,sourceKey:s,strength:e.strength})}var vo=`
@group(1) @binding(0) var lut: texture_3d<f32>;
@group(1) @binding(1) var lutSampler: sampler;
@fragment fn color_stage_fs(input: VertexOutput) -> @location(0) vec4<f32> {
  let color = textureSampleLevel(source, sourceSampler, input.uv, 0.0);
  let mapped = textureSampleLevel(lut, lutSampler, clamp(color.rgb, vec3<f32>(0.0), vec3<f32>(1.0)), 0.0);
  return vec4<f32>(mix(color.rgb, mapped.rgb, LUT_STRENGTH), color.a);
}`;function yo(e,t,n,r){return Ua(e,`standard-color-lut`,t,n,vo.replace(`LUT_STRENGTH`,String(r.strength)),{accesses:[{resource:r.view,usage:`sampled-read`}],bind:(e,t,n)=>{let i=r.bind(n);return{layout:i.bindGroupLayout,bindGroup:i.bindGroup}}})}var bo=new WeakMap;function xo(e){let t=bo.get(e);if(t===void 0){t=[],bo.set(e,t);let n=t;e._adopt(`post-effect`,t,()=>{bo.delete(e),n.length=0})}return t}function So(e){throw new l({code:`rhi-not-available`,expected:e,hint:`prepare the Standard output transform and its resident LUT before encoding`})}function Co(e,t,n,r,i){let a=[],s,c=e.addRasterPass(`standard-tone-lut-output`,{accesses:[{resource:t.view,usage:`sampled-read`},{resource:r.view,usage:`sampled-read`},{resource:n.view,usage:`color-attachment`}],colorAttachments:[{view:n.view,loadOp:`clear`,storeOp:`store`,clearValue:{r:0,g:0,b:0,a:1}}],encode:({frame:e,pass:o,resources:c})=>{let{runtime:l}=e,d=l.device,f=r.bind(e),p=l.immediateShaderModuleFactory??l.shaderModuleFactory,m=l.lookupPostProcess?.(j),h=e.postProcessParams.get(j),g=l.getPostProcessParamsBuffer?.(j);if(p===void 0||m===void 0||g===void 0||h?.byteLength!==u.byteSize)return So(`the composed Standard tone/LUT module and 32-byte params are available`);let _=p.createShaderModule({code:m.source,label:Ce(m.source)});if(!_.ok)throw _.error;let v=l.deviceScope,y=v===void 0?a:v.isAlive()?xo(v):void 0,b=y?.find(e=>e.device===d&&e.factory===p&&e.createModule===p.createShaderModule&&e.module===_.value&&e.source===m.source&&e.format===n.format&&e.sampleCount===n.sampleCount&&e.lutLayout===f.bindGroupLayout);if(b===void 0){let e=d.createBindGroupLayout({entries:[]});if(!e.ok)throw e.error;let t=d.createBindGroupLayout({entries:[{binding:0,visibility:2,texture:{sampleType:`float`,viewDimension:`2d`}},{binding:1,visibility:2,sampler:{type:`filtering`}},{binding:2,visibility:2,buffer:{type:`uniform`}}]});if(!t.ok)throw t.error;let r=d.createPipelineLayout({bindGroupLayouts:[e.value,t.value,f.bindGroupLayout]});if(!r.ok)throw r.error;let i=d.createSampler({minFilter:`linear`,magFilter:`linear`});if(!i.ok)throw i.error;let a=d.createRenderPipeline({label:`standard-tone-lut-output`,layout:r.value,vertex:{module:_.value,entryPoint:`vs_main`,buffers:[]},fragment:{module:_.value,entryPoint:`fs_tone_lut_encode`,targets:[{format:n.format}]},primitive:{topology:`triangle-list`},multisample:{count:n.sampleCount}});if(!a.ok)throw a.error;b={device:d,factory:p,createModule:p.createShaderModule,module:_.value,source:m.source,format:n.format,sampleCount:n.sampleCount,lutLayout:f.bindGroupLayout,inputLayout:t.value,sampler:i.value,pipeline:a.value},y!==void 0&&(v===void 0||v.isAlive())&&(y.length===8&&y.shift(),y.push(b))}let x=c.textureViewExtent(n.view);if(!x.ok)throw x.error;let S=h.slice(),C=new DataView(S.buffer,S.byteOffset,S.byteLength);C.setFloat32(u.ditherOffset,+!!i,!0),C.setFloat32(u.outputGamutOffset+4,r.strength,!0),C.setFloat32(u.outputWidthOffset,x.value.width,!0),C.setFloat32(u.outputHeightOffset,x.value.height,!0);let w=d.queue.writeBuffer(g,0,S);if(!w.ok)throw w.error;let T=c.textureView(t.view);if(!T.ok)throw T.error;if(s?.program!==b||s.input!==T.value||s.params!==g){let e=d.createBindGroup({layout:b.inputLayout,entries:[{binding:0,resource:{kind:`textureView`,value:T.value}},{binding:1,resource:{kind:`sampler`,value:b.sampler}},{binding:2,resource:{kind:`buffer`,value:{buffer:g}}}]});if(!e.ok)throw e.error;s={program:b,input:T.value,params:g,group:e.value}}o.setPipeline(b.pipeline),o.setBindGroup(1,s.group),o.setBindGroup(2,f.bindGroup),o.draw(3,1,0,0)}});return c.ok?o(void 0):c}var wo=5,Y={composited:{label:`bloom-composited`,format:`rgba16float`},horizontalPrefix:`bloom-horizontal-`,verticalPrefix:`bloom-vertical-`};function To(e,t){let n=[],r=Math.max(1,Math.ceil(e/2)),i=Math.max(1,Math.ceil(t/2));for(let e=0;e<wo;e+=1)n.push({width:r,height:i}),r=Math.max(1,Math.ceil(r/2)),i=Math.max(1,Math.ceil(i/2));return n}function Eo(e,t){let n=To(e,t);return{composited:{label:Y.composited.label,format:Y.composited.format,size:{width:e,height:t},domain:`linear-hdr`},horizontal:n.map((e,t)=>({label:`${Y.horizontalPrefix}${t}`,format:`rgba16float`,size:e,domain:`linear-hdr`})),vertical:n.map((e,t)=>({label:`${Y.verticalPrefix}${t}`,format:`rgba16float`,size:e,domain:`linear-hdr`})),levels:n}}var Do=()=>({status:`empty`,targetCount:0,targetBytes:0,passCount:0,levelCount:0,levelDimensions:[],horizontalPassCount:0,verticalPassCount:0}),Oo=()=>({status:`invalid`,targetCount:0,targetBytes:0,passCount:0,levelCount:0,levelDimensions:[],horizontalPassCount:0,verticalPassCount:0});function ko(e){let n=e.descriptor;if(e.kind!==`texture`||n===void 0||n.kind!==`texture`||n.format!==`rgba16float`)return;let r=t(n.format).bytesPerBlock,a=0;for(let e=0;e<n.mipLevelCount;e+=1)a+=i(n.width,e)*i(n.height,e)*n.depthOrArrayLayers*r;let o=a*n.sampleCount;return e.byteSize===o&&o>0?o:void 0}function Ao(e){let t=e.descriptor;if(e.kind===`texture`&&t.kind===`texture`&&typeof t.size!=`string`&&e.extent!==void 0&&e.extent.width===t.width&&e.extent.height===t.height&&e.extent.depthOrArrayLayers===t.depthOrArrayLayers&&!(t.format!==`rgba16float`||t.domain!==`linear-hdr`||t.width<=0||t.height<=0||t.depthOrArrayLayers!==1||t.mipLevelCount!==1||t.sampleCount!==1||e.dimension!==`2d`||t.size.width!==t.width||t.size.height!==t.height||ko(e)===void 0))return{width:t.width,height:t.height}}function jo(e,t){return e!==void 0&&e.kind===`raster`&&e.accesses.length===t.length&&t.every((t,n)=>e.accesses[n]?.resource===t.resource&&e.accesses[n]?.usage===t.usage)}function Mo(e){if(e===void 0)return Do();let t=e.resources.filter(e=>e.label===Y.composited.label),n=e.resources.filter(e=>e.label.startsWith(Y.horizontalPrefix)).sort((e,t)=>e.label.localeCompare(t.label,void 0,{numeric:!0})),r=e.resources.filter(e=>e.label.startsWith(Y.verticalPrefix)).sort((e,t)=>e.label.localeCompare(t.label,void 0,{numeric:!0})),i=[...t,...n,...r],a=e.passes.filter(e=>e.name===ce.composite||e.name.startsWith(`${ce.horizontal}-`)||e.name.startsWith(`${ce.vertical}-`)).sort((e,t)=>e.executionIndex-t.executionIndex);if(i.length===0&&a.length===0)return Do();if(t.length!==1)return Oo();let o=t[0];if(o===void 0)return Oo();let s=Ao(o);if(s===void 0)return Oo();let c=Eo(s.width,s.height),l=c.horizontal.map(e=>e.label),u=c.vertical.map(e=>e.label),d=n.sort((e,t)=>e.label.localeCompare(t.label,void 0,{numeric:!0})),f=r.sort((e,t)=>e.label.localeCompare(t.label,void 0,{numeric:!0})),p=i.length===1+l.length+u.length&&d.length===l.length&&f.length===u.length&&d.every((e,t)=>e.label===l[t])&&f.every((e,t)=>e.label===u[t])&&d.every((e,t)=>Ao(e)?.width===c.levels[t]?.width&&Ao(e)?.height===c.levels[t]?.height)&&f.every((e,t)=>Ao(e)?.width===c.levels[t]?.width&&Ao(e)?.height===c.levels[t]?.height),m=l.flatMap((e,t)=>[e,u[t]]);m.push(ce.composite);let h=a.length===m.length&&a.every((e,t)=>e.name===m[t]),g=a[0]?.accesses[0]?.resource,_=h&&g!==void 0&&!g.startsWith(`bloom-`)&&e.resources.some(e=>e.label===g)&&d.every((e,t)=>jo(a[t*2],[{resource:t===0?g:`bloom-vertical-${t-1}`,usage:`sampled-read`},{resource:`bloom-horizontal-${t}`,usage:`color-attachment`}])&&jo(a[t*2+1],[{resource:`bloom-horizontal-${t}`,usage:`sampled-read`},{resource:`bloom-vertical-${t}`,usage:`color-attachment`}]))&&jo(a.at(-1),[{resource:g,usage:`sampled-read`},...u.map(e=>({resource:e,usage:`sampled-read`})),{resource:Y.composited.label,usage:`color-attachment`}]);if(!p||!_)return Oo();let v=d.flatMap(e=>{let t=Ao(e);return t===void 0?[]:[t]});if(v.length!==d.length)return Oo();let y=i.reduce((e,t)=>e+(ko(t)??0),0);return{status:`valid`,targetCount:i.length,targetBytes:y,passCount:a.length,levelCount:d.length,levelDimensions:v,horizontalPassCount:d.length,verticalPassCount:f.length}}function X(e,t,n){return F(e.graph,t,n)}function No(e,t){return new oe({featureIdentity:`forgeax::standard`,schema:`forgeax::scene-data::temporal-v1`,lane:e.lane.compute?`clustered`:`cpu-webgl2`,reason:`producer-missing`,missingContributorIds:[t],omittedMissingContributorCount:0,recovery:`renderer-recover`})}function Po(e,t,n,r){let{color:i,colorResolve:a,depth:o}=t;return e.contributeFeatures({targets:[{name:`linear-hdr`,kind:`scene-color`,texture:i.texture,view:i.view,...a===void 0?{}:{resolveTarget:a},format:i.format,sampleCount:i.sampleCount},{kind:`scene-depth`,texture:o.texture,view:o.view,format:o.format,sampleCount:o.sampleCount}],semanticTargets:[],namedTargets:{},standardSurfaceAccesses:n,exclude:[$e],passNames:[],atmosphere:r})}function Fo(e,t){let n=t.clearOnly===!0,r=t.camera,i=Io(t,n),a=!n&&(r.tonemap!==`none`||r.antialias===`taa`||i.bloom),o=!n&&t.surface.profile?.kind===`raw-only`,s=n?[]:t.preTemporalEffects??[],c=n?[]:Lo(t,s);return{clearOnly:n,features:i,hdr:a,linearLdr:!n&&!a,rawOnly:o,motionBlur:!n&&t.temporal?.motionBlur===!0,outputDither:Te(t.config),preTemporalEffects:s,postEffects:c,splitOutput:!n&&Ro(i),fusedToneLut:!n&&!o&&zo(e,t,i,c.length),debugOverlayBeforePost:(i.barrelDistortion||i.lensEffects)===!0}}function Io(e,t){let n=e.camera;return uo({temporal:!t&&n.antialias===`taa`,meter:e.output?.autoExposure===!0,bloom:!t&&Qe(e.camera),dof:!t&&n.depthOfField!==void 0,lensFlare:!t&&n.lensFlare===!0,exposure:e.output?.autoExposure===!0,whiteBalance:e.output?.whiteBalance===!0,lut:e.output?.colorLut===!0,outline:!t&&n.outline===!0,barrelDistortion:n.barrelDistortion===!0,lensEffects:!t&&n.lensEffects===!0,fxaa:!t&&n.antialias===`fxaa`,smaa:!t&&n.antialias===`smaa`}).features}function Lo(e,t){return(e.config?.postEffects??[]).filter(e=>!t.includes(e)&&e!==`fullscreen.forgeax.barrel-distortion`&&e!==`forgeax.lens-effects`&&!wa(e)&&!ra(e)&&!Fa(e))}function Ro(e){return(e.lut||e.exposure||e.whiteBalance||e.barrelDistortion||e.lensEffects||e.outline||e.smaa)===!0}function zo(e,t,n,r){let i=t.extent,a=t.camera.antialias===`none`||t.camera.antialias===`taa`&&(i===void 0||i.internalWidth===i.outputWidth&&i.internalHeight===i.outputHeight);return n.lut&&a&&!n.outline&&!n.barrelDistortion&&!n.lensEffects&&r===0&&(e.observationCaptureDomains?.length??0)===0}function Bo(e,t){if((t.barrelDistortion||t.lensEffects||t.lensFlare)&&e.capabilities?.rgba16floatRenderable!==!0)return new A(t.barrelDistortion?$e:t.lensEffects?Bi:Wi,0,`rgba16floatRenderable`)}function Vo(e,t,n){let r=Di(e.graph,t);if(!r.ok)return r;if(e.observationCaptureDomains?.includes(`final-display`)===!0){let n=tt(e.graph,t,`final-display`);if(!n.ok)return n}return I(e.graph,t,n.storage,{name:`standard-clear-present`,fragmentEntryPoint:`fs_present`})}function Ho(e,t){return!t.rawOnly||t.postEffects.length===0?o(void 0):X(e,`standard-post-effects-input`,{format:`rgba16float`,size:`surface`,usage:1,domain:`display-encoded`})}function Uo(e,t,n){return!n.rawOnly||e.observationCaptureDomains?.includes(`final-display`)!==!0?o(void 0):X(e,`standard-observed-output`,{format:t.surface.storageFormat,size:`surface`,domain:`display-encoded`})}function Wo(e,t,n,r,i){let a=r;for(let[o,s]of n.entries()){let n=X(e,`scene-effect-output-${o}`,{format:r.format,size:t.extent===void 0?`surface`:se(t.extent,`internal`),domain:`linear-hdr`});if(!n.ok)return n;let c=P(e.graph,{name:`scene-effect-${o}`,shader:s,input:a,outputs:[n.value],depth:i});if(!c.ok)return c;a=n.value}return o(a)}function Go(e,t){let r=e.standardOutput?.autoExposure;return t.features.exposure&&r===void 0?n(new z({code:`resource-resolution-failed`,expected:`a prepared same-frame auto-exposure producer projection`,hint:`prepare device-scoped auto-exposure resources before compiling Standard output`,detail:{resourceLabel:`standard-auto-exposure`}})):o(r)}function Ko(e,t,r,i,a,s,c,l){if(a===void 0)return n(No(t,`forgeax::standard::scene-data`));let u=e.taaHistory;if(u===void 0)return n(No(t,`forgeax::standard::taa-history`));let d={scene:r,depth:i,currentTemporal:a,...c===void 0?{}:{coverage:c},...l===void 0?{}:{coverageDepth:l},...s===void 0?{}:{secondaryReactivity:s},historyColor:u.previousColor,historyTemporal:u.previousTemporal,historyStability:u.previousStability,writeColor:u.currentColor,writeTemporal:u.currentTemporal,writeStability:u.currentStability},f=Ze(e.graph,d);return f.ok?o(u):f}function qo(e,t,n,r,i){return!n.features.exposure||i===void 0?o(void 0):io(e,{source:r,resources:i,width:t.surface.width,height:t.surface.height})}function Jo(e,t){return[{kind:`scene-color`,texture:e.texture,view:e.view,format:e.format,sampleCount:e.sampleCount},{kind:`scene-depth`,texture:t.texture,view:t.view,format:t.format,sampleCount:t.sampleCount}]}function Yo(e,t,n,r,i,a){if(t.clearOnly)return o(r);if(t.motionBlur)return Xo(e,t,n,r,i);let s=e.contributeFeatures({targets:n,semanticTargets:a===void 0?[]:[a],namedTargets:{},standardSurfaceAccesses:[],exclude:[$e]});return s.ok?o(r):s}function Xo(e,t,r,i,a){if(a===void 0)return n(Error(`Motion Blur requires the Standard scene-data producer`));let s=X(e,`motion-blurred-color`,{format:`rgba16float`,size:`surface`,domain:t.hdr?`linear-hdr`:`linear-ldr`});if(!s.ok)return s;let c=e.contributeFeatures({targets:r,semanticTargets:[a],namedTargets:{"motion-input":i,"motion-output":s.value},standardSurfaceAccesses:[],exclude:[$e]});if(!c.ok)return c;if(e.hasFeature?.(`forgeax.motion-blur`)!==!0){let t=ca(e.graph,i,a,s.value);if(!t.ok)return t}return o(s.value)}function Zo(e,t,n,r,i,a){let s=i;if(n.features.dof){let n=t.temporal?.taa===!0,i=Ri({graph:e.graph,camera:e.camera??{},temporalTaa:n,msaaActive:r.sampleCount===4,...t.extent===void 0?{}:{extent:t.extent}},s,r,n?a:void 0);if(!i.ok)return i;s=i.value}if(n.hdr&&n.features.bloom){let n=Qo(e,t,s);if(!n.ok)return n;s=n.value}if(n.hdr&&n.features.lensFlare){let n=oa(e.graph,s,{width:t.extent?.outputWidth??t.surface.width,height:t.extent?.outputHeight??t.surface.height});if(!n.ok)return n;s=n.value}return o(s)}function Qo(e,t,n){let r=Eo(t.extent?.outputWidth??t.surface.width,t.extent?.outputHeight??t.surface.height),i=X(e,r.composited.label,r.composited);if(!i.ok)return i;let a=$o(e,r.horizontal);if(!a.ok)return a;let s=$o(e,r.vertical);if(!s.ok)return s;let c=Fe(e.graph,{scene:n,composited:i.value,horizontal:a.value,vertical:s.value,levelDimensions:r.levels});return c.ok?o(i.value):c}function $o(e,t){let n=[];for(let r of t){let t=X(e,r.label,r);if(!t.ok)return t;n.push(t.value)}return o(n)}function es(e,t,n,r,i){if(!n.features.exposure&&!n.features.whiteBalance)return o(r);let a=X(e,`standard-exposure-white-balance`,{format:`rgba16float`,size:`surface`,domain:`linear-hdr`});if(!a.ok)return a;let s=so(e,r,a.value,n.features.exposure?i:void 0,{temperature:t.output?.temperature??6504,tint:t.output?.tint??0});return s.ok?o(a.value):s}function ts(e,t,n,r,i,a){let s=ns(e,t,i);if(!s.ok)return s;let c=s.value;if(t.features.lut){let n=rs(e,t,c,a);if(!n.ok)return n;c=n.value}if(t.features.outline){let t=ha(e.graph,c,n);if(!t.ok)return t;c=t.value}if(t.rawOnly||t.debugOverlayBeforePost){let t=Di(e.graph,c);if(!t.ok)return t}if(t.features.barrelDistortion){let t=is(e,r,c);if(!t.ok)return t;c=t.value}if(t.features.smaa){let t=Oa(e.graph,c);if(!t.ok)return t;c=t.value}return o(c)}function ns(e,t,n){let r=e.observationCaptureDomains?.includes(`linear-ldr`)===!0;if(t.fusedToneLut||!(t.splitOutput||r))return o(n);let i=X(e,`standard-tone-output`,{format:`rgba16float`,size:`surface`,domain:`linear-ldr`});if(!i.ok)return i;let a=I(e.graph,n,i.value,{dither:!1,name:`standard-tone`,fragmentEntryPoint:`fs_tone_only`});if(!a.ok)return a;if(t.splitOutput)return o(i.value);let s=tt(e.graph,i.value,`linear-ldr`);return s.ok?o(n):s}function rs(e,t,r,i){let a=e.standardOutput?.colorLut;if(a===void 0)return n(new z({code:`resource-resolution-failed`,expected:`a prepared resident Standard color LUT projection`,hint:`resolve and admit the TextureAsset LUT before compiling Standard output`,detail:{resourceLabel:`standard-color-lut`}}));if(t.fusedToneLut){let n=Co(e.graph,r,i,a,t.outputDither);return n.ok?o(i):n}let s=X(e,`standard-color-lut`,{format:`rgba16float`,size:`surface`,domain:`linear-ldr`});if(!s.ok)return s;let c=yo(e.graph,r,s.value,a);return c.ok?o(s.value):c}function is(e,t,r){let i=X(e,`standard-barrel-distortion`,{format:`rgba16float`,size:`surface`,domain:`linear-ldr`});if(!i.ok)return i;let a=e.contributeFeatures({targets:t,semanticTargets:[],namedTargets:{"barrel-input":r,"barrel-output":i.value},standardSurfaceAccesses:[],include:[$e]});return a.ok?e.hasFeature?.(`fullscreen.forgeax.barrel-distortion`)===!0?o(i.value):n(new A($e,0,`rgba16floatRenderable`)):a}function as(e,t,n,r){let i=t.splitOutput?X(e,`standard-fxaa-output`,{format:`rgba16float`,size:`surface`,domain:`linear-ldr`}):X(e,`standard-output-color`,{format:`rgba16float`,size:`surface`,usage:1,domain:`display-encoded`});if(!i.ok)return i;if(!t.splitOutput){let t=I(e.graph,n,i.value,{dither:!1});if(!t.ok)return t}let a=P(e.graph,{name:`fxaa`,shader:`fxaa`,input:t.splitOutput?n:i.value,outputs:[t.splitOutput?i.value:r],...t.splitOutput?{paramsTransform:()=>new Uint8Array(16)}:{}});return a.ok?o(t.splitOutput?i.value:n):a}function os(e,t,n,r,i){if(t.splitOutput)return o(n);let a=t.outputDither,s=i===void 0?I(e.graph,n,r,{dither:a}):I(e.graph,n,i,{dither:a&&t.postEffects.length===0});return s.ok?o(n):s}function ss(e,t){let n=X(e,`standard-lens-effects`,{format:`rgba16float`,size:`surface`,domain:`linear-ldr`});if(!n.ok)return n;let r=P(e.graph,{name:`lens-effects`,shader:Bi,input:t,outputs:[n.value]});return r.ok?o(n.value):r}function cs(e,t,n,r,i){let a=n;if(t.hdr||t.linearLdr||t.features.fxaa||t.rawOnly||t.motionBlur){let n=t.features.fxaa?as(e,t,a,i??r):os(e,t,a,r,i);if(!n.ok)return n;a=n.value}if(t.features.lensEffects){let t=ss(e,a);if(!t.ok)return t;a=t.value}if(t.splitOutput&&!t.fusedToneLut){let n=i??r,o=I(e.graph,a,n,{dither:t.outputDither,name:`standard-output-encoding`,fragmentEntryPoint:`fs_encode_only`,observationCaptureDomains:e.observationCaptureDomains?.filter(e=>e!==`final-display`)});if(!o.ok)return o;a=n}return o(a)}function ls(e,t,r,i,a,s){if(r.postEffects.length===0)return o(void 0);if(a===void 0)return n(new z({code:`resource-descriptor-invalid`,expected:`raw-only post effects have a graph-owned encoded input target`,hint:`retain the candidate LKG when the post-effect input target cannot be declared`,detail:{resourceLabel:`standard-post-effects-input`,field:`descriptor`,expected:`rgba16float display-encoded target`,actual:`absent`}}));let c=Ye(e.graph,r.postEffects,a,s,i,t.surface);return c.ok?o(void 0):c}function us(e,t,n,r,i){if(!t.rawOnly&&!t.debugOverlayBeforePost){let t=Di(e.graph,n.display??n.storage);if(!t.ok)return t}if(e.observationCaptureDomains?.includes(`final-display`)===!0){let t=tt(e.graph,r,`final-display`);if(!t.ok)return t}if(i!==void 0){let t=I(e.graph,r,n.storage,{name:`standard-observed-present`,fragmentEntryPoint:`fs_present`});if(!t.ok)return t}return o(void 0)}function ds(e,t,r,i,a,o,s,c,l){if(t.clearOnly===!0&&a.display===void 0)return Vo(e,r,a);let u=Fo(e,t),d=Bo(e,u.features);if(d!==void 0)return n(d);let f=Ho(e,u);if(!f.ok)return f;let p=Uo(e,t,u);if(!p.ok)return p;let m=p.value??a.storage,h=Wo(e,t,u.preTemporalEffects,r,i);if(!h.ok)return h;let g=h.value,_=o,v=Go(e,u);if(!v.ok)return v;if(t.camera.antialias===`taa`){let n=Ko(e,t,g,i,o,s,c,l);if(!n.ok)return n;g=n.value.currentColor,_=n.value.currentTemporal}let y=qo(e,t,u,g,v.value);if(!y.ok)return y;let b=Jo(r,i),x=Yo(e,u,b,g,_,o);if(!x.ok)return x;let S=Zo(e,t,u,i,x.value,_);if(!S.ok)return S;let C=es(e,t,u,S.value,v.value);if(!C.ok)return C;let w=ts(e,u,i,b,C.value,m);if(!w.ok)return w;let T=cs(e,u,w.value,m,f.value);if(!T.ok)return T;let E=ls(e,t,u,i,u.rawOnly?f.value:a.storage,m);return E.ok?us(e,u,a,m,p.value):E}function Z(e,t,n){return F(e,t,n)}function fs(e,t){let n=e.lane,r=e.subsurface===void 0?de:Ne,i=t?r.visibleSurface:r.surface;if(t&&(n.primitiveIndex!==!0||n.maxColorAttachments<7||(n.maxColorAttachmentBytesPerSample??0)<de.visibleSurface||e.camera.antialias===`msaa`))return new z({code:`resource-descriptor-invalid`,expected:`visible surfaces require primitive-index, seven targets, ${de.visibleSurface} attachment bytes and single sampling`,hint:`request these device features/limits before enabling visibleSurface`,detail:{resourceLabel:`visible-surface`,field:`capabilities`,expected:`primitive-index / 7 targets / ${de.visibleSurface} bytes / single sample`,actual:JSON.stringify(n)}});if(!n.storageBuffer||n.maxColorAttachments<Me.length)return new z({code:`resource-descriptor-invalid`,expected:`Standard deferred requires storage buffers and six color attachments`,hint:`select a device with deferred capabilities or explicitly select the Forward profile`,detail:{resourceLabel:`forgeax::standard`,field:`renderPath`,expected:`storage buffers and six MRTs`,actual:`storageBuffer=${n.storageBuffer}, maxColorAttachments=${n.maxColorAttachments}`}});if((n.maxColorAttachmentBytesPerSample??32)<i)return new z({code:`resource-descriptor-invalid`,expected:`Deferred attachments fit the device byte limit`,hint:`request at least ${i} bytes/sample for this Deferred profile`,detail:{resourceLabel:`subsurface-profile`,field:`capabilities`,expected:`${i} bytes/sample`,actual:String(n.maxColorAttachmentBytesPerSample)}})}function ps(e,t,n,r){let i=t.subsurface===void 0?Me:ye,a=Z(e,`hdrp-depth`,{format:`depth32float-stencil8`,size:n});if(!a.ok)return a;let s=e.view(a.value.texture,{label:`ssr-scene-depth`,dimension:`2d`,aspect:`depth-only`});if(!s.ok)return s;let c=Z(e,`gbuffer-normal-roughness`,{format:Me[1],size:n});if(!c.ok)return c;let l=Z(e,`gbuffer-albedo-metallic`,{format:Me[3],size:n});if(!l.ok)return l;let u=Z(e,`gbuffer-f0-occlusion`,{format:Me[2],size:n});if(!u.ok)return u;let d=Z(e,`gbuffer-lighting-context`,{format:i[4],size:n});if(!d.ok)return d;let f=Z(e,`gbuffer-receiver-geometry`,{format:Me[5],size:n});if(!f.ok)return f;let p=r?Z(e,`visible-surface`,{format:pe,size:n}):o(void 0);if(!p.ok)return p;let m=Z(e,`hdrp-scene-color`,{format:i[0],size:n});if(!m.ok)return m;let h=t.singleLayerMedium===!0?ms(e,m.value,n):o(void 0);if(!h.ok)return h;let g=hs(e,t,n);return g.ok?o({depth:a.value,depthSample:s.value,normalRoughness:c.value,albedoMetallic:l.value,f0Occlusion:u.value,lightingContext:d.value,receiverGeometry:f.value,visibleSurface:p.value,scene:m.value,medium:h.value,reflection:g.value}):g}function ms(e,t,n){let r=Z(e,`single-layer-medium-nearest-layer`,{format:t.format,size:n,sampleCount:1,domain:`linear-ldr`});if(!r.ok)return r;let i=Z(e,`single-layer-medium-nearest-depth`,{format:`depth32float-stencil8`,size:n,sampleCount:1});return i.ok?o({nearestLayer:r.value,nearestDepth:i.value}):i}function hs(e,t,n){let r=t.standardProfile?.diffuseGi;if(!(t.reflectionFallback?.enabled===!0||t.ssr?.status===`admitted`||r?.gather!==`baked`&&r?.reflections!==void 0))return o({fallback:void 0,response:void 0});let i=Z(e,`reflection-fallback-linear-hdr`,{format:`rgba16float`,size:n,domain:`linear-hdr`});if(!i.ok)return i;let a=Z(e,`deferred-specular-response`,{format:`rgba16float`,size:n});return a.ok?o({fallback:i.value,response:a.value}):a}function gs(e,t,n){let r=t.lane,i=Pt({taa:t.camera.antialias===`taa`,motionBlur:t.temporal?.motionBlur===!0,ssr:t.ssr?.status===`admitted`,visibleSurface:n}),a=It({demand:i,compute:r.compute,storageBuffer:r.storageBuffer,rgba16floatRenderable:e.capabilities?.rgba16floatRenderable??!1});if(!a.ok)return a;if(i.targetCount!==1)return o({targets:void 0,inGBuffer:!1});let s=Rt(e.graph,t.extent);if(!s.ok)return s;let c=t.subsurface===void 0?de:Ne,l=r.maxColorAttachments>=7+Number(n)&&(r.maxColorAttachmentBytesPerSample??0)>=(n?c.visibleSurfaceTemporal:c.temporal);return o({targets:s.value,inGBuffer:l})}function _s(e,t,n,r){let i=e.contributeShadowFeatures?.();return i!==void 0&&!i.ok?i:kr(e.graph,t,{projectGpuDrivenShadow:e.projectGpuDrivenShadow,shadowFeatures:i?.value,cameraPyramid:r,staticLayers:e.gpuDrivenShadowDepthLayers,depthLayers:e.shadowDepthLayers,reuseAdjacentShadow:n})}function vs(e,t){let n=wi(e,t);if(!n.ok||n.value===null)return n;let r=Ei(e,t,n.value);return r.ok?n:r}function ys(e,t,n,r){let i=e.hasFeatureRasterWork?.(Re,`scene`)===!0,a=Jr(e,i,{format:t.format,size:r,domain:`linear-hdr`});if(!a.ok)return a;let s=Yr(e,i);if(!s.ok)return s;let c=Xr(e,{color:t,depth:n,cloudShadow:s.value});return c.ok?o({cloudScene:a.value,cloudShadow:s.value,featureTargets:c.value}):c}function bs(e,t,n,r,i){if(t.atmosphere===!0)return jn(e,n,{directional:r,cloud:i?.view});let a=ze(e,n);return a.ok?o(void 0):a}function xs(e,t,n){return[e.scene,e.normalRoughness,e.f0Occlusion,e.albedoMetallic,e.lightingContext,e.receiverGeometry,...e.visibleSurface===void 0?[]:[e.visibleSurface],...n&&t!==void 0?[t.temporal]:[]]}function Ss(e,t,n,r,i){let a=t.visibleSurface!==void 0;return L(e,{name:`g-buffer`,color:t.scene,colorTargets:xs(t,n,r),colorLoadOp:[`load`,`clear`,`clear`,`clear`,`clear`,`clear`,...a?[`clear`]:[],...r?[`clear`]:[]],colorClearValues:[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],...a?[[0,0,0,0]]:[],...r?[[0,0,-1,1]]:[]],gpuDrivenFilter:`deferred-opaque`,...i===void 0?{}:{gpuDriven:i},depth:t.depth,selector:ae,recordMode:`opaque`,passKind:`deferred`,clearColor:[0,0,0,0]})}function Cs(e,t,n,r,i){return L(e,{name:`g-buffer-late`,color:t.scene,colorTargets:xs(t,n,r),colorLoadOp:[`load`,`load`,`load`,`load`,`load`,`load`,...t.visibleSurface===void 0?[]:[`load`],...r?[`load`]:[]],depthLoadOp:`load`,gpuDriven:i,gpuDrivenFilter:`deferred-opaque`,gpuDrivenPhase:`late`,depth:t.depth,selector:ae,recordMode:`opaque`,passKind:`deferred`})}function ws(e,t,n,r){let i=e.graph;if(n.visibleSurface!==void 0){let e=tt(i,n.visibleSurface,`visible-surface`);if(!e.ok)return e}let a=En(i,t.projectedDecals??[],{depth:n.depthSample,normal:n.normalRoughness,albedo:n.albedoMetallic,f0:n.f0Occlusion,size:r});if(!a.ok)return a;if(e.contributeProbePlacement!==void 0&&n.visibleSurface!==void 0){let t=e.contributeProbePlacement({depth:n.depthSample,normal:a.value.normal,identity:n.visibleSurface});if(!t.ok)return t}return a}function Ts(e,t,n,r,i){if(t.config?.ssao?.enabled!==!0)return o(void 0);let{resolutionScale:a}=h(t.config.ssao),s={width:Math.max(1,Math.round(n.width*a)),height:Math.max(1,Math.round(n.height*a))},c=Z(e,`ssao-raw`,{format:`rgba8unorm`,size:s});if(!c.ok)return c;let l=Z(e,`ssao-blurred`,{format:`r8unorm`,size:s});if(!l.ok)return l;let u=He(e,{normal:r,depth:i,raw:c.value,blurred:l.value});return u.ok?o(l.value):u}function Es(e,t,n,r,i,a,s){let c=t.subsurface===void 0?o(void 0):Z(e,`subsurface-diffuse`,{format:`rgba16float`,size:a});if(!c.ok)return c;let{shadows:l,cloudShadow:u,ssao:d,environment:f,clusters:p}=i,m=n.reflection,h=vi(e,{color:n.scene,...c.value===void 0?{}:{diffuse:c.value},gbuffer:[r.normal,r.albedo,r.f0,n.lightingContext],receiverGeometry:n.receiverGeometry,depth:n.depthSample,...m.fallback===void 0?{}:{reflectionFallback:m.fallback},...m.response===void 0?{}:{response:m.response},...d===void 0?{}:{ssao:d},...f===void 0?{}:{environment:f},...l.directional===void 0?{}:{directionalShadow:l.directional},spotShadow:l.spot,shadowMoments:l.moments,...u===void 0?{}:{cloudShadow:u},...l.point===void 0?{}:{pointShadow:l.point},cluster:p,extraAccesses:p===null?[]:Ti(p),size:s});return h.ok?c.value===void 0||t.subsurface===void 0?o(void 0):Bn(e,{scene:n.scene,diffuse:c.value,profiles:n.lightingContext.view,normal:r.normal.view,depth:n.depthSample,size:s,scale:[s.width/(t.extent?.outputWidth??t.surface.width),s.height/(t.extent?.outputHeight??t.surface.height)],quality:t.subsurface.quality}):h}function Ds(e,t,n,r,i,a){let s=e.graph,c=t.reflection,l=r.targets;if(l!==void 0){let e=zt(s,l.temporal,t.depth,i,r.inGBuffer?`forward-only-opaque`:`opaque`);if(!e.ok)return e}if(e.contributeDiffuseGi!==void 0&&t.visibleSurface!==void 0&&l!==void 0){let r=e.contributeDiffuseGi({scene:t.scene,depth:t.depthSample,normal:n.normal,albedo:n.albedo,f0:n.f0,identity:t.visibleSurface,motion:l.temporal,depthPyramid:()=>{let e=a.closestPyramid();return e.ok?o(e.value.pyramid.pyramid):e},...c.fallback===void 0||c.response===void 0?{}:{reflection:{fallback:c.fallback,response:c.response}}});if(!r.ok)return r}return e.targetCoverage===void 0?o(void 0):Wn(s,e.targetCoverage,i)}function Os(e,t,n,r,i,a,s){let c=t.ssr;if(c===void 0)return o(void 0);let l=c.status===`admitted`?s.sceneView():o(void 0);if(!l.ok)return l;let u=c.status===`admitted`?s.closestPyramid():o(void 0);if(!u.ok)return u;let d=e.ssrHistory,f=n.reflection.fallback,p=zn(e.graph,{admission:c,width:a.width,height:a.height,depth:n.depthSample,normal:r.view,scene:n.scene.view,...i===void 0?{}:{currentTemporal:i.temporal.view},...f===void 0?{}:{fallback:f.view},...i===void 0||d===void 0?{}:{temporal:{previousHistory:d.previous.view,outputHistory:d.output.view,previousSurface:d.previousSurface.view,outputSurface:d.outputSurface.view,params:d.params}},...l.value===void 0?{}:{view:l.value},...u.value===void 0?{}:{depthPyramid:u.value.pyramid}});return p.ok?ks(e.graph,n,r,p.value,l.value):p}function ks(e,t,n,r,i){let{fallback:a,response:s}=t.reflection,c=r.resources;if(c===void 0||a===void 0||i===void 0||s===void 0)return o(void 0);let l=r.reactivity,u=r.reactivitySurface,d=Mn(e,{scene:t.scene,radiance:c.radiancePyramid??c.trace.view,fallback:a.view,response:s.view,normal:n.view,view:i});return d.ok?o(l===void 0||u===void 0?void 0:{view:l,...u}):d}function As(e,t,n,r){let i=e.graph,{color:a,depth:s,environment:c,receiver:l,gpuDriven:u}=n,d=L(i,{environment:c,name:`forward`,color:a,depth:s,selector:_,colorLoadOp:`load`,depthLoadOp:`load`,...l,...u===void 0?{}:{gpuDriven:u},passKind:`forward`,excludeSelector:ae,recordMode:`opaque`,gpuDrivenFilter:`forward-only-opaque`});if(!d.ok)return d;let f=Wr(i,{topology:t,atmosphere:c?.atmosphere,color:a,depth:s});if(!f.ok)return f;if(r.cloudScene===void 0)return o(a);let p=Zr(e,r.featureTargets,{input:a,output:r.cloudScene,cloudShadow:r.cloudShadow},l.extraAccesses,c?.atmosphere);return p.ok?o(r.cloudScene):p}function js(e,t,n,r,i){let a=e.graph,{color:o,depth:s,environment:c,receiver:l}=n;if(r.needsBackPass===!0){let n=tr({graph:a,name:`transmission-backdrop-backs`,source:o,demand:r,copySize:i,surfaceSize:t.surface,encodeRoughMip:e.encodeTransmissionMip,includeConsumerPasses:!1});if(!n.ok)return n;let u=L(a,{environment:c,name:`transmission-backs`,color:o,depth:s,...l,selector:O,colorLoadOp:`load`,depthLoadOp:`load`,recordMode:`transmission`,transparentDepthWrite:!0,transmissionBackdrop:n.value.backdrop?.view});if(!u.ok)return u}return L(a,{environment:c,name:`transparent-before-transmission`,color:o,depth:s,...l,selector:_,colorLoadOp:`load`,depthLoadOp:`load`,recordMode:`translucent-before-transmission`,transparentDepthWrite:!0})}function Ms(e,t,n,r,i,a){let{color:o,depth:s,receiver:c,gpuDriven:l}=t,u=vn(n,r);if(!u.ok)return u;let d=gn({graph:e,sourceColor:o,sourceDepth:s,size:a});if(!d.ok)return d;let f={opaqueColor:u.value.backdrop,rawDepth:{status:`available`,view:d.value.view}};return yn({graph:e,size:a,...u.value.nearestTargets,color:o,depth:s,...c,extraAccesses:[...c.extraAccesses,...i===void 0?[]:[{resource:i,usage:`sampled-read`}]],surfacePair:f,...l===void 0?{}:{gpuDriven:l}})}function Ns(e,t,n,r){return Xe(e,{color:n.color,depth:n.depth,size:r,transparency:t.transparency,template:{environment:n.environment,...n.receiver,passKind:`forward`}})}function Ps(e,t,n,r,i,a){let s=e.graph,c=it(t),l=Ve(t),{transmissionActive:u,backdropActive:d}=r,f=r.sorted;if(f){let i=js(e,t,n,r.demand,l);if(!i.ok)return i}let p=tr({graph:s,source:n.color,demand:r.backdropDemand,copySize:l,surfaceSize:t.surface,encodeRoughMip:e.encodeTransmissionMip,includeConsumerPasses:!1});if(!p.ok)return p;let m=p.value.backdrop?.view;if(t.singleLayerMedium===!0){let e=Ms(s,n,i,m,a,c);if(!e.ok)return e}if(d){if(u){let e=L(s,{environment:n.environment,name:`transmission-forward`,color:n.color,depth:n.depth,selector:_,colorLoadOp:`load`,depthLoadOp:`load`,...n.receiver,passKind:`forward`,recordMode:f?`translucent`:`transmission`,transparentDepthWrite:!0,transmissionBackdrop:m});if(!e.ok)return e}if(!f){let e=Ns(s,t,n,c);if(!e.ok)return e}let e=nr(s,n.color);if(!e.ok)return e}return p.value.topology.active?o(void 0):Ns(s,t,n,c)}function Fs(e,t,n,r,i){let a=e.graph,{color:s,depth:c,environment:l,receiver:u}=n,d=Gr(a,{topology:t,atmosphere:l?.atmosphere,color:s,depth:c,directionalShadow:r.shadows.directional?.view,spotShadow:r.shadows.spot.view,clusterBuffers:r.clusters,cloudShadow:r.cloudShadow?.view});if(!d.ok)return d;let f=Po(e,{color:s,colorResolve:void 0,depth:c},bi(u),l?.atmosphere);if(!f.ok)return f;let p=nt(a,s);return p.ok?i?.sampleCount===1?Ue(a,i):o(void 0):p}function Is(e,t,n){let r=Kr(e),i;return{sceneView:r,closestPyramid:()=>{if(i!==void 0)return i;let a=r();return a.ok?(i=Ot(e,{depth:t,width:n.width,height:n.height,view:a.value}),i):a}}}function Ls(e,t,n){return t.atmosphere===!0?_s(e,t,n,void 0):o(void 0)}function Rs(e,t,n,r,i){return r===void 0?_s(e,t,n,i):o(r)}function zs(e,t,n){let r=n.reflection.fallback;return e.projectGpuDriven({format:n.scene.format,sampleCount:n.scene.sampleCount,lateOcclusion:t.config?.gpuOcclusion!==!1,...r===void 0?{}:{additionalColorFormats:[r.format]}})}function Bs(e,t,n,r,i,a){let o=Ss(e,t,n.targets,n.inGBuffer,r);if(!o.ok)return o;let s=qr(e,{gpuDriven:r,depth:t.depthSample,multisampled:t.depth.sampleCount>1,width:i.width,height:i.height,view:a.sceneView});if(!s.ok||s.value===void 0||r===void 0)return s;let c=Cs(e,t,n.targets,n.inGBuffer,r);return c.ok?s:c}function Vs(e,t){return e.contributeCubeCaptures===void 0?o(void 0):e.contributeCubeCaptures(t)}function Hs(e,t,n,r,i,a,o){let s=r.clusters,c={color:n.scene,depth:n.depth,environment:r.environment,receiver:yi({shadows:r.shadows,cloudShadow:r.cloudShadow,ssao:r.ssao,clusterReads:s===null?[]:Ti(s)}),gpuDriven:a},l=As(e,t,c,i);if(!l.ok)return l;let u={...c,color:l.value},d=Ps(e,t,u,Kn(t,n.scene.sampleCount),n.medium,o);if(!d.ok)return d;let f=Fs(e,t,u,r,n.reflection.fallback);return f.ok?l:f}function Us(e,t,r,i=!1){let a=t.standardProfile?.visibleSurface===!0,o=fs(t,a);if(o!==void 0)return n(o);let s=e.graph,c=xe(s,t);if(!c.ok)return c;let l=it(t),u=Ve(t),d=vs(s,r);if(!d.ok)return d;let f=Ls(e,t,i);if(!f.ok)return f;let p=ps(s,t,l,a);if(!p.ok)return p;let{scene:m,depth:h}=p.value,g=gs(e,t,a);if(!g.ok)return g;let _=zs(e,t,p.value);if(!_.ok)return _;let v=ys(e,m,h,l);if(!v.ok)return v;let y=bs(s,t,m,f.value?.directional?.view,v.value.cloudShadow);if(!y.ok)return y;let b=Is(s,p.value.depthSample,u),x=Bs(s,p.value,g.value,_.value,u,b);if(!x.ok)return x;let S=Rs(e,t,i,f.value,x.value);if(!S.ok)return S;let C=ws(e,t,p.value,l);if(!C.ok)return C;let w=Ts(s,t,u,C.value.normal,h);if(!w.ok)return w;let T=Vs(e,y.value);if(!T.ok)return T;let E={shadows:S.value,cloudShadow:v.value.cloudShadow,ssao:w.value,environment:y.value,clusters:d.value},D=Es(s,t,p.value,C.value,E,l,u);if(!D.ok)return D;let O=Ds(e,p.value,C.value,g.value,_.value,b);if(!O.ok)return O;let k=Os(e,t,p.value,C.value.normal,g.value.targets,u,b);if(!k.ok)return k;let A=Hs(e,t,p.value,E,v.value,_.value,T.value);return A.ok?ds(e,t,A.value,h,c.value,g.value.targets?.temporal,k.value,e.targetCoverage?.coverage,e.targetCoverage?.depth):A}function Q(e,t,n){return F(e,t,n)}function Ws(e){return{color:e.color,depth:e.depth,...e.msaa?{resolve:e.resolved}:{}}}function Gs(e,t){return t===e.surface.storageFormat&&e.surface.storageFormat!==e.surface.viewFormat?{viewFormats:[e.surface.viewFormat]}:{}}function Ks(e,t,n,r,i){let a=e.graph,s=Q(a,`scene-depth`,{format:`depth32float-stencil8`,size:i,sampleCount:r?4:1});if(!s.ok)return s;let c=e.forwardOutput?.format??`rgba16float`,l=e.forwardOutput?.domain??`linear-ldr`,u=t.clearOnly===!0?qs(a,t,n):Q(a,`scene-color`,{format:c,size:i,sampleCount:1,domain:l,...Gs(t,c)});if(!u.ok)return u;let d=r?Q(a,`scene-color-msaa`,{format:c,size:i,sampleCount:4,domain:l,...Gs(t,c)}):u;return d.ok?o({color:d.value,resolved:u.value,depth:s.value,msaa:r}):d}function qs(e,t,n){return n.display===void 0?Q(e,`scene-color`,{format:t.surface.storageFormat,size:`surface`,sampleCount:1,domain:`display-encoded`}):o(n.display)}function Js(e,t,n,r){if(t.singleLayerMedium!==!0)return o(void 0);let i=n.msaa?4:1,a=Q(e.graph,`single-layer-medium-nearest-layer`,{format:n.color.format,size:r,sampleCount:i,domain:e.forwardOutput?.domain??`linear-ldr`});if(!a.ok)return a;let s=Q(e.graph,`single-layer-medium-nearest-depth`,{format:`depth32float-stencil8`,size:r,sampleCount:i});return s.ok?o({nearestLayer:a.value,nearestDepth:s.value}):s}function Ys(e,t,n,r){if(!t.reflectionFallback?.enabled)return o(void 0);let i=Q(e,`reflection-fallback-linear-hdr`,{format:`rgba16float`,size:r,sampleCount:n.color.sampleCount,domain:`linear-hdr`,usage:21});if(!i.ok)return i;let a=e.addRasterPass(`reflection-fallback-clear`,{accesses:[{resource:i.value.view,usage:`color-attachment`}],colorAttachments:[{view:i.value.view,loadOp:`clear`,storeOp:`store`,clearValue:{r:0,g:0,b:0,a:0}}],encode:()=>{}});return a.ok?i:a}function Xs(e,t,n){let r=e.contributeShadowFeatures?.();return r!==void 0&&!r.ok?r:kr(e.graph,t,{projectGpuDrivenShadow:e.projectGpuDrivenShadow,shadowFeatures:r?.value,staticLayers:e.gpuDrivenShadowDepthLayers,depthLayers:e.shadowDepthLayers,reuseAdjacentShadow:n})}function Zs(e,t,n){if(n)return o(null);let r=wi(e,t);if(!r.ok||r.value===null)return r;let i=Ei(e,t,r.value);return i.ok?r:i}function Qs(e,t,n){if(t.atmosphere===!0)return jn(e,n);let r=ze(e,n);return r.ok?o(void 0):r}function $s(e,t,n,r){return e.projectGpuDriven({format:n.format,sampleCount:n.sampleCount,lateOcclusion:t.config?.gpuOcclusion!==!1,...r===void 0?{}:{additionalColorFormats:[r.format]}})}function ec(e,t,n,r,i){let a=L(e,t);if(!a.ok)return a;let s=e.view(n.depth.texture,{label:`occlusion-scene-depth`,dimension:`2d`,aspect:`depth-only`});if(!s.ok)return s;let c=qr(e,{gpuDriven:r,depth:s.value,multisampled:n.msaa,width:i.width,height:i.height,view:Kr(e)});if(!c.ok)return c;if(c.value===void 0)return o(void 0);let l=L(e,{...t,name:`main-late`,depthLoadOp:`load`,gpuDrivenPhase:`late`});return l.ok?o(void 0):l}function tc(e,t,n,r,i){let a=e.graph,s=It({demand:n,compute:t.lane.compute,storageBuffer:t.lane.storageBuffer,rgba16floatRenderable:e.capabilities?.rgba16floatRenderable??!1});if(!s.ok)return s;let c;if(n.targetCount===1){let e=Rt(a,t.extent);if(!e.ok)return e;c=e.value.temporal;let n=zt(a,c,r,i);if(!n.ok)return n}if(e.targetCoverage!==void 0){let t=Wn(a,e.targetCoverage,i);if(!t.ok)return t}return o(c)}function nc(e,t,n,r,i){let a=e.graph;if(i.needsBackPass===!0){let o=tr({graph:a,name:`transmission-backdrop-backs`,source:n.resolved,demand:i,copySize:Ve(t),surfaceSize:t.surface,encodeRoughMip:e.encodeTransmissionMip,includeConsumerPasses:!1});if(!o.ok)return o;let s=L(a,{...r,name:`transmission-backs`,...Ws(n),selector:O,colorLoadOp:`load`,depthLoadOp:`load`,recordMode:`transmission`,transparentDepthWrite:!0,transmissionBackdrop:o.value.backdrop?.view});if(!s.ok)return s}let s=L(a,{...r,name:`transparent-before-transmission`,...Ws(n),selector:_,colorLoadOp:`load`,depthLoadOp:`load`,recordMode:`translucent-before-transmission`,transparentDepthWrite:!0});return s.ok?o(void 0):s}function rc(e,t,n,r,i,a){let o=vn(r.nearestTargets,i);if(!o.ok)return o;let s=it(t),c=r.opaquePair?.depth;if(c===void 0){let t=gn({graph:e,sourceColor:n.resolved,sourceDepth:n.depth,size:s});if(!t.ok)return t;c=t.value}let l={opaqueColor:r.opaquePair?.color.view??o.value.backdrop,rawDepth:{status:`available`,view:c.view}};return yn({graph:e,size:s,...o.value.nearestTargets,color:n.color,...n.msaa?{colorResolve:n.resolved}:{},depth:n.depth,...a,extraAccesses:[...a.extraAccesses,...r.targetCaptures===void 0?[]:[{resource:r.targetCaptures,usage:`sampled-read`}]],surfacePair:l,...r.gpuDriven===void 0?{}:{gpuDriven:r.gpuDriven}})}function ic(e,t,n,r,i,a){let s=e.graph,c=Wr(s,{topology:t,color:n.resolved,depth:n.depth});if(!c.ok)return c;let l=Kn(t,n.color.sampleCount),u={environment:r,...i};if(l.sorted){let r=nc(e,t,n,u,l.demand);if(!r.ok)return r}let d=tr({graph:s,source:n.resolved,demand:l.backdropDemand,copySize:Ve(t),surfaceSize:t.surface,encodeRoughMip:e.encodeTransmissionMip,includeConsumerPasses:!1});if(!d.ok)return d;let f=d.value.backdrop?.view;if(t.singleLayerMedium===!0){let e=rc(s,t,n,a,f,i);if(!e.ok)return e}if(l.backdropActive&&l.transmissionActive){let e=L(s,{...u,name:`transmission-forward`,...Ws(n),selector:_,colorLoadOp:`load`,depthLoadOp:`load`,recordMode:l.sorted?`translucent`:`transmission`,transparentDepthWrite:!0,transmissionBackdrop:f});if(!e.ok)return e}if(!l.sorted){let e=Xe(s,{color:n.color,...n.msaa?{resolve:n.resolved}:{},depth:n.depth,size:it(t),transparency:t.transparency,template:u});if(!e.ok)return e}if(l.backdropActive){let e=nr(s,n.resolved);if(!e.ok)return e}return o(void 0)}function ac(e){let t=e.clearOnly===!0,n=e.camera;return{clearOnly:t,msaa:!t&&n.antialias===`msaa`&&e.lane.multisample,hdr:!t&&(n.tonemap!==`none`||n.antialias===`taa`),temporalDemand:Pt({taa:!t&&n.antialias===`taa`,motionBlur:!t&&e.temporal?.motionBlur===!0})}}function oc(e,t,n,r,i,a){let s=e.graph,c=ec(s,r,n,i,Ve(t));if(!c.ok)return c;let l=t.singleLayerMedium===!0&&n.msaa?_n({graph:s,label:`single-layer-medium-opaque-resolve`,sourceColor:n.color,sourceDepth:n.depth,size:it(t)}):o(void 0);if(!l.ok)return l;if(a.scene!==void 0){let t=Zr(e,a.featureTargets,{input:n.resolved,output:a.scene,cloudShadow:a.shadow},[]);if(!t.ok)return t}return l}function sc(e,t){return t===void 0?e:{...e,color:t,resolved:t}}function cc(e,t,n,r){let i=e.hasFeatureRasterWork?.(Re,`scene`)===!0,a=Jr(e,i&&!n.msaa,{format:t.resolved.format,size:r,domain:n.hdr?`linear-hdr`:`linear-ldr`});if(!a.ok)return a;let s=Yr(e,i);return s.ok?o({scene:a.value,shadow:s.value}):s}function lc(e,t,n,r,i){return{environment:t,name:`main`,color:e.color,...r===void 0?{}:{colorTargets:[e.color,r]},depth:e.depth,...e.msaa?{resolve:e.resolved}:{},...n,selector:_,colorLoadOp:`load`,recordMode:`opaque`,gpuDrivenFilter:`opaque`,...i===void 0?{}:{gpuDriven:i}}}function uc(e,t,n,r=!1){let i=e.graph,a=xe(i,t);if(!a.ok)return a;let o=it(t),s=ac(t),c=Ks(e,t,a.value,s.msaa,o);if(!c.ok)return c;let l=Js(e,t,c.value,o);if(!l.ok)return l;let u=Ys(i,t,c.value,o);if(!u.ok)return u;let d=Xs(e,t,r);if(!d.ok)return d;let f=Zs(i,n,s.clearOnly);if(!f.ok)return f;let p=Qs(i,t,c.value.color);if(!p.ok)return p;let m=$s(e,t,c.value.color,u.value);if(!m.ok)return m;let h=cc(e,c.value,s,o);if(!h.ok)return h;let g=e.contributeCubeCaptures?.(p.value);if(g!==void 0&&!g.ok)return g;let _=Xr(e,{color:c.value.resolved,depth:c.value.depth,cloudShadow:h.value.shadow});if(!_.ok)return _;let v=yi({shadows:d.value,cloudShadow:h.value.shadow,clusterReads:f.value===null?[]:Ti(f.value)}),y=lc(c.value,p.value,v,u.value,m.value),b=oc(e,t,c.value,y,m.value,{scene:h.value.scene,shadow:h.value.shadow,featureTargets:_.value});if(!b.ok)return b;let x=tc(e,t,s.temporalDemand,c.value.depth,m.value);if(!x.ok)return x;let S=sc(c.value,h.value.scene),C=ic(e,t,S,p.value,v,{nearestTargets:l.value,opaquePair:b.value,targetCaptures:g?.value,gpuDriven:m.value});if(!C.ok)return C;let w=Gr(i,{topology:t,color:S.resolved,depth:S.depth,directionalShadow:d.value.directional?.view,spotShadow:d.value.spot.view,clusterBuffers:f.value,cloudShadow:h.value.shadow?.view});if(!w.ok)return w;let T=dc(e,t,S,v,u.value);return T.ok?fc(e,t,S,a.value,x.value):T}function dc(e,t,n,r,i){let a=e.graph,s=Po(e,{color:n.color,colorResolve:n.msaa?n.resolved.view:void 0,depth:n.depth},bi(r));if(!s.ok)return s;if(e.forwardOutput===void 0&&t.clearOnly!==!0){let e=nt(a,n.resolved);if(!e.ok)return e}if(i?.sampleCount===1){let e=Ue(a,i);if(!e.ok)return e}return o(void 0)}function fc(e,t,n,r,i){if(e.forwardOutput!==void 0)return e.forwardOutput.build(e,t,n.resolved,n.depth,r);let a=ds(e,t,n.resolved,n.depth,r,i,void 0,e.targetCoverage?.coverage,e.targetCoverage?.depth);return a.ok?o(void 0):a}function pc(e){return e===void 0?`missing`:e.kind===`no-local-lights`?`no-local-lights`:JSON.stringify({kind:e.kind,transport:e.transport.kind,producer:e.transport.producer,grid:e.prepared.layout.grid,clusterGridU32Length:e.prepared.layout.clusterGridU32Length,lightIndexListCapacity:e.prepared.layout.lightIndexListCapacity,lightDataSlotCount:e.prepared.layout.lightDataSlotCount,lightBoundsInt32Length:e.prepared.layout.lightBoundsInt32Length})}function $(e){return n({code:`topology-input-invalid`,expected:`prepared Standard lighting topology input`,hint:`derive topology from prepared Standard lighting`,detail:{field:e}})}function mc(e){let t=e;if(`lights`in t)return $(`lights`);if(`capabilities`in t)return $(`capabilities`);if(typeof e!=`object`||!e)return $(`kind`);if(e.prepared===null||typeof e.prepared!=`object`)return $(`prepared`);let n=e.prepared;if(e.kind===`no-local-lights`)return n.local.length!==0||`transport`in t?$(`transport`):o(e);if(e.kind!==`clustered`)return $(`kind`);if(!(`transport`in t)||t.transport===null||typeof t.transport!=`object`)return $(`transport`);let r=e.transport,i=n.local.length,a=r.layout===n.layout&&r.requestedLightCount===i&&r.admittedLightCount===i&&r.membershipEntryCount===n.membershipEntryCount&&r.lightBoundsBytes===n.lightBounds.byteLength,s=r.producer===`gpu`&&r.kind===`compute-storage`||r.producer===`cpu`&&(r.kind===`cpu-storage`||r.kind===`cpu-texture`);return!a||!s?$(`transport`):o(e)}var hc=`
struct ClusterUniform {
  grid : vec4<u32>,
  near_far_log : vec4<f32>,
};

@group(0) @binding(0) var<storage, read> cluster_grid : array<u32>;
@group(0) @binding(1) var<storage, read_write> light_index_list : array<u32>;
@group(0) @binding(2) var<uniform> cluster_uniform : ClusterUniform;
@group(0) @binding(3) var<storage, read> light_bounds : array<i32>;

@compute @workgroup_size(64)
fn cs_cluster_membership(@builtin(global_invocation_id) global_id : vec3<u32>) {
  let cluster_index = global_id.x;
  let grid_x = cluster_uniform.grid.x;
  let grid_y = cluster_uniform.grid.y;
  let grid_z = cluster_uniform.grid.z;
  let cluster_count = grid_x * grid_y * grid_z;
  if (cluster_index >= cluster_count) {
    return;
  }

  let cluster_x = cluster_index % grid_x;
  let cluster_yz = cluster_index / grid_x;
  let cluster_y = cluster_yz % grid_y;
  let cluster_z = cluster_yz / grid_y;
  let grid_offset = cluster_index * 2u;
  let output_offset = cluster_grid[grid_offset];
  let output_count = cluster_grid[grid_offset + 1u];
  let cluster_x_i = i32(cluster_x);
  let cluster_y_i = i32(cluster_y);
  let cluster_z_i = i32(cluster_z);
  var output_index = output_offset;

  var light_index = 0u;
  loop {
    if (light_index >= cluster_uniform.grid.w || light_index >= 256u) {
      break;
    }
    let bounds_offset = light_index * 6u;
    let min_x = light_bounds[bounds_offset];
    if (min_x >= 0) {
      let min_y = light_bounds[bounds_offset + 1u];
      let min_z = light_bounds[bounds_offset + 2u];
      let max_x = light_bounds[bounds_offset + 3u];
      let max_y = light_bounds[bounds_offset + 4u];
      let max_z = light_bounds[bounds_offset + 5u];
      if (
        cluster_x_i >= min_x && cluster_x_i <= max_x &&
        cluster_y_i >= min_y && cluster_y_i <= max_y &&
        cluster_z_i >= min_z && cluster_z_i <= max_z
      ) {
        if (output_index < output_offset + output_count) {
          light_index_list[output_index] = light_index;
          output_index += 1u;
        }
      }
    }
    light_index += 1u;
  }
}
`;function gc(e){let{x:t,y:r,z:i}=e;return Number.isInteger(t)&&Number.isInteger(r)&&Number.isInteger(i)&&t>=1&&t<=64&&r>=1&&r<=64&&i>=1&&i<=64?o({x:t,y:r,z:i}):n(new C(`clusterGrid {x:${t}, y:${r}, z:${i}} is invalid; set x, y, and z to positive integers in [1, 64]`,{field:`clusterGrid`,actual:{x:t,y:r,z:i}}))}function _c(e){return e.standardProfile??ot}function vc(e){let t=e.standardLighting;if(t!==void 0){let e=mc(t);return e.ok?e:n(new z({code:`resource-descriptor-invalid`,expected:`Forward/Deferred consume one prepared Standard topology input`,hint:e.error.hint,detail:{resourceLabel:`forgeax::standard`,field:`standardLighting.${e.error.detail.field}`,expected:e.error.expected,actual:`invalid`}}))}return n(new z({code:`resource-descriptor-invalid`,expected:`RenderPipelineBuildContext.standardLighting from frame preparation`,hint:`prepare Standard lighting once, select a proven Cluster transport, and pass it to both lanes`,detail:{resourceLabel:`forgeax::standard`,field:`standardLighting`,expected:`prepared Standard lighting topology input`,actual:`invalid`}}))}function yc(e,t){let n={...e.config??{},ssao:{...e.config?.ssao??{},...typeof t.ssao==`object`?t.ssao:{},enabled:t.ssao!==!1}};return{...e,pipelineId:Se,standardProfile:t,config:n}}function bc(e,t,r=!1){let i=e,a=_c(t);if(!_e.some(e=>e===a.lightCount))return n(new z({code:`resource-descriptor-invalid`,expected:`StandardProfile.lightCount is one of 1, 32, or 256`,hint:`set StandardProfile.lightCount to 1, 32, or 256`,detail:{resourceLabel:`forgeax::standard`,field:`lightCount`,expected:`1 | 32 | 256`,actual:a.lightCount}}));if((t.projectedDecals?.length??0)>0&&(a.renderPath!==`deferred`||t.camera.antialias===`msaa`))throw new M(`renderPath`,`Standard Deferred with single-sample depth`);let o=yc(t,a),s=vc(e);return s.ok?o.clearOnly===!0||a.renderPath===`forward`?uc(i,o,s.value,r):Us(i,o,s.value,r):s}var xc=Object.freeze({identity:Se,build:bc});export{xc as $,Gt as A,ia as B,na as C,Un as D,Pa as E,ei as F,xn as G,fn as H,Mo as I,to as J,bn as K,qt as L,Yn as M,no as N,zi as O,wi as P,pc as Q,wa as R,Hi as S,Ca as T,Jn as U,_o as V,Mr as W,or as X,go as Y,Ti as Z,bc as _,Bi as a,kn as b,hn as c,$n as d,gc as et,Wt as f,Vr as g,kr as h,Ni as i,Kt as j,Ii as k,pn as l,Ei as m,qa as n,Nt as nt,ta as o,jn as p,qn as q,Pi as r,mn as s,Br as t,eo as tt,hc as u,di as v,pa as w,$a as x,An as y,Ui as z};