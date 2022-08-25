(()=>{
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
var t;const e=window,i=e.trustedTypes,s=i?i.createPolicy("lit-html",{createHTML:t=>t}):void 0,n=`lit$${(Math.random()+"").slice(9)}$`,o="?"+n,r=`<${o}>`,l=document,h=(t="")=>l.createComment(t),a=t=>null===t||"object"!=typeof t&&"function"!=typeof t,c=Array.isArray,d=t=>c(t)||"function"==typeof(null==t?void 0:t[Symbol.iterator]),u=/<(?:(!--|\/[^a-zA-Z])|(\/?[a-zA-Z][^>\s]*)|(\/?$))/g,$=/-->/g,p=/>/g,v=RegExp(">|[ \t\n\f\r](?:([^\\s\"'>=/]+)([ \t\n\f\r]*=[ \t\n\f\r]*(?:[^ \t\n\f\r\"'`<>=]|(\"|')|))|$)","g"),_=/'/g,A=/"/g,g=/^(?:script|style|textarea|title)$/i,m=t=>(e,...i)=>({_$litType$:t,strings:e,values:i}),f=m(1),y=(m(2),Symbol.for("lit-noChange")),w=Symbol.for("lit-nothing"),x=new WeakMap,b=(t,e,i)=>{var s,n;const o=null!==(s=null==i?void 0:i.renderBefore)&&void 0!==s?s:e;let r=o._$litPart$;if(void 0===r){const t=null!==(n=null==i?void 0:i.renderBefore)&&void 0!==n?n:null;o._$litPart$=r=new T(e.insertBefore(h(),t),t,void 0,null!=i?i:{})}return r._$AI(t),r},H=l.createTreeWalker(l,129,null,!1),N=(t,e)=>{const i=t.length-1,o=[];let l,h=2===e?"<svg>":"",a=u;for(let e=0;e<i;e++){const i=t[e];let s,c,d=-1,m=0;for(;m<i.length&&(a.lastIndex=m,c=a.exec(i),null!==c);)m=a.lastIndex,a===u?"!--"===c[1]?a=$:void 0!==c[1]?a=p:void 0!==c[2]?(g.test(c[2])&&(l=RegExp("</"+c[2],"g")),a=v):void 0!==c[3]&&(a=v):a===v?">"===c[0]?(a=null!=l?l:u,d=-1):void 0===c[1]?d=-2:(d=a.lastIndex-c[2].length,s=c[1],a=void 0===c[3]?v:'"'===c[3]?A:_):a===A||a===_?a=v:a===$||a===p?a=u:(a=v,l=void 0);const f=a===v&&t[e+1].startsWith("/>")?" ":"";h+=a===u?i+r:d>=0?(o.push(s),i.slice(0,d)+"$lit$"+i.slice(d)+n+f):i+n+(-2===d?(o.push(void 0),e):f)}const c=h+(t[i]||"<?>")+(2===e?"</svg>":"");if(!Array.isArray(t)||!t.hasOwnProperty("raw"))throw Error("invalid template strings array");return[void 0!==s?s.createHTML(c):c,o]};class M{constructor({strings:t,_$litType$:e},s){let r;this.parts=[];let l=0,a=0;const c=t.length-1,d=this.parts,[u,$]=N(t,e);if(this.el=M.createElement(u,s),H.currentNode=this.el.content,2===e){const t=this.el.content,e=t.firstChild;e.remove(),t.append(...e.childNodes)}for(;null!==(r=H.nextNode())&&d.length<c;){if(1===r.nodeType){if(r.hasAttributes()){const t=[];for(const e of r.getAttributeNames())if(e.endsWith("$lit$")||e.startsWith(n)){const i=$[a++];if(t.push(e),void 0!==i){const t=r.getAttribute(i.toLowerCase()+"$lit$").split(n),e=/([.?@])?(.*)/.exec(i);d.push({type:1,index:l,name:e[2],strings:t,ctor:"."===e[1]?L:"?"===e[1]?U:"@"===e[1]?B:E})}else d.push({type:6,index:l})}for(const e of t)r.removeAttribute(e)}if(g.test(r.tagName)){const t=r.textContent.split(n),e=t.length-1;if(e>0){r.textContent=i?i.emptyScript:"";for(let i=0;i<e;i++)r.append(t[i],h()),H.nextNode(),d.push({type:2,index:++l});r.append(t[e],h())}}}else if(8===r.nodeType)if(r.data===o)d.push({type:2,index:l});else{let t=-1;for(;-1!==(t=r.data.indexOf(n,t+1));)d.push({type:7,index:l}),t+=n.length-1}l++}}static createElement(t,e){const i=l.createElement("template");return i.innerHTML=t,i}}function C(t,e,i=t,s){var n,o,r,l;if(e===y)return e;let h=void 0!==s?null===(n=i._$Cl)||void 0===n?void 0:n[s]:i._$Cu;const c=a(e)?void 0:e._$litDirective$;return(null==h?void 0:h.constructor)!==c&&(null===(o=null==h?void 0:h._$AO)||void 0===o||o.call(h,!1),void 0===c?h=void 0:(h=new c(t),h._$AT(t,i,s)),void 0!==s?(null!==(r=(l=i)._$Cl)&&void 0!==r?r:l._$Cl=[])[s]=h:i._$Cu=h),void 0!==h&&(e=C(t,h._$AS(t,e.values),h,s)),e}class S{constructor(t,e){this.v=[],this._$AN=void 0,this._$AD=t,this._$AM=e}get parentNode(){return this._$AM.parentNode}get _$AU(){return this._$AM._$AU}p(t){var e;const{el:{content:i},parts:s}=this._$AD,n=(null!==(e=null==t?void 0:t.creationScope)&&void 0!==e?e:l).importNode(i,!0);H.currentNode=n;let o=H.nextNode(),r=0,h=0,a=s[0];for(;void 0!==a;){if(r===a.index){let e;2===a.type?e=new T(o,o.nextSibling,this,t):1===a.type?e=new a.ctor(o,a.name,a.strings,this,t):6===a.type&&(e=new I(o,this,t)),this.v.push(e),a=s[++h]}r!==(null==a?void 0:a.index)&&(o=H.nextNode(),r++)}return n}m(t){let e=0;for(const i of this.v)void 0!==i&&(void 0!==i.strings?(i._$AI(t,i,e),e+=i.strings.length-2):i._$AI(t[e])),e++}}class T{constructor(t,e,i,s){var n;this.type=2,this._$AH=w,this._$AN=void 0,this._$AA=t,this._$AB=e,this._$AM=i,this.options=s,this._$C_=null===(n=null==s?void 0:s.isConnected)||void 0===n||n}get _$AU(){var t,e;return null!==(e=null===(t=this._$AM)||void 0===t?void 0:t._$AU)&&void 0!==e?e:this._$C_}get parentNode(){let t=this._$AA.parentNode;const e=this._$AM;return void 0!==e&&11===t.nodeType&&(t=e.parentNode),t}get startNode(){return this._$AA}get endNode(){return this._$AB}_$AI(t,e=this){t=C(this,t,e),a(t)?t===w||null==t||""===t?(this._$AH!==w&&this._$AR(),this._$AH=w):t!==this._$AH&&t!==y&&this.$(t):void 0!==t._$litType$?this.T(t):void 0!==t.nodeType?this.k(t):d(t)?this.O(t):this.$(t)}S(t,e=this._$AB){return this._$AA.parentNode.insertBefore(t,e)}k(t){this._$AH!==t&&(this._$AR(),this._$AH=this.S(t))}$(t){this._$AH!==w&&a(this._$AH)?this._$AA.nextSibling.data=t:this.k(l.createTextNode(t)),this._$AH=t}T(t){var e;const{values:i,_$litType$:s}=t,n="number"==typeof s?this._$AC(t):(void 0===s.el&&(s.el=M.createElement(s.h,this.options)),s);if((null===(e=this._$AH)||void 0===e?void 0:e._$AD)===n)this._$AH.m(i);else{const t=new S(n,this),e=t.p(this.options);t.m(i),this.k(e),this._$AH=t}}_$AC(t){let e=x.get(t.strings);return void 0===e&&x.set(t.strings,e=new M(t)),e}O(t){c(this._$AH)||(this._$AH=[],this._$AR());const e=this._$AH;let i,s=0;for(const n of t)s===e.length?e.push(i=new T(this.S(h()),this.S(h()),this,this.options)):i=e[s],i._$AI(n),s++;s<e.length&&(this._$AR(i&&i._$AB.nextSibling,s),e.length=s)}_$AR(t=this._$AA.nextSibling,e){var i;for(null===(i=this._$AP)||void 0===i||i.call(this,!1,!0,e);t&&t!==this._$AB;){const e=t.nextSibling;t.remove(),t=e}}setConnected(t){var e;void 0===this._$AM&&(this._$C_=t,null===(e=this._$AP)||void 0===e||e.call(this,t))}}class E{constructor(t,e,i,s,n){this.type=1,this._$AH=w,this._$AN=void 0,this.element=t,this.name=e,this._$AM=s,this.options=n,i.length>2||""!==i[0]||""!==i[1]?(this._$AH=Array(i.length-1).fill(new String),this.strings=i):this._$AH=w}get tagName(){return this.element.tagName}get _$AU(){return this._$AM._$AU}_$AI(t,e=this,i,s){const n=this.strings;let o=!1;if(void 0===n)t=C(this,t,e,0),o=!a(t)||t!==this._$AH&&t!==y,o&&(this._$AH=t);else{const s=t;let r,l;for(t=n[0],r=0;r<n.length-1;r++)l=C(this,s[i+r],e,r),l===y&&(l=this._$AH[r]),o||(o=!a(l)||l!==this._$AH[r]),l===w?t=w:t!==w&&(t+=(null!=l?l:"")+n[r+1]),this._$AH[r]=l}o&&!s&&this.P(t)}P(t){t===w?this.element.removeAttribute(this.name):this.element.setAttribute(this.name,null!=t?t:"")}}class L extends E{constructor(){super(...arguments),this.type=3}P(t){this.element[this.name]=t===w?void 0:t}}const P=i?i.emptyScript:"";class U extends E{constructor(){super(...arguments),this.type=4}P(t){t&&t!==w?this.element.setAttribute(this.name,P):this.element.removeAttribute(this.name)}}class B extends E{constructor(t,e,i,s,n){super(t,e,i,s,n),this.type=5}_$AI(t,e=this){var i;if((t=null!==(i=C(this,t,e,0))&&void 0!==i?i:w)===y)return;const s=this._$AH,n=t===w&&s!==w||t.capture!==s.capture||t.once!==s.once||t.passive!==s.passive,o=t!==w&&(s===w||n);n&&this.element.removeEventListener(this.name,this,s),o&&this.element.addEventListener(this.name,this,t),this._$AH=t}handleEvent(t){var e,i;"function"==typeof this._$AH?this._$AH.call(null!==(i=null===(e=this.options)||void 0===e?void 0:e.host)&&void 0!==i?i:this.element,t):this._$AH.handleEvent(t)}}class I{constructor(t,e,i){this.element=t,this.type=6,this._$AN=void 0,this._$AM=e,this.options=i}get _$AU(){return this._$AM._$AU}_$AI(t){C(this,t)}}const z=e.litHtmlPolyfillSupport;null==z||z(M,T),(null!==(t=e.litHtmlVersions)&&void 0!==t?t:e.litHtmlVersions=[]).push("2.3.1");
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
const R=2,k=t=>(...e)=>({_$litDirective$:t,values:e});
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
class O extends class{constructor(t){}get _$AU(){return this._$AM._$AU}_$AT(t,e,i){this._$Ct=t,this._$AM=e,this._$Ci=i}_$AS(t,e){return this.update(t,e)}update(t,e){return this.render(...e)}}{constructor(t){if(super(t),this.it=w,t.type!==R)throw Error(this.constructor.directiveName+"() can only be used in child bindings")}render(t){if(t===w||null==t)return this._t=void 0,this.it=t;if(t===y)return t;if("string"!=typeof t)throw Error(this.constructor.directiveName+"() called with a non-string value");if(t===this.it)return this._t;this.it=t;const e=[t];return e.raw=e,this._t={_$litType$:this.constructor.resultType,strings:e,values:[]}}}O.directiveName="unsafeHTML",O.resultType=1;k(O);
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */class V extends O{}V.directiveName="unsafeSVG",V.resultType=2;const D=k(V),W=["https://hoppscotch.io"];let q=[],J="",Z="https://hoppscotch.io",j="";const G=t=>new Promise(((e,i)=>{chrome.storage.sync.set({originList:JSON.stringify(t)},(()=>{e()}))})),F=t=>{t.preventDefault();try{const t=new URL(J);q.includes(t.origin)?(j="Origin is already on the list",b(X(),document.body)):(q.push(t.origin),J="",G(q),j="",b(X(),document.body))}catch(t){j="Improper URL",b(X(),document.body)}},K=t=>{J=t.target.value,j="",b(X(),document.body)},Q=async t=>{q.splice(t,1),await G(q),b(X(),document.body)},X=()=>f`
  ${tt(J,K,F)}
  ${Y(j)} ${et(q,Q)}
`,Y=t=>f`
  ${t.length>0?f`
        <div class="err">
          ${D('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="18px" height="18px"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-2h2v2zm0-4h-2V7h2v6z"/></svg>\n')}
          <span class="err-text"> ${t} </span>
        </div>
      `:f``}
`,tt=(t,e,i)=>f`
  <form novalidate class="origin-input-box">
    <label class="origin-input-label" for="origin-input">Enter new origin</label>

    <div class="origin-input-wrapper">
      <input id="origin-input" required placeholder="${Z}" class="origin-input" .value=${t} @input=${e}></input>
      <button class="origin-add" type="submit" @click=${i}>
        ${D('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="18px" height="18px"><path d="M0 0h24v24H0z" fill="none"/><path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"/></svg>\n')}
        <span class="button-text">Add</span>
      </button>
    </div>
  </form>
`,et=(t,e)=>f`
  <label class="origin-input-label">Active origins</label>
  <ul class="origin-list">
    ${t.map(((t,i)=>f`
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
`;new Promise(((t,e)=>{chrome.storage.sync.get(["originList"],(async e=>{e&&e.originList||(await G(W),t(W)),t(JSON.parse(e.originList))}))})).then((t=>{q=t,b(X(),document.body)})).catch((()=>{})),chrome.tabs.query({active:!0},(t=>{if(t.length>0)try{if(t[0].url){if(!t[0].url.startsWith("http"))return;const e=new URL(t[0].url);e&&e.origin&&(Z=e.origin,J=e.origin),b(X(),document.body)}}catch(t){}}))})();
//# sourceMappingURL=popup-script.js.map
