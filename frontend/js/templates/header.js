(function(){

    var $ = jQuery,
        animations = app.animations,
        helpers = app.helpers,
        searchListenerClass = '.l--search-submit',
        menuOpenListenerClass = '.l--menu-open-submit',
        menuCloseListenerClass = '.l--menu-close-submit',
        mobileMenu = $('#mobile-menu-fullscreen-container');

    function getSharetribeBaseUrl(){
        var baseUrl = [location.protocol, '//', location.host].join(''),
            sharetribeDirectory = '/shop';
        if (baseUrl.indexOf('.com') !== -1) {
            //for local environment
            sharetribeDirectory = '';
            if (baseUrl.indexOf(':3000') === -1){
                sharetribeDirectory = ':3000';
            }
        }
        if (baseUrl.charAt(baseUrl.length - 1) === '/') {
            baseUrl = baseUrl.substring(0,baseUrl.length-1);
        }
        return baseUrl+sharetribeDirectory;
    }

    function searchSubmit(activeSubmitButton){
        var searchQueryKey = 'q',
            searchValue = activeSubmitButton.prev().val(),
            urlParameters = helpers.getUrlParameters();
        if (searchValue.length > 0){
            if (urlParameters.hasOwnProperty(searchQueryKey)){
                urlParameters[searchQueryKey] = searchValue;
                var urlParametersArray = [];
                for (var key in urlParameters) {
                    if (urlParameters.hasOwnProperty(key)) {
                        urlParametersArray.push(key+'='+urlParameters[key]);
                    }
                }
                window.location.href = getSharetribeBaseUrl()+'?'+urlParametersArray.join('&');
            } else {
                var delimiter = '?';
                if (window.location.href.indexOf('?') !== -1){
                    delimiter = '&';
                }
                window.location.href = getSharetribeBaseUrl()+delimiter+searchQueryKey+'='+searchValue;
            }
        }
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