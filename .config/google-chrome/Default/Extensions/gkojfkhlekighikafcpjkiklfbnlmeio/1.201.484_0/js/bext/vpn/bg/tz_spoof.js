// LICENSE_CODE ZON
'use strict'; 
(()=>{
    let offset;
    if ((offset = document.currentScript.src) &&
        (offset = offset.match(/\?offset=(-?\d+)/)) && (offset = +offset[1]))
    {
        Date.prototype.getTimezoneOffset = ()=>offset;
    }
})();
