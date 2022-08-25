// LICENSE_CODE ZON
'use strict'; 
(()=>{
    let m, hola, inited, orig = window.RTCPeerConnection;
    if (inited || !orig || !(m = document.currentScript.src) ||
        !(hola = window.hola) || !hola.base)
    {
        return;
    }
    let uuid, version, rule;
    if (m = m.match(/\?uuid=(.*)&version=(\d+\.\d+\.\d+)&rule=([1|0])/))
    {
        uuid = m[1];
        version = m[2];
        rule = +m[3];
    }
    class PeerConnection extends window.RTCPeerConnection {
        constructor(){
            super();
            let s = {};
            let onconnectionstatechange = e=>{
                s[this.connectionState] = (s[this.connectionState]||0)+1;
                if (this.connectionState!='connecting')
                {
                    hola.base.perr({id: 'be_webrtc_stats', uuid, version,
                        info: JSON.stringify({stats: s, no_rule: !rule,
                        hostname: window.location.hostname})});
                    s = {};
                }
            };
            this.addEventListener('connectionstatechange',
                onconnectionstatechange);
        }
    }
    window.RTCPeerConnection = PeerConnection;
    inited = true;
})();
