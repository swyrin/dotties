let user = document.getElementById('user');
let pass = document.getElementById('pass');
let autologin = document.getElementById('autologin');
let savebtn = document.getElementById('savebtn');

// Load config đã lưu vào form
chrome.storage.sync.get(['user', 'password', 'autologin'], function (result) {
    if (result.user != null) {
        user.value = result.user;
        pass.value = result.password;
        autologin.checked = result.autologin;
    }
});

// bắt sự kiện lưu
savebtn.onclick = function (e) {
    savebtn.textContent = "Đang lưu...";
    savebtn.disabled = true;
    chrome.storage.sync.set({
        user: user.value,
        password: pass.value,
        autologin: autologin.checked,
    }, function () {
        setTimeout(
            function () {
                savebtn.textContent = "Lưu";
                savebtn.disabled = false;
            }, 300
        );
    })
};