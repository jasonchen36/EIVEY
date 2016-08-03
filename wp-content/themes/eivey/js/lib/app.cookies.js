(function(){

    var $ = jQuery,
        that = app.cookies;

    this.setCookie = function(key, value){
        return store.set(key, value);
    };

    this.getCookie = function(key){
        return store.get(key);
    };

    this.clearCookie = function(key){
        return store.remove(key);
    };

    this.clearAllCookies = function(){
        return store.clear();
    };

    this.areCookiesEnabled = function(){
        return store.enabled;
    };

}).apply(app.cookies);