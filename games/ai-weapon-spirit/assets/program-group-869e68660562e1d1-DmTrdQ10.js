import{t as e}from"./program-group-2a8e41bc58c54452-D2D1sqPP.js";import{i as t}from"./program-group-44cb0d4c6c27887d-BSiPHXSf.js";import{o as n}from"./program-group-0257312be7b25939-C12Fp4Rs.js";import{a as r,d as i,i as a,l as o,n as s,o as c,p as l,u}from"./program-group-5ab85ef54f680cae-ETygQLlg.js";import{t as d}from"./program-group-1127ac328ade2710-B411UVOq.js";import{n as f,t as p}from"./program-group-bb4103839bccbf8d-CRdw42SR.js";import{r as m}from"./program-group-f6a42328846395eb-D6JX51LB.js";var h=e=>e.replace(/[&<>"']/g,e=>({"&":`&amp;`,"<":`&lt;`,">":`&gt;`,'"':`&quot;`,"'":`&#39;`})[e]);function g(e,n){let r=e?.get(n)??e?.get(`affix`);return r?m(r):t(`talent`)}function _(e){let{id:t,icon:n,label:r,value:i,detail:a,badge:o,valueAttribute:s,explanation:c,pin:l,conditionBadge:u}=e,d=u===`proximity`?`<svg class="icon-stat__condition" data-stat-condition="proximity" viewBox="0 0 12 12" fill="none"><path d="M6 1 11 6 6 11 1 6Z" fill="var(--ui-card-surface)" stroke="currentColor" stroke-width="1.4"/><circle cx="6" cy="6" r="1.25" fill="currentColor"/></svg>`:``;return`<span class="icon-stat" tabindex="0"${l?` role="button" aria-expanded="false" data-detail-pin`:``} data-detail-key="${h(t)}" data-numerical="${h(t)}" aria-label="${h(`${r} ${i}${d?`；另有近主条件`:``}`)}" data-detail="${h(`${r}：${i}${a?`
`+a:``}`)}"><span class="icon-stat__icon" aria-hidden="true">${n}${o?`<small>${h(o)}</small>`:``}${d}</span><b${s?` ${s}`:``}>${h(i)}</b>${c?`<template data-stat-explanation><header class="stat-explanation__header"><strong>${h(r)}</strong><button type="button" data-dismiss-detail aria-label="关闭属性说明">×</button></header><div class="stat-explanation__body"><p>${h(a??``)}</p>${c}</div></template>`:``}</span>`}var v=`
.icon-stat-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(92px,1fr));gap:3px 8px}
.icon-stat{display:flex;align-items:center;justify-content:space-between;gap:7px;min-width:0;min-height:36px;padding:3px 6px;box-sizing:border-box;border:1px solid transparent;color:var(--ui-text)}
.icon-stat:hover,.icon-stat:focus-visible{outline:none;border-color:var(--ui-card-line);background:color-mix(in srgb,var(--ui-jade) 8%,var(--ui-card-surface))}
.icon-stat__icon{position:relative;display:block;flex:none;width:23px;height:23px;color:var(--ui-jade)}
.icon-stat__icon svg{display:block;width:100%;height:100%}.icon-stat__icon small{position:absolute;right:-4px;bottom:-5px;font:600 9px var(--ui-font-number);color:var(--ui-text);background:var(--ui-card-surface);padding:0 1px}
.icon-stat__icon .icon-stat__condition{position:absolute;right:-5px;bottom:-4px;width:12px;height:12px;color:var(--ui-jade)}
.icon-stat>b{font:600 13px/1.4 var(--ui-font-number);font-variant-numeric:tabular-nums;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
/* Keep the sticky heading above positioned stat icons as the detail scrolls. */
.stat-explanation__header{position:sticky;top:0;z-index:1;display:flex;align-items:center;justify-content:space-between;gap:8px;padding:8px 12px;border-bottom:1px solid var(--ui-card-line);background:var(--ui-card-surface)}
.stat-explanation__header>strong{min-width:0;overflow-wrap:anywhere}
.stat-explanation__header button{flex:none;min-width:32px;min-height:32px;border:0;background:none;color:var(--ui-text);font-size:20px}
/* Nested sticky formula sources stay above body rows, below the sibling header. */
.stat-explanation__body{isolation:isolate;padding:4px 12px 12px;white-space:normal}.stat-explanation__body p{font-size:11px;line-height:1.6;color:var(--ui-muted)}
.stat-explanation__body summary{min-height:36px;cursor:pointer}.stat-explanation__body h4{margin:12px 0 4px}
@media(pointer:coarse){.icon-stat{min-height:44px}}
`,y=e=>{let t=e.unit===`percent`?e.value*100:e.value,n={percent:`%`,seconds:` 秒`,count:` 次`,qi:` 灵力`,qiPerSecond:` 灵力/秒`,damagePerSecond:` 伤害/秒`,damage:``,factor:``}[e.unit];return Number(t.toFixed(3)).toLocaleString(`zh-CN`,{maximumFractionDigits:3})+n};function b(e,t=y(e)){let n=`${e.label}：${y(e)}\n${e.sources.join(`
`)}`;return`<button type="button" class="damage-formula__term" data-damage-term="${h(e.id)}" data-tone="${e.color}" data-source-text="${h(n)}" aria-label="${h(`${e.label} ${y(e)}，查看来源`)}"><small>${h(e.label)}</small><b>${h(t)}</b></button>`}var x=(e,t)=>`<div class="damage-formula__line"><strong>${e}</strong><div class="damage-formula__equation">${t}</div></div>`;function S(e,t=``){let n=t=>b(e.terms[t]),r=x,i=e.elements.filter(e=>e.raw>0||e.share>0||e.weaponAdded||e.ownerAdded||e.weaponIncrease||e.ownerIncrease),a=i.map(t=>{let i=t.element,a=[t.share?n(`base`)+(t.share===1?``:` × ${n(`${i}-share`)}`):``,t.weaponAdded?n(`${i}-added`):``,t.ownerAdded?n(`${i}-owner-added`):``].filter(Boolean).join(` + `)||`0`,o=[`local`,`${i}-increase`,`${i}-owner-increase`,`aura`].filter(t=>e.terms[t].value!==0),s=o.length?` × (1 + ${o.map(n).join(` + `)})`:``;return r(`${p[i]}伤`,`(${a})${s} × ${n(`common`)}${t.elementMultiplier===1?``:` × ${n(`${i}-affinity`)}`} ≈ ${n(`${i}-total`)}`)}).join(``);return`<section class="damage-formula" data-damage-formula>
    <h4>伤害构成与公式</h4><p>${f[e.school]} · 主元素${p[e.primaryElement]} · ${h(e.context)}</p>
    <p>学派决定人物属性和目标防御；五行是这次伤害的组成。基础与附加点伤先相加，同类增伤相加，独立倍率再相乘。</p>
    <div class="damage-formula__source" data-damage-source role="status" aria-live="polite">悬停、聚焦或点按任一彩色数字，查看具体来源。公式中的 1 是倍率基准；负点伤和负增伤按战斗规则最低截为0。</div>
    ${r(`基础攻击`,`${n(`flat`)} + ${n(`power`)} × ${n(`coefficient`)} ≈ ${n(`base`)}`)}
    ${r(`共用倍率`,`${n(`rarity`)} × ${n(`mastery`)} × ${n(`tuning`)} × ${n(`mechanism`)} ≈ ${n(`common`)}`)}
    ${a}
    ${r(`单次合计`,`${i.map(e=>n(`${e.element}-total`)).join(` + `)||`0`} ≈ ${n(`ordinary`)}`)}
    ${e.canCrit?r(`暴击期望`,`1 + ${n(`chance`)} × (${n(`critical`)} − 1) ≈ ${n(`expectation`)}`):r(`暴击`,n(`expectation`))}
    ${r(`单次直击（中间结果）`,`${n(`ordinary`)} × ${n(`expectation`)} ≈ ${n(`expected`)}`)}
    ${t}
    <details><summary>参考条件与触发收益</summary>${e.notes.map(e=>`<p>${h(e)}</p>`).join(``)}</details>
  </section>`}function C(e){let t=t=>{let n=t.target instanceof Element?t.target.closest(`[data-damage-term]`):null;if(!n||!e.contains(n))return;let r=n.closest(`[data-damage-formula]`),i=r?.querySelector(`[data-damage-source]`);i&&(i.textContent=n.dataset.sourceText??``,r.querySelector(`[data-source-selected]`)?.removeAttribute(`data-source-selected`),n.setAttribute(`data-source-selected`,`true`))};return e.addEventListener(`pointerover`,t),e.addEventListener(`focusin`,t),e.addEventListener(`click`,t),()=>{e.removeEventListener(`pointerover`,t),e.removeEventListener(`focusin`,t),e.removeEventListener(`click`,t)}}var w=`
.damage-formula{white-space:normal;font-size:12px;color:var(--ui-card-text)}
.damage-formula h4{margin:5px 0}.damage-formula p{line-height:1.65}
.damage-formula__line{padding:9px 0;border-bottom:1px solid var(--ui-card-line)}
.damage-formula__line>strong{display:block;margin-bottom:5px;font-size:11px;color:var(--ui-muted)}
.damage-formula__equation{display:flex;flex-wrap:wrap;align-items:center;gap:4px;line-height:1.9}
.damage-formula__term{display:inline-flex;flex-direction:column;align-items:center;gap:1px;max-width:100%;min-width:42px;padding:3px 5px;background:var(--ui-raised);border:1px solid transparent;border-radius:4px;color:var(--ui-card-text);cursor:help;font:inherit}
.damage-formula__term small{font-size:9px;line-height:1.3}.damage-formula__term b{font:600 13px/1.5 var(--ui-font-number);font-variant-numeric:tabular-nums;overflow-wrap:anywhere}
${Object.entries(d).map(([e,t])=>`.damage-formula__term[data-tone=${e}]{color:color-mix(in srgb,var(--ui-card-text) 55%,${t})}`).join(``)}
.damage-formula__term[data-tone=increase]{color:var(--ui-qi-light)}
.damage-formula__term[data-tone=factor]{color:var(--ui-bronze-light)}
.damage-formula__term[data-tone=critical]{color:color-mix(in srgb,var(--ui-card-text) 55%,var(--ui-health-light))}
.damage-formula__term:hover,.damage-formula__term:focus-visible,.damage-formula__term[data-source-selected]{border-color:currentColor;outline:none}
.damage-formula__source{position:sticky;top:41px;z-index:1;height:108px;overflow:auto;box-sizing:border-box;margin:10px 0;padding:9px;background:var(--ui-recessed);border-left:2px solid var(--ui-jade);white-space:pre-line;overflow-wrap:anywhere;line-height:1.7;font-size:11px}
@media(pointer:coarse){.damage-formula__term{min-height:44px;min-width:44px;justify-content:center}}
`;function T(e){let t=e.contribution===void 0&&e.automaticAttackEnabled!==!1;return{result:t?e.solo:e.after,equipment:t?e.solo?.equipment[0]:e.contributionDetails,solo:t}}function ee(e,t){let{equipment:n,result:i,solo:a}=T(e);if(!n||!i||i.quality===`invalid`)return`<p>完整循环结果尚不可用；单次直击不是上方的每秒伤害。</p>`;let o=n.ideal,s=n.referenceTarget!==void 0,c=a?`本器单件参考，按开启自动释放计算；移除其他攻击器物，保留防具与已学天赋。`:`本器在当前／试配配装中的${s?`试演参考`:`标准`}贡献，与上方伤害数字读取同一结果。`,l=(e,t,n,r,i,a,o)=>b({id:`dps-${e}`,label:t,value:n,unit:r,color:i,sources:a},o),u=i.aggregation===`independent-standard`,d=l(`final`,s?`试演参考秒伤`:u?`标准秒伤`:`持续输出估计`,n.dps,`damagePerSecond`,`base`,[c,`完整循环伤害 ÷ 实际循环时间 + 持续状态伤害。计算使用未舍入值；上方主值紧凑显示，此处保留完整数字。`],t);if(!o)return x(`最终结果 · 与上方伤害数字一致`,`${l(`measured-damage`,`本器累计伤害`,n.damage,`damage`,`base`,[c])} ÷ ${l(`measured-seconds`,`统计时长`,i.measuredSeconds,`seconds`,`factor`,[`同一测量窗口，包含实际攻击与供灵等待。`])} ≈ ${d}`);let f=[...o.notes];n.referenceTarget&&f.push(`采用本器展示目标：距离 ${r(n.referenceTarget.distanceMeters,3)} 米、半径 ${r(n.referenceTarget.radiusMeters,3)} 米；伤害按中立无防御计算。`);let p=l(`cycle-damage`,`完整循环伤害`,o.damagePerCycle,`damage`,`base`,[c,`本器每循环 ${r(o.hitsPerCycle,3)} 次接触；按每次命中的实际招式、首击／留印、范围 tick 等规则合计，不把每击都当作上面的一次常态直击。`,...f]),m=o.cycleSeconds===null?``:l(`cycle-seconds`,`实际循环时间`,o.cycleSeconds,`seconds`,`factor`,[u?`已计入本器起手、充能、外飞／持续、返航、补灵和每秒 1 灵力预算；各器不争身体指令时间。`:`已计入本器起手、充能、外飞／持续、返航、补灵和整套共享指令的限制。`,`机械周期：${o.mechanicalSeconds===null?`无法完成`:r(o.mechanicalSeconds,5)+` 秒`}；瓶颈：${o.bottleneck??`完整循环`}。`,...f]),h=o.statusDamagePerSecond??0,g=h?` + ${l(`status`,`持续状态秒伤`,h,`damagePerSecond`,`increase`,[u?`本器独立木桩，按自身施加间隔、持续时间与层数上限估计；不与其他器物分摊状态，不默认队友供印。`:`同一目标的同名状态共享上限，按施加速率分摊期望；不精确复现每次覆盖和归属。`,...f])}`:``,_=x(`循环与供灵`,`${l(`hits`,`每循环接触`,o.hitsPerCycle,`count`,`base`,[`由本器执行规则、飞行／巡击与载灵容量决定；多剑体按实际数量合计。`])}
    ${l(`net-qi`,`每循环净耗灵`,o.netQiPerCycle,`qi`,`increase`,[`总耗灵 ${r(o.grossQiPerCycle,5)} − 自产／回收 ${r(o.selfQiPerCycle,5)}。`,...f])}
    ${l(`supply`,u?`独立预算内取灵`:`分配供灵`,o.supplyQiPerSecond,`qiPerSecond`,`increase`,[u?`本件独立预算每秒 1 灵力；余量不转给其他器物，当前人物回灵另见共享持续估计。`:`${c}人物供给共 ${r(i.ideal?.ownerSupplyQiPerSecond??0,5)} 灵力/秒；按整套分配并计入共享指令限制。`])}`),v=o.ownerCycle,y=o.sustainedCycle,S=y?x(`有限巡击 · 带余灵归巢`,`${l(`quota`,`计划接触`,y.contactsPerSortie,`count`,`base`,[`在当前可支付的次数中比较完整长期收益；真实完整支付命中与续穿费后推进。失靶、破损或缺灵可提前返航。`])}
    ${l(`return-qi`,`归巢余灵`,y.returnQi,`qi`,`base`,[`归巢保留实际剩余灵力，只补缺口，不每趟清空。`])}
    ${l(`self-qi`,`全程自产`,y.selfQiRegenPerSecond,`qiPerSecond`,`increase`,[`归位、蓄势、外飞和返航均可自行回复，满库部分不累计；此值只计稳定的本器来源。范围额外回灵取决于实际覆盖。`])}`):``;return`<h4>从单次伤害到每秒伤害</h4><p>单次直击是中间结果。完整循环还可能有多次命中及条件招式；以下使用本器完整循环，最终单位为伤害/秒。</p>${_}
    ${v?x(`自动发剑 · 灵力账本`,`${l(`departure-qi`,`起飞前器气`,v.departureQiBeforeCost,`qi`,`base`,[`自动门槛为 ${r(v.launchThresholdQi,5)} 灵；达到门槛后继续起手、蓄势和传灵，未假设容量全满。`])}
    ${l(`near-transfer`,`离身传灵`,v.nearOwnerTransferQi,`qi`,`increase`,[`离开主人传灵范围前仍收到的灵力，已同时计入剑气和主人付款。`])}
    ${l(`home-wait`,`归位补气等待`,v.waitForThresholdSeconds,`seconds`,`factor`,[`按归巢时主人和剑的实际库存，计算补到自动门槛所需时间；包含等待主人回灵。`])}
    ${l(`owner-overflow`,`主人溢出`,v.ownerOverflowQi,`qi`,`base`,[`主人容量有限。每轮：供灵速率 × 循环时间 = 主人付款 + 溢出；没有每轮免费补满角色。`])}`):``}
    ${S}
    ${o.cycleSeconds===null?`<p>当前无法形成持续攻击循环，直击秒伤为 0。</p>`:``}
    ${x(`最终结果 · 与上方伤害数字一致`,`${m?`${p} ÷ ${m}`:`0`}${g} ≈ ${d}`)}`}var E=e=>`${Math.round(e*100)}%`,D=`无低血护持时，综合生存 =（气血上限 + 持续回血/秒 × ${i} 秒）÷ 加权承伤比例。表示满血开始，在 ${i} 秒连续细小来伤下可承受的原始总伤害。固定参考：物理 ${E(u)}、术法 ${E(1-u)}；两类伤害均按${Object.entries({metal:`金`,wood:`木`,water:`水`,fire:`火`,earth:`土`}).map(([e,t])=>`${t} ${E(o[e])}`).join(`、`)}计算五行承伤。计入双防、五行实抗及承伤倍率；单系免疫只免除该系份额。采用同境界、无攻击者亲和及克制的参考，不代表本关敌群。有低血护持时，按实际血线分段，取各段最强减伤，与持续回血共同计算耗尽满血的来伤；大额跨血线首击不享受回溯保护。仅计无需等待的持续回血；未受伤回血、移速、定势、抗推与其它触发条件效果另列。未受伤回血需要连续一段时间未受伤，不需要离开战斗。`,O=`不需要离开战斗。气血、防具或护盾受到实际伤害时重新计时；完全没有损耗的接触不重置等待。受击硬直、完全定身或无敌时暂停回血；元素免疫技能准备或生效期间也暂停。暂停回血时，未受伤的等待计时仍继续。这项条件回复不计入持续承伤主值。`,k=`低血护持已计入连续细小来伤的理想承伤值；大额跨血线首击不享受回溯保护。同一血线取最强保护，关闭自动施放仍保留，卸装失效。`;function A(e){let t=e?.healthWards??[];return t.length?[...new Map(t.map(e=>[JSON.stringify(e),e])).values()].map(e=>`${e.name}：受击前气血≤${E(e.healthRatio)}时，本次伤害再降低${E(1-e.damageTakenMultiplier)}。`).join(``)+k:``}var j=e=>e.replace(/[&<>"']/g,e=>({"&":`&amp;`,"<":`&lt;`,">":`&gt;`,'"':`&quot;`,"'":`&#39;`})[e]),M=e=>`${Math.round(e*100)}%`,N={lead:`从满血开始，估算连续承伤 ${i} 秒时能承受的原始伤害。`,included:`气血上限、无需等待的持续回血、双防、五行实抗与承伤倍率。`,excluded:`未受伤回血、移速、定势、抗推与其他条件触发效果另看各自说明，不计入这个主值。`,limit:`这是同境界的固定参考，不代表当前敌群；跨低血线的大额首击不补算减伤。`,formula:`无低血护持时：（气血上限 + 持续回血/秒 × ${i} 秒）÷ 加权承伤比例。`,damage:`参考来伤：物理 ${M(u)}、术法 ${M(1-u)}；两类均按${[[`metal`,`金`],[`wood`,`木`],[`water`,`水`],[`fire`,`火`],[`earth`,`土`]].map(([e,t])=>`${t} ${M(o[e])}`).join(`、`)}计算。`,immunity:`单系免疫只免除该系份额；参考不含攻击者亲和与五行克制。`,ward:`低血护持按实际血线分段，取各段最强减伤，并与持续回血共同计算。`,healing:`未受伤回血需要连续一段时间未受伤，不需要离开战斗；它不属于无需等待的持续回血。`};function P(e=e=>e){let t=t=>j(e(t));return`<p class="detail-description__lead">${t(N.lead)}</p>
    <dl class="detail-description__facts"><div><dt>${t(`计入`)}</dt><dd>${t(N.included)}</dd></div><div><dt>${t(`另看`)}</dt><dd>${t(N.excluded)}</dd></div></dl>
    <p class="detail-description__note">${t(N.limit)}</p>
    <details class="detail-description__more" data-description-fold data-numerical-fold="survival-rules"><summary>${t(`计算依据与完整规则`)}</summary>
      <section><h4>${t(`计算方式`)}</h4><p>${t(N.formula)}</p><p>${t(N.damage)}</p><p>${t(N.immunity)}</p></section>
      <section><h4>${t(`低血护持与回复`)}</h4><p>${t(N.ward)}</p><p>${t(k)}</p><p>${t(N.healing)}</p></section>
    </details>`}function F(e){return e.match(/[^。！？!?]+[。！？!?]+|[^。！？!?]+$/g)?.flatMap(e=>e.split(/(?<=[.!?])\s+(?=[A-Z"“])/).filter(Boolean))??[e]}function I(e,t=e=>e){let n=e.indexOf(D);if(n>=0){let r=e.slice(0,n).trim(),i=e.slice(n+D.length).replace(k,``).trim(),a=i?`<div class="detail-description__context">${j(t(i))}</div>`:``;return`${r?`<h3 class="detail-description__title">${j(t(r))}</h3>\n`:``}${P(t)}${a}`}let r=t(e),i=r.split(/\n+/).filter(e=>e.trim()),a=i.length>1&&i[0].length<150?i.shift():void 0,o=i.flatMap(F),s=o.shift()??``,c=o.map(e=>`<p>${j(e.trim())}</p>`).join(``),l=o.length>0&&(o.length>2||i.join(``).length>(/[\u3400-\u9fff]/.test(r)?140:400)),u=a?`<h3 class="detail-description__title">${j(a)}</h3>\n`:``;return l?u+`<p class="detail-description__lead">${j(s.trim())}</p><details class="detail-description__more" data-description-fold><summary>${j(t(`详细说明`))}</summary>${c}</details>`:u+`<p class="detail-description__lead">${j(i.join(`
`))}</p>`}function te(e,t,n){let r=e.createElement(`template`);return r.innerHTML=`<div class="detail-description" data-i18n-skip>${I(t,n)}</div>`,r.content}var L=[[`metal`,`金`],[`wood`,`木`],[`water`,`水`],[`fire`,`火`],[`earth`,`土`]];function R(e){return`${r(e.rating)} 点 · ${e.immune?`免疫`:`实抗 ${r(e.reduction*100)}%`}`+(e.damageTakenMultiplier===1?``:` · 元素承伤 ×${r(e.damageTakenMultiplier,3)}`)}function ne(e){return e===`live`?`当前实抗：包含已生效状态、环境削抗与动态免疫。`:`标准参考：不含临时状态、环境削抗与动态免疫。`}var z=`抗性点数经曲线换算，再计入比例抗性加成与环境扣减；负实抗表示易伤。元素承伤倍率单独相乘，不折算为抗性点数。`,B=e=>e.replace(/[&<>"']/g,e=>({"&":`&amp;`,"<":`&lt;`,">":`&gt;`,'"':`&quot;`,"'":`&#39;`})[e]),V=e=>`${r(e*100)}%`,H=(e,t,n=``)=>`<div${n?` data-numerical="${n}"`:``}><span>${e}</span><b>${B(t)}</b></div>`,U=e=>Number.isFinite(e)?e.toLocaleString(`zh-CN`,{notation:`compact`,useGrouping:!1,maximumFractionDigits:Math.abs(e)>=1e3&&Math.abs(e)<1e4?0:1}):`—`,W=e=>Math.abs(e)<1e3||!Number.isFinite(e)?c(e):`${e>=0?`+`:``}${U(e)}`,G=e=>!e||e.quality===`invalid`?a(e):`${e.quality===`stable`?``:`≈`}${U(e.dps)}`;function K(e){return e?l(e):void 0}var q=(e,t=1)=>{let n=K(e);return n===void 0?`—`:n===null?`免伤`:r(n,t)};function J(e,t){let n=K(e),r=K(t),i=typeof n==`number`&&typeof r==`number`?r-n:void 0,a=n===void 0||r===void 0?void 0:r===null?n===null?`保持免伤`:`获得免伤`:n===null?`失去免伤`:void 0;return{gain:i,immunity:a,text:a??(i===void 0?`—`:c(i))}}function Y(e,t){let n=[],i=(e,t,i,a)=>{t!==i&&n.push(`${e}${i>t?`提高`:`降低`} ${r(Math.abs(i-t),3)} ${a}（${r(t,3)} → ${r(i,3)}）`)};for(let[r,a]of L){let o=e.elementalResistance[r],s=t.elementalResistance[r];i(`${a}行抗性`,o.rating,s.rating,`点`),o.immune===s.immune?o.immune||i(`${a}行实抗`,o.reduction*100,s.reduction*100,`个百分点`):n.push(`${s.immune?`获得`:`失去`}${a}行免疫`),i(`${a}行元素承伤倍率`,o.damageTakenMultiplier,s.damageTakenMultiplier,`倍`)}return n.length?`五行防御明细：${n.join(`；`)}。`:``}function re(e,t,n=!1){return`<p>${ne(e.resistanceContext)}${t?n?`以下为当前 → 换装后。`:`以下为不含本件 → 包含本件。`:``}</p>`+L.map(([n,r])=>H(`${r}行抗性`,(t?`${R(t.elementalResistance[n])} → `:``)+R(e.elementalResistance[n]),`${n}-resistance`)).join(``)+`<p>${z}</p>`}function ie(e,r,i=!1){let o=t=>e?.empty?`0`:!t||t.quality===`invalid`?`—`:G(t),s=(e,n,r,a,o)=>`<span class="strength-readout__stat" ${i?`data-detail`:`title`}="${B(a)}" aria-label="${B(`${n} ${r}`)}">${t(e)}<b ${o}>${B(r)}</b></span>`,c=e?.empty?`0`:e?.standard?a(e.standard):`—`,l=e?.error??(e?.standard?.quality===`invalid`?e.standard.reason:e?.pending?`当前配装读数正在更新`:e?void 0:`当前配装读数尚未就绪`),u=e?.standard?.equipment.some(e=>e.referenceTarget),d=u?`试演参考总秒伤`:`标准总秒伤`,f=`${d}：${c} 伤害/秒。${u?`每件各 1 灵力/秒，按各器自己的参考目标与完整周期求和；距离和模型见详情。`:n}${l?`当前结果：${l}。`:``}点击查看角色详情。`,p=`综合生存：${q(r,3)} 承伤点。${D}${A(r)}计入${r?.resistanceContext===`live`?`当前属性、抗性与环境`:`参考属性与抗性`}。点击查看角色详情。`;return s(`standardDps`,d,o(e?.standard),f,`data-current-dps`)+s(`physicalGuard`,`综合生存`,q(r),p,`data-survival`)}function ae(e,t){if(!e.firstElementChild){e.innerHTML=t;return}let n=e.ownerDocument.createElement(`template`);n.innerHTML=t;for(let t of[`data-current-dps`,`data-survival`]){let r=e.querySelector(`[${t}]`),i=n.content.querySelector(`[${t}]`);if(!r?.parentElement||!i?.parentElement)throw Error(`[HUD] Missing compact strength value ${t}`);r.textContent=i.textContent;for(let e of[`title`,`aria-label`,`data-detail`]){let t=i.parentElement.getAttribute(e);t===null?r.parentElement.removeAttribute(e):r.parentElement.setAttribute(e,t)}}}function oe(e,t){let n=e?.empty?`未装武器`:e?.error&&!e.standard?`不可用`:a(e?.standard),i=t?.conditionalRegeneration.reduce((e,t)=>e+t.healthPerSecond,0)??0,o=t?.continuousHealthPerSecond||i,s=t?.continuousHealthPerSecond?`回血`:i?`未受伤回血`:`回血`;return`<div class="strength-readout__headline"><span>${e?.standard?.equipment.some(e=>e.referenceTarget)?`试演参考总秒伤`:`标准总秒伤`} <small>伤害/秒</small></span><b data-current-dps>${B(n)}</b></div>
    ${t?`<div class="strength-readout__survival">气血 <b>${r(t.maximumHealth,0)}</b> · ${s} <b>${r(o)}</b>/秒</div><div class="strength-readout__survival">减伤 · 物理 <b>${V(t.physicalReduction)}</b> · 术法 <b>${V(t.spellReduction)}</b></div>`:``}`}function X(e,t=``){if(e.quality===`invalid`)return`<p>${B(e.reason)}</p>`;if(e.ideal)return ce(e,t);let n=e.qi;return`<div class="numerical-evidence">${H(`测量状态`,s(e))}
    ${H(`伤害 ÷ 秒数 = 秒伤`,`${r(e.damage)} ÷ ${r(e.measuredSeconds)} = ${r(e.dps)}`,`dps-equation`)}
    ${H(`灵力效率`,e.damagePerQi===null?`未消耗灵力`:`${r(e.damagePerQi)} 伤害/灵力`)}
    <p>先运行 ${r(e.warmupSeconds)} 秒进入循环，再统计上述时间。所有装备共享本人供灵；装备自身产灵按实际机制保留，见下方账本。</p>
    <p>木桩距本人 ${e.target.distanceMeters} 米、半径 ${e.target.radiusMeters} 米，五行中立、无防御。全自动出击，包含充能、起手、飞行、命中耗灵与归位。</p>
    <details data-numerical-fold="${t}${e.supply}-ledger"><summary>灵力去了哪里</summary><div class="numerical-evidence">
    ${H(`期初储量`,r(n.startingStored))}
    ${H(`＋ 新供给`,r(n.supplied))}
    ${H(`－ 最终消耗`,r(n.spent))}
    ${H(`－ 溢出损失`,r(n.discarded))}
    ${H(`＝ 期末储量`,r(n.stored))}
    <p>储量包含本人及所有装备。供给来自本人 ${r(n.ownerSupplied)}、剑体自回 ${r(n.swordSelfSupplied)}；消耗来自本人 ${r(n.ownerSpent)}、装备 ${r(n.weaponSpent)}。</p>
    <p>本人转给剑体 ${r(n.internalTransfers)} 灵力，是内部转移，已包含在储量流动中，不重复算消耗。灵力效率 = ${r(e.damage)} 伤害 ÷ ${r(n.spent)} 消耗。</p>
    </div></details>
    <details data-numerical-fold="${t}${e.supply}-cycles"><summary>${e.equipment.length>1?`逐件贡献与飞行循环`:`飞行循环与器命`}</summary>
    <p>贡献来自这次同场测量。阶段时间为抽样近似值，同一装备的多个剑体分别累计；阶段时长不用于反推伤害。</p>
    ${e.equipment.map(de).join(``)}</details>
    ${e.quality===`stable`?``:`<p>${B(e.reason)}</p>`}</div>`}function se(e,t,n,i){let a=e.sustainedCycle;return a?`${H(`本趟计划`,`${a.contactsPerSortie} 次完整付款接触后返航；可因失靶、破损或缺灵提前结束`)}
    ${H(`全程自产`,`${r(a.selfQiRegenPerSecond,3)} 灵/秒；满库部分不累计`)}
    ${H(`满灵后准备 / 归巢余灵 / 补满缺口`,`${r(a.preparationSeconds,3)} 秒 / ${r(a.returnQi,3)} 灵 / ${r(a.returnDeficitQi,3)} 灵`)}
    ${H(`补灵下限：传导 / 有限气库 / 持续供灵`,`${r(a.rechargeBounds.transferSeconds,3)} / ${r(a.rechargeBounds.finiteInventorySeconds,3)} / ${r(a.rechargeBounds.renewableSupplySeconds,3)} 秒`)}
    <p>在可完整支付的次数中比较每轮伤害 ÷ 完整周期，选择长期收益最高的一项。实战沿动态目标飞行；下列账目是标准中立木桩参考，使用实际费用并保留余灵。</p>
    <details data-numerical-fold="${B(t+n+`-sustained-`+i)}"><summary>逐次付款与等待</summary>
      ${H(`等待命中间隔 / 满灵等待动作`,`${r(a.waitingSeconds,3)} / ${r(a.fullSwordIdleSeconds,3)} 秒`)}
      ${a.contacts.map((e,t)=>H(`第 ${t+1} 次：命中前 → 命中后 → 续穿后`,`${r(e.qiBefore,3)} → ${r(e.qiAfterImpact,3)} → ${r(e.qiAfterPenetration,3)} 灵`)).join(``)}
    </details>`:``}function ce(e,t){let n=e.ideal,i=e.aggregation===`independent-standard`,a=e.equipment.some(e=>e.referenceTarget?.kind===`native-fixed-contact-neutral/1`),o=e.equipment.some(e=>e.ideal?.sharedCharge),s=e.aggregation??e.supply;return`<div class="numerical-evidence" data-dps-mode="${s}">${H(`计算口径`,a?e.equipment.length===1?`试演参考秒伤 · 单剑 1 灵力/秒`:`试演参考总秒伤 · 每件各 1 灵力/秒`:i?`标准总秒伤 · 每件各 1 灵力/秒`:e.supply===`current`?`当前配装持续输出 · 解析估计`:`理想长期平均 · 数学公式`)}
    ${H(`整套秒伤`,`${e.equipment.map(e=>r(e.dps,2)).join(` + `)||`0`} = ${r(e.dps,2)} 伤害/秒`,`dps-equation`)}
    ${H(i?`独立参考总预算`:e.supply===`total`?`理想循环需灵`:`本人供灵`,`${r(n.ownerSupplyQiPerSecond,3)} 灵力/秒${i?`，各件预算独立，余额不转让`:e.supply===`total`?`，供灵充足的能力参考`:`，整套共享`}`)}
    ${n.ownerRecoveryQiPerSecond===void 0?``:H(`当前本人回灵`,`${r(n.ownerRecoveryQiPerSecond,3)} 灵力/秒`)}
    ${H(`循环实际需求 / 剩余供灵`,`${r(n.allocatedQiPerSecond,3)} / ${r(n.unusedQiPerSecond,3)} 灵力/秒`)}
    ${H(`灵力效率`,e.damagePerQi===null?`循环无需净外部供灵`:`${r(e.damagePerQi,2)} 伤害/实际消耗灵力`)}
    <p>${a?`试演参考总秒伤 = 各启用器物参考贡献之和。固定巡击按本器全部接触的平均伤害 ÷ 完整长期周期；计入指令、起手、蓄势、各段飞行、返航与归位补灵。每件各 1 灵力/秒，不争指令，不转让余量。各器的路线与参考距离见下方；目标伤害按中立无防御计算。`:i?`每件标准秒伤 = 每循环平均伤害 ÷ 完整供灵循环时间 + 本器独立状态秒伤；只汇总启用器物。已闭合的自动周期同时核对主人与剑的库存，其余采用满灵循环近似，具体见各器说明。自身动作计入周期，各器不争指令时间。光环仍取完整配装的参考位置，支援变化另计。`:e.supply===`total`?`每件理想秒伤 = 每循环平均伤害 ÷ 完整机械周期 + 状态伤害贡献；整套为各件之和。机械周期包含本器起手、飞行、返航和传灵充能。供灵充足、逐件独立评估；实际共享回灵与人物指令限制见持续估计。`:o?`每件持续估计 = 每轮伤害 ÷ 共享充能周期 + 状态伤害。先固定自动门槛与起手补灵，再按各剑在身边充能的时间分配灵力；准备、外飞、返航和归位等待均计入。主人外飞期间积攒的灵力可用于返航后充能，各器平均取灵之和不超过本人回灵；最后保留身体指令上限。`:`每件持续估计 = 每循环平均伤害 ÷ max(机械周期, 净耗灵 ÷ 分配供灵) + 状态伤害贡献，再计入共享指令上限。分配量为 0 且需要外部供灵时，该装备不能持续输出。同名状态按平均施加速率分摊，不精确复现每次覆盖和攻击顺序。`}</p>
    <details data-numerical-fold="${t}${s}-assumptions"><summary>理想条件与未计入收益</summary>
      <p>${e.target.perEquipment?`各器分别使用下方列出的目标距离和半径。`:`${a?`试演目标中心`:`木桩`}距本人 ${r(e.target.distanceMeters,3)} 米。`}${n.assumptions.map(B).join(`；`)}。</p></details>
    <details open data-numerical-fold="${t}${s}-cycles"><summary>逐件公式与循环</summary>
    ${e.equipment.map(n=>{let a=n.ideal,o=a.heldArc?{distanceMeters:a.heldArc.targetDistanceMeters,radiusMeters:a.heldArc.targetRadiusMeters}:n.referenceTarget??e.target;return`<div class="numerical-equipment-evidence"><strong>${B(n.name)} · 阵位 ${n.slotIndex+1}</strong><div class="numerical-evidence">
        ${H(`参考目标`,`${a.heldArc?`刀刃范围内无甲木桩`:n.referenceTarget?`本器展示目标`:`普通中立木桩`} · 距离 ${r(o.distanceMeters,3)} 米 / 半径 ${r(o.radiusMeters,3)} 米`)}
        ${H(`周期模型`,a.bottleneck===`自动释放关闭`?`停发，不计算攻击周期`:a.heldArc?`手持弧扫与角色直接供灵`:a.sustainedCycle?`有限巡击与保余灵`:a.fixedContactCycle?`固定接触路线`:a.ownerCycle?`直线出入与巡击周期`:a.sharedCharge?`自动门槛与共享充能近似`:`满灵循环近似`)}
        ${H(`秒伤贡献`,`${r(n.dps,2)} 伤害/秒 · ${a.bottleneck}`)}
        ${H(`每循环平均伤害 / 命中`,`${r(a.damagePerCycle,2)} / ${r(a.hitsPerCycle,0)} 次`)}
        ${H(`净耗灵 = 总耗灵 − 自产灵`,`${r(a.netQiPerCycle,3)} = ${r(a.grossQiPerCycle,3)} − ${r(a.selfQiPerCycle,3)}`)}
        ${H(i?`独立预算内实际取灵`:a.sharedCharge?`每秒平均取灵`:`分到供灵`,`${r(a.supplyQiPerSecond,3)} 灵力/秒`)}
        ${a.limits?.sharedCommand?H(`共享指令放慢倍率`,`${r(a.limits.commandSlowdown,3)} 倍；${a.limits.allocationSupply?`分配供灵曾限制初始频率；最终由身体指令限制，取灵量随之减少`:`身体指令受限，供灵有余量`}`):``}
        ${a.sustainedCycle?se(a,t,s,n.instanceId):a.fixedContactCycle?`${H(`满灵后准备 / 归巢余灵 / 补满缺口`,`${r(a.fixedContactCycle.preparationSeconds,3)} 秒 / ${r(a.fixedContactCycle.returnQi,3)} 灵 / ${r(a.fixedContactCycle.returnDeficitQi,3)} 灵`)}
          ${H(`补灵下限：传导 / 主人气库 / 持续供给`,`${r(a.fixedContactCycle.rechargeBounds.transferSeconds,3)} / ${r(a.fixedContactCycle.rechargeBounds.finiteInventorySeconds,3)} / ${r(a.fixedContactCycle.rechargeBounds.renewableSupplySeconds,3)} 秒`)}
          ${H(`归位补灵时间 = 三者最大值`,`${r(a.refillSeconds,3)} 秒`)}
          ${H(`${a.fixedContactCycle.contacts.length} 击路程 / 锚点等待`,`${r(a.fixedContactCycle.outboundMeters,3)} 米 / ${r(a.fixedContactCycle.waitingSeconds,3)} 秒`)}
          <details><summary>${a.fixedContactCycle.contacts.length} 次接触与付款余额</summary>${a.fixedContactCycle.contacts.map((e,t)=>H(`第 ${t+1} 击 · 放剑后 / 付款前 → 命中后 → 续穿后`,`${r(e.sinceReleaseSeconds,3)} 秒 / ${r(e.qiBefore,3)} → ${r(e.qiAfterImpact,3)} → ${r(e.qiAfterPenetration,3)} 灵`)).join(``)}</details>`:a.sharedCharge?`${H(`自动门槛 / 起飞前器气 / 归巢器气`,`${r(a.sharedCharge.launchThresholdQi,3)} / ${r(a.sharedCharge.departureQiBeforeCost,3)} / ${r(a.sharedCharge.returnQi,3)} 灵`)}
          ${H(`起手参考速度 / 固定起手补灵`,`${r(a.sharedCharge.referenceSupplyQiPerSecond,3)} 灵/秒 / ${r(a.sharedCharge.preparationQi,3)} 灵`)}
          ${H(`归位需补灵 / 每轮主人供灵`,`${r(a.sharedCharge.thresholdDeficitQi,3)} / ${r(a.netQiPerCycle,3)} 灵`)}
          ${H(`同时充能参考速度 / 本器充能速度`,`${r(a.sharedCharge.serviceQiPerSecond,3)} / ${r(a.sharedCharge.chargingQiPerSecond,3)} 灵/秒`)}
          ${H(`归位等待 = 归位需补灵 ÷ 本器充能速度`,a.sharedCharge.waitForThresholdSeconds===null?`供灵为 0，无法补到门槛`:`${r(a.sharedCharge.thresholdDeficitQi,3)} 灵 ÷ ${r(a.sharedCharge.chargingQiPerSecond,3)} 灵/秒 = ${r(a.sharedCharge.waitForThresholdSeconds,3)} 秒`)}
          ${H(`门槛后准备`,`${r(a.sharedCharge.preparationSeconds,3)} 秒；已含固定起手补灵，不再次计时`)}
          <p>充能时的服务速度与整轮平均取灵不同。周期计入准备、外飞、返航和补到门槛的等待，再受身体动作限制；同一套装备的平均取灵之和不超过本人回灵。</p>`:a.ownerCycle?`${H(`自动门槛 / 起飞前器气 / 归巢器气`,`${r(a.ownerCycle.launchThresholdQi,3)} / ${r(a.ownerCycle.departureQiBeforeCost,3)} / ${r(a.ownerCycle.returnQi,3)} 灵`)}
          ${H(`归位补到门槛 / 门槛后准备`,`${r(a.ownerCycle.waitForThresholdSeconds,3)} / ${r(a.ownerCycle.preparationSeconds,3)} 秒`)}
          ${H(`离身近距传灵`,`${r(a.ownerCycle.nearOwnerTransferQi,5)} 灵（已计入主人付款）`)}
          ${H(`主人离身 / 归巢库存`,`${r(a.ownerCycle.ownerAtDepartureQi,3)} / ${r(a.ownerCycle.ownerAtReturnQi,3)} 灵`)}
          ${H(`每轮主人溢出`,`${r(a.ownerCycle.ownerOverflowQi,5)} 灵`)}
          ${H(`每轮守恒`,`1 灵/秒 × ${r(a.cycleSeconds,5)} 秒 = ${r(a.netQiPerCycle,5)} 付款 + ${r(a.ownerCycle.ownerOverflowQi,5)} 溢出`)}`:a.transferQiPerSecond===void 0||a.autonomous?``:H(`补灵量 ÷ 传灵速度 = 时间`,`${r(a.netQiPerCycle,3)} 灵 ÷ ${r(a.transferQiPerSecond,3)} 灵/秒 = ${r(a.refillSeconds,3)} 秒`)}
        ${H(`机械周期 / 最终周期`,`${r(a.mechanicalSeconds,3)} / ${r(a.cycleSeconds,3)} 秒`)}
        ${a.heldArc?H(`起手 / 横扫 / 收招`,`${a.heldArc.windupFrames} / ${a.heldArc.activeFrames} / ${a.heldArc.recoveryFrames} 帧（60 帧/秒）`):H(`人物起手 / 器体蓄力`,`${r(a.bodySeconds,3)} / ${r(a.chargeSeconds,3)} 秒`)}
        ${a.firstContactSeconds===void 0?``:H(a.heldArc?`首击参考（资源就绪）`:a.firstContactBasis===`automatic-threshold`?`首击参考（自动门槛就绪）`:`首击参考（满灵）`,`${r(a.firstContactSeconds,3)} 秒`)}
        ${a.heldArc?H(`接触器损 / 自然养护`,`${r(a.heldArc.contactHealthCost,3)} 器命/目标 / ${r(a.heldArc.repairHealthPerSecond,3)} 器命/秒`):H(a.sharedCharge?`外飞巡击 / 返航 / 本器全速补灵`:`外飞巡击 / 返航 / 补灵`,`${r(a.outboundSeconds,3)} / ${r(a.returnSeconds,3)} / ${r(a.refillSeconds,3)} 秒`)}
        ${a.heldArc?H(`单目标器损 ÷ 自然养护`,`${r(a.heldArc.maintenanceSeconds,3)} 秒/击 · 与动作、供灵取最长间隔`):``}
        ${a.outboundMetersPerSecond===void 0?H(`持续阶段 / 冷却`,`${r(a.activeSeconds,3)} / ${r(a.cooldownSeconds,3)} 秒`):H(`出击 / 返航速度`,`${r(a.outboundMetersPerSecond,2)} / ${r(a.returnMetersPerSecond,2)} 米/秒`)}
        ${a.heldArc?.armorReference?le(a.heldArc.armorReference):``}
        ${a.statusDamagePerSecond?H(`持续伤害`,`${r(a.statusDamagePerSecond,2)} 伤害/秒`):``}
        ${a.notes.map(e=>`<p>${B(e)}</p>`).join(``)}
        ${a.firstContactSeconds===void 0?``:`<p>${a.heldArc?`首击从资源就绪起手开始，加上刀刃扫到近身木桩碰撞范围的时间；连续刀路按固定步结算，实际首击允许一帧内取整差异。`:a.fixedContactCycle||a.sustainedCycle?`首击从满灵就绪开始，计入指令、起手、蓄势及到目标碰撞范围的首次飞行；各接触间隔分别计算，不假设相等。`:`首击从资源就绪开始，按起手、蓄力及到本器木桩中心的飞行或生效延迟计算；实际碰撞可能更早。完整长期周期仍包含返航和补灵。`}</p>`}
      </div></div>`}).join(``)}</details></div>`}function le(e){return`${H(`护甲 ${e.armor} 的条件参考`,`${r(e.unmarkedDamagePerSecond,3)} → ${r(e.damagePerSecond,3)} 伤害/秒`)}
    ${H(`命中前 ${e.beforeHitStackProbabilities.map((e,t)=>t).join(` / `)} 层概率`,e.beforeHitStackProbabilities.map(e=>V(e)).join(` / `))}
    <p>每次正生命伤害后 ${V(e.chance)} 施加并刷新 ${r(e.durationSeconds,3)} 秒。逐层计算护甲减伤后取长期期望；无甲木桩收益为 0，此条件值不加进主秒伤。</p>`}var ue={"docked-charging":`归位补灵 / 等待出击`,departing:`离位出击`,"hunting-leg":`在外巡击`,returning:`返航`,"disabled-docked":`器命不足停摆`,ready:`就绪`,charging:`蓄力`,outbound:`外飞`,cooldown:`冷却`,idle:`待机`};function de(e){return`<div class="numerical-equipment-evidence"><strong>${B(e.name)} · 阵位 ${e.slotIndex+1}</strong>
    <div class="numerical-evidence">${H(`同场秒伤贡献`,`${r(e.damage)} 伤害 → ${r(e.dps)}/秒`)}
    ${H(`出击 / 接触次数`,`${e.launches} / ${e.contacts}`)}
    ${H(`每次接触对应伤害`,r(e.averageDamagePerContact))}
    ${Object.entries(e.phaseSeconds).map(([e,t])=>H(B(ue[e]??e),`约 ${r(t)} 秒`)).join(``)}
    ${e.remainingHealth===null?``:H(`结束时器命`,`${r(e.remainingHealth)} / ${r(e.maximumHealth)}`)}
    </div></div>`}function fe(e,t){let i=e?.standard?.equipment.some(e=>e.referenceTarget);return`<p>${i?`每个启用器物各按 1 灵力/秒的完整周期计算后相加；本组含展示路径参考，各器目标与模型见详情。当前共享估算单独说明。`:n}</p>
    ${e?.error?`<p role="status">${B(e.error)}</p>`:``}
    ${e?.standard?`<details open data-numerical-fold="standard-sum"><summary>${i?`试演参考总秒伤`:`标准总秒伤`} · 逐件贡献与计算依据</summary>${X(e.standard)}</details>`:`<p>配置变化后立即按同一公式计算。</p>`}
    ${e?.currentError?`<p role="status">当前配装持续估计不可用：${B(e.currentError)}。主读数单独计算。</p>`:``}
    ${e?.current?`<details data-numerical-fold="current"><summary>当前配装持续估计 · 共享供灵与指令</summary>${X(e.current)}</details>`:``}
    ${t?`<div class="detail-description">${P()}</div><div class="numerical-evidence">${H(`生存主值`,q(t))}${H(`持续回血`,`${r(t.continuousHealthPerSecond)} 气血/秒`)}${H(`物理有效气血`,t.physicalEffectiveHealth===null?`不承受此类伤害`:r(t.physicalEffectiveHealth,0))}${H(`术法有效气血`,t.spellEffectiveHealth===null?`不承受此类伤害`:r(t.spellEffectiveHealth,0))}${H(`移动速度`,`${r(t.moveMetersPerSecond)} 米/秒`)}<p>物理／术法有效气血为静态分项，未含回血；生存主值另外计入固定参考时长的持续回血与低血护持。</p>${re(t)}${A(t)?`<p data-health-ward>${B(A(t))}</p>`:``}${t.conditionalRegeneration.map(e=>`<p>未受伤回血：连续 ${r(e.damageDelaySeconds,3)} 秒未受伤后，每秒回复 ${r(e.healthPerSecond)} 气血。</p>`).join(``)}${t.conditionalRegeneration.length?`<p>${O}</p>`:``}</div>`:``}`}function pe(e,t){let n=e.scrollTop,r=e.ownerDocument.activeElement,i=r?.tagName===`SUMMARY`&&e.contains(r)?r.parentElement.dataset.numericalFold:void 0,a=new Map(Array.from(e.querySelectorAll(`[data-numerical-fold]`),e=>[e.dataset.numericalFold,e.open]));e.innerHTML=t;for(let t of e.querySelectorAll(`[data-numerical-fold]`)){let e=a.get(t.dataset.numericalFold);e!==void 0&&(t.open=e),i!==void 0&&t.dataset.numericalFold===i&&t.querySelector(`:scope > summary`)?.focus({preventScroll:!0})}e.scrollTop=n}function me(e,t,n=!1){let i=t??e;if(!i||!i.rawEfficiency&&!e?.rawEfficiency&&i.kind!==`blink`&&e?.kind!==`blink`)return``;let a=e=>`${e.kind===`blink`?`缩地`:`翻滚`} ${r(e.seconds,3)}秒（${e.cooldownFrames}帧）`,o=e&&t?t.cooldownFrames-e.cooldownFrames:void 0;return`<div class="numerical-evidence" data-roll-recovery>${H(n?`当前 → 换装后身法间隔`:`不含本件 → 包含本件身法间隔`,e&&t?`${a(e)} → ${a(t)}`:a(i))}
    ${o===void 0?``:H(`实际间隔变化`,o===0?`0帧 · 当前身法间隔不变`:`${o>0?`+`:``}${o}帧（${r(t.seconds-e.seconds,3)}秒）`)}
    ${H(`动作结束后等待`,`${i.waitFrames}帧 / ${r(i.waitSeconds,3)}秒`)}
    ${H(`整套原合计效率 → 有效效率`,`${r(i.rawEfficiency*100,4)}% → ${r(i.effectiveEfficiency*100,4)}%`)}
    <p>${i.kind===`blink`?`当前身法：缩地；轻撤暂不生效。`:``}合计效率最多计入${r(i.maximumEfficiency*100)}%，按整帧向上取整；当前实际间隔缩短${r(i.intervalReduction*100,2)}%。未跨帧或已经封顶时，原掷值仍保留。换装不刷新正在计时的身法，不折算为固定承伤或秒伤。</p></div>`}function he(e,n){let i=e.solo,o=e.survivalBefore,s=e.survivalAfter,l=e.comparison===!0,u=!!(e.contributionDetails?.referenceTarget??i?.equipment[0]?.referenceTarget),d=[e.before,e.after].some(e=>e?.equipment.some(e=>e.referenceTarget)),f=u?`试演参考秒伤`:`标准秒伤`,p=d?`参考秒伤`:`标准秒伤`,m=e.before?.quality===`stable`&&e.after?.quality===`stable`?e.after.dps-e.before.dps:void 0,h=!!(i||e.attackEquipment),g=h&&e.automaticAttackEnabled===!1,v=g?0:h?e.contribution??i:m,y=typeof v==`number`?h?r(v):c(v):a(v),b=typeof v==`number`?h?U(v):W(v):G(v),x=_({id:`item-dps`,icon:t(`standardDps`),label:h?f:l?`换装${p}变化`:`${p}支援`,value:b,valueAttribute:`data-item-dps`,pin:!0,detail:`${g?`自动释放已关闭，当前${u?`试演参考`:`标准`}贡献为 0；生存与光环保留，开启参考见详情。`:h?`本器独立按每秒 1 灵力计算完整循环，单位为伤害/秒；有试配配装时，使用与角色总值相同的本器贡献。${u?`采用本器展示路线，目标按中立无防御计算；参考距离见详情。`:``}`:l?`此物品没有独立攻击；主值为替换当前防具后整套${p}的变化，负数表示换装后降低。`:`此物品没有独立攻击；主值为本件从同部位空槽提供的整套${p}支援。`}${e.error??e.note}`,explanation:`${e.damageFormula?S(e.damageFormula,ee(e,y)):``}<div data-equipment-section-body="damage"></div><div class="numerical-evidence">
      ${i?H(`灵力效率`,i.damagePerQi===null?`无需净外部供灵，效率不适用`:`${r(i.damagePerQi)} 伤害/灵力`):``}
      ${e.contribution===void 0?``:H(`本器${f}贡献`,r(e.contribution))}
      ${m===void 0?``:H(l?`换装后${d?`参考`:`标准`}总秒伤变化`:`包含支援变化的整套${d?`参考`:`标准`}增量`,c(m))}</div>
      ${i?`<details><summary>单件开启参考 · 供灵与循环</summary><p>移除其他攻击器物，保留防具、随身物和已学天赋；本器按开启自动计算，不能把此独立参考当作当前停发贡献。</p>${X(i,`item-`)}</details>`:``}
      ${e.currentBeforeError||e.currentAfterError?`<p>当前配装持续估计不可用：${B([e.currentBeforeError,e.currentAfterError].filter(Boolean).join(`；`))}。主读数单独计算。</p>`:``}
      ${e.currentAfter?`<details><summary>当前配装持续估计 · 共享资源</summary>${e.currentBefore?H(l?`替换前 → 替换后`:`不含本件 → 包含本件`,`${a(e.currentBefore)} → ${a(e.currentAfter)} 伤害/秒`):``}${X(e.currentAfter,`shared-after-`)}</details>`:``}
      ${e.before&&e.after?`<details><summary>${l?`换装比较依据`:`本件贡献依据`}</summary><h4>${l?`当前整套`:`不含本件`}</h4>${X(e.before,`before-`)}<h4>${l?`替换后整套`:`包含本件`}</h4>${X(e.after,`after-`)}</details>`:``}`}),C=s??o,w=C?`<div class="numerical-evidence">
    ${H(`气血上限`,r(C.maximumHealth,0))}
    ${H(`物理 / 术法减伤`,`${V(C.physicalReduction)} / ${V(C.spellReduction)}`)}
    ${H(`物理有效气血`,C.physicalEffectiveHealth===null?`免伤`:r(C.physicalEffectiveHealth,0))}
    ${H(`术法有效气血`,C.spellEffectiveHealth===null?`免伤`:r(C.spellEffectiveHealth,0))}
    ${H(`移动速度`,`${r(C.moveMetersPerSecond)} 米/秒`)}
    ${H(`持续回血`,`${r(C.continuousHealthPerSecond)} 气血/秒`)}
    ${o&&s?H(l?`当前 → 换装后生存`:`不含本件 → 包含本件生存`,`${q(o,3)} → ${q(s,3)}`):``}
    ${re(C,o&&s?o:void 0,l)}
    ${A(C)?`<p data-health-ward>${B(A(C))}</p>`:``}${C.conditionalRegeneration.map(e=>`<p>未受伤回血：连续 ${r(e.damageDelaySeconds,3)} 秒未受伤后，每秒回复 ${r(e.healthPerSecond)} 气血。</p>`).join(``)}${C.conditionalRegeneration.length?`<p>${O}</p>`:``}</div>`:``,{gain:T,immunity:E,text:k}=J(o,s),j=e.survivalPoseComparison,M=j?J(j.nearOwnerBefore,j.nearOwnerAfter):void 0,N=!!M&&(M.immunity!==E||M.gain!==void 0&&T!==void 0&&Math.abs(M.gain-T)>1e-8),P=j?`主值为出击参考：角色在原点，自动飞剑在 ${r(j.targetDistanceMeters)} 米外木桩处，停发飞剑按归位计算；防具与角色光环以角色为中心。全部近主参考：所有飞剑也在角色原点，${l?`换装`:`本件`}生存变化为 ${M.text}${M.gain===void 0?``:` 承伤点`}。两套参考分别比较同一站位下的前后配装；同组光环只取最强。实际生存随剑的位置与半径变化，既非全程覆盖，也非时间平均。`+(N?`盾牌角上的菱标表示生存贡献随站位变化。`:``):``,F=j?`<div class="numerical-evidence" data-equipment-survival-poses>
    ${H(`出击参考 · ${l?`当前 → 换装后`:`不含本件 → 包含本件`}`,`${q(o,3)} → ${q(s,3)} 承伤点`,`survival-deployed-before-after`)}
    ${H(`出击参考 · 生存变化`,k,`survival-deployed-contribution`)}
    ${H(`全部近主 · ${l?`当前 → 换装后`:`不含本件 → 包含本件`}`,`${q(j.nearOwnerBefore,3)} → ${q(j.nearOwnerAfter,3)} 承伤点`,`survival-near-owner-before-after`)}
    ${H(`全部近主 · 生存变化`,M.text,`survival-near-owner-contribution`)}
    <p>${B(Y(j.nearOwnerBefore,j.nearOwnerAfter))}</p></div>`:``,I=o&&s?Y(o,s):``,te=_({id:`item-survival`,icon:t(`physicalGuard`),label:l?`换装生存变化`:`生存贡献`,conditionBadge:N?`proximity`:void 0,value:E??(T===void 0?`—`:W(T)),valueAttribute:`data-item-survival`,pin:!0,detail:(E?`${E}。${D}`:T===void 0?`此物品暂无可计算的承伤贡献点数；实际效果见下方明细。`:`${l?`换装后 − 当前`:`包含本件 − 不含本件`} = ${c(T)} 点额外承伤量，不是百分比。${D}`)+(P?`\n${P}`:``)+(I?`\n${I}`:``),explanation:`<div data-equipment-section-body="survival"></div>${F}${w}${me(e.rollRecoveryBefore,e.rollRecoveryAfter,l)}`});return`<section class="equipment-numerics" aria-label="伤害与生存" data-equipment-numerics-mode="${l?`comparison`:`contribution`}" ${!e.pending&&!e.error?`data-equipment-numerics-ready`:``}><div class="equipment-primary-stats"><div>${x}${g?`<small class="equipment-dps-state" data-item-dps-state>自动关闭 · 贡献 0</small>`:``}</div>${te}</div></section>`}var ge=`${w}${v}
.strength-readout{pointer-events:auto;font-size:11px;color:var(--ui-text)}
.strength-readout>summary{list-style:none;cursor:pointer}.strength-readout>summary::-webkit-details-marker{display:none}
.strength-readout>summary:focus-visible{outline:2px solid var(--ui-jade);outline-offset:3px}
.strength-readout__headline{display:flex;align-items:baseline;justify-content:space-between;gap:8px;font-size:12px}
.strength-readout__headline small{font-size:9px;color:var(--ui-muted);white-space:nowrap}
.strength-readout__headline>b{font:600 20px var(--ui-font-number);color:var(--ui-jade);font-variant-numeric:tabular-nums}
.strength-readout__survival{font-size:10px;line-height:1.8;color:var(--ui-muted)}
.strength-readout__survival b{color:var(--ui-text);font-weight:500}
.strength-readout__detail{position:absolute;z-index:5;width:280px;max-height:55vh;overflow:auto;background:var(--ui-panel);border:1px solid var(--ui-line);border-radius:5px;padding:12px;box-shadow:0 8px 22px #0006}
.strength-readout__detail p,.equipment-numerics p{font-size:10px;line-height:1.65;color:var(--ui-muted);margin:7px 0}
.numerical-evidence>div:not(.numerical-equipment-evidence){display:flex;justify-content:space-between;align-items:baseline;gap:8px;font-size:11px;margin:5px 0}
.numerical-evidence span{color:var(--ui-muted)}
.numerical-evidence b,.equipment-numerics>div>b{font-variant-numeric:tabular-nums}
.numerical-evidence b{overflow-wrap:anywhere;text-align:right;max-width:65%}
.numerical-equipment-evidence{border-top:1px solid var(--ui-line);padding-top:7px;margin-top:9px;font-size:11px}
.numerical-equipment-evidence>strong{font-weight:500;color:var(--ui-text)}
.strength-readout__detail summary,.numerical-evidence summary{cursor:pointer;min-height:32px;display:flex;align-items:center;font-size:11px}
.equipment-primary-stats{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:12px}.equipment-primary-stats>div{min-width:0}.equipment-primary-stats .icon-stat{min-height:48px;cursor:pointer}.equipment-primary-stats .icon-stat>b{font-size:20px}
.equipment-dps-state{display:block;color:var(--ui-muted);font-size:10px;padding:0 6px}
.equipment-numerics{padding:10px 0;border-bottom:1px solid var(--ui-line);margin-bottom:8px}
.equipment-numerics details{font-size:11px;margin-top:8px}.equipment-numerics summary{cursor:pointer;min-height:32px;display:flex;align-items:center}
`,_e=`(max-width:700px), (orientation:landscape) and (max-height:550px)`,ve=String.raw`
@media (pointer:coarse), (max-width:700px) {
  .spirit-gym-hud{--mobile-left:max(10px,env(safe-area-inset-left));--mobile-right:max(10px,env(safe-area-inset-right));--mobile-top:max(10px,env(safe-area-inset-top));--mobile-bottom:max(8px,env(safe-area-inset-bottom))}
  .spirit-gym-hud__status{position:absolute;left:var(--mobile-left);top:var(--mobile-top);width:170px;display:grid;grid-template-columns:1fr 1fr;gap:6px;background:none;border:0;padding:0}
  .spirit-gym-hud__identity{position:static;width:100%;min-height:32px;padding:3px 8px;background:linear-gradient(90deg,var(--ui-panel),transparent);border-left:1px solid var(--ui-bronze)}
  .spirit-gym-hud__readouts{position:static;width:100%;grid-column:1/-1;gap:4px}
  .spirit-gym-hud__cultivation b{font-size:14px}
  .spirit-gym-hud__cultivation>span{font-size:10px}
  .spirit-gym-hud__xp-track{margin-top:3px}
  .spirit-gym-hud__strength{padding:3px 8px}
  .spirit-gym-hud__talents{font-size:13px;min-height:44px;padding:3px 5px}
  .spirit-gym-hud__resource-orb,.spirit-gym-hud__resource-orb--qi{position:relative;inset:auto;justify-self:center;margin-top:22px;width:50px;height:50px;border-width:2px}
  .spirit-gym-hud__resource-orb::before{inset:-7px}
  .spirit-gym-hud__resource-orb strong{font-size:10px;bottom:calc(100% + 8px);padding-inline:3px}
  .spirit-gym-hud__orb-rune{font-size:18px}
  .spirit-gym-hud__round{left:auto;right:var(--mobile-right);top:calc(var(--mobile-top) + 52px);bottom:auto;transform:none;width:100px;min-width:0;padding:4px 6px;border:0;border-radius:var(--ui-corner);background:color-mix(in srgb,var(--ui-surface) 75%,transparent)}
  .spirit-gym-hud__round strong{font-size:11px;letter-spacing:0}
  .spirit-gym-hud__round span{font-size:20px;line-height:1.1}
  .spirit-gym-hud__score{top:calc(var(--mobile-top) + 200px);left:var(--mobile-left);right:auto;bottom:auto;width:max-content;display:flex;gap:10px;padding:3px 6px;font-size:10px;background:color-mix(in srgb,var(--ui-surface) 50%,transparent);border:0;border-radius:4px}
  .spirit-gym-hud__score span{gap:5px}
  .spirit-gym-hud__score b{font-size:12px}
  .spirit-gym-hud__score span:last-child{display:none}
  .spirit-gym-hud__loadout{bottom:var(--mobile-bottom);width:calc(100% - var(--mobile-left) - var(--mobile-right));max-width:380px;padding:0;border:0;background:none}
  .spirit-gym-hud__loadout::after{display:none}
  .spirit-gym-hud__slot-row{gap:3px}
  .spirit-gym-hud__slot{height:54px;min-height:46px;padding:3px 1px;gap:2px;border-radius:5px;background:color-mix(in srgb,var(--ui-surface) 86%,transparent)}
  .spirit-gym-hud__slot-name{font-size:10px}
  .spirit-gym-hud__weapon-vitals{--weapon-vitals-size:26px}.spirit-gym-hud__weapon-health{inset:5px}
  .spirit-gym-hud__input-hint,.spirit-gym-hud__dash{display:none}
  .spirit-gym-hud__touch{display:block}
  .spirit-gym-hud[data-input-device=gamepad] .spirit-gym-hud__touch{display:none}
  .spirit-gym-hud__joystick{left:calc(var(--mobile-left) + 4px);top:auto;bottom:calc(var(--mobile-bottom) + 80px);width:96px;height:96px;background:color-mix(in srgb,var(--ui-surface) 40%,transparent);border:2px solid var(--ui-bronze)}
  .spirit-gym-hud__joystick::after{width:32px;height:32px}
  .spirit-gym-hud__touch-action{width:64px;height:64px;font-size:13px;border:2px solid var(--ui-bronze);background:color-mix(in srgb,var(--ui-surface) 60%,transparent)}
  .spirit-gym-hud__touch-jump{right:var(--mobile-right);bottom:calc(var(--mobile-bottom) + 118px)}
  .spirit-gym-hud__touch-dash{right:calc(var(--mobile-right) + 74px);bottom:calc(var(--mobile-bottom) + 78px)}
  [data-game-menu-open=true] .spirit-gym-hud{visibility:hidden}
}
@media (pointer:coarse) and (orientation:landscape) {
  .spirit-gym-hud__round{left:50%;right:auto;top:var(--mobile-top);transform:translateX(-50%);width:112px}
  .spirit-gym-hud__score{top:calc(var(--mobile-top) + 200px);right:auto;width:180px;gap:8px;font-size:9px}
  .spirit-gym-hud__loadout{max-width:304px;width:calc(100% - 260px)}
  .spirit-gym-hud__joystick{bottom:calc(var(--mobile-bottom) + 8px)}
  .spirit-gym-hud__touch-jump{bottom:calc(var(--mobile-bottom) + 74px)}
  .spirit-gym-hud__touch-dash{bottom:calc(var(--mobile-bottom) + 4px)}
}
@media (pointer:coarse) and (orientation:landscape) and (max-width:700px) {
  .spirit-gym-hud__touch-dash{right:var(--mobile-right)}
}
`,ye=String.raw`
@media (pointer:coarse), (max-width:700px) {
  .spirit-menu{font-size:14px}
  .spirit-menu__launcher{top:max(10px,env(safe-area-inset-top));right:max(10px,env(safe-area-inset-right));min-width:88px;min-height:46px;padding:0 10px;font-size:13px}
  .spirit-menu__launcher kbd{display:none}
  .spirit-menu__dialog{inset:max(4px,env(safe-area-inset-top)) max(0px,env(safe-area-inset-right)) calc(max(8px,env(safe-area-inset-bottom)) + 52px) max(0px,env(safe-area-inset-left));grid-template-rows:52px 48px minmax(0,1fr)}
  .spirit-menu__header{padding:2px 10px;gap:8px}
  .spirit-menu__header h1{font-size:18px}
  .spirit-menu__header small,.spirit-menu__paused,.spirit-menu__seal{display:none}
  .spirit-menu button{min-height:46px;touch-action:manipulation}
  .spirit-menu__return{min-height:46px;font-size:13px;padding:6px 12px}
  .spirit-menu__nav{padding:0 4px;gap:0;overflow-x:auto}
  .spirit-menu__nav button{min-width:46px;min-height:46px;flex:1 0 auto;padding:4px 6px;font-size:13px;white-space:nowrap;letter-spacing:0}
  .spirit-menu__journey{padding:16px;overscroll-behavior:contain}
  .spirit-menu .spirit-audio-settings__body,.spirit-menu .forgeax-presentation-settings__panel{padding:16px}
  .spirit-menu .forgeax-presentation-settings fieldset{grid-template-columns:90px minmax(50px,1fr) 48px;gap:12px 6px}
  .spirit-menu input[type=range],.spirit-menu select{min-height:46px}
}
`,Z=`M2 2H98V98H2Z`,be=`<span class="weapon-activation-frame" aria-hidden="true">
  <svg viewBox="0 0 100 100" preserveAspectRatio="none" focusable="false">
    <path class="weapon-activation-frame__track" d="${Z}" vector-effect="non-scaling-stroke"/>
    <path class="weapon-activation-frame__glow" d="${Z}" pathLength="100" vector-effect="non-scaling-stroke"/>
    <path class="weapon-activation-frame__spark" d="${Z}" pathLength="100" vector-effect="non-scaling-stroke"/>
  </svg>
</span>`;function xe(e,t,n){let r=String(t);e.dataset.automatic!==r&&(e.dataset.automatic=r),e.getAttribute(`aria-pressed`)!==r&&e.setAttribute(`aria-pressed`,r),e.setAttribute(`aria-label`,Se(n,t))}function Se(e,t){return`${e} · 自动攻击${t?`已开启，点击停止`:`已停止，点击开启`}`}var Ce=String.raw`
.weapon-activation-frame{--frame-metal:var(--ui-bronze);position:absolute;inset:0;z-index:2;display:block;pointer-events:none;color:var(--frame-metal)}
.weapon-activation-frame svg{position:absolute;inset:0;width:100%;height:100%;overflow:visible;fill:none;stroke:currentColor;stroke-linejoin:round}
.weapon-activation-frame__track{stroke-width:1;opacity:.65}
.weapon-activation-frame__glow,.weapon-activation-frame__spark{display:none;stroke-linecap:round}
.weapon-activation-frame__glow{stroke:var(--ui-jade);stroke-width:2;stroke-dasharray:12 38;opacity:.45}
.weapon-activation-frame__spark{stroke:var(--ui-text);stroke-width:1.2;stroke-dasharray:5 45}
[data-automatic=true]>.weapon-activation-frame{--frame-metal:var(--ui-jade);filter:drop-shadow(0 0 2px color-mix(in srgb,var(--ui-jade) 25%,transparent))}
[data-automatic=true]>.weapon-activation-frame .weapon-activation-frame__glow,[data-automatic=true]>.weapon-activation-frame .weapon-activation-frame__spark{display:block;animation:weapon-frame-orbit 2.4s linear infinite}
[data-automatic=true]>.weapon-activation-frame .weapon-activation-frame__track{opacity:.9}
@keyframes weapon-frame-orbit{from{stroke-dashoffset:0}to{stroke-dashoffset:-100}}
@media(prefers-reduced-motion:reduce){[data-automatic=true]>.weapon-activation-frame .weapon-activation-frame__glow,[data-automatic=true]>.weapon-activation-frame .weapon-activation-frame__spark{animation:none;stroke-dasharray:none}.weapon-activation-frame__glow{opacity:.2}}
`;function we(){return new URL(`assets/play-hud/`,new URL(`/games/ai-weapon-spirit/`,document.baseURI)).href}function Te(e){let t=[`hud-orb.css`,`hud-bar.css`,`hud-touch.css`].map(t=>{let n=document.createElement(`link`);return n.rel=`stylesheet`,n.href=we()+t,e.append(n),n});return()=>t.forEach(e=>e.remove())}function Q(t){let n=e.zones.find(e=>e.id===t);return`data-hud-zone="${n.id}" data-hud-anchor="${n.anchor}" data-hud-fields="${n.data.join(` `)}"`}function $(e,t,n){let r=e===`life`?`health`:`qi`;return`<div class="ui-art ui-art--hud-orb play-hud-orb spirit-gym-hud__resource-orb spirit-gym-hud__resource-orb--${r}" data-player-${r}-orb role="meter" aria-label="${t}">
    <div class="spirit-gym-hud__orb-well" aria-hidden="true"><div class="spirit-gym-hud__orb-liquid play-hud-orb__liquid" data-${n}-liquid><span class="spirit-gym-hud__orb-current"></span><span class="spirit-gym-hud__orb-current spirit-gym-hud__orb-current--rear"></span></div></div>
    <div class="ui-art__content"><span class="play-hud-orb-char">${t}</span><strong class="play-hud-orb-value" data-${n}-text></strong></div>
  </div>`}function Ee(){return`
  <div class="play-hud-orbs" ${Q(`status`)}>${$(`life`,`命`,`hp`)}${$(`qi`,`灵`,`qi`)}</div>
  <div id="play-hud-tl"><div class="play-hud-stack">
    <div class="play-hud-realm">
      <div class="play-hud-realm__head">
        <div class="play-hud-realm__name">
          <span class="play-hud-realm__title" data-level></span><span class="play-hud-realm__grade" data-realm-grade></span>
        </div>
      </div>
    </div>
    <div class="play-hud-details">
      <button type="button" class="strength-readout" data-open-character aria-label="打开角色属性，查看秒伤与生存详情"><span data-strength-summary></span></button>
    </div>
  </div></div>
  <div class="play-hud-wave" ${Q(`round`)} tabindex="0">
    <small class="play-hud-wave__label" data-wave></small><strong class="play-hud-wave__state" data-time></strong>
  </div>
  <span class="play-hud-condition" data-water-state hidden></span>
    <div class="play-hud-dash" data-dash ${Q(`dash`)} role="status">
      <div class="play-hud-dash__plate"><span class="play-hud-dash__lead"><kbd class="play-hud-dash__key">Shift</kbd><span class="play-hud-dash__label" data-dash-label></span></span><span class="play-hud-dash__tail"><i class="play-hud-dash__sep" aria-hidden="true"></i><span class="play-hud-dash__state" data-dash-state></span></span></div>
    </div>
  <div class="play-hud-bottom-group">
  <div class="play-hud-dock play-hud-dock--lite spirit-gym-hud__loadout" ${Q(`loadout`)}>
    <div class="play-hud-progression">
      <div class="play-hud-dock__xp" data-cultivation-progress tabindex="0" role="progressbar" aria-label="修为进度"><span>修为</span><b data-cultivation></b></div>
      <button type="button" class="play-hud-talents" data-open-talents aria-label="天赋">${t(`talent`)}<b data-talent-points>0</b></button>
    </div>
    <div class="play-hud-dock__slots" data-weapon-slots></div>
    <div data-gear-slots hidden></div><button type="button" class="spirit-gym-hud__reset" hidden>重开</button>
  </div>
  </div>
  <div class="play-hud-input-hint" data-input-hint ${Q(`input-hint`)}>${e.copy.keyboardHint}</div>
  <div class="play-hud-touch" aria-hidden="true" ${Q(`touch`)}>
    <div class="play-hud-joystick" data-touch-joystick><div class="play-hud-joystick__ring"></div><div class="play-hud-joystick__knob"></div></div>
    <span class="play-hud-touch-btn play-hud-touch-btn--roll" data-touch-dash><span class="play-hud-touch-btn__label">翻滚</span></span>
    <span class="play-hud-touch-btn" data-touch-jump><span class="play-hud-touch-btn__label">跳跃</span></span>
  </div>`}var De=`<span class="play-hud-wpn__ring spirit-gym-hud__weapon-vitals"><i class="spirit-gym-hud__weapon-health"></i><span class="spirit-gym-hud__weapon-phase"></span></span><i class="play-hud-wpn__gem" aria-hidden="true" hidden></i><span class="play-hud-wpn__name spirit-gym-hud__slot-name"></span><span class="spirit-gym-hud__slot-meta" hidden></span>${be}`;function Oe(e,t){let n=Array.from(t).length,r=n<=2?1:n<=3?.96:n<=4?.9:n<=6?.86:n<=8?.82:.74;e.style.setProperty(`--wpn-name-scale`,String(r)),e.style.setProperty(`--wpn-name-track`,n<=3?`.12em`:n<=4?`.06em`:`.02em`)}function ke(e,t){let n=window.matchMedia(`(orientation: landscape)`),r=window.matchMedia(`(orientation: landscape) and (hover: hover) and (pointer: fine)`),i=e.querySelector(`#play-hud-tl`),a=e.querySelector(`.play-hud-orbs`),o=e.querySelector(`[data-player-health-orb]`),s=e.querySelector(`[data-player-qi-orb]`),c=e.querySelector(`.play-hud-bottom-group`),l=e.querySelector(`.play-hud-dock`),u=t.querySelector(`.play-hud-sys`),d=0,f=()=>{cancelAnimationFrame(d),d=requestAnimationFrame(()=>{if(e.style.setProperty(`--play-tl-bottom`,`${i.getBoundingClientRect().bottom}px`),e.style.setProperty(`--play-dock-height`,`${l.getBoundingClientRect().height}px`),u){let t=u.getBoundingClientRect();e.style.setProperty(`--play-menu-bottom`,`${t.bottom}px`),e.style.setProperty(`--play-menu-left`,`${t.left}px`)}})},p=()=>{n.matches?(c.prepend(o),c.append(s)):a.append(o,s);for(let t of[`realm`,`wave`])e.querySelector(`.play-hud-`+t)?.classList.toggle(`play-hud-`+t+`--desktop`,n.matches);l.classList.toggle(`play-hud-dock--desktop`,r.matches),u?.classList.toggle(`play-hud-sys--desktop`,n.matches),f()},m=new ResizeObserver(f);return m.observe(i),m.observe(l),u&&m.observe(u),p(),n.addEventListener(`change`,p),r.addEventListener(`change`,p),window.addEventListener(`resize`,f),()=>{n.removeEventListener(`change`,p),r.removeEventListener(`change`,p),window.removeEventListener(`resize`,f),m.disconnect(),cancelAnimationFrame(d)}}export{h as A,R as C,A as D,O as E,C as O,L as S,D as T,oe as _,we as a,ae as b,Ce as c,ve as d,ye as f,fe as g,he as h,Te as i,_ as j,g as k,xe as l,ie as m,Oe as n,Ee as o,ge as p,ke as r,be as s,De as t,_e as u,pe as v,te as w,z as x,K as y};