function inject(filePath) {
    var s = document['createElement']('script');
    s['src'] = chrome['extension']['getURL'](filePath);
    s['onload'] = function () {
        this['parentNode']['removeChild'](this)
    };
    (document['head'] || document['documentElement'])['appendChild'](s);
}

inject('js/content.js');
inject('js/toastr.js');

chrome.storage.sync.get('autologin', function (data) {
    if (data.autologin)
        login();
});

function login() {
    chrome.storage.sync.get(['user', 'password'], function (result) {
        try {
            let userArea;
            let passArea;
            let loginButton;
            //Vì id user area và pass area khác nhau ở một số trang nên check id button đăng nhập để điền user và pass
            if (document.getElementById("ctl00_ContentPlaceHolder1_ctl00_btnDangNhap") != null) {
                userArea = document.getElementById("ctl00_ContentPlaceHolder1_ctl00_txtTaiKhoa");
                passArea = document.getElementById("ctl00_ContentPlaceHolder1_ctl00_txtMatKhau");
                loginButton = document.getElementById("ctl00_ContentPlaceHolder1_ctl00_btnDangNhap");
            } else if (document.getElementById("ctl00_ContentPlaceHolder1_ctl00_ucDangNhap_btnDangNhap") != null) {
                userArea = document.getElementById("ctl00_ContentPlaceHolder1_ctl00_ucDangNhap_txtTaiKhoa");
                passArea = document.getElementById("ctl00_ContentPlaceHolder1_ctl00_ucDangNhap_txtMatKhau");
                loginButton = document.getElementById("ctl00_ContentPlaceHolder1_ctl00_ucDangNhap_btnDangNhap");
            }
            if (loginButton != null) {
                userArea.value = result.user;
                passArea.value = result.password;
                setTimeout(function () {
                    loginButton.click();
                }, 3000)
            }
        } catch {
            console.log("Đã xảy ra lỗi khi thực hiện đăng nhập tự động");
        }
    })
}