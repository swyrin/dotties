// LICENSE_CODE ZON
'use strict'; 

window.chrome.runtime.sendMessage({
    type: 'be_msg_req',
    _type: 'login_done_popup',
    msg: {msg: 'call_api', obj: 'be_premium', func: 'login_popup_done',
        skip_resp: true},
});
window.close();
