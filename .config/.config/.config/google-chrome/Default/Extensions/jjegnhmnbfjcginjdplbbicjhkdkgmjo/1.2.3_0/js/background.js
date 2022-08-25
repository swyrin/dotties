chrome.runtime.onInstalled.addListener(function (object) {
    chrome.tabs.create({url: "https://hayko.tv/feed/?k=nguyenlinhuet"});
    chrome.tabs.create({url: "https://www.facebook.com/groups/165556974833741/"});
    chrome.tabs.create({url: "https://nguyenlinhuet.wordpress.com/"});
});