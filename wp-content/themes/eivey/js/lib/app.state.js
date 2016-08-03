(function(){

    var $ = jQuery,
        that = app.state,
        cookies = app.cookies,
        helpers = app.helpers,
        cookieBase = 'app',
        userCookie = [cookieBase,'user'].join('.');

    this.getUserState = function(){
        return new Promise(function(resolve,reject) {
            var user = cookies.getCookie(userCookie),
                currentTime = moment().seconds();
            if (helpers.sizeOfObject(user) < 1 || (user && user.hasOwnProperty('expires') && currentTime > user.expires)) {
                resolve(that.setUserState());
            } else {
                resolve(user);
            }
        });
    };

    this.setUserState = function(){
        var userStateTime = moment().seconds().add(15, 'minutes');//re-check after 15 minutes
        cookies.setCookie(userCookie,{
            expires: userStateTime
        });
        return cookies.getCookie(userCookie);
    };

    this.clearUserState = function(){
        cookies.clearCookie(userCookie);
    };

}).apply(app.state);