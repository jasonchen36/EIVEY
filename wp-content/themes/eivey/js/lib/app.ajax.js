(function() {
    var that = app.ajax,
        helpers = app.helpers,
        $ = jQuery;

    this.ajax= function(method,url,data,contentType) {
        var parameters =  {
            method: method,
            url: url,
            data: data,
            xhrFields: {
                withCredentials: true
            }
        };
        if(data && helpers.sizeOfObject(data) > 0) {
            if (contentType === 'json') {
                parameters.data = JSON.stringify(data);
                parameters.contentType= "application/json";
            } else {
                parameters.data = data;
            }
        }
        return that.ajaxCall(parameters);
    };

    this.ajaxCall = function(parameters) {
        return new Promise(function(resolve,reject) {
            $.ajax(parameters)
                .then(function(data) {
                    resolve(data);
                })
                .fail(function(jqXHR,textStatus,errorThrown) {
                    reject({
                        jqXHR:jqXHR,
                        textStatus:textStatus,
                        errorThrown:errorThrown
                    });
                });
        });
    };

}).apply(app.ajax);
