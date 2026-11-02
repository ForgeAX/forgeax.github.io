import{t as e}from"./program-group-2a8e41bc58c54452-D2D1sqPP.js";import{i as t,n,r,t as i}from"./program-group-44cb0d4c6c27887d-BSiPHXSf.js";import{O as a}from"./program-group-55dd75a7eff12825-BnFETuGK.js";import{i as o}from"./program-group-bcc061e5de30e302-Beqcfr9U.js";import{f as s}from"./program-group-25a772bc59287f6c-BUHp_qqi.js";import{A as c}from"./program-group-2887c02b2f3964a5-yb_MuU4a.js";import{n as l,r as u}from"./program-group-aaf64718d5f7a3a2-DZL-8ol7.js";import{d,g as f,m as p,u as m}from"./program-group-348124dc5bd63ce1-CL8kWycF.js";import{c as h,r as g}from"./program-group-991e278e0bd52e78-Bx9MN6U0.js";import{k as _}from"./program-group-9b62e74e69f309de-BScBPyj3.js";import{b as v,c as y,d as b,i as x,l as S,m as C,n as w,o as T,p as E,r as D,s as O,t as ee,w as k}from"./program-group-869e68660562e1d1-DmTrdQ10.js";import{n as te,r as ne}from"./program-group-ff4c6ae40002d5d7-BLwotFSt.js";var A=Math.min,j=Math.max,M=Math.round,N=Math.floor,P=e=>({x:e,y:e}),re={left:`right`,right:`left`,bottom:`top`,top:`bottom`};function ie(e,t,n){return j(e,A(t,n))}function F(e,t){return typeof e==`function`?e(t):e}function I(e){return e.split(`-`)[0]}function L(e){return e.split(`-`)[1]}function ae(e){return e===`x`?`y`:`x`}function oe(e){return e===`y`?`height`:`width`}function R(e){let t=e[0];return t===`t`||t===`b`?`y`:`x`}function se(e){return ae(R(e))}function z(e,t,n){n===void 0&&(n=!1);let r=L(e),i=se(e),a=oe(i),o=i===`x`?r===(n?`end`:`start`)?`right`:`left`:r===`start`?`bottom`:`top`;return t.reference[a]>t.floating[a]&&(o=V(o)),[o,V(o)]}function ce(e){let t=V(e);return[le(e),t,le(t)]}function le(e){return e.includes(`start`)?e.replace(`start`,`end`):e.replace(`end`,`start`)}var ue=[`left`,`right`],de=[`right`,`left`],fe=[`top`,`bottom`],pe=[`bottom`,`top`];function me(e,t,n){switch(e){case`top`:case`bottom`:return n?t?de:ue:t?ue:de;case`left`:case`right`:return t?fe:pe;default:return[]}}function B(e,t,n,r){let i=L(e),a=me(I(e),n===`start`,r);return i&&(a=a.map(e=>e+`-`+i),t&&(a=a.concat(a.map(le)))),a}function V(e){let t=I(e);return re[t]+e.slice(t.length)}function he(e){return{top:e.top??0,right:e.right??0,bottom:e.bottom??0,left:e.left??0}}function H(e){return typeof e==`number`?{top:e,right:e,bottom:e,left:e}:he(e)}function U(e){let{x:t,y:n,width:r,height:i}=e;return{width:r,height:i,top:n,left:t,right:t+r,bottom:n+i,x:t,y:n}}function ge(e,t,n){let{reference:r,floating:i}=e,a=R(t),o=se(t),s=oe(o),c=I(t),l=a===`y`,u=r.x+r.width/2-i.width/2,d=r.y+r.height/2-i.height/2,f=r[s]/2-i[s]/2,p;switch(c){case`top`:p={x:u,y:r.y-i.height};break;case`bottom`:p={x:u,y:r.y+r.height};break;case`right`:p={x:r.x+r.width,y:d};break;case`left`:p={x:r.x-i.width,y:d};break;default:p={x:r.x,y:r.y}}let m=L(t);return m&&(p[o]+=f*(m===`end`?1:-1)*(n&&l?-1:1)),p}async function _e(e,t){t===void 0&&(t={});let{x:n,y:r,platform:i,rects:a,elements:o,strategy:s}=e,{boundary:c=`clippingAncestors`,rootBoundary:l=`viewport`,elementContext:u=`floating`,altBoundary:d=!1,padding:f=0}=F(t,e),p=H(f),m=o[d?u===`floating`?`reference`:`floating`:u],h=U(await i.getClippingRect({element:await(i.isElement==null?void 0:i.isElement(m))??!0?m:m.contextElement||await(i.getDocumentElement==null?void 0:i.getDocumentElement(o.floating)),boundary:c,rootBoundary:l,strategy:s})),g=u===`floating`?{x:n,y:r,width:a.floating.width,height:a.floating.height}:a.reference,_=await(i.getOffsetParent==null?void 0:i.getOffsetParent(o.floating)),v=await(i.isElement==null?void 0:i.isElement(_))&&await(i.getScale==null?void 0:i.getScale(_))||{x:1,y:1},y=U(i.convertOffsetParentRelativeRectToViewportRelativeRect?await i.convertOffsetParentRelativeRectToViewportRelativeRect({elements:o,rect:g,offsetParent:_,strategy:s}):g);return{top:(h.top-y.top+p.top)/v.y,bottom:(y.bottom-h.bottom+p.bottom)/v.y,left:(h.left-y.left+p.left)/v.x,right:(y.right-h.right+p.right)/v.x}}var ve=50,ye=async(e,t,n)=>{let{placement:r=`bottom`,strategy:i=`absolute`,middleware:a=[],platform:o}=n,s=o.detectOverflow?o:{...o,detectOverflow:_e},c=await(o.isRTL==null?void 0:o.isRTL(t)),l=await o.getElementRects({reference:e,floating:t,strategy:i}),{x:u,y:d}=ge(l,r,c),f=r,p=0,m={};for(let n=0;n<a.length;n++){let h=a[n];if(!h)continue;let{name:g,fn:_}=h,{x:v,y,data:b,reset:x}=await _({x:u,y:d,initialPlacement:r,placement:f,strategy:i,middlewareData:m,rects:l,platform:s,elements:{reference:e,floating:t}});u=v??u,d=y??d,m[g]={...m[g],...b},x&&p<ve&&(p++,typeof x==`object`&&(x.placement&&(f=x.placement),x.rects&&(l=x.rects===!0?await o.getElementRects({reference:e,floating:t,strategy:i}):x.rects),{x:u,y:d}=ge(l,f,c)),n=-1)}return{x:u,y:d,placement:f,strategy:i,middlewareData:m}},be=function(e){return e===void 0&&(e={}),{name:`flip`,options:e,async fn(t){var n;let{placement:r,middlewareData:i,rects:a,initialPlacement:o,platform:s,elements:c}=t,{mainAxis:l=!0,crossAxis:u=!0,fallbackPlacements:d,fallbackStrategy:f=`bestFit`,fallbackAxisSideDirection:p=`none`,flipAlignment:m=!0,...h}=F(e,t);if((n=i.arrow)!=null&&n.alignmentOffset)return{};let g=I(r),_=R(o),v=I(o)===o,y=await(s.isRTL==null?void 0:s.isRTL(c.floating)),b=d||(v||!m?[V(o)]:ce(o)),x=p!==`none`;!d&&x&&b.push(...B(o,m,p,y));let S=[o,...b],C=await s.detectOverflow(t,h),w=[],T=i.flip?.overflows||[];if(l&&w.push(C[g]),u){let e=z(r,a,y);w.push(C[e[0]],C[e[1]])}if(T=[...T,{placement:r,overflows:w}],!w.every(e=>e<=0)){let e=(i.flip?.index||0)+1,t=S[e];if(t&&(u!==`alignment`||_===R(t)||T.every(e=>R(e.placement)!==_||e.overflows[0]>0)))return{data:{index:e,overflows:T},reset:{placement:t}};let n=T.filter(e=>e.overflows[0]<=0).sort((e,t)=>e.overflows[1]-t.overflows[1])[0]?.placement;if(!n)switch(f){case`bestFit`:{let e=T.filter(e=>{if(x){let t=R(e.placement);return t===_||t===`y`}return!0}).map(e=>[e.placement,e.overflows.filter(e=>e>0).reduce((e,t)=>e+t,0)]).sort((e,t)=>e[1]-t[1])[0]?.[0];e&&(n=e);break}case`initialPlacement`:n=o}if(r!==n)return{reset:{placement:n}}}return{}}}},xe=new Set([`left`,`top`]);async function Se(e,t){let{placement:n,platform:r,elements:i}=e,a=await(r.isRTL==null?void 0:r.isRTL(i.floating)),o=I(n),s=L(n),c=R(n)===`y`,l=xe.has(o)?-1:1,u=a&&c?-1:1,d=F(t,e),{mainAxis:f,crossAxis:p,alignmentAxis:m}=typeof d==`number`?{mainAxis:d,crossAxis:0,alignmentAxis:null}:{mainAxis:d.mainAxis||0,crossAxis:d.crossAxis||0,alignmentAxis:d.alignmentAxis};return s&&typeof m==`number`&&(p=s===`end`?m*-1:m),c?{x:p*u,y:f*l}:{x:f*l,y:p*u}}var Ce=function(e){return e===void 0&&(e=0),{name:`offset`,options:e,async fn(t){var n;let{x:r,y:i,placement:a,middlewareData:o}=t,s=await Se(t,e);return a===o.offset?.placement&&(n=o.arrow)!=null&&n.alignmentOffset?{}:{x:r+s.x,y:i+s.y,data:{...s,placement:a}}}}},we=function(e){return e===void 0&&(e={}),{name:`shift`,options:e,async fn(t){let{x:n,y:r,placement:i,platform:a}=t,{mainAxis:o=!0,crossAxis:s=!1,limiter:c={fn:e=>{let{x:t,y:n}=e;return{x:t,y:n}}},...l}=F(e,t),u={x:n,y:r},d=await a.detectOverflow(t,l),f=R(i),p=ae(f),m=u[p],h=u[f],g=(e,t)=>ie(t+d[e===`y`?`top`:`left`],t,t-d[e===`y`?`bottom`:`right`]);o&&(m=g(p,m)),s&&(h=g(f,h));let _=c.fn({...t,[p]:m,[f]:h});return{..._,data:{x:_.x-n,y:_.y-r,enabled:{[p]:o,[f]:s}}}}}},Te=function(e){return e===void 0&&(e={}),{name:`size`,options:e,async fn(t){let{placement:n,rects:r,platform:i,elements:a}=t,{apply:o=()=>{},...s}=F(e,t),c=await i.detectOverflow(t,s),l=I(n),u=L(n),d=R(n)===`y`,{width:f,height:p}=r.floating,m,h;l===`top`||l===`bottom`?(m=l,h=u===(await(i.isRTL==null?void 0:i.isRTL(a.floating))?`start`:`end`)?`left`:`right`):(h=l,m=u===`end`?`top`:`bottom`);let g=p-c.top-c.bottom,_=f-c.left-c.right,v=A(p-c[m],g),y=A(f-c[h],_),b=t.middlewareData.shift,x=!b,S=v,C=y;b!=null&&b.enabled.x&&(C=_),b!=null&&b.enabled.y&&(S=g),x&&!u&&(d?C=f-2*j(c.left,c.right):S=p-2*j(c.top,c.bottom)),await o({...t,availableWidth:C,availableHeight:S});let w=await i.getDimensions(a.floating);return f!==w.width||p!==w.height?{reset:{rects:!0}}:{}}}};function Ee(){return typeof window<`u`}function W(e){return De(e)?(e.nodeName||``).toLowerCase():`#document`}function G(e){var t;return(e==null||(t=e.ownerDocument)==null?void 0:t.defaultView)||window}function K(e){return((De(e)?e.ownerDocument:e.document)||window.document)?.documentElement}function De(e){return Ee()?e instanceof Node||e instanceof G(e).Node:!1}function q(e){return Ee()?e instanceof Element||e instanceof G(e).Element:!1}function J(e){return Ee()?e instanceof HTMLElement||e instanceof G(e).HTMLElement:!1}function Oe(e){return!Ee()||typeof ShadowRoot>`u`?!1:e instanceof ShadowRoot||e instanceof G(e).ShadowRoot}function ke(e){let{overflow:t,overflowX:n,overflowY:r,display:i}=X(e);return/auto|scroll|overlay|hidden|clip/.test(t+r+n)&&i!==`inline`&&i!==`contents`}function Ae(e){return/^(table|td|th)$/.test(W(e))}function je(e){try{if(e.matches(`:popover-open`))return!0}catch{}try{return e.matches(`:modal`)}catch{return!1}}var Me=/transform|translate|scale|rotate|perspective|filter/,Ne=/paint|layout|strict|content/,Y=e=>!!e&&e!==`none`,Pe;function Fe(e){let t=q(e)?X(e):e;return Y(t.transform)||Y(t.translate)||Y(t.scale)||Y(t.rotate)||Y(t.perspective)||!Le()&&(Y(t.backdropFilter)||Y(t.filter))||Me.test(t.willChange||``)||Ne.test(t.contain||``)}function Ie(e){let t=Z(e);for(;J(t)&&!Re(t);){if(Fe(t))return t;if(je(t))return null;t=Z(t)}return null}function Le(){return Pe??=typeof CSS<`u`&&CSS.supports&&CSS.supports(`-webkit-backdrop-filter`,`none`),Pe}function Re(e){return/^(html|body|#document)$/.test(W(e))}function X(e){return G(e).getComputedStyle(e)}function ze(e){return q(e)?{scrollLeft:e.scrollLeft,scrollTop:e.scrollTop}:{scrollLeft:e.scrollX,scrollTop:e.scrollY}}function Z(e){if(W(e)===`html`)return e;let t=e.assignedSlot||e.parentNode||Oe(e)&&e.host||K(e);return Oe(t)?t.host:t}function Be(e){let t=Z(e);return Re(t)?(e.ownerDocument||e).body:J(t)&&ke(t)?t:Be(t)}function Ve(e,t,n){t===void 0&&(t=[]),n===void 0&&(n=!0);let r=Be(e),i=r===e.ownerDocument?.body,a=G(r);if(i){let e=He(a);return t.concat(a,a.visualViewport||[],ke(r)?r:[],e&&n?Ve(e):[])}return t.concat(r,Ve(r,[],n))}function He(e){return e.parent&&Object.getPrototypeOf(e.parent)?e.frameElement:null}function Ue(e){let t=X(e),n=parseFloat(t.width)||0,r=parseFloat(t.height)||0,i=J(e),a=i?e.offsetWidth:n,o=i?e.offsetHeight:r,s=M(n)!==a||M(r)!==o;return s&&(n=a,r=o),{width:n,height:r,$:s}}function We(e){return q(e)?e:e.contextElement}function Ge(e){let t=We(e);if(!J(t))return P(1);let n=t.getBoundingClientRect(),{width:r,height:i,$:a}=Ue(t),o=(a?M(n.width):n.width)/r,s=(a?M(n.height):n.height)/i;return o&&Number.isFinite(o)||(o=1),s&&Number.isFinite(s)||(s=1),{x:o,y:s}}var Ke=P(0);function qe(e){let t=G(e);return!Le()||!t.visualViewport?Ke:{x:t.visualViewport.offsetLeft,y:t.visualViewport.offsetTop}}function Je(e,t,n){return t===void 0&&(t=!1),!n||t&&n!==G(e)?!1:t}function Q(e,t,n,r){t===void 0&&(t=!1),n===void 0&&(n=!1);let i=e.getBoundingClientRect(),a=We(e),o=P(1);t&&(r?q(r)&&(o=Ge(r)):o=Ge(e));let s=Je(a,n,r)?qe(a):P(0),c=(i.left+s.x)/o.x,l=(i.top+s.y)/o.y,u=i.width/o.x,d=i.height/o.y;if(a){let e=G(a),t=r&&q(r)?G(r):r,n=e,i=He(n);for(;i&&r&&t!==n;){let e=Ge(i),t=i.getBoundingClientRect(),r=X(i),a=t.left+(i.clientLeft+parseFloat(r.paddingLeft))*e.x,o=t.top+(i.clientTop+parseFloat(r.paddingTop))*e.y;c*=e.x,l*=e.y,u*=e.x,d*=e.y,c+=a,l+=o,n=G(i),i=He(n)}}return U({width:u,height:d,x:c,y:l})}function Ye(e,t){let n=ze(e).scrollLeft;return t?t.left+n:Q(K(e)).left+n}function Xe(e,t){let n=e.getBoundingClientRect();return{x:n.left+t.scrollLeft-Ye(e,n),y:n.top+t.scrollTop}}function Ze(e){let{elements:t,rect:n,offsetParent:r,strategy:i}=e,a=i===`fixed`,o=K(r),s=t?je(t.floating):!1;if(r===o||s&&a)return n;let c={scrollLeft:0,scrollTop:0},l=P(1),u=P(0),d=J(r);if((d||!d&&!a)&&((W(r)!==`body`||ke(o))&&(c=ze(r)),d)){let e=Q(r);l=Ge(r),u.x=e.x+r.clientLeft,u.y=e.y+r.clientTop}let f=o&&!d&&!a?Xe(o,c):P(0);return{width:n.width*l.x,height:n.height*l.y,x:n.x*l.x-c.scrollLeft*l.x+u.x+f.x,y:n.y*l.y-c.scrollTop*l.y+u.y+f.y}}function Qe(e){return Array.from(e.getClientRects())}function $e(e){let t=K(e),n=ze(e),r=e.ownerDocument.body,i=j(t.scrollWidth,t.clientWidth,r.scrollWidth,r.clientWidth),a=j(t.scrollHeight,t.clientHeight,r.scrollHeight,r.clientHeight),o=-n.scrollLeft+Ye(e),s=-n.scrollTop;return X(r).direction===`rtl`&&(o+=j(t.clientWidth,r.clientWidth)-i),{width:i,height:a,x:o,y:s}}var et=25;function tt(e,t){let n=G(e),r=K(e),i=n.visualViewport,a=r.clientWidth,o=r.clientHeight,s=0,c=0;if(i){a=i.width,o=i.height;let e=Le();(!e||e&&t===`fixed`)&&(s=i.offsetLeft,c=i.offsetTop)}let l=Ye(r);if(l<=0){let e=r.ownerDocument,t=e.body,n=getComputedStyle(t),i=e.compatMode===`CSS1Compat`&&parseFloat(n.marginLeft)+parseFloat(n.marginRight)||0,o=Math.abs(r.clientWidth-t.clientWidth-i);o<=et&&(a-=o)}else l<=et&&(a+=l);return{width:a,height:o,x:s,y:c}}function nt(e,t){let n=Q(e,!0,t===`fixed`),r=n.top+e.clientTop,i=n.left+e.clientLeft,a=J(e)?Ge(e):P(1);return{width:e.clientWidth*a.x,height:e.clientHeight*a.y,x:i*a.x,y:r*a.y}}function rt(e,t,n){let r;if(t===`viewport`)r=tt(e,n);else if(t===`document`)r=$e(K(e));else if(q(t))r=nt(t,n);else{let n=qe(e);r={x:t.x-n.x,y:t.y-n.y,width:t.width,height:t.height}}return U(r)}function it(e,t){let n=Z(e);return n===t||!q(n)||Re(n)?!1:X(n).position===`fixed`||it(n,t)}function at(e,t){let n=t.get(e);if(n)return n;let r=Ve(e,[],!1).filter(e=>q(e)&&W(e)!==`body`),i=null,a=X(e).position===`fixed`,o=a?Z(e):e;for(;q(o)&&!Re(o);){let t=X(o),n=Fe(o);!n&&t.position===`fixed`&&(i=null),(a?!n&&!i:!n&&t.position===`static`&&i&&(i.position===`absolute`||i.position===`fixed`)||ke(o)&&!n&&it(e,o))?r=r.filter(e=>e!==o):i=t,o=Z(o)}return t.set(e,r),r}function ot(e){let{element:t,boundary:n,rootBoundary:r,strategy:i}=e,a=[...n===`clippingAncestors`?je(t)?[]:at(t,this._c):[].concat(n),r],o=rt(t,a[0],i),s=o.top,c=o.right,l=o.bottom,u=o.left;for(let e=1;e<a.length;e++){let n=rt(t,a[e],i);s=j(n.top,s),c=A(n.right,c),l=A(n.bottom,l),u=j(n.left,u)}return{width:c-u,height:l-s,x:u,y:s}}function st(e){let{width:t,height:n}=Ue(e);return{width:t,height:n}}function ct(e,t,n){let r=J(t),i=K(t),a=n===`fixed`,o=Q(e,!0,a,t),s={scrollLeft:0,scrollTop:0},c=P(0);function l(){c.x=Ye(i)}if(r||!r&&!a){if((W(t)!==`body`||ke(i))&&(s=ze(t)),r){let e=Q(t,!0,a,t);c.x=e.x+t.clientLeft,c.y=e.y+t.clientTop}else i&&l()}a&&!r&&i&&l();let u=i&&!r&&!a?Xe(i,s):P(0);return{x:o.left+s.scrollLeft-c.x-u.x,y:o.top+s.scrollTop-c.y-u.y,width:o.width,height:o.height}}function lt(e){return X(e).position===`static`}function ut(e,t){if(!J(e)||X(e).position===`fixed`)return null;if(t)return t(e);let n=e.offsetParent;return K(e)===n&&(n=n.ownerDocument.body),n}function dt(e,t){let n=G(e);if(je(e))return n;if(!J(e)){let t=Z(e);for(;t&&!Re(t);){if(q(t)&&!lt(t))return t;t=Z(t)}return n}let r=ut(e,t);for(;r&&Ae(r)&&lt(r);)r=ut(r,t);return r&&Re(r)&&lt(r)&&!Fe(r)?n:r||Ie(e)||n}var ft=async function(e){let t=this.getOffsetParent||dt,n=this.getDimensions,r=await n(e.floating);return{reference:ct(e.reference,await t(e.floating),e.strategy),floating:{x:0,y:0,width:r.width,height:r.height}}};function pt(e){return X(e).direction===`rtl`}var mt={convertOffsetParentRelativeRectToViewportRelativeRect:Ze,getDocumentElement:K,getClippingRect:ot,getOffsetParent:dt,getElementRects:ft,getClientRects:Qe,getDimensions:st,getScale:Ge,isElement:q,isRTL:pt};function ht(e,t){return e.x===t.x&&e.y===t.y&&e.width===t.width&&e.height===t.height}function gt(e,t){let n=null,r,i=K(e);function a(){var e;clearTimeout(r),(e=n)==null||e.disconnect(),n=null}function o(s,c){s===void 0&&(s=!1),c===void 0&&(c=1),a();let l=e.getBoundingClientRect(),{left:u,top:d,width:f,height:p}=l;if(s||t(),!f||!p)return;let m=N(d),h=N(i.clientWidth-(u+f)),g=N(i.clientHeight-(d+p)),_=N(u),v={rootMargin:-m+`px `+-h+`px `+-g+`px `+-_+`px`,threshold:j(0,A(1,c))||1},y=!0;function b(t){let n=t[0].intersectionRatio;if(n!==c){if(!y)return o();n?o(!1,n):r=setTimeout(()=>{o(!1,1e-7)},1e3)}n===1&&!ht(l,e.getBoundingClientRect())&&o(),y=!1}try{n=new IntersectionObserver(b,{...v,root:i.ownerDocument})}catch{n=new IntersectionObserver(b,v)}n.observe(e)}return o(!0),a}function _t(e,t,n,r){r===void 0&&(r={});let{ancestorScroll:i=!0,ancestorResize:a=!0,elementResize:o=typeof ResizeObserver==`function`,layoutShift:s=typeof IntersectionObserver==`function`,animationFrame:c=!1}=r,l=We(e),u=i||a?[...l?Ve(l):[],...t?Ve(t):[]]:[];u.forEach(e=>{i&&e.addEventListener(`scroll`,n,{passive:!0}),a&&e.addEventListener(`resize`,n)});let d=l&&s?gt(l,n):null,f=-1,p=null;o&&(p=new ResizeObserver(e=>{let[r]=e;r&&r.target===l&&p&&t&&(p.unobserve(t),cancelAnimationFrame(f),f=requestAnimationFrame(()=>{var e;(e=p)==null||e.observe(t)})),n()}),l&&!c&&p.observe(l),t&&p.observe(t));let m,h=c?Q(e):null;c&&g();function g(){let t=Q(e);h&&!ht(h,t)&&n(),h=t,m=requestAnimationFrame(g)}return n(),()=>{var e;u.forEach(e=>{i&&e.removeEventListener(`scroll`,n),a&&e.removeEventListener(`resize`,n)}),d?.(),(e=p)==null||e.disconnect(),p=null,c&&cancelAnimationFrame(m)}}var vt=Ce,yt=we,bt=be,xt=Te,St=(e,t,n)=>{let r=new Map,i={platform:mt,...n},a={...i.platform,_c:r};return ye(e,t,{...i,platform:a})},Ct=new WeakMap;function wt(e,t,n={}){let r=e.ownerDocument,i=Ct.get(r)??new Set;Ct.set(r,i);let a=e.getRootNode(),o=a===r?void 0:new Set([...a.querySelectorAll(`[id]`)].map(e=>e.id));a.nodeType===1&&o?.add(a.id);let s=n.id??`arsenal-detail-hint`,c=s,l=1;for(;i.has(c)||r.getElementById(c)||o?.has(c);)c=`${s}-${l++}`;i.add(c);let u=r.createElement(`aside`);u.className=`item-detail-hint`,u.id=c,u.setAttribute(`role`,`tooltip`),u.hidden=!0,e.append(u);let d=null,f,p=0,m,h=!1,g=!1,_=!1,v=!1,y,b=e=>{let t=u.querySelector(`[data-description-fold]`),n=t?.open??!1,i=t?.contains(r.activeElement),a=r.defaultView?.__uiI18n;u.replaceChildren(k(r,e,a?.lang===`en`?e=>a.tr(e):void 0)),y=e;let o=u.querySelector(`[data-description-fold]`);o&&(o.open=n,i&&o.querySelector(`summary`)?.focus({preventScroll:!0})),u.dataset.rich=String(!!o),u.setAttribute(`role`,o?`dialog`:`tooltip`),o?u.setAttribute(`aria-label`,a?.lang===`en`?a.tr(`属性说明`):`属性说明`):u.removeAttribute(`aria-label`),clearTimeout(m)},x=()=>{d&&y!==void 0&&(b(d.dataset.detail??``),w())},S=()=>{d&&w()},C=()=>{if(clearTimeout(m),++p,f?.(),f=void 0,d){let e=(d.getAttribute(`aria-describedby`)??``).split(/\s+/).filter(e=>e&&e!==c);e.length?d.setAttribute(`aria-describedby`,e.join(` `)):d.removeAttribute(`aria-describedby`)}d?.hasAttribute(`data-detail-pin`)&&d.setAttribute(`aria-expanded`,`false`),d=null,y=void 0,u.hidden=!0,g=!1,_=!1,delete u.dataset.pinned},w=async()=>{let t=d,r=++p;if(!t?.isConnected||t.closest(`[hidden]`)){C();return}let i=y!==void 0&&!t.hasAttribute(`data-detail-pin`)?t.closest(`[data-affix-sockets]`):null,a=await St(i?{contextElement:t,getBoundingClientRect(){let e=t.getBoundingClientRect(),n=i.getBoundingClientRect();return{x:n.x,left:n.left,right:n.right,width:n.width,y:e.y,top:e.top,bottom:e.bottom,height:e.height}}}:t,u,{placement:n.placement??`right-start`,strategy:`absolute`,middleware:[vt(10),bt({boundary:e,padding:10}),yt({boundary:e,padding:10,crossAxis:!0}),xt({boundary:e,padding:10,apply({availableHeight:t}){u.style.maxHeight=`${Math.max(60,Math.min(e.clientHeight-20,t))}px`}})]});r===p&&d===t&&(u.style.left=`${a.x}px`,u.style.top=`${a.y}px`)},T=(e,r=!1)=>{if(clearTimeout(m),v||n.enabled?.()===!1){C();return}if(!e.dataset.detail)return;if(d===e){r&&(_=!0);return}C(),d=e,_=r;let i=t?.(e);u.dataset.rich=String(!!i),u.setAttribute(`role`,i?`dialog`:`tooltip`),i?u.setAttribute(`aria-label`,e.hasAttribute(`data-stack-detail`)?`叠放物品明细`:`属性说明`):u.removeAttribute(`aria-label`),i?u.replaceChildren(i):b(e.dataset.detail),u.hidden=!1,u.scrollTop=0,u.dataset.section=e.hasAttribute(`data-detail-pin`)?`true`:`false`;let a=new Set((e.getAttribute(`aria-describedby`)??``).split(/\s+/).filter(Boolean));a.add(c),e.setAttribute(`aria-describedby`,[...a].join(` `)),f=_t(e,u,()=>{w()})},E=e=>e instanceof Element?e.closest(`[data-detail]`):null,D=t=>{if(t.type===`pointerover`&&t.pointerType===`touch`||t.type===`focusin`&&h&&e.dataset.inputDevice!==`gamepad`)return;let n=E(t.target);!g&&n&&e.contains(n)&&T(n)},O=e=>{if(g||_&&e.type===`focusout`||u.contains(r.activeElement)||e.type===`pointerout`&&e.pointerType===`touch`)return;let t=e.relatedTarget;t instanceof Node&&(d?.contains(t)||u.contains(t))||(clearTimeout(m),m=setTimeout(C,130))},ee=e=>{let t=h;h=!1;let r=t||e.detail>0?n.restorePointerFocus:void 0;if(n.enabled?.()===!1){C();return}if(e.target instanceof Element&&e.target.closest(`[data-dismiss-detail]`)){r?r():d?.focus({preventScroll:!0}),C();return}let i=E(e.target);if(i){if(i.hasAttribute(`data-detail-pin`)){if(d===i&&g){C(),r?.();return}r||i.focus({preventScroll:!0}),T(i,!!r),r?.(),clearTimeout(m),g=!0,u.dataset.pinned=`true`,i.setAttribute(`aria-expanded`,`true`);return}if(t&&d===i&&!u.hidden){C(),r?.();return}r||i.focus({preventScroll:!0}),T(i,!!r),r?.()}else e.target instanceof Node&&!u.contains(e.target)&&C()},te=()=>{clearTimeout(m)},ne=e=>{h=e.pointerType===`touch`,n.restorePointerFocus&&n.enabled?.()!==!1&&e.pointerType===`mouse`&&e.button===0&&E(e.target)&&e.preventDefault()},A=()=>{h=!1},j=e=>{!_||e.target instanceof Node&&u.contains(e.target)||e.type!==`keydown`&&e.target instanceof Node&&d?.contains(e.target)||C()},M=e=>{if(u.hidden||u.dataset.rich!==`true`)return!1;let t=u.scrollTop;return u.scrollTop+=e,u.scrollTop!==t},N=e=>{let t=E(e.target);if(t?.hasAttribute(`data-detail-pin`)&&[`Enter`,` `].includes(e.key)){e.preventDefault(),e.stopPropagation(),t.click();return}if(e.target!==d||![`ArrowDown`,`ArrowUp`,`PageDown`,`PageUp`].includes(e.key))return;let n=(e.key.endsWith(`Down`)?1:-1)*(e.key.startsWith(`Page`)?u.clientHeight*.8:64);M(n)&&(e.preventDefault(),e.stopPropagation())};return e.addEventListener(`pointerdown`,ne,!0),r.addEventListener(`pointerdown`,j,!0),r.addEventListener(`keydown`,j,!0),e.addEventListener(`pointercancel`,A),e.addEventListener(`keydown`,A,!0),e.addEventListener(`keydown`,N),e.addEventListener(`pointerover`,D),e.addEventListener(`pointerout`,O),e.addEventListener(`focusin`,D),e.addEventListener(`focusout`,O),e.addEventListener(`click`,ee),u.addEventListener(`pointerenter`,te),u.addEventListener(`pointerleave`,O),u.addEventListener(`toggle`,S,!0),r.addEventListener(`ui-languagechange`,x),{hide:C,show:T,scroll:M,dismiss(){let e=!u.hidden;return C(),e},refresh(){n.enabled?.()===!1||d&&(!d.isConnected||d.closest(`[hidden]`))?C():d&&y!==void 0&&y!==d.dataset.detail&&(b(d.dataset.detail??``),w())},dispose(){v||(v=!0,e.removeEventListener(`pointerdown`,ne,!0),r.removeEventListener(`pointerdown`,j,!0),r.removeEventListener(`keydown`,j,!0),e.removeEventListener(`pointercancel`,A),e.removeEventListener(`keydown`,A,!0),e.removeEventListener(`keydown`,N),r.removeEventListener(`ui-languagechange`,x),u.removeEventListener(`toggle`,S,!0),C(),e.removeEventListener(`pointerover`,D),e.removeEventListener(`pointerout`,O),e.removeEventListener(`focusin`,D),e.removeEventListener(`focusout`,O),e.removeEventListener(`click`,ee),u.remove(),i.delete(c))}}}var Tt=`
.item-detail-hint{position:absolute;z-index:65;width:min(292px,calc(100% - 20px));box-sizing:border-box;padding:12px 14px;border:1px solid var(--ui-card-line);background:var(--ui-card-surface);color:var(--ui-card-text);box-shadow:0 8px 24px #061113bb;font:12px/1.65 var(--ui-font-body);white-space:pre-line;overflow:auto;overscroll-behavior:contain;pointer-events:auto}
.item-detail-hint[hidden]{display:none}
.item-detail-hint[data-section=true]{width:min(380px,calc(100% - 20px))}
[data-detail]:focus-visible{outline:1px solid var(--ui-jade);outline-offset:2px}
[data-detail]{cursor:help}
`;function Et(e,t){let n,r=!1,i=!1,a=()=>{clearTimeout(n),n=void 0},o=()=>{a(),i=!1,r=!1},s=a=>{o(),r=a.pointerType===`touch`,r&&(n=setTimeout(()=>{n=void 0,e.isConnected&&(i=t())},400))},c=t=>{a(),queueMicrotask(()=>{r=!1}),i&&(i=!1,t.preventDefault(),t.stopImmediatePropagation(),e.blur())};return e.addEventListener(`pointerdown`,s),e.addEventListener(`pointerup`,a),e.addEventListener(`pointerleave`,a),e.addEventListener(`pointercancel`,o),e.addEventListener(`keydown`,o),e.addEventListener(`click`,c,!0),{get touchActive(){return r},dispose(){o(),e.removeEventListener(`pointerdown`,s),e.removeEventListener(`pointerup`,a),e.removeEventListener(`pointerleave`,a),e.removeEventListener(`pointercancel`,o),e.removeEventListener(`keydown`,o),e.removeEventListener(`click`,c,!0)}}}var Dt=String.raw`
.spirit-gym-hud__resource-orb{
  --orb-color:var(--ui-health);--orb-light:var(--ui-health-light);--orb-deep:var(--ui-health-deep);--orb-flow:var(--ui-blood-flow);
  position:absolute;bottom:var(--hud-tray-bottom);left:calc(50% - var(--hud-tray-width)/2 - var(--hud-orb-size) - 20px);
  width:var(--hud-orb-size);height:var(--hud-orb-size);padding:0;margin:0;border:3px solid var(--ui-recessed);border-radius:50%;
  background:var(--ui-recessed);box-shadow:0 5px 18px #0009,0 0 0 1px var(--ui-bronze);pointer-events:none
}
.spirit-gym-hud__resource-orb--qi{
  --orb-color:var(--ui-qi);--orb-light:var(--ui-qi-light);--orb-deep:var(--ui-qi-deep);--orb-flow:var(--ui-qi-flow);
  left:auto;right:calc(50% - var(--hud-tray-width)/2 - var(--hud-orb-size) - 20px)
}
.spirit-gym-hud__resource-orb::before{content:"";position:absolute;inset:-10px;background:var(--ui-motif-disc) center/contain no-repeat;pointer-events:none;opacity:.86}
/* The glass stays still: narrow Fresnel rim, curved softbox reflection and a
   smaller opposing glint. Dark edge absorption gives the shell visible thickness. */
.spirit-gym-hud__resource-orb::after{
  content:"";position:absolute;inset:0;z-index:3;border-radius:50%;pointer-events:none;
  background:
    radial-gradient(ellipse 20% 8% at 32% 15%,#fffdf0d9 5%,#fffdf070 38%,#fffdf000 76%),
    radial-gradient(ellipse 7% 19% at 13% 32%,#e8fff578,transparent 78%),
    radial-gradient(ellipse 3% 10% at 87% 67%,#c7f8f69c,transparent 82%),
    radial-gradient(ellipse 25% 8% at 63% 88%,#b7e5d961,transparent 80%),
    radial-gradient(circle at 50% 50%,transparent 59%,#04171c66 72%,#dbf6e95c 77%,#05222bdd 81%);
  box-shadow:inset 0 1px 1px #f0fff6b3,inset 2px 0 3px #d3fff338,inset -2px -3px 4px #010d14b3
}
.spirit-gym-hud__orb-well{
  position:absolute;inset:0;overflow:hidden;isolation:isolate;border-radius:50%;
  background:radial-gradient(ellipse at 38% 28%,#405753,#15292e 48%,#061319 82%)
}
.spirit-gym-hud__orb-well::before{
  content:"";position:absolute;inset:8% 17% 47% 10%;z-index:3;pointer-events:none;
  border-radius:50%;border-top:1px solid #effff1a6;transform:rotate(-27deg);
  background:linear-gradient(180deg,#e5ffed26,transparent 62%)
}
.spirit-gym-hud__orb-well::after{
  content:"";position:absolute;inset:0;z-index:2;border-radius:50%;pointer-events:none;
  background:radial-gradient(ellipse at 40% 35%,transparent 35%,#03101538 61%,#010c16b3 94%),
    linear-gradient(125deg,#e5f3d31a,transparent 38%,#03131a33 72%,transparent);
  box-shadow:inset 0 -5px 9px #03101699
}
.spirit-gym-hud__orb-liquid{
  position:absolute;inset:0;width:100%;height:100%;overflow:hidden;isolation:isolate;
  transform:translateY(calc((1 - var(--resource-ratio,1)) * 100%));transform-origin:bottom;
  transition:transform var(--ui-feedback) ease-out;
  background:radial-gradient(ellipse at 42% 28%,var(--orb-color) 16%,var(--orb-deep) 82%);
  box-shadow:inset 0 3px 6px color-mix(in srgb,var(--orb-light) 48%,transparent)
}
/* Meniscus stays on the resource plane. Movement cannot draw liquid above the
   authoritative clip, including at zero; the far edge is softer than the near lip. */
.spirit-gym-hud__orb-liquid::before{
  content:"";position:absolute;z-index:2;left:-20%;top:-3%;width:140%;height:10%;border-radius:50%;
  background:radial-gradient(ellipse at 50% 0%,var(--orb-deep),var(--orb-color) 55%,var(--orb-light) 74%,transparent 81%);
  box-shadow:0 1px 1px color-mix(in srgb,var(--orb-light) 55%,transparent);
  animation:spirit-orb-meniscus var(--ui-liquid-wave) ease-in-out infinite alternate
}
.spirit-gym-hud__orb-current{
  position:absolute;inset:-30%;border-radius:42%;pointer-events:none;
  background:
    radial-gradient(ellipse 33% 17% at 39% 43%,transparent 52%,color-mix(in srgb,var(--orb-light) 34%,transparent) 58%,transparent 65%),
    radial-gradient(ellipse 30% 13% at 36% 42%,transparent 37%,color-mix(in srgb,var(--orb-light) 70%,transparent) 58%,transparent 83%),
    radial-gradient(ellipse 23% 36% at 67% 60%,transparent 32%,color-mix(in srgb,var(--orb-color) 80%,transparent) 63%,transparent 82%),
    radial-gradient(ellipse 24% 18% at 38% 69%,color-mix(in srgb,var(--orb-light) 65%,transparent),transparent 76%);
  opacity:.74;animation:spirit-orb-current var(--orb-flow) linear infinite
}
.spirit-gym-hud__orb-current--rear{
  background:
    radial-gradient(ellipse 35% 20% at 62% 46%,transparent 30%,var(--orb-deep) 58%,transparent 83%),
    radial-gradient(ellipse 29% 15% at 42% 63%,transparent 32%,color-mix(in srgb,var(--orb-light) 78%,transparent) 61%,transparent 85%);
  opacity:.56;animation-duration:calc(var(--orb-flow) * 1.37);animation-direction:reverse;animation-delay:-5s
}
.spirit-gym-hud__resource-orb--qi .spirit-gym-hud__orb-current{opacity:.9}
.spirit-gym-hud__resource-orb--qi .spirit-gym-hud__orb-current--rear{opacity:.68}
.spirit-gym-hud__orb-rune{position:absolute;inset:0;z-index:2;display:grid;place-items:center;font:25px var(--ui-font-title);color:#fff8;text-shadow:0 1px 3px #031019,0 0 7px #04181aaa;pointer-events:none}
.spirit-gym-hud__resource-orb strong{position:absolute;bottom:calc(100% + 13px);left:50%;transform:translateX(-50%);white-space:nowrap;font:12px/1.3 var(--ui-font-number);color:var(--ui-text);padding:1px 7px;background:linear-gradient(90deg,transparent,var(--ui-panel),transparent)}
.spirit-gym-hud__resource-orb.is-low strong{color:var(--orb-light)}
@keyframes spirit-orb-current{
  0%{transform:translate(-2%,1%) rotate(0deg)}
  33%{transform:translate(3%,-2%) rotate(120deg)}
  66%{transform:translate(-1%,3%) rotate(240deg)}
  100%{transform:translate(-2%,1%) rotate(360deg)}
}
@keyframes spirit-orb-meniscus{from{transform:translateX(-3%) rotate(-1.5deg)}to{transform:translateX(3%) rotate(1.5deg)}}
[data-game-menu-open=true] .spirit-gym-hud__orb-current,
[data-game-menu-open=true] .spirit-gym-hud__orb-liquid::before{animation-play-state:paused}
@media(prefers-reduced-motion:reduce){
  .spirit-gym-hud__orb-current,.spirit-gym-hud__orb-liquid::before{animation:none}
  .spirit-gym-hud__orb-current--rear{transform:rotate(125deg)}
  .spirit-gym-hud__orb-liquid{transition:none}
}
`,Ot=Dt+`
.play-hud .play-hud-orb,.play-hud .play-hud-orb *{box-sizing:border-box}
.play-hud .play-hud-orb{position:relative;inset:auto;flex:none}
.play-hud .play-hud-orb::before{inset:-5px}
.play-hud .play-hud-orb > .ui-art__content{inset:18% 4%;z-index:4;gap:5px}
.play-hud .play-hud-orb-char{font:calc(var(--hud-orb-size)*.27)/1 var(--ui-font-title);color:#fff9;text-shadow:0 1px 3px #031019,0 0 7px #04181aaa}
.play-hud .play-hud-orb strong{position:static;transform:none;padding:0;background:none;white-space:nowrap;font:clamp(10px,calc(var(--hud-orb-size)*.14),13px)/1.2 var(--ui-font-number);color:var(--ui-text);text-shadow:0 1px 3px #031019,0 0 4px #031019;letter-spacing:0}
.play-hud .play-hud-orb.is-low strong{color:var(--orb-light)}
`,kt=String.raw`
.spirit-gym-hud__weapon-vitals{
  --qi-angle:0deg;--weapon-vitals-size:30px;--ring-color:var(--weapon-accent,var(--ui-bronze));
  position:relative;display:grid;place-items:center;isolation:isolate;
  flex:none;width:var(--weapon-vitals-size);height:var(--weapon-vitals-size);aspect-ratio:1;
  border-radius:50%;font-style:normal;
  background:radial-gradient(circle at 38% 26%,color-mix(in srgb,var(--ring-color) 18%,var(--ui-recessed)),var(--ui-recessed) 72%);
  box-shadow:0 1px 3px #0008,inset 0 1px .5px #effffb50,inset 0 -1px 1px #000b;
}
.spirit-gym-hud__weapon-vitals[hidden]{display:none}
/* Two masks intersect: a true circular channel and the current resource arc.
   The highlight is cut by the same arc, including when the resource is empty. */
.spirit-gym-hud__weapon-vitals::before,.spirit-gym-hud__weapon-health::before{
  content:"";position:absolute;inset:1px;border-radius:50%;pointer-events:none;
  background:linear-gradient(140deg,color-mix(in srgb,var(--ring-color) 55%,#fffdf2) 5%,var(--ring-color) 40%,color-mix(in srgb,var(--ring-color) 58%,#132f35) 72%,var(--ring-color));
  mask-image:conic-gradient(#000 var(--ring-angle,var(--qi-angle)),transparent 0),radial-gradient(farthest-side,transparent calc(100% - 2.5px),#000 calc(100% - 2px));
  mask-composite:intersect;
}
.spirit-gym-hud__weapon-vitals::after{
  content:"";position:absolute;inset:4px;border-radius:50%;pointer-events:none;
  box-shadow:0 0 0 .5px #020f17c0,inset 0 1px 1px #0008;
}
.spirit-gym-hud__weapon-health{
  --health-angle:0deg;--ring-angle:var(--health-angle);--ring-color:var(--ui-health-light);
  position:absolute;inset:6px;display:grid;place-items:center;border-radius:50%;font-style:normal;
  background:var(--ui-recessed);box-shadow:0 0 0 .5px #d7e7dc22,inset 0 1px 2px #000b;
}
.spirit-gym-hud__weapon-health::before{
  inset:0;mask-image:conic-gradient(#000 var(--health-angle),transparent 0),radial-gradient(farthest-side,transparent calc(100% - 2px),#000 calc(100% - 1.5px));
}
.spirit-gym-hud__weapon-health::after{
  content:"";position:absolute;inset:3px;border-radius:50%;pointer-events:none;
  background:radial-gradient(ellipse at 35% 12%,#dff6ed30,transparent 55%);
  box-shadow:inset 0 .5px .5px #dff6ed30,inset 0 -1px 1px #0009;
}
.spirit-gym-hud__weapon-phase{position:relative;z-index:1;font:500 9px/1 var(--ui-font-title);color:var(--ui-text);text-shadow:0 1px 2px #000}
.spirit-gym-hud__slot[data-element=metal]{--weapon-accent:#d6bf86}
.spirit-gym-hud__slot[data-element=wood]{--weapon-accent:#9bbe8a}
.spirit-gym-hud__slot[data-element=water]{--weapon-accent:#88b8c6}
.spirit-gym-hud__slot[data-element=fire]{--weapon-accent:#d69273}
.spirit-gym-hud__slot[data-element=earth]{--weapon-accent:#c0a37f}
.spirit-gym-hud__slot[data-resource-phase=disabled-docked]{opacity:.55}
.spirit-gym-hud__slot[data-automatic=true][data-resource-phase=docked-charging] .spirit-gym-hud__weapon-vitals::before{animation:weapon-qi-breathe 2.4s ease-in-out infinite}
@keyframes weapon-qi-breathe{0%,100%{opacity:.76}50%{opacity:1}}
[data-game-menu-open=true] .spirit-gym-hud__weapon-vitals::before{animation-play-state:paused}
@media(prefers-reduced-motion:reduce){.spirit-gym-hud__slot[data-automatic=true][data-resource-phase=docked-charging] .spirit-gym-hud__weapon-vitals::before{animation:none}}
`,At=String.raw`
.spirit-gym-hud{${n}--ink:var(--ui-text);--muted:var(--ui-muted);--gold:var(--ui-bronze);--jade:var(--ui-jade);--line:var(--ui-line);position:absolute;inset:0;width:100%;height:100%;min-width:0;overflow:clip;pointer-events:none!important;z-index:50;color:var(--ink);font:12px/1.5 var(--ui-font-body);font-variant-numeric:tabular-nums;text-shadow:0 1px 4px #0008}
.spirit-gym-hud *{box-sizing:border-box}.spirit-gym-hud__panel{background:color-mix(in srgb,var(--ui-surface) 85%,transparent);border:1px solid var(--line);border-radius:3px;box-shadow:0 4px 20px #0002}
.spirit-gym-hud{--hud-tray-width:392px;--hud-orb-size:90px;--hud-tray-bottom:max(36px,calc(env(safe-area-inset-bottom) + 26px))}
.spirit-gym-hud__status{position:static}
.spirit-gym-hud__readouts{position:absolute;top:max(20px,env(safe-area-inset-top));left:max(22px,env(safe-area-inset-left));width:184px;display:grid;gap:6px}
.spirit-gym-hud__identity{width:100%;padding:4px 10px;background:linear-gradient(100deg,var(--ui-panel),transparent);border:0;border-left:2px solid var(--ui-bronze);border-radius:0;box-shadow:none}
.spirit-gym-hud__name:not(:has([data-water-state]:not([hidden]))){display:none}.spirit-gym-hud__name{color:var(--ui-muted);font-size:9px;letter-spacing:.06em;margin-bottom:4px;white-space:nowrap}.spirit-gym-hud__cultivation{display:flex;justify-content:space-between;align-items:center;gap:8px}.spirit-gym-hud__cultivation b{font:500 18px/1.4 var(--ui-font-title);letter-spacing:.06em}.spirit-gym-hud__cultivation>span{color:var(--muted);font-size:10px}.spirit-gym-hud__xp-track{height:2px;background:var(--ui-line);margin-top:7px}.spirit-gym-hud__xp-track i{display:block;height:100%;background:var(--ui-jade);transform-origin:left;transform:scaleX(0)}
.spirit-gym-hud__talents{pointer-events:auto;display:inline-flex;align-items:center;justify-content:center;gap:5px;font:600 14px var(--ui-font-number);color:var(--ui-muted);background:none;border:0;border-radius:4px;padding:4px 6px;cursor:pointer;min-height:40px;min-width:46px}.spirit-gym-hud__talents svg{width:19px;height:19px}.spirit-gym-hud__talents[data-available=true]{color:var(--ui-jade);background:color-mix(in srgb,var(--ui-jade) 10%,transparent)}
.spirit-gym-hud__talents:focus-visible,.spirit-gym-hud__experience:focus-visible{outline:2px solid var(--ui-jade);outline-offset:3px}
.spirit-gym-hud__strength{width:100%;padding:3px 8px;background:color-mix(in srgb,var(--ui-panel) 80%,transparent);border:0;border-radius:4px;cursor:pointer;text-align:left}.spirit-gym-hud__strength:focus-visible{outline:2px solid var(--ui-jade);outline-offset:3px}.spirit-gym-hud__strength:hover{background:var(--ui-panel)}.spirit-gym-hud__strength [data-strength-summary]{display:grid;grid-template-columns:minmax(0,1.2fr) minmax(0,1fr);gap:0 8px}.strength-readout__stat{display:flex;align-items:center;gap:4px;min-height:28px;min-width:0}.strength-readout__stat svg{width:16px;height:16px;flex:none;color:var(--ui-jade)}.strength-readout__stat b{font:500 15px var(--ui-font-number);font-variant-numeric:tabular-nums;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.spirit-gym-hud__experience{position:absolute;bottom:calc(100% + 5px);left:0;right:0;padding:3px 5px;pointer-events:auto;cursor:help;background:color-mix(in srgb,var(--ui-panel) 75%,transparent);border-radius:3px}
.spirit-gym-hud__experience>div:first-child{display:flex;justify-content:space-between;font-size:9px;color:var(--ui-muted);line-height:1.3}
.spirit-gym-hud__experience .spirit-gym-hud__xp-track{margin-top:3px;height:4px}
${Dt}
.spirit-gym-hud__round{position:absolute;top:max(22px,env(safe-area-inset-top));left:50%;transform:translateX(-50%);min-width:134px;padding:10px 22px 14px;text-align:center;background:linear-gradient(color-mix(in srgb,var(--ui-surface) 75%,transparent),transparent);border-width:0 0 1px;border-radius:0}.spirit-gym-hud__round strong{display:block;font-weight:500;font-size:11px;color:var(--ui-text);letter-spacing:.2em}.spirit-gym-hud__round span{display:block;margin-top:2px;font:30px/1.2 var(--ui-font-number);letter-spacing:.08em}
.spirit-gym-hud__score{position:absolute;top:max(94px,calc(var(--game-hud-right-top,0px) + 8px));right:18px;display:grid;grid-template-columns:1fr 1fr;gap:10px 22px;padding:13px 18px;width:165px;font-size:10px;color:var(--muted)}.spirit-gym-hud__score span{display:flex;gap:8px;justify-content:space-between;align-items:baseline;white-space:nowrap;min-width:0}.spirit-gym-hud__score span:first-child{grid-column:1/-1}.spirit-gym-hud__score [data-stones]{pointer-events:auto}.spirit-gym-hud__score b{color:var(--ink);font-size:15px;font-weight:500}.spirit-gym-hud__score span:last-child{grid-column:1/-1;font-size:10px}.spirit-gym-hud__score span:last-child b{font-size:12px}
.spirit-gym-hud__loadout{position:absolute;bottom:var(--hud-tray-bottom);left:50%;transform:translateX(-50%);width:var(--hud-tray-width);padding:10px 12px;background:linear-gradient(0deg,var(--ui-panel),color-mix(in srgb,var(--ui-recessed) 80%,transparent));border:1px solid var(--ui-line);border-radius:2px;box-shadow:0 5px 22px #0006}.spirit-gym-hud__slot-group-label,.spirit-gym-hud__gear-group,.spirit-gym-hud__reset{display:none}.spirit-gym-hud__slot-row{display:grid;grid-template-columns:repeat(var(--hud-slot-count),minmax(0,1fr));gap:6px}.spirit-gym-hud__slot{position:relative;min-width:0;display:flex;flex-direction:column;align-items:center;justify-content:center;gap:4px;height:62px;padding:5px 3px;border:1px solid var(--ui-line);background:color-mix(in srgb,var(--ui-recessed) 80%,transparent);color:var(--ui-muted);border-radius:2px;pointer-events:auto}.spirit-gym-hud__slot.is-filled{border-color:color-mix(in srgb,var(--weapon-accent,var(--ui-bronze)) 60%,transparent)}.spirit-gym-hud__slot-name{display:block;max-width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;font-size:10px;text-align:center}.spirit-gym-hud__slot-copy{max-width:100%}.spirit-gym-hud__slot-meta{display:none}.spirit-gym-hud__slot:not(.is-filled) .spirit-gym-hud__weapon-vitals{opacity:.25}
${kt}
.spirit-gym-hud__dash{position:absolute;left:24px;bottom:55px;padding:6px 12px;border-width:0 0 0 2px;font-size:12px;color:var(--muted)}.spirit-gym-hud__dash[data-ready=true]{border-color:var(--jade);color:var(--ink)}.spirit-gym-hud__input-hint{position:absolute;left:24px;bottom:24px;padding:0;border:0;background:none;box-shadow:none;font-size:10px;color:var(--ui-muted)}
.spirit-gym-hud__touch{display:none}.spirit-gym-hud__joystick,.spirit-gym-hud__touch-action{position:absolute;display:grid;place-items:center;border:1px solid var(--ui-bronze);border-radius:50%;background:#18221d77;color:#eee9db}.spirit-gym-hud__joystick{left:calc(var(--touch-origin-x,18%) - 42px);top:calc(var(--touch-origin-y,78%) - 42px);width:84px;height:84px}.spirit-gym-hud__joystick::after{content:"";width:28px;height:28px;border:1px solid var(--ui-bronze);border-radius:50%;background:color-mix(in srgb,var(--ui-jade) 25%,transparent);transform:translate(var(--touch-stick-x,0px),var(--touch-stick-y,0px))}.spirit-gym-hud__touch-jump{right:6%;bottom:14%;width:62px;height:62px}.spirit-gym-hud__touch-dash{right:24%;bottom:8%;width:52px;height:52px}.spirit-gym-hud__touch-action.is-active{background:color-mix(in srgb,var(--ui-jade) 45%,transparent)}
[data-game-menu-open=true]>.spirit-gym-hud{visibility:hidden}
/* HUD groups shrink together, preserving the gap between the spheres and the tray. */
.spirit-gym-hud__loadout::after{content:"";position:absolute;inset:4px;background:var(--ui-motif-corner-nw) left top/20px 20px no-repeat,var(--ui-motif-corner-se) right bottom/20px 20px no-repeat;opacity:.55;pointer-events:none}
.spirit-gym-hud__round::after{content:"";position:absolute;width:5px;height:5px;bottom:-3px;left:calc(50% - 3px);border:1px solid var(--ui-bronze-light);background:var(--ui-recessed);transform:rotate(45deg);pointer-events:none}
@media(max-width:1100px){.spirit-gym-hud{--hud-tray-width:354px;--hud-orb-size:78px}.spirit-gym-hud__score{width:146px;padding:8px 12px;gap:8px 12px}.spirit-gym-hud__input-hint{max-width:180px;font-size:9px}}
@media(max-height:500px){.spirit-gym-hud{--hud-tray-width:314px;--hud-orb-size:64px;--hud-tray-bottom:36px}.spirit-gym-hud__readouts{top:max(8px,env(safe-area-inset-top));left:max(12px,env(safe-area-inset-left));width:176px}.spirit-gym-hud__identity{padding:4px 10px}.spirit-gym-hud__cultivation b{font-size:15px}.spirit-gym-hud__round{top:10px;padding:4px 16px;min-width:110px}.spirit-gym-hud__round span{font-size:23px}.spirit-gym-hud__score{top:max(62px,calc(var(--game-hud-right-top,0px) + 8px));right:12px;width:130px;padding:7px 10px}.spirit-gym-hud__score span:last-child{display:none}.spirit-gym-hud__loadout{padding:6px 8px}.spirit-gym-hud__slot{height:50px;padding:4px 3px;gap:2px}.spirit-gym-hud__weapon-vitals{--weapon-vitals-size:22px}.spirit-gym-hud__weapon-health{inset:4px}.spirit-gym-hud__input-hint{display:none}.spirit-gym-hud__dash{bottom:18px;left:12px}.spirit-gym-hud__resource-orb strong{font-size:10px;bottom:calc(100% + 10px)}}

.spirit-gym-hud__slot{font-family:var(--ui-font-body);cursor:pointer}
.spirit-gym-hud__slot[data-automatic=true]{border-color:transparent}
.spirit-gym-hud__slot:not(.is-filled)>.weapon-activation-frame{display:none}
.spirit-gym-hud__slot:focus-visible{outline:var(--ui-focus) solid var(--ui-jade);outline-offset:2px}
.spirit-gym-hud__slot[data-automatic=false]{filter:saturate(.55)}
.spirit-gym-hud__slot:disabled{cursor:default;opacity:.4}
`,jt=`
.play-hud,.spirit-menu .play-hud-sys{
  --ui-font-title:"Noto Sans CJK SC","PingFang SC","Microsoft YaHei",sans-serif;
  --ui-font-number:var(--ui-font-title);
  --ui-health-light:#ed7963;--ui-recessed:#14282c;--ui-text:#edf3ef;--ui-muted:#bacac7;--ui-jade:#9bcabb;--ui-gold-2:var(--ui-jade);
  --play-panel:linear-gradient(155deg,rgb(29 44 48 / 94%),rgb(14 27 32 / 94%));
  --play-line:#93b5aa40;--play-text-shadow:0 1px 2px #0009;
  font-variant-numeric:tabular-nums;
}
/* One information group, with shared insets instead of separately framed readouts. */
.play-hud .play-hud-stack{
  box-sizing:border-box;width:var(--play-realm-w);padding:0 10px 4px;gap:0;
  background:var(--play-panel);border:1px solid var(--play-line);border-radius:3px;
  box-shadow:0 2px 5px #0003;
}
.play-hud :is(.play-hud-realm,.play-hud-wave){
  box-sizing:border-box;width:100%;padding:0;margin:0;background:none;filter:none;
  border:0;border-image:none;box-shadow:none;color:var(--ui-text);
}
.play-hud :is(.play-hud-realm,.play-hud-wave)::before,
.play-hud :is(.play-hud-realm,.play-hud-wave)::after{content:none}
.play-hud .play-hud-realm{gap:4px;--realm-title:18px}
.play-hud .play-hud-realm__head{gap:6px;padding:0;align-items:center}
.play-hud .play-hud-realm__name{gap:4px;padding:0}
.play-hud .play-hud-realm__title{color:var(--ui-text);font-weight:600;letter-spacing:.03em}
.play-hud .play-hud-realm__grade{font-size:11px;letter-spacing:0;color:var(--ui-muted)}
.play-hud .play-hud-wave{justify-content:space-between;--wave-h:24px;--wave-label:12px;--wave-state:14px}
.play-hud .play-hud-wave__label,.play-hud .play-hud-wave__state{letter-spacing:0;color:var(--ui-text)}
.play-hud .play-hud-wave__state{font-weight:600}
.play-hud .play-hud-details{position:static;width:100%;gap:4px;padding-top:0;border-top:1px solid var(--play-line);flex-wrap:wrap}
.play-hud .play-hud-details button{
  position:relative;flex:1;min-width:0;min-height:44px;padding:0 2px;border:0;border-radius:2px;background:none;
  color:var(--ui-muted);font:12px/1 var(--ui-font-title);letter-spacing:0;
}
.play-hud .play-hud-details button:hover,.play-hud .play-hud-details button:focus-visible{background:#98c2b51a;color:var(--ui-text)}
.play-hud .play-hud-progression{display:grid;grid-template-columns:minmax(0,1fr) auto;gap:6px;align-items:center;height:var(--dock-progress-h);min-height:0}
.play-hud .play-hud-talents{position:relative;display:inline-flex;align-items:center;justify-content:center;gap:4px;min-width:44px;min-height:0;height:100%;box-sizing:border-box;padding:0 5px;border:0;border-radius:2px;background:none;color:var(--ui-muted);font:11px/1 var(--ui-font-number);cursor:pointer}
/* Grow the hit target upwards into free space, never into the weapon row. */
.play-hud .play-hud-talents::after{content:"";position:absolute;inset:min(0px,calc(var(--dock-progress-h) - 44px)) 0 0;pointer-events:auto}
.play-hud .play-hud-talents svg{width:16px;height:16px;flex:none}
.play-hud .play-hud-talents[data-available=true]{color:var(--ui-jade)}
.play-hud .play-hud-talents:is(:hover,:focus-visible){background:#98c2b51a;outline:1px solid var(--ui-jade);outline-offset:-1px}
.play-hud > .play-hud-wave{width:180px;height:32px;padding:0 12px;background:var(--play-panel);border:1px solid var(--play-line);border-radius:3px}
/* A single weapon tray: thin separators, a readable resource band and a quiet focus mark. */
.play-hud .play-hud-dock{--dock-progress-h:24px;--dock-padding:5px;--dock-gap:5px;display:grid;grid-template-rows:auto auto;gap:var(--dock-gap);padding:var(--dock-padding);aspect-ratio:auto;min-height:0;--xp-font:11px;--wpn-font:12px;--ink:var(--ui-text);background:var(--play-panel);border:1px solid var(--play-line);border-radius:3px;box-sizing:border-box;filter:none;box-shadow:0 2px 5px #0003;text-shadow:var(--play-text-shadow)}
.play-hud .play-hud-dock__xp{position:relative;inset:auto;height:100%;min-width:0;box-sizing:border-box;padding:0 0 3px;border-radius:1px;color:var(--ui-muted);overflow:visible;background:none}
.play-hud .play-hud-dock__xp::before,.play-hud .play-hud-dock__xp::after{top:auto;bottom:0;height:3px}
.play-hud .play-hud-dock__xp::before{background:#8dc5ae29;mix-blend-mode:normal}
.play-hud .play-hud-dock__xp::after{background:transparent;box-shadow:inset 1px 0 0 #9bcabb99}
.play-hud .play-hud-dock__xp > *{padding:0 4px;background:none;box-shadow:none;border-radius:0;letter-spacing:0}
.play-hud .play-hud-dock__xp > b{font-weight:500}
.play-hud .play-hud-dock__slots{position:relative;inset:auto;column-gap:4px}
.play-hud .play-hud-wpn__ring{--weapon-vitals-size:clamp(24px,calc(var(--dock-w)*.07),32px);width:var(--weapon-vitals-size);height:var(--weapon-vitals-size);font-size:11px;background:#10252c;color:var(--ui-jade);text-shadow:none;box-shadow:none}
.play-hud .spirit-gym-hud__weapon-health{inset:5px}
.play-hud .play-hud-wpn__ring::before{background:conic-gradient(#9bcabb calc(var(--wpn-charge)*1turn),#9bcabb30 0)}
.play-hud .play-hud-wpn__name{font-weight:500;line-height:1.3;color:var(--ui-text);letter-spacing:0;margin:0}
.play-hud .play-hud-wpn--active .play-hud-wpn__name{color:#b4dacb}
.play-hud .play-hud-wpn--empty .play-hud-wpn__name{font-size:10px;color:#a2b4b3;font-weight:400}
.play-hud .play-hud-wpn__gem{box-sizing:border-box;width:clamp(18px,calc(var(--dock-w)*.06),28px);height:auto;border:0;box-shadow:none;transform:none;position:relative}
.play-hud .play-hud-wpn__gem::after{content:"";position:absolute;left:35%;right:35%;top:50%;border-top:1px solid #9bcabb60}
.play-hud .play-hud-wpn[data-automatic=false]:not(:disabled) .play-hud-wpn__ring{color:#b9c5c2;background:#29363b}
.play-hud .play-hud-dock__lit{--col:calc((100% - var(--dock-padding)*2 - 20px)/6);left:calc(var(--dock-padding) + var(--wpn-current,0)*(var(--col) + 4px));right:auto;top:calc(var(--dock-padding) + var(--dock-progress-h) + var(--dock-gap));bottom:var(--dock-padding);width:var(--col);clip-path:none;transition:none;background:#9bcabb0d;box-shadow:inset 0 -2px 0 #9bcabb}
/* Native touch targets keep their positions; the visual rings lose their ornaments. */
.play-hud .play-hud-dash{--dash-label:11px;--dash-state:11px}
.play-hud .play-hud-dash__plate{border-image:none;background:#16292de6;border-radius:3px;padding-inline:8px}
.play-hud .play-hud-dash__plate::before,.play-hud .play-hud-dash__sep{display:none}
.play-hud .play-hud-touch-btn{opacity:1;background:#16292dad;border:1px solid #a3c2b961;border-radius:50%;filter:none}
.play-hud .play-hud-touch-btn::before{content:none}
.play-hud .play-hud-touch-btn--pressed{background:#477366d9}
.play-hud .play-hud-touch-btn__label{font-size:12px;font-weight:500;color:var(--ui-text);text-shadow:var(--play-text-shadow)}
.play-hud .play-hud-joystick__ring{box-sizing:border-box;border-radius:50%;border:1px solid #a3c2b950;background:#16292d77}
.play-hud .play-hud-joystick__knob{box-sizing:border-box;width:42%;height:42%;margin:-21%;border:1px solid #b4d4c980;border-radius:50%;background:#3b5b58bf}
/* System controls share the slate surface. Transparent hit areas remain at least 44px. */
.spirit-menu .play-hud-sys button{position:relative;text-shadow:var(--play-text-shadow);touch-action:manipulation;filter:none}
.spirit-menu .play-hud-sys .play-hud-sys__menu,.spirit-menu .play-hud-sys .play-hud-sys__icon{background:var(--play-panel);border-image:none;border:1px solid var(--play-line);border-radius:3px;color:var(--ui-text);box-shadow:0 2px 5px #0003;line-height:1}
.spirit-menu .play-hud-sys button::after{content:"";position:absolute;inset:min(0px,calc((var(--sys-h) - 44px)/2));pointer-events:auto}
.spirit-menu .play-hud-sys .play-hud-sys__key{background:none;box-shadow:none;border-color:var(--play-line);color:var(--ui-muted);margin:0}
.spirit-menu .play-hud-sys svg{display:block;flex:none;filter:none;stroke:currentColor}
.spirit-menu .play-hud-sys .play-hud-sys__menu > span{display:inline-flex;align-items:center;flex:none;margin:0;line-height:1}
@media(orientation:portrait){
  .spirit-menu .play-hud-sys{--sys-font:13px;gap:12px}
  .spirit-menu .play-hud-sys .play-hud-sys__menu{width:68px;min-width:68px;padding:0 7px;gap:4px;letter-spacing:0}
  .spirit-menu .play-hud-sys--touch .play-hud-sys__menu{width:68px;min-width:68px}
  .spirit-menu .play-hud-sys:not(.play-hud-sys--touch) .play-hud-sys__menu > span[aria-hidden=true]{display:none}
  .spirit-menu .play-hud-sys:not(.play-hud-sys--touch) .play-hud-sys__menu{gap:2px}
  .spirit-menu .play-hud-sys .play-hud-sys__key{flex:none;font:9px/1 var(--ui-font-number);letter-spacing:0;padding:1px 2px}
  .spirit-menu[data-input-device=gamepad] .play-hud-sys:not(.play-hud-sys--touch) .play-hud-sys__menu{flex-direction:column;gap:0;font-size:12px}
  .spirit-menu[data-input-device=gamepad] .play-hud-sys:not(.play-hud-sys--touch) .play-hud-sys__key{padding:0;border:0}
  .spirit-menu .play-hud-sys .play-hud-sys__icon svg{width:14px;height:14px}
}
@media(orientation:landscape){
  .play-hud .play-hud-realm{--realm-title:20px}
  .play-hud .play-hud-dock{--wpn-font:13px}
}
@media(orientation:landscape) and (pointer:coarse),(orientation:landscape) and (max-height:500px){
  .play-hud .play-hud-stack{gap:6px;padding-inline:8px;padding-bottom:4px}
  .play-hud .play-hud-realm{--realm-title:18px}
  .play-hud .play-hud-dock{--xp-font:10px;--wpn-font:11px;--dock-gap:4px;--dock-padding:4px}
  .play-hud .play-hud-wpn__ring{font-size:10px}
  .play-hud > .play-hud-wave{width:156px}
}
${`
@property --hud-card-angle{syntax:"<angle>";initial-value:125deg;inherits:false}
.play-hud .play-hud-wpn{
  --wpn-rarity:var(--ui-muted);--card-light:.38;--card-speed:6s;--card-delay:0s;
  isolation:isolate;overflow:hidden;justify-content:center;min-height:62px;
  padding:6px 3px;gap:4px;border:1px solid var(--play-line);border-radius:3px;
  color:var(--ui-text);text-shadow:var(--play-text-shadow);
  background:var(--ui-recessed);
}
${i.rarity.map((e,t)=>`.play-hud .play-hud-wpn[data-rarity="${t+1}"]{--wpn-rarity:${e}}`).join(`
`)}
.play-hud .play-hud-wpn.is-filled{
  border-color:color-mix(in srgb,var(--wpn-rarity) 48%,var(--ui-recessed));
  background:
    radial-gradient(ellipse at 50% 0%,color-mix(in srgb,var(--wpn-rarity) 16%,transparent),transparent 75%),
    linear-gradient(150deg,var(--ui-recessed),color-mix(in srgb,var(--ui-recessed) 66%,#030a10));
  box-shadow:inset 0 1px 0 #e5fff114,inset 0 -1px 4px #0005;
}
.play-hud .play-hud-wpn > :is(.play-hud-wpn__ring,.play-hud-wpn__name,.play-hud-wpn__gem){position:relative;z-index:1}
.play-hud .play-hud-wpn.is-filled .play-hud-wpn__name{
  color:color-mix(in srgb,var(--wpn-rarity) 38%,var(--ui-text));
  font-weight:600;text-shadow:0 1px 2px #000;line-height:1.3;letter-spacing:0;margin:0;
}
/* A narrow sheen crosses the recessed face; the bright colour stays at the rim. */
.play-hud .play-hud-wpn::before{
  content:"";inset:0;z-index:0;pointer-events:none;opacity:0;transform:translateX(-110%);
  background:linear-gradient(115deg,transparent 22%,color-mix(in srgb,var(--wpn-rarity) 24%,transparent) 44%,#edfff52e 49%,color-mix(in srgb,var(--wpn-rarity) 14%,transparent) 55%,transparent 76%);
}
.play-hud .play-hud-wpn:is([data-rarity="5"],[data-rarity="6"],[data-rarity="7"],[data-rarity="8"])::before{
  opacity:var(--card-light);animation:hud-card-sheen var(--card-speed) ease-in-out infinite;
  animation-delay:var(--card-delay);
}
.play-hud .play-hud-wpn[data-rarity="6"]{--card-light:.52;--card-speed:5s}
.play-hud .play-hud-wpn:is([data-rarity="7"],[data-rarity="8"]){
  --card-light:.65;--card-speed:4.8s;border-color:transparent;
  background:
    radial-gradient(ellipse at 0% 0%,color-mix(in srgb,${i.rainbow[0]} 22%,transparent),transparent 65%),
    radial-gradient(ellipse at 100% 100%,color-mix(in srgb,${i.rainbow[4]} 18%,transparent),transparent 65%),
    linear-gradient(145deg,var(--ui-recessed),#08121c);
}
.play-hud .play-hud-wpn:is([data-rarity="7"],[data-rarity="8"])::after{
  content:"";position:absolute;inset:0;padding:2px;border-radius:inherit;z-index:2;pointer-events:none;
  background:conic-gradient(from var(--hud-card-angle),${[...i.rainbow,i.rainbow[0]].join(`,`)});
  mask:linear-gradient(#000 0 0) content-box,linear-gradient(#000 0 0);mask-composite:exclude;
  opacity:.95;filter:saturate(1.45);animation:hud-card-spectrum 7s linear infinite;animation-delay:var(--card-delay);
}
.play-hud .play-hud-wpn[data-rarity="8"]{--card-light:.85;--card-speed:3.8s;box-shadow:inset 0 0 12px #a8e1d619,0 0 5px #94bdce18}
.play-hud .play-hud-wpn[data-rarity="8"]::after{padding:2.5px;opacity:1;animation-duration:4.5s}
.play-hud .play-hud-wpn:nth-child(2){--card-delay:-.8s}
.play-hud .play-hud-wpn:nth-child(3){--card-delay:-1.6s}
.play-hud .play-hud-wpn:nth-child(4){--card-delay:-2.4s}
.play-hud .play-hud-wpn:nth-child(5){--card-delay:-3.2s}
.play-hud .play-hud-wpn:nth-child(6){--card-delay:-4s}
.play-hud .play-hud-wpn:hover,.play-hud .play-hud-wpn:focus-visible{box-shadow:inset 0 0 0 1px var(--ui-jade),inset 0 0 12px #a8e1d620}
.play-hud .play-hud-wpn:focus-visible{outline:2px solid var(--ui-jade);outline-offset:2px}
.play-hud .play-hud-wpn > .weapon-activation-frame{inset:2px;--frame-metal:var(--wpn-rarity)}
.play-hud .play-hud-wpn[data-automatic=true] > .weapon-activation-frame{--ui-jade:#d6fff2;--ui-text:#fff;filter:none}
.play-hud .play-hud-wpn:is([data-rarity="7"],[data-rarity="8"]) > .weapon-activation-frame{inset:4px;--frame-metal:color-mix(in srgb,var(--ui-jade) 38%,var(--ui-recessed))}
.play-hud .play-hud-wpn[data-automatic=true] > .weapon-activation-frame :is(.weapon-activation-frame__glow,.weapon-activation-frame__spark){animation-delay:var(--card-delay)}
.play-hud .play-hud-wpn--empty > .weapon-activation-frame{display:none}
.play-hud .play-hud-wpn--empty .play-hud-wpn__name{font-size:10px;color:var(--ui-muted);font-weight:400}
.play-hud .play-hud-wpn[data-automatic=false]:not(:disabled){filter:saturate(.55)}
.play-hud .play-hud-wpn[data-automatic=false]::before{opacity:.15;animation-play-state:paused}
.play-hud .play-hud-wpn[data-automatic=false]::after{opacity:.45;animation-play-state:paused}
[data-game-menu-open=true] .play-hud .play-hud-wpn::before,
[data-game-menu-open=true] .play-hud .play-hud-wpn::after,
[data-game-menu-open=true] .play-hud .weapon-activation-frame :is(.weapon-activation-frame__glow,.weapon-activation-frame__spark){animation-play-state:paused}
@keyframes hud-card-sheen{0%,18%{transform:translateX(-110%)}72%,100%{transform:translateX(110%)}}
@keyframes hud-card-spectrum{to{--hud-card-angle:485deg}}
@media(orientation:portrait),(orientation:landscape) and (pointer:coarse),(orientation:landscape) and (max-height:500px){
  .play-hud .play-hud-wpn{min-height:50px;padding:4px 2px;gap:3px}
}
@media(prefers-reduced-motion:reduce){
  .play-hud .play-hud-wpn::before,.play-hud .play-hud-wpn::after{animation:none!important}
  .play-hud .play-hud-wpn::before{transform:none;opacity:.12}
}
`}
`,Mt=`
.play-hud,.play-hud-sys{${r}}
#game-ui{--hud-edge-x:12px;--hud-edge-top:max(12px,env(safe-area-inset-top) + 8px);--hud-edge-bottom:max(8px,env(safe-area-inset-bottom) + 8px);--hud-title-row-h:32px}
.play-hud{
  --play-left:max(var(--hud-edge-x),env(safe-area-inset-left));--play-right:max(var(--hud-edge-x),env(safe-area-inset-right));
  --play-bottom:var(--hud-edge-bottom);--play-stick-size:112px;--play-wave-top:var(--hud-edge-top);
  --play-dock-w:min(374px,calc(100vw - var(--play-left) - var(--play-right)));--play-realm-w:min(212px,calc(100vw - var(--play-left) - var(--play-right) - 124px));--play-orb-size:72px;
  --play-text-shadow:0 1px 2px rgb(0 0 0 / 95%),0 0 4px rgb(0 0 0 / 85%);
  /* Override the native Host's #game-ui > * rule; Canvas owns touch actions. */
  position:absolute;inset:0;z-index:30;pointer-events:none!important;color:var(--ui-text);
  font-family:var(--ui-font-title);user-select:none;
}
.play-hud [hidden]{display:none!important}
/* A detail hint must escape the HUD's lower layer while damage numbers are active. */
.play-hud:has(> #play-hud-detail-hint:not([hidden])){z-index:50}
.play-hud button,.play-hud [tabindex]{pointer-events:auto}
.play-hud #play-hud-tl{position:fixed;left:var(--play-left);top:var(--hud-edge-top);z-index:1;overflow:visible}
.play-hud .play-hud-stack{--realm-w:var(--play-realm-w);position:static;gap:8px;overflow:visible}
.play-hud .play-hud-realm{--realm-w:var(--play-realm-w);padding-top:0;padding-left:0}
/* The title shares the system-button row height and the group content inset. */
.play-hud .play-hud-realm__head{height:var(--hud-title-row-h);align-items:center;box-sizing:border-box;padding-right:max(0px,calc(var(--play-left) + var(--play-realm-w) + 12px - var(--play-menu-left,100vw)))}
.play-hud .play-hud-realm__name{height:100%;box-sizing:border-box;align-items:center;padding-block:0}
.play-hud :is(.play-hud-realm,.play-hud-realm__title,.play-hud-realm__grade,.play-hud-wave,.play-hud-dash){text-shadow:var(--play-text-shadow)}
.play-hud :is(.play-hud-realm,.play-hud-wave,.play-hud-dash){opacity:1}
.play-hud .play-hud-realm__title{font-weight:600}
.play-hud .play-hud-orbs{position:fixed;top:calc(var(--play-menu-bottom,56px) + 10px);right:var(--play-right);display:flex;flex-direction:column;gap:8px}
.play-hud .ui-art--hud-orb{--hud-orb-size:var(--play-orb-size);flex:none;position:relative;inset:auto}
.play-hud .play-hud-bottom-group{position:fixed;left:50%;transform:translateX(-50%);bottom:var(--play-bottom);display:flex;align-items:flex-end;gap:16px}
.play-hud .play-hud-dock{--dock-w:var(--play-dock-w);position:relative;inset:auto;transform:none;flex:none}
.play-hud .play-hud-wpn{pointer-events:auto;touch-action:manipulation}
.play-hud .play-hud-wpn__name{text-overflow:clip}
.play-hud .play-hud-wpn:disabled{cursor:default}
.play-hud .play-hud-wpn__ring{flex:none}
/* Secondary actions share the information group and keep the existing handlers. */
.play-hud .play-hud-details{display:flex;align-items:center;gap:4px;flex-wrap:wrap}
.play-hud-details button{appearance:none;border:0;border-bottom:1px solid #a8e1d640;background:#061e1e60;color:var(--ui-text);font:11px/1.3 var(--ui-font-title);text-shadow:var(--play-text-shadow);min-height:32px;padding:4px 8px;cursor:pointer}
.play-hud-details button:focus-visible{outline:1px solid var(--ui-gold-2);outline-offset:2px}
.play-hud-details [data-strength-summary]{display:flex;align-items:center;justify-content:space-between;gap:12px;width:100%}
.play-hud .strength-readout__stat{display:inline-flex;align-items:center;gap:4px;white-space:nowrap}
.play-hud .strength-readout__stat svg{width:20px;height:20px;flex:none;color:var(--ui-jade)}
.play-hud .strength-readout__stat b{font:600 16px var(--ui-font-number)}
/* These short explanations never own clicks; the character button owns details. */
.play-hud > .item-detail-hint{pointer-events:none}
.play-hud .play-hud-dash{display:none}
.play-hud .play-hud-input-hint{position:fixed;bottom:calc(var(--play-bottom) + var(--play-dock-height,calc(var(--play-dock-w)/4.1468 + 24px)) + 8px);left:50%;transform:translateX(-50%);font:10px/1.4 var(--ui-font-title);color:var(--ui-text);white-space:nowrap;text-shadow:var(--play-text-shadow)}
.play-hud .play-hud-touch{display:none;position:absolute;inset:0;pointer-events:none}
.play-hud[data-input-device=touch] .play-hud-touch{display:block}
.play-hud[data-input-device=touch] .play-hud-input-hint{display:none}
.play-hud:is([data-input-device=touch],[data-input-device=gamepad]) .play-hud-dash__key{display:none}
.play-hud .play-hud-joystick{position:fixed;left:var(--play-left);bottom:calc(var(--play-bottom) + var(--play-dock-height,calc(var(--play-dock-w)/4.1468 + 24px)) + 20px)}
.play-hud .play-hud-joystick__knob{transform:translate(var(--touch-stick-x,0px),var(--touch-stick-y,0px))}
.play-hud .play-hud-touch-btn{position:fixed;right:var(--play-right);bottom:calc(var(--play-bottom) + var(--play-dock-height,calc(var(--play-dock-w)/4.1468 + 24px)) + 88px)}
.play-hud .play-hud-touch-btn--roll{bottom:calc(var(--play-bottom) + var(--play-dock-height,calc(var(--play-dock-w)/4.1468 + 24px)) + 16px)}
[data-game-menu-open=true] .play-hud{visibility:hidden}
/* Preserve the native handlers, while retiring the old launcher box styles. */
.spirit-menu .play-hud-sys{--sys-h:var(--hud-title-row-h);position:absolute;top:var(--hud-edge-top);right:max(var(--hud-edge-x),env(safe-area-inset-right));gap:12px;pointer-events:none}
.spirit-menu .play-hud-sys button{position:static;inset:auto;display:inline-flex;align-items:center;justify-content:center;box-sizing:border-box;min-height:0;height:var(--sys-h);margin:0;border:0 solid transparent;border-radius:0;box-shadow:none;pointer-events:auto;color:#fffbee;font-family:var(--ui-font-title)}
.spirit-menu .play-hud-sys .play-hud-sys__menu{min-width:88px;padding:0 calc(var(--sys-h)*.4);gap:calc(var(--sys-font)*.4);font-size:var(--sys-font);letter-spacing:.14em;background:none;border-image:none}
.spirit-menu .play-hud-sys .play-hud-sys__icon{width:var(--sys-h);padding:0;background:var(--play-hud-button-square) center/100% 100% no-repeat}
.spirit-menu .play-hud-sys .play-hud-sys__key{display:inline-block;font:11px/1 var(--ui-font-number);padding:3px 5px 2px;border:1px solid #a8e1d688;border-radius:3px;background:#0003;color:var(--ui-muted)}
.spirit-menu .play-hud-sys--touch .play-hud-sys__key,.spirit-menu .play-hud-sys--no-fullscreen .game-fullscreen-shortcut{display:none}
.spirit-menu .play-hud-sys--touch .play-hud-sys__menu{width:88px;min-width:88px}
.spirit-menu .play-hud-sys .game-fullscreen-shortcut{position:relative;inset:auto}
.spirit-menu .play-hud-sys [data-forgeax-viewport-metrics][data-placement=toolbar]{top:calc(100% + 6px)}
@media(orientation:landscape){
  #game-ui{--hud-edge-x:16px;--hud-edge-top:max(20px,env(safe-area-inset-top));--hud-edge-bottom:max(20px,env(safe-area-inset-bottom));--hud-title-row-h:36px}
  .play-hud{--play-dock-w:520px;--play-realm-w:232px;--play-orb-size:96px}
  .play-hud .play-hud-orbs{display:none}
  .play-hud > .play-hud-wave{position:fixed;top:var(--hud-edge-top);left:50%;margin:0;transform:translateX(-50%);--wave-w:260px}
  .play-hud > .play-hud-wave--battle{--wave-w:200px;--wave-h:28px}
  .play-hud .play-hud-dash{display:block;position:fixed;bottom:var(--play-bottom);left:var(--play-left);margin:0}
  .play-hud .play-hud-input-hint{left:var(--play-left);bottom:calc(var(--play-bottom) + 30px);transform:none}
  .play-hud .play-hud-joystick{bottom:var(--play-bottom)}
  #game-ui .play-hud[data-input-device=touch] .play-hud-dash{left:var(--play-left);bottom:calc(var(--play-bottom) + var(--play-stick-size) + 8px)}
  .play-hud .play-hud-touch-btn{bottom:calc(var(--play-bottom) + 70px)}
  .play-hud .play-hud-touch-btn--roll{bottom:var(--play-bottom)}
  .spirit-menu .play-hud-sys{gap:16px}
  .spirit-menu .play-hud-sys .play-hud-sys__menu{width:118px;min-width:118px;padding:0 10px}
}
.play-hud > .play-hud-wave{position:fixed;top:var(--play-wave-top);left:50%;transform:translateX(-50%)}
.play-hud .play-hud-condition{position:fixed;top:calc(var(--play-wave-top) + 42px);left:50%;transform:translateX(-50%);padding:3px 8px;font-size:11px;background:var(--play-panel);border-radius:3px}
@media(orientation:portrait){
  .play-hud{--play-wave-top:calc(max(var(--play-tl-bottom,96px),var(--play-menu-bottom,56px)) + 8px)}
}
/* M-L keeps the complete life/dock/qi group centred, with room for native touch on both sides. */
@media(orientation:landscape) and (pointer:coarse),(orientation:landscape) and (max-height:500px){
  #game-ui{--hud-edge-x:12px;--hud-edge-top:max(12px,env(safe-area-inset-top) + 8px);--hud-edge-bottom:max(8px,env(safe-area-inset-bottom) + 8px)}
  .play-hud{--play-dock-w:304px;--play-orb-size:64px;--play-realm-w:188px;--play-stick-size:clamp(56px,calc((100vw - 464px)/2 - var(--play-left) - 12px),96px)}
  .play-hud .play-hud-realm{--realm-title:26px;--realm-grade:15px}
  .play-hud > .play-hud-wave{--wave-w:200px;--wave-h:44px}
  .play-hud > .play-hud-wave--battle{--wave-w:160px;--wave-h:24px}
  .spirit-menu .play-hud-sys{gap:12px}
  .play-hud .play-hud-dock{--wpn-font:11px}
  .play-hud .play-hud-joystick{width:var(--play-stick-size);height:auto;aspect-ratio:1}
  .play-hud .play-hud-joystick__knob{width:42%;height:42%}
  .play-hud .play-hud-input-hint{display:none}
}
@media(orientation:landscape) and (max-width:620px){
  .play-hud{--play-dock-w:calc(100vw - 320px);--play-realm-w:160px}
  .play-hud .play-hud-realm{--realm-title:22px}
  .play-hud > .play-hud-wave--battle{--wave-w:140px}
}
${kt}
${y}
${jt}
.play-hud .play-hud-orb{${n}}
${Ot}
`,Nt=new Intl.NumberFormat(`zh-CN`,{notation:`compact`,useGrouping:!1,maximumFractionDigits:1});function Pt(e){return`${Math.floor(Math.max(0,e)/60).toString().padStart(2,`0`)}:${Math.floor(Math.max(0,e)%60).toString().padStart(2,`0`)}`}function Ft(e){switch(e){case`docked-charging`:return`充`;case`departing`:return`出`;case`hunting-leg`:return`猎`;case`returning`:return`归`;case`disabled-docked`:return`损`;default:return`·`}}function It(e){return`data-hud-zone="${e.id}" data-hud-anchor="${e.anchor}" data-hud-fields="${e.data.join(` `)}"`}function Lt(n){let r=e.copy,i=It(n);switch(n.id){case`status`:return`<div class="spirit-gym-hud__status" ${i}>
        <div class="spirit-gym-hud__readouts">
        <div class="spirit-gym-hud__identity spirit-gym-hud__panel">
          <div class="spirit-gym-hud__name" title="${e.title}"><span data-water-state hidden></span></div>
          <div class="spirit-gym-hud__cultivation"><b data-level></b><button type="button" class="spirit-gym-hud__talents" data-open-talents aria-label="天赋" title="天赋">${t(`talent`)}<span data-talent-points>0</span></button></div>
        </div>
        <button type="button" class="spirit-gym-hud__strength strength-readout" data-open-character aria-label="打开角色属性，查看秒伤与生存详情"><span data-strength-summary></span></button>
        </div>
        <div class="spirit-gym-hud__resource-orb spirit-gym-hud__resource-orb--health" data-player-health-orb role="meter" aria-label="${r.health}">
          <div class="spirit-gym-hud__orb-well" aria-hidden="true"><div class="spirit-gym-hud__orb-liquid" data-hp-liquid><span class="spirit-gym-hud__orb-current"></span><span class="spirit-gym-hud__orb-current spirit-gym-hud__orb-current--rear"></span></div></div>
          <span class="spirit-gym-hud__orb-rune" aria-hidden="true">命</span>
          <strong data-hp-text></strong>
        </div>
        <div class="spirit-gym-hud__resource-orb spirit-gym-hud__resource-orb--qi" data-player-qi-orb role="meter" aria-label="${r.qi}">
          <div class="spirit-gym-hud__orb-well" aria-hidden="true"><div class="spirit-gym-hud__orb-liquid" data-qi-liquid><span class="spirit-gym-hud__orb-current"></span><span class="spirit-gym-hud__orb-current spirit-gym-hud__orb-current--rear"></span></div></div>
          <span class="spirit-gym-hud__orb-rune" aria-hidden="true">灵</span>
          <strong data-qi-text></strong>
        </div>
      </div>`;case`round`:return`<div class="spirit-gym-hud__round spirit-gym-hud__panel" ${i}><strong data-wave></strong><span data-time></span></div>`;case`score`:return`<div class="spirit-gym-hud__score spirit-gym-hud__panel" ${i}>
        <span>${r.spiritStones}<b data-stones></b></span><span>${r.kills}<b data-kills></b></span><span>${r.enemies}<b data-enemies></b></span><span>${r.loot}<b data-loot></b></span>
      </div>`;case`loadout`:return`<div class="spirit-gym-hud__loadout spirit-gym-hud__panel" ${i}>
        <div class="spirit-gym-hud__experience" tabindex="0" role="progressbar" aria-label="修为进度" data-cultivation-progress><div><span>修为</span><span data-cultivation></span></div><div class="spirit-gym-hud__xp-track"><i data-xp-fill></i></div></div>
        <div class="spirit-gym-hud__loadout-main">
          <div class="spirit-gym-hud__slot-group"><span class="spirit-gym-hud__slot-group-label">飞剑</span><div class="spirit-gym-hud__slot-row" style="--hud-slot-count:${e.loadout.weapon.count}" data-weapon-slots></div></div>
          <div class="spirit-gym-hud__slot-group spirit-gym-hud__gear-group"><span class="spirit-gym-hud__slot-group-label">防具</span><div class="spirit-gym-hud__slot-row" style="--hud-slot-count:${e.loadout.gear.count}" data-gear-slots></div></div>
        </div>
        <button class="spirit-gym-hud__reset" type="button" title="${r.reset}" aria-label="${r.reset}">↻</button>
      </div>`;case`dash`:return`<div class="spirit-gym-hud__dash spirit-gym-hud__panel" data-dash ${i}></div>`;case`input-hint`:return`<div class="spirit-gym-hud__input-hint spirit-gym-hud__panel" data-input-hint ${i}>${r.keyboardHint}</div>`;case`shop`:return``;case`touch`:return`<div class="spirit-gym-hud__touch" aria-hidden="true" ${i}>
        <span class="spirit-gym-hud__joystick" data-touch-joystick></span>
        <span class="spirit-gym-hud__touch-action spirit-gym-hud__touch-dash" data-touch-dash>${r.touchDash}</span>
        <span class="spirit-gym-hud__touch-action spirit-gym-hud__touch-jump" data-touch-jump>${r.touchJump}</span>
      </div>`}throw Error(`[spirit-gym-hud] unsupported authored zone`)}function Rt(){return e.zones.map(Lt).join(`
`)}function zt(t){if(t.mount===document.body)throw Error(`[spirit-gym-hud] ctx.uiRoot mount is required`);let n=document.createElement(`div`),r=t.appearance===`play`;n.className=r?`spirit-gym-hud play-hud`:`spirit-gym-hud`,n.innerHTML=`
    <style>${r?Mt+Tt:At+y+b}${E}</style>
    ${r?T():Rt()}
  `,t.mount.appendChild(n);let i=r?x(n):()=>{},a=r?D(n,t.mount):()=>{},s=e=>n.querySelector(e),d=s(`[data-hp-text]`),f=s(`[data-hp-liquid]`),p=s(`[data-qi-text]`),m=s(`[data-qi-liquid]`),_=s(`[data-player-health-orb]`),k=s(`[data-player-qi-orb]`),A=[],j=(e,r,i,a)=>{e.tabIndex=0,e.style.pointerEvents=`auto`;let o=()=>{t.menu?.isOpen||t.onInspectResource?.(r,a)};e.addEventListener(`pointerenter`,e=>{e.pointerType!==`touch`&&o()}),e.addEventListener(`pointerdown`,e=>{i&&e.pointerType===`touch`||o()}),e.addEventListener(`focus`,()=>{i?.touchActive&&n.dataset.inputDevice!==`gamepad`||o()})};j(_,`health`),j(k,`qi`);let M=s(`[data-wave]`),N=s(`[data-time]`),P=r?void 0:s(`[data-stones]`),re=r?void 0:s(`[data-kills]`),ie=r?void 0:s(`[data-enemies]`),F=s(`[data-level]`),I=s(`[data-cultivation]`),L=s(`[data-cultivation-progress]`),ae=s(`[data-strength-summary]`),oe=s(`[data-open-character]`),R=r?wt(n,void 0,{id:`play-hud-detail-hint`,placement:`bottom-start`,enabled:()=>!t.menu?.isOpen,restorePointerFocus:t.focusGame}):void 0,se=``,z=s(`[data-open-talents]`),ce=e=>{R?.hide(),t.menu?.open(e)};z.addEventListener(`click`,()=>ce(`talents`)),oe.addEventListener(`click`,()=>ce(`character`));let le=r?void 0:s(`[data-loot]`),ue=s(`[data-dash]`),de=s(`[data-input-hint]`),fe=s(`[data-touch-joystick]`),pe=s(`[data-touch-jump]`),me=s(`[data-touch-dash]`),B=[],V=[],he=r?s(`.play-hud-dock`):void 0,H=r?document.createElement(`i`):void 0;H&&(H.className=`play-hud-dock__lit`,H.setAttribute(`aria-hidden`,`true`));let U=-1,ge=e=>{U=e,he?.style.setProperty(`--wpn-current`,String(Math.max(0,e))),B.forEach((t,n)=>t.classList.toggle(`play-hud-wpn--active`,r&&n===e)),H&&he&&(e<0?H.remove():H.isConnected||he.insertBefore(H,s(`[data-weapon-slots]`)))};if(e.loadout.weapon.count!==6||e.loadout.gear.count!==6)throw Error(`[spirit-gym-hud] authored slot capacities drifted from the playable loadout`);for(let n=0;n<e.loadout.weapon.count;n+=1){let e=document.createElement(`button`);e.type=`button`,e.dataset.autoAttackSlot=String(n),e.addEventListener(`click`,i=>{r&&ge(n),t.onToggleAutomaticAttack?.(n),i.detail>0&&e.blur()}),e.className=r?`play-hud-wpn play-hud-wpn--empty`:`spirit-gym-hud__slot is-weapon`,e.innerHTML=r?ee:`<span class="spirit-gym-hud__weapon-vitals"><i class="spirit-gym-hud__weapon-health"><b class="spirit-gym-hud__weapon-phase"></b></i></span><span class="spirit-gym-hud__slot-copy"><span class="spirit-gym-hud__slot-name"></span><span class="spirit-gym-hud__slot-meta"></span></span>${O}`,r&&e.addEventListener(`focus`,()=>ge(n));let i=r?Et(e,()=>t.menu?.isOpen||!e.dataset.detail||e.disabled?!1:(R?.show(e,!0),t.onInspectResource?.(`weapon`,n),!0)):void 0;i&&A.push(i),j(e,`weapon`,i,n),B.push(e),s(`[data-weapon-slots]`).appendChild(e)}for(let t=0;t<e.loadout.gear.count;t+=1){let e=document.createElement(`span`);e.className=`spirit-gym-hud__slot`,e.innerHTML=`<span class="spirit-gym-hud__slot-name"></span><span class="spirit-gym-hud__slot-meta"></span>`,V.push(e),s(`[data-gear-slots]`).appendChild(e)}return s(`.spirit-gym-hud__reset`).addEventListener(`click`,()=>t.menu?t.menu.open(`journey`):t.onReset()),{update(i){let a=i.run;n.dataset.playerX=i.playerX.toFixed(4),n.dataset.playerY=i.playerY.toFixed(4),n.dataset.playerZ=i.playerZ.toFixed(4),n.dataset.grounded=i.grounded.toString();let y=s(`[data-water-state]`);y.hidden=!i.inWater;let b=i.waterSlowResistance??0;y.textContent=b>0?`${e.copy.inWater} · ${e.copy.clearWater} ${Math.round(b*100)}%`:e.copy.inWater,y.title=`水中移动速度 ×${Math.round(c(b)*100)}%`,n.dataset.attacking=i.attacking.toString(),n.dataset.phase=a.phase,n.dataset.activeEquipmentAttacks=i.activeEquipmentAttacks.toString(),n.dataset.gpuReturningSwordInstances=i.gpuReturningSwordInstances.toString(),n.dataset.gpuReturningSwordRenderEntities=i.gpuReturningSwordRenderEntities.toString(),n.dataset.combatFixedTicks=i.combatFixedTicks.toString(),n.dataset.combatDamageEvents=i.combatDamageEvents.toString(),n.dataset.combatActiveStatuses=i.combatActiveStatuses.toString(),n.dataset.combatBroadphaseCandidates=i.combatBroadphaseCandidates.toString(),n.dataset.combatNarrowphaseTests=i.combatNarrowphaseTests.toString(),n.dataset.combatDroppedEquipmentInstances=i.combatDroppedEquipmentInstances.toString(),n.dataset.equipmentMountVisuals=i.equipmentMountVisuals.toString(),n.dataset.flyingSwordsReady=i.flyingSwordsReady.toString(),n.dataset.flyingSwordsAttacking=i.flyingSwordsAttacking.toString(),n.dataset.cultivationLevel=i.cultivationLevel.toString(),n.dataset.cultivation=i.cultivation.toFixed(3),n.dataset.activePickups=i.activePickups.toString(),n.dataset.gpuPickupInstances=i.gpuPickupInstances.toString();let x=Math.max(0,Math.min(1,i.health/Math.max(1,i.maxHealth))),T=Math.max(0,Math.min(1,i.qi/Math.max(1,i.maxQi)));n.dataset.playerHealth=i.health.toFixed(3),n.dataset.playerMaxHealth=i.maxHealth.toFixed(3),n.dataset.playerQi=i.qi.toFixed(3),n.dataset.playerMaxQi=i.maxQi.toFixed(3);let E=ne(i.health,i.maxHealth);d.textContent=`${E.current} / ${E.maximum}`,f.style.setProperty(`--resource-ratio`,String(x)),p.textContent=`${Math.ceil(Math.max(0,i.qi))} / ${i.maxQi}`,m.style.setProperty(`--resource-ratio`,String(T)),_.setAttribute(`aria-valuemin`,`0`),_.setAttribute(`aria-valuemax`,String(E.maximum)),_.setAttribute(`aria-valuenow`,String(E.current)),k.setAttribute(`aria-valuemin`,`0`),k.setAttribute(`aria-valuemax`,String(i.maxQi)),k.setAttribute(`aria-valuenow`,String(Math.max(0,i.qi))),_.dataset.detail=`主人气血 ${d.textContent}；受伤时减少。与武器器命分别计算。`,k.dataset.detail=`主人灵力 ${p.textContent}；与武器自己的灵力分别计算。`,_.classList.toggle(`is-low`,x<=.25),k.classList.toggle(`is-low`,T<=.2),M.textContent=i.teaching?`青竹教学`:a.phase===`combat`?`第 ${a.wave} 波`:`第 ${a.wave} 波结算`,N.textContent=i.teaching?`完成实操后入境`:a.phase===`combat`?Pt(a.waveRemaining):`休整`,P&&(P.textContent=Nt.format(i.spiritStones),P.title=`${i.spiritStones} 灵石`,P.setAttribute(`aria-label`,P.title)),re&&(re.textContent=i.kills.toString()),ie&&(ie.textContent=i.enemies.toString());let D=u(i.cultivationLevel);F.textContent=r?D.realmName:D.displayName,F.title=`境界第 ${D.stageIndex+1} 阶段`;let O=`${Math.floor(i.cultivation)} / ${i.nextCultivation}`;if(r||(I.textContent=O),r){s(`[data-realm-grade]`).textContent=`· ${D.subStageName}`,I.textContent=O;let e=Math.max(0,Math.min(1,i.cultivation/Math.max(1,i.nextCultivation)));L.style.setProperty(`--xp-progress`,String(e));let t=s(`.play-hud-wave`);t.classList.toggle(`play-hud-wave--battle`,a.phase===`combat`),t.dataset.detail=`${M.textContent} · ${N.textContent}。当前敌人 ${i.enemies}；本局已击破 ${i.kills}。其余战绩与拾获详情见菜单「本局」。`,t.setAttribute(`aria-label`,t.dataset.detail)}if(L.setAttribute(`aria-valuemin`,`0`),L.setAttribute(`aria-valuemax`,String(i.nextCultivation)),L.setAttribute(`aria-valuenow`,String(Math.min(i.nextCultivation,i.cultivation))),L.title=`修为 ${Math.floor(i.cultivation)} / ${i.nextCultivation} · ${D.stageIndex===l-1?`境界已累计授予 ${l} 个天赋点；继续积累修为不再获得天赋点`:`每晋升一个小境界获得 1 个天赋点`}`,r){let e=u(i.cultivationLevel+1);L.dataset.detail=`${L.title}。${e.stageIndex>D.stageIndex?`下一境界：${e.displayName}`:`已达最高境界`}。`,L.removeAttribute(`title`)}s(`[data-talent-points]`).textContent=String(i.talentPoints??0),z.title=`天赋 · ${i.talentPoints??0} 点可用`,z.setAttribute(`aria-label`,z.title),r&&(z.dataset.detail=z.title,z.removeAttribute(`title`)),z.dataset.available=String((i.talentPoints??0)>0);let ee=C(i.numerics,i.survival,r);if(ee!==se){se=ee,v(ae,ee);let e=Array.from(ae.children,e=>e.getAttribute(`aria-label`)).join(`；`);oe.setAttribute(`aria-label`,`${e}；打开角色属性查看详情`),r&&(oe.dataset.detail=Array.from(ae.children,e=>e.dataset.detail).join(`
`))}t.menu?.isOpen?R?.hide():R?.refresh(),le&&(le.textContent=`${i.remnants} / ${i.items}`),r||(s(`[data-xp-fill]`).style.transform=`scaleX(${Math.min(1,i.cultivation/Math.max(1,i.nextCultivation))})`),t.menu?.updateRun(i);let A=i.dodgeKind===`blink`?`缩地`:`翻滚`;r?(s(`[data-dash-label]`).textContent=A,s(`[data-dash-state]`).textContent=i.dashReady?`就绪`:`调息`,ue.classList.toggle(`play-hud-dash--cd`,!i.dashReady),me.querySelector(`.play-hud-touch-btn__label`).textContent=A):(ue.textContent=`${A} · ${i.dashReady?`就绪`:`调息`}`,me.textContent=A),ue.dataset.ready=i.dashReady.toString();let j=new Map(i.weaponResources.map(e=>[e.slot,e]));for(let n=0;n<B.length;n+=1){let s=B[n],c=a.loadout.weaponDefinitionIds[n],l=c?o[c]:void 0,u=i.weaponNames?.[n]??l?.name??c,d=a.weaponMastery.find(e=>e.equipmentId===c),f=j.get(n),p=l?.family===`elemental-spell`?l:void 0;s.classList.toggle(`is-filled`,c!==null),s.classList.remove(`is-gear`),s.dataset.definitionId=c??``,s.dataset.element=l?.element??``,s.dataset.resourcePhase=f?.resourcePhase??``;let m=`${e.loadout.weapon.shortLabel}${n+1}`;s.querySelector(`.spirit-gym-hud__slot-name`).textContent=c?u:`${m} · 空`,s.querySelector(`.spirit-gym-hud__slot-meta`).textContent=c?p?`每次 ${p.tiers[0].qiCost} 灵力`:f?`命 ${te(f.health,f.maxHealth,`/`)} · 灵 ${Math.ceil(f.qi)}/${Math.ceil(f.maxQi)}`:`器命 / 灵力同步中`:`待装配`;let h=s.querySelector(`.spirit-gym-hud__weapon-vitals`),g=s.querySelector(`.spirit-gym-hud__weapon-health`),_=s.querySelector(`.spirit-gym-hud__weapon-phase`),v=f?Math.max(0,Math.min(1,f.health/Math.max(1,f.maxHealth))):0,y=f?Math.max(0,Math.min(1,f.qi/Math.max(1,f.maxQi))):0;h.style.setProperty(`--qi-angle`,`${(y*360).toFixed(2)}deg`),g.style.setProperty(`--health-angle`,`${(v*360).toFixed(2)}deg`);let b=!!l&&(t.readAutomaticAttack?.(n)??!0);S(s,b,u??`空武器位`),l||s.setAttribute(`aria-label`,`空武器位`),s.disabled=!l,_.textContent=l?b?p?`术`:Ft(f?.resourcePhase??``):`歇`:``,h.hidden=!!p||!c,r&&(s.dataset.rarity=c?String(i.weaponRarities?.[n]??1):`0`,h.hidden=!c,h.style.setProperty(`--wpn-charge`,String(y)),s.classList.toggle(`play-hud-wpn--empty`,!c),s.querySelector(`.play-hud-wpn__gem`).hidden=!!c,c||(s.querySelector(`.play-hud-wpn__name`).textContent=`武${n+1}·空`),w(s,u??`武${n+1}·空`)),h.setAttribute(`aria-hidden`,h.hidden?`true`:`false`),s.title=c?`${u} · ${p?`每次消耗本人 ${p.tiers[0].qiCost} 灵力 · ${b?`自动施法`:`已停用`}`:f?`器命 ${te(f.health,f.maxHealth,`/`)} · 灵力 ${f.qi.toFixed(1)}/${f.maxQi.toFixed(1)} · 出鞘门槛 ${f.minimumLaunchQi.toFixed(1)} · ${f.bodyCount} 剑体${f.disabledBodyCount>0?` · ${f.disabledBodyCount} 失能`:``} · ${Ft(f.resourcePhase)}`:`资源尚未同步`} · 精通 ${d?.level??1}级 · 击杀 ${d?.kills??0} · 经验 ${d?.experience??0}/${d?.nextExperience??0}`:`${e.loadout.weapon.emptyTitle} ${n+1} · 空`,r&&(s.dataset.detail=s.title,s.removeAttribute(`title`))}r&&(U<0||B[U].disabled)&&ge(B.findIndex(e=>!e.disabled));for(let t=0;t<V.length;t+=1){let n=V[t],r=a.loadout.gearIds[t],i=a.loadout.gearLevels[t]??0;n.classList.toggle(`is-filled`,r!==null),n.classList.toggle(`is-gear`,r!==null),n.dataset.definitionId=r??``,n.dataset.level=String(i);let o=`${e.loadout.gear.shortLabel}${t+1}`;n.querySelector(`.spirit-gym-hud__slot-name`).textContent=r?g[r].name:`${o} · 空`,n.querySelector(`.spirit-gym-hud__slot-meta`).textContent=r?`Lv.${i} · ${h(r,i)}`:`未装备`,n.title=r?`${g[r].name} · Lv.${i}/${g[r].maxLevel} · ${h(r,i)}`:`${e.loadout.gear.emptyTitle} ${t+1} · 空`}},handleInput(i){(t.menu?.isOpen||i.uiCancel)&&R?.hide(),n.dataset.inputDevice!==i.activeDevice&&(n.dataset.inputDevice=i.activeDevice);let a=i.activeDevice===`gamepad`?e.copy.gamepadHint:i.activeDevice===`touch`?e.copy.touchHint:e.copy.keyboardHint;de.textContent!==a&&(de.textContent=a),(i.activeDevice===`touch`||i.touch.moveActive)&&(n.style.setProperty(`--touch-origin-x`,`${i.touch.moveOriginX*100}%`),n.style.setProperty(`--touch-origin-y`,`${i.touch.moveOriginY*100}%`),n.style.setProperty(`--touch-stick-x`,`${i.touch.moveX*30}px`),n.style.setProperty(`--touch-stick-y`,`${i.touch.moveY*30}px`)),fe.classList.toggle(`is-active`,i.touch.moveActive),pe.classList.toggle(`is-active`,i.touch.jumpActive),me.classList.toggle(`is-active`,i.touch.dashActive),r&&(t.mount.querySelector(`.play-hud-sys`)?.classList.toggle(`play-hud-sys--touch`,i.activeDevice===`touch`),pe.classList.toggle(`play-hud-touch-btn--pressed`,i.touch.jumpActive),me.classList.toggle(`play-hud-touch-btn--pressed`,i.touch.dashActive))},dispose(){A.forEach(e=>e.dispose()),R?.dispose(),a(),i(),n.remove()}}}var Bt=s;function Vt(e,t,n,r){let i=d(n);if(!e||e.version!==1||!Number.isSafeInteger(e.revision)||e.revision<0||!e.ranks||typeof e.ranks!=`object`||Array.isArray(e.ranks)||Object.getPrototypeOf(e.ranks)!==Object.prototype)return[{code:`invalid`,message:`天赋存档格式无效，未应用其中的效果`}];let a=new Map(t.map(e=>[e.id,e])),o=[],s=0;for(let[t,n]of Object.entries(e.ranks)){let c=a.get(t);if(!c||!Number.isSafeInteger(n)||n<1||n>c.ranks.length)o.push({code:`invalid`,nodeId:t,message:`天赋等级无效：${c?.name??t}`});else{s+=n,p(c.board,r)||o.push({code:`disabled`,nodeId:t,message:`${c.name}所属技能板在本局未开启`}),c.ranks[n-1].realmLevel>i&&o.push({code:`realm`,nodeId:t,message:`${c.name}需要修炼到第 ${c.ranks[n-1].realmLevel} 个小境界`});for(let n of c.prerequisites)(e.ranks[n.id]??0)<n.rank&&o.push({code:`prerequisite`,nodeId:t,message:`${c.name}需要${a.get(n.id)?.name??n.id} ${n.rank} 级`})}}return s>i&&o.push({code:`budget`,message:`需要 ${s} 点，当前境界共有 ${i} 点`}),o}var Ht=e=>Object.values(e.ranks).reduce((e,t)=>e+t,0),$=e=>({...e,ranks:{...e.ranks}}),Ut=(e,t)=>{let n=Object.keys(e.ranks);return n.length===Object.keys(t.ranks).length&&n.every(n=>e.ranks[n]===t.ranks[n])},Wt=class{definitions;cultivationLevel;committed;draft;history=[];applying=!1;rules;constructor(e,t,n,r){this.definitions=e,this.cultivationLevel=n,f(e),this.rules=a(r);let i=Vt(t,e,n,this.rules);if(i.length)throw Error(i.map(e=>e.message).join(`；`));this.committed=$(t),this.draft=$(t)}get allocation(){return $(this.draft)}get applied(){return $(this.committed)}get availablePoints(){return d(this.cultivationLevel)-Ht(this.draft)}get dirty(){return!Ut(this.draft,this.committed)}get canUndo(){return this.history.length>0}updateRealm(e){let t=Vt(this.draft,this.definitions,e,this.rules);if(t.length)throw Error(t.map(e=>e.message).join(`；`));this.cultivationLevel=e}previewChange(e,t){if(t!==1&&t!==-1||!this.definitions.some(t=>t.id===e))return{allocation:this.allocation,issues:[{code:`invalid`,message:`无效的天赋加点操作`}]};let n={...this.draft.ranks},r=(n[e]??0)+t;r===0?delete n[e]:n[e]=r;let i={...this.draft,ranks:n};return{allocation:i,issues:Vt(i,this.definitions,this.cultivationLevel,this.rules)}}change(e,t){if(this.applying)return[{code:`phase`,message:`正在保存天赋，请稍候。`}];let n=this.previewChange(e,t);return n.issues.length?n.issues:(this.remember(),this.draft=n.allocation,[])}remember(){this.history.length===128&&this.history.shift(),this.history.push($(this.draft))}undo(){if(this.applying)return;let e=this.history.pop();e&&(this.draft=e)}reset(){this.applying||Object.keys(this.draft.ranks).length&&(this.remember(),this.draft={...this.draft,ranks:{}})}discard(){this.applying||(this.draft=$(this.committed),this.history.length=0)}async apply(e,t,n){if(this.applying)return[{code:`phase`,message:`正在保存天赋，请勿重复应用。`}];if(e!==`preparation`)return[{code:`phase`,message:`战斗中可预览天赋；请在幕间整备应用或洗点`}];if(t!==this.committed.revision)return[{code:`stale`,message:`天赋已在其他操作中更新，请重新打开技能板`}];let r=Vt(this.draft,this.definitions,this.cultivationLevel,this.rules);if(r.length)return r;if(!this.dirty)return[];if(!Number.isSafeInteger(this.committed.revision+1))return[{code:`invalid`,message:`天赋版本号已超出有效范围，未应用草案`}];let i={...this.draft,revision:this.committed.revision+1};this.applying=!0;try{await n($(i)),this.committed=$(i),this.draft=$(i),this.history.length=0}finally{this.applying=!1}return[]}};function Gt(e,t,n,r){let i=Vt(e,t,n,r);if(i.length)throw Error(i.map(e=>e.message).join(`；`));let a=[];for(let n of t){m(n);let t=e.ranks[n.id]??0;if(t)for(let e of n.ranks[t-1].effectGrants)a.push({...e,giver:`talent`,sourceId:n.id})}return _(a)}export{zt as a,_t as c,vt as d,yt as f,Bt as i,St as l,Wt as n,Tt as o,xt as p,Ht as r,wt as s,Gt as t,bt as u};