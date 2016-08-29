(function(){
    
    var $ = jQuery,
        that = app.helpers,
        bodyElement = $('body');

    this.sizeOfObject = function(data){
        if (data){
            return Object.keys(data).length;
        } else {
            return 0;
        }
    };
    
    this.getFormData = function(formElement){
        var data = {};
        formElement.find('input').each(function(){
            data[$(this).attr('name')] = $(this).attr('value');
        });
        return data;
    };

    this.getUrlParameters = function(){
        var params={};
        window.location.search
            .replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str,key,value) {
                    params[key] = value;
                }
            );
        return params;
    };
    
    this.isIndexPage = function(){
        return bodyElement.hasClass('home');
    };
    
}).apply(app.helpers);