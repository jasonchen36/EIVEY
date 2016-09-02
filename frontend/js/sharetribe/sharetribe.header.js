(function(){

    var $ = jQuery,
        userMenuToggle = $('#header-user-toggle-menu'),
        userMenuAnchor = $('#header-user-desktop-anchor'),
        searchButtonSubmit = $('#search-button');

    this.init = function(){
        userMenuToggle.width(userMenuAnchor.outerWidth());

        searchButtonSubmit.on('click touchend', function(){
            console.log('search me');
        });
    };

}).apply(app.header);