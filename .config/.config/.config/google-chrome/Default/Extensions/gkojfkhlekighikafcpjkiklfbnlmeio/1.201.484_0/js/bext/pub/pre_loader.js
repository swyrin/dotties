// LICENSE_CODE ZON
'use strict'; 
(()=>{
const chrome = window.chrome;
const hola = window.hola = window.hola||{};
const E = hola.base = {};
function _zerr(){
    if (typeof window!='object' || !window.console || !window.console.error)
        return;
    Function.prototype.apply.bind(window.console.error,
        window.console)(arguments);
}

const uri_comp = s=>encodeURIComponent(s).replace(/%20/g, '+');

const qs = (param, opt)=>{
    var uri = '';
    if (!param)
        return uri;
    opt = opt||{};
    var _uri_comp = opt.space_plus ? uri_comp : window.encodeURIComponent;
    for (var i in param)
    {
        var val = param[i];
        if (val===null||val===undefined)
            continue;
        uri += (!uri ? '' : '&')+_uri_comp(i)+'='+_uri_comp(val);
    }
    return uri;
};

const chrome_details = chrome && chrome.runtime &&
    chrome.runtime.getManifest && chrome.runtime.getManifest();
const perr_url = '{[=1]}'=='1' && '{[=it.perr_url]}' || 'perr.hola.org';
E.defaults = {
    conf: {url_ccgi: 'https://client.hola.org/client_cgi',
        url_perr: 'https://'+perr_url+'/client_cgi', type: 'unknown',
        browser: {firefox: !chrome}},
    zon_config: {CONFIG_MAKEFLAGS: '',
        ZON_VERSION: chrome_details ? chrome_details.version : '0.0.0'}
};

E.get_conf = ()=>window.conf||E.defaults.conf;
E.get_zon_config = ()=>window.zon_config||E.defaults.zon_config;

var rate_limit = (rl, ms, n)=>{
    var now = Date.now();
    if (!rl.count || rl.ts+ms<now)
    {
        rl.count = 1;
        rl.ts = now;
        return true;
    }
    rl.count++;
    return rl.count<=n;
};

var check_rate_limit = opt=>{
    var _rate_limit = opt.rate_limit;
    if (!_rate_limit)
        return true;
    var hash = {}, rl;
    try {
        hash = JSON.parse(localStorage.getItem('perr_rate_limit') || '{}');
    } catch(e){}
    rl = hash[opt.id] = hash[opt.id]||{};
    var res = rate_limit(rl, _rate_limit.ms || 1000*60*60,
        _rate_limit.count || 10);
    try {
        localStorage.setItem('perr_rate_limit', JSON.stringify(hash));
    } catch(e){ _zerr('localStorage.setItem failed'); }
    return res;
};

E.raw_perr = opt=>{
    try {
        var url = E.get_conf().url_perr+'/perr';
        var xhr = new XMLHttpRequest();
        xhr.open('POST', url+'?'+qs(opt, {space_plus: true}));
        xhr.send(null);
    } catch(e){ _zerr('raw_perr failed '+e.stack); }
};

var get_hola_extension_info = ()=>{
    if (window.hola_extension_info)
        return window.hola_extension_info;
    try {
        var a;
        if (a = document.documentElement.getAttribute('hola_extension_info'))
            return JSON.parse(a);
    } catch(e){}
};

E.perr_prepare = opt=>{
    var build = E.build_info(opt);
    try {
        opt.uuid = opt.uuid || (get_hola_extension_info()||{}).uuid ||
            localStorage.getItem('uuid');
    } catch(e){ _zerr('perr failed '+e.stack); }
    opt.cid = opt.cid || window.hola_svc_info&&window.hola_svc_info.cid;
    opt.ver = build.version;
    opt.browser = opt.browser||E.browser();
    opt.build = opt.build||E.build(opt);
    opt.url = location.href;
    return opt;
};

E.perr_once_cache = {};
E.perr_once = opt=>{
    opt = E.perr_prepare(opt);
    var id = opt.id, info = opt.info;
    var holder = E.perr_once_cache[id] = E.perr_once_cache[id]||{};
    if (info in holder)
        return holder[info];
    if (!check_rate_limit(opt))
        return;
    var key = id+'.'+info;
    var item;
    try { item = localStorage.getItem(key); }
    catch(e){ _zerr('localStorage.getItem failed'); }
    if (item===null)
    {
        item = E.raw_perr(opt)||0;
        try { localStorage.setItem(key, item); }
        catch(e){ _zerr('localStorage.setItem failed'); }
    }
    return holder[info] = item;
};

E.perr = opt=>{
    opt = E.perr_prepare(opt);
    if (!check_rate_limit(opt))
        return;
    E.raw_perr(opt);
};

var check_opera = /\bOPR\b\/(\d+)/i;
var check_edge = /\bEdg\/(\d+)/i;
var check_hola = /\bHola\b\/(\d+)/i;
var check_ff = /\b(Firefox|PaleMoon)\/(\d+).\d/;
E.browser = ()=>{
    var ua = navigator.userAgent;
    if (check_ff.test(ua))
        return 'firefox';
    if (check_hola.test(ua))
        return 'hola';
    if (check_opera.test(ua))
        return 'opera';
    if (check_edge.test(ua))
        return 'edge';
    return 'chrome';
};

E.build_info = opt=>{
    opt = opt||{};
    var zconf = E.get_zon_config(), conf = E.get_conf();
    var info = {version: zconf.ZON_VERSION && zconf.ZON_VERSION!='0.0.0' ?
        zconf.ZON_VERSION : opt.version||zconf.ZON_VERSION};
    info.makeflags = zconf.CONFIG_MAKEFLAGS;
    if (conf.firefox_web_ext)
        info.product_type ='webextension';
    else if (chrome)
        info.product_type = E.get_conf().type;
    info.id = chrome ? chrome.runtime&&chrome.runtime.id :
        'jid1-4P0kohSJxU1qGg@jetpack';
    info.browser = E.browser();
    info.browser_build = window.conf && window.conf.browser.name ||
        E.browser();
    info.platform = navigator.platform;
    info.user_agent = navigator.userAgent;
    return info;
};

E.build = opt=>{
    var info = E.build_info(opt), s = '';
    for (var f in info)
        s += (s ? '\n' : '')+f+': '+info[f];
    return s;
};

const require_perr_sent = [];

E.require_on_error = err=>{
    var mods = err.requireModules||[], _mods = mods.join(' ');
    var id = 'be_int_require_err';
    if (!err.fallback)
        id += '_fin';
    _zerr('require fatal error, modules: '+_mods+'\n'+err.stack);
    err.require_handled = true;
    if (require_perr_sent.indexOf(id)<0)
    {
        var fh;
        if (typeof require!='undefined')
            mods.map(m=>require.toUrl(m)).join('\n');
        E.perr({id, info: _mods || ''+err, bt: err.stack, filehead: fh});
        require_perr_sent.push(id);
    }
    if (!err.fallback)
        throw err;
};

var prev_error_handler = window.onerror;
window.onerror = E.onerror = function(message, file, line, col, err){
    var error_location = file+':'+line+':'+col;
    if (typeof message=='object')
        message = message.toString();
    _zerr('js error: '+error_location+'\n'+message);
    if (err && err.require_handled)
        return;
    E.perr_once({
        id: 'be_js_err',
        info: JSON.stringify({file: error_location, msg: message,
            href: location.href}),
        bt: err&&err.stack || '',
        filehead: 'userAgent: '+navigator.userAgent,
    });
    if (prev_error_handler)
        prev_error_handler.apply(window, arguments);
};

if (performance.mark)
    performance.mark('pre_loader');
})();
