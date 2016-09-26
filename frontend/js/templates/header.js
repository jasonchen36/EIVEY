(function(){

    var $ = jQuery,
        that = app.header,
        animations = app.animations,
        helpers = app.helpers,
        searchListenerClass = '.l--search-submit',
        menuOpenListenerClass = '.l--menu-open',
        menuCloseListenerClass = '.l--menu-close',
        mobileMenu = $('#mobile-menu-fullscreen-container');

    this.getSharetribeBaseUrl = function(){
        var baseUrl = [location.protocol, '//', location.host].join(''),
            sharetribeDirectory = '/shop';
        if (baseUrl.indexOf('.com') !== -1 || baseUrl.indexOf(':3000') !== -1) {
            //for local environment
            sharetribeDirectory = '';
        }
        if (baseUrl.charAt(baseUrl.length - 1) === '/') {
            baseUrl = baseUrl.substring(0,baseUrl.length-1);
        }
        return baseUrl+sharetribeDirectory;
    };

    function searchSubmit(activeSubmitButton){
        var searchValue = activeSubmitButton.prev().val();
        window.location.href = that.getSharetribeBaseUrl()+'?q='+searchValue;
    }

    function openMenu(){
        animations.fadeIn(mobileMenu);
    }

    function closeMenu(){
        animations.fadeOut(mobileMenu);
    }

    this.init = function(){
        $(document).on('click touchend', searchListenerClass, function (event) {
            event.preventDefault();
            searchSubmit($(this));
        });

        $(document).on('click touchend', menuOpenListenerClass, function (event) {
            event.preventDefault();
            openMenu();
        });

        $(document).on('click touchend', menuCloseListenerClass, function (event) {
            event.preventDefault();
            closeMenu();
        });
    };

}).apply(app.header);