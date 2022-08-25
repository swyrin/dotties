// LICENSE_CODE ZON
'use strict'; 
(()=>{
    let m;
    if (!navigator.geolocation || !(m = document.currentScript.src) ||
        !(m = m.match(/\?latitude=(-?[\d.]+)&longitude=(-?[\d.]+)/)))
    {
        return;
    }
    navigator.geolocation.getCurrentPosition = function(succ, err, opt){
        succ({
            coords: {
                accuracy: 10,
                altitude: null,
                altitudeAccuracy: null,
                heading: null,
                latitude: +m[1],
                longitude: +m[2],
                speed: null,
            },
            timestamp: Date.now(),
        });
    };
    navigator.geolocation.watchPosition = function(succ, err, opt){
        this.getCurrentPosition(succ, err, opt);
        return Math.floor(Math.random()*10000);
    };
    navigator.geolocation.clearWatch = function(){};
})();
