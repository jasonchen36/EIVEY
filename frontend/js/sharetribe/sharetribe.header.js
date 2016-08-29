(function(){

    var $ = jQuery,
        userMenuToggle = $('#header-user-toggle-menu'),
        userMenuAnchor = $('#header-user-desktop-anchor');

    this.init = function(){
        userMenuToggle.width(userMenuAnchor.outerWidth());
    };

}).apply(app.header);