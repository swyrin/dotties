/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
var t;const e=globalThis.trustedTypes,i=e?e.createPolicy("lit-html",{createHTML:t=>t}):void 0,s=`lit$${(Math.random()+"").slice(9)}$`,n="?"+s,o=`<${n}>`,r=document,l=(t="")=>r.createComment(t),h=t=>null===t||"object"!=typeof t&&"function"!=typeof t,a=Array.isArray,c=t=>{var e;return a(t)||"function"==typeof(null===(e=t)||void 0===e?void 0:e[Symbol.iterator])},d=/<(?:(!--|\/[^a-zA-Z])|(\/?[a-zA-Z][^>\s]*)|(\/?$))/g,u=/-->/g,$=/>/g,p=/>|[ 	\n\r](?:([^\s"'>=/]+)([ 	\n\r]*=[ 	\n\r]*(?:[^ 	\n\r"'`<>=]|("|')|))|$)/g,v=/'/g,A=/"/g,g=/^(?:script|style|textarea|title)$/i,_=t=>(e,...i)=>({_$litType$:t,strings:e,values:i}),m=_(1),f=(_(2),Symbol.for("lit-noChange")),y=Symbol.for("lit-nothing"),w=new WeakMap,b=(t,e,i)=>{var s,n;const o=null!==(s=null==i?void 0:i.renderBefore)&&void 0!==s?s:e;let r=o._$litPart$;if(void 0===r){const t=null!==(n=null==i?void 0:i.renderBefore)&&void 0!==n?n:null;o._$litPart$=r=new T(e.insertBefore(l(),t),t,void 0,null!=i?i:{})}return r._$AI(t),r},x=r.createTreeWalker(r,129,null,!1),H=(t,e)=>{const n=t.length-1,r=[];let l,h=2===e?"<svg>":"",a=d;for(let e=0;e<n;e++){const i=t[e];let n,c,_=-1,m=0;for(;m<i.length&&(a.lastIndex=m,c=a.exec(i),null!==c);)m=a.lastIndex,a===d?"!--"===c[1]?a=u:void 0!==c[1]?a=$:void 0!==c[2]?(g.test(c[2])&&(l=RegExp("</"+c[2],"g")),a=p):void 0!==c[3]&&(a=p):a===p?">"===c[0]?(a=null!=l?l:d,_=-1):void 0===c[1]?_=-2:(_=a.lastIndex-c[2].length,n=c[1],a=void 0===c[3]?p:'"'===c[3]?A:v):a===A||a===v?a=p:a===u||a===$?a=d:(a=p,l=void 0);const f=a===p&&t[e+1].startsWith("/>")?" ":"";h+=a===d?i+o:_>=0?(r.push(n),i.slice(0,_)+"$lit$"+i.slice(_)+s+f):i+s+(-2===_?(r.push(void 0),e):f)}const c=h+(t[n]||"<?>")+(2===e?"</svg>":"");if(!Array.isArray(t)||!t.hasOwnProperty("raw"))throw Error("invalid template strings array");return[void 0!==i?i.createHTML(c):c,r]};class N{constructor({strings:t,_$litType$:i},o){let r;this.parts=[];let h=0,a=0;const c=t.length-1,d=this.parts,[u,$]=H(t,i);if(this.el=N.createElement(u,o),x.currentNode=this.el.content,2===i){const t=this.el.content,e=t.firstChild;e.remove(),t.append(...e.childNodes)}for(;null!==(r=x.nextNode())&&d.length<c;){if(1===r.nodeType){if(r.hasAttributes()){const t=[];for(const e of r.getAttributeNames())if(e.endsWith("$lit$")||e.startsWith(s)){const i=$[a++];if(t.push(e),void 0!==i){const t=r.getAttribute(i.toLowerCase()+"$lit$").split(s),e=/([.?@])?(.*)/.exec(i);d.push({type:1,index:h,name:e[2],strings:t,ctor:"."===e[1]?L:"?"===e[1]?U:"@"===e[1]?B:S})}else d.push({type:6,index:h})}for(const e of t)r.removeAttribute(e)}if(g.test(r.tagName)){const t=r.textContent.split(s),i=t.length-1;if(i>0){r.textContent=e?e.emptyScript:"";for(let e=0;e<i;e++)r.append(t[e],l()),x.nextNode(),d.push({type:2,index:++h});r.append(t[i],l())}}}else if(8===r.nodeType)if(r.data===n)d.push({type:2,index:h});else{let t=-1;for(;-1!==(t=r.data.indexOf(s,t+1));)d.push({type:7,index:h}),t+=s.length-1}h++}}static createElement(t,e){const i=r.createElement("template");return i.innerHTML=t,i}}function C(t,e,i=t,s){var n,o,r,l;if(e===f)return e;let a=void 0!==s?null===(n=i._$Cl)||void 0===n?void 0:n[s]:i._$Cu;const c=h(e)?void 0:e._$litDirective$;return(null==a?void 0:a.constructor)!==c&&(null===(o=null==a?void 0:a._$AO)||void 0===o||o.call(a,!1),void 0===c?a=void 0:(a=new c(t),a._$AT(t,i,s)),void 0!==s?(null!==(r=(l=i)._$Cl)&&void 0!==r?r:l._$Cl=[])[s]=a:i._$Cu=a),void 0!==a&&(e=C(t,a._$AS(t,e.values),a,s)),e}class M{constructor(t,e){this.v=[],this._$AN=void 0,this._$AD=t,this._$AM=e}get parentNode(){return this._$AM.parentNode}get _$AU(){return this._$AM._$AU}p(t){var e;const{el:{content:i},parts:s}=this._$AD,n=(null!==(e=null==t?void 0:t.creationScope)&&void 0!==e?e:r).importNode(i,!0);x.currentNode=n;let o=x.nextNode(),l=0,h=0,a=s[0];for(;void 0!==a;){if(l===a.index){let e;2===a.type?e=new T(o,o.nextSibling,this,t):1===a.type?e=new a.ctor(o,a.name,a.strings,this,t):6===a.type&&(e=new I(o,this,t)),this.v.push(e),a=s[++h]}l!==(null==a?void 0:a.index)&&(o=x.nextNode(),l++)}return n}m(t){let e=0;for(const i of this.v)void 0!==i&&(void 0!==i.strings?(i._$AI(t,i,e),e+=i.strings.length-2):i._$AI(t[e])),e++}}class T{constructor(t,e,i,s){var n;this.type=2,this._$AH=y,this._$AN=void 0,this._$AA=t,this._$AB=e,this._$AM=i,this.options=s,this._$Cg=null===(n=null==s?void 0:s.isConnected)||void 0===n||n}get _$AU(){var t,e;return null!==(e=null===(t=this._$AM)||void 0===t?void 0:t._$AU)&&void 0!==e?e:this._$Cg}get parentNode(){let t=this._$AA.parentNode;const e=this._$AM;return void 0!==e&&11===t.nodeType&&(t=e.parentNode),t}get startNode(){return this._$AA}get endNode(){return this._$AB}_$AI(t,e=this){t=C(this,t,e),h(t)?t===y||null==t||""===t?(this._$AH!==y&&this._$AR(),this._$AH=y):t!==this._$AH&&t!==f&&this.$(t):void 0!==t._$litType$?this.T(t):void 0!==t.nodeType?this.k(t):c(t)?this.S(t):this.$(t)}A(t,e=this._$AB){return this._$AA.parentNode.insertBefore(t,e)}k(t){this._$AH!==t&&(this._$AR(),this._$AH=this.A(t))}$(t){this._$AH!==y&&h(this._$AH)?this._$AA.nextSibling.data=t:this.k(r.createTextNode(t)),this._$AH=t}T(t){var e;const{values:i,_$litType$:s}=t,n="number"==typeof s?this._$AC(t):(void 0===s.el&&(s.el=N.createElement(s.h,this.options)),s);if((null===(e=this._$AH)||void 0===e?void 0:e._$AD)===n)this._$AH.m(i);else{const t=new M(n,this),e=t.p(this.options);t.m(i),this.k(e),this._$AH=t}}_$AC(t){let e=w.get(t.strings);return void 0===e&&w.set(t.strings,e=new N(t)),e}S(t){a(this._$AH)||(this._$AH=[],this._$AR());const e=this._$AH;let i,s=0;for(const n of t)s===e.length?e.push(i=new T(this.A(l()),this.A(l()),this,this.options)):i=e[s],i._$AI(n),s++;s<e.length&&(this._$AR(i&&i._$AB.nextSibling,s),e.length=s)}_$AR(t=this._$AA.nextSibling,e){var i;for(null===(i=this._$AP)||void 0===i||i.call(this,!1,!0,e);t&&t!==this._$AB;){const e=t.nextSibling;t.remove(),t=e}}setConnected(t){var e;void 0===this._$AM&&(this._$Cg=t,null===(e=this._$AP)||void 0===e||e.call(this,t))}}class S{constructor(t,e,i,s,n){this.type=1,this._$AH=y,this._$AN=void 0,this.element=t,this.name=e,this._$AM=s,this.options=n,i.length>2||""!==i[0]||""!==i[1]?(this._$AH=Array(i.length-1).fill(new String),this.strings=i):this._$AH=y}get tagName(){return this.element.tagName}get _$AU(){return this._$AM._$AU}_$AI(t,e=this,i,s){const n=this.strings;let o=!1;if(void 0===n)t=C(this,t,e,0),o=!h(t)||t!==this._$AH&&t!==f,o&&(this._$AH=t);else{const s=t;let r,l;for(t=n[0],r=0;r<n.length-1;r++)l=C(this,s[i+r],e,r),l===f&&(l=this._$AH[r]),o||(o=!h(l)||l!==this._$AH[r]),l===y?t=y:t!==y&&(t+=(null!=l?l:"")+n[r+1]),this._$AH[r]=l}o&&!s&&this.C(t)}C(t){t===y?this.element.removeAttribute(this.name):this.element.setAttribute(this.name,null!=t?t:"")}}class L extends S{constructor(){super(...arguments),this.type=3}C(t){this.element[this.name]=t===y?void 0:t}}const E=e?e.emptyScript:"";class U extends S{constructor(){super(...arguments),this.type=4}C(t){t&&t!==y?this.element.setAttribute(this.name,E):this.element.removeAttribute(this.name)}}class B extends S{constructor(t,e,i,s,n){super(t,e,i,s,n),this.type=5}_$AI(t,e=this){var i;if((t=null!==(i=C(this,t,e,0))&&void 0!==i?i:y)===f)return;const s=this._$AH,n=t===y&&s!==y||t.capture!==s.capture||t.once!==s.once||t.passive!==s.passive,o=t!==y&&(s===y||n);n&&this.element.removeEventListener(this.name,this,s),o&&this.element.addEventListener(this.name,this,t),this._$AH=t}handleEvent(t){var e,i;"function"==typeof this._$AH?this._$AH.call(null!==(i=null===(e=this.options)||void 0===e?void 0:e.host)&&void 0!==i?i:this.element,t):this._$AH.handleEvent(t)}}class I{constructor(t,e,i){this.element=t,this.type=6,this._$AN=void 0,this._$AM=e,this.options=i}get _$AU(){return this._$AM._$AU}_$AI(t){C(this,t)}}const z=window.litHtmlPolyfillSupport;null==z||z(N,T),(null!==(t=globalThis.litHtmlVersions)&&void 0!==t?t:globalThis.litHtmlVersions=[]).push("2.2.1");
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
const P=2,R=t=>(...e)=>({_$litDirective$:t,values:e});
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
class k extends class{constructor(t){}get _$AU(){return this._$AM._$AU}_$AT(t,e,i){this._$Ct=t,this._$AM=e,this._$Ci=i}_$AS(t,e){return this.update(t,e)}update(t,e){return this.render(...e)}}{constructor(t){if(super(t),this.it=y,t.type!==P)throw Error(this.constructor.directiveName+"() can only be used in child bindings")}render(t){if(t===y||null==t)return this.ft=void 0,this.it=t;if(t===f)return t;if("string"!=typeof t)throw Error(this.constructor.directiveName+"() called with a non-string value");if(t===this.it)return this.ft;this.it=t;const e=[t];return e.raw=e,this.ft={_$litType$:this.constructor.resultType,strings:e,values:[]}}}k.directiveName="unsafeHTML",k.resultType=1;R(k);
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */class V extends k{}V.directiveName="unsafeSVG",V.resultType=2;const D=R(V),O=["https://hoppscotch.io"];let W=[],q="",J="https://hoppscotch.io",Z="";const j=t=>new Promise(((e,i)=>{chrome.storage.sync.set({originList:JSON.stringify(t)},(()=>{e()}))})),G=t=>{t.preventDefault();try{const t=new URL(q);W.includes(t.origin)?(Z="Origin is already on the list",b(Q(),document.body)):(W.push(t.origin),q="",j(W),Z="",b(Q(),document.body))}catch(t){Z="Improper URL",b(Q(),document.body)}},F=t=>{q=t.target.value,Z="",b(Q(),document.body)},K=async t=>{W.splice(t,1),await j(W),b(Q(),document.body)},Q=()=>m`
  ${Y(q,F,G)}
  ${X(Z)} ${tt(W,K)}
`,X=t=>m`
  ${t.length>0?m`
        <div class="err">
          ${D('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="18px" height="18px"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-2h2v2zm0-4h-2V7h2v6z"/></svg>\n')}
          <span class="err-text"> ${t} </span>
        </div>
      `:m``}
`,Y=(t,e,i)=>m`
  <form novalidate class="origin-input-box">
    <label class="origin-input-label" for="origin-input">Enter new origin</label>

    <div class="origin-input-wrapper">
      <input id="origin-input" required placeholder="${J}" class="origin-input" .value=${t} @input=${e}></input>
      <button class="origin-add" type="submit" @click=${i}>
        ${D('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="18px" height="18px"><path d="M0 0h24v24H0z" fill="none"/><path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"/></svg>\n')}
        <span class="button-text">Add</span>
      </button>
    </div>
  </form>
`,tt=(t,e)=>m`
  <label class="origin-input-label">Active origins</label>
  <ul class="origin-list">
    ${t.map(((t,i)=>m`
        <li class="origin-list-entry">
          <span class="origin-list-entry-origin">${t}</span>
          <button
            class="origin-delete"
            .disabled=${"https://hoppscotch.io"===t}
            @click=${()=>e(i)}
          >
            ${D('<svg xmlns="http://www.w3.org/2000/svg" height="18" viewBox="0 0 24 24" fill="currentColor" width="18"><path d="M0 0h24v24H0z" fill="none"/><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/></svg>\n')}
          </button>
        </li>
      `))}
  </ul>
`;new Promise(((t,e)=>{chrome.storage.sync.get(["originList"],(async e=>{e&&e.originList||(await j(O),t(O)),t(JSON.parse(e.originList))}))})).then((t=>{W=t,b(Q(),document.body)})).catch((()=>{})),chrome.tabs.query({active:!0},(t=>{if(t.length>0)try{if(t[0].url){if(!t[0].url.startsWith("http"))return;const e=new URL(t[0].url);e&&e.origin&&(J=e.origin,q=e.origin),b(Q(),document.body)}}catch(t){}}));
//# sourceMappingURL=popup.e422ad99.js.map
