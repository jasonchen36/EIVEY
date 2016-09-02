(function(){

    var $ = jQuery,
        helpers = app.helpers,
        userMenuToggle = $('#header-user-toggle-menu'),
        userMenuAnchor = $('#header-user-desktop-anchor'),
        searchButtonSubmit = $('#search-button'),
        searchInput = $('#search-form-input #q');

    function getSharetribeBaseUrl(){
        return  helpers.getBaseUrl().split('/en')[0];
    }

    function searchSubmit(){
        var searchQueryKey = 'q',
            searchValue = searchInput.val(),
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

    this.init = function(){
        userMenuToggle.width(userMenuAnchor.outerWidth());

        searchButtonSubmit.on('click touchend', function(){
            searchSubmit();
        });
    };

}).apply(app.header);