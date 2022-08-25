// LICENSE_CODE ZON
'use strict'; 
(function(){
var allowed_origin = /^https:\/\/(www\.)?(hola|zspeed-cdn|svd-cdn|h-vpn|holafreevpn|holavpnextension)\.(org|com)$/;
var allowed_chrome_origin = /^chrome:\/\/(hola-new-tab-page|new-tab-page|hola-diagnostics|hola-settings)/;
var origin = document.location.origin;
if (!origin.match(allowed_origin) && !origin.match(allowed_chrome_origin))
    return;

var chrome = window.chrome, firefox = window.self, got_info, tries = 0;
var web_ext = firefox && !firefox.port;
firefox = web_ext ? false : firefox;

function hola_ext_present(){
    document.documentElement.setAttribute('hola_ext_present', 'true');
    try {
        let manifest = (chrome || browser).runtime.getManifest();
        document.documentElement.setAttribute('hola_ext_version',
            manifest.version);
    } catch(e){
        console.error('failed to get extension manifest', e);
    }
}
hola_ext_present();

function resp_cb(resp){
    if (!resp)
        return;
    resp.src = chrome ? 'hola_chrome' : 'hola_firefox';
    document.defaultView.postMessage(resp, origin);
}

function embed_info(resp){
    if (!resp)
        return console.error('ipc got empty response');
    if (!chrome && !web_ext)
    {
        if (resp.id!='ping' && resp.id!='callback' || got_info)
            return;
        got_info = true;
        firefox.port.removeListener('resp', embed_info);
    }
    resp.data = JSON.stringify(resp.data);
    document.documentElement.setAttribute('hola_extension_info', resp.data);
}

function message_cb(e){
    var origin = e.origin||'';
    var target = e.data && e.data.target || 'vpn';
    if (!origin.match(allowed_origin) && !origin.match(allowed_chrome_origin))
        return;
    if (e.data.src!='hola_ccgi' || target!='vpn')
        return;
    if (e.data.id=='cs_ping')
        return resp_cb(Object.assign({pong: 1}, e.data));
    if (chrome)
    {
        try {
            chrome.runtime.sendMessage(e.data, resp_cb);
        } catch(err){
            if (err.message.includes('context invalidated'))
                location.reload();
        }
        return;
    }
    if (web_ext)
        return browser.runtime.sendMessage(e.data, resp_cb);
    firefox.port.emit('req', e.data);
}
window.addEventListener('message', message_cb, false);
if (chrome)
    return chrome.runtime.sendMessage({id: 'ping'}, embed_info);
if (web_ext)
    return browser.runtime.sendMessage({id: 'ping'}, embed_info);

function get_info_ff(){
    if (got_info)
        return;
    if (tries++>10)
        return console.error('failed to get info from extensions');
    firefox.port.emit('req', {id: 'ping'});
    setTimeout(get_info_ff, 200);
}

function uninit(){
    try {
        window.removeEventListener('message', message_cb);
    } catch(e){}
    firefox.port.removeListener('resp', resp_cb);
    firefox.port.removeListener('resp', embed_info);
    firefox.removeListener('detach', uninit);
    firefox.port.removeListener('detach', uninit);
}
firefox.port.on('resp', resp_cb);
firefox.port.on('resp', embed_info);
firefox.on('detach', uninit); 
firefox.port.on('detach', uninit); 
get_info_ff();

})();
