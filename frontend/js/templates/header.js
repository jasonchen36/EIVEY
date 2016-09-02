(function(){

    var $ = jQuery,
        helpers = app.helpers,
        listenerSearchSubmit = $('.l--search-submit');

    function getSharetribeBaseUrl(){
        var baseUrl = helpers.getBaseUrl().split('/en')[0],
            sharetribeDirectory = '/shop';
        if (baseUrl.indexOf('.com') !== -1){
            //not needed for production env
            sharetribeDirectory = ':3000';
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

    this.init = function(){
        listenerSearchSubmit.on('click touchend', function(event){
            event.preventDefault();
            searchSubmit($(this));
        });
    };

}).apply(app.header);