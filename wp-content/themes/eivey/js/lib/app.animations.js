(function(){

    var $ = jQuery,
        that = app.animations;

    this.scrollingToTop = false;

    //default animation function
    this.animateElement = function(element, params){
        var duration = params.hasOwnProperty('duration') ? params.duration : 250,
            begin = params.hasOwnProperty('begin') ? params.begin : function () {},
            queue = params.hasOwnProperty('queue') ? params.queue : false,
            delay = params.hasOwnProperty('delay') ? params.delay : 0,
            complete = params.hasOwnProperty('complete') ? params.complete: function(){},
            easing = params.hasOwnProperty('easing') ? params.easing : 'swing';
        return new Promise(function(resolve,reject) {
            if (!queue){
                $(element).velocity('stop', true);
            }
            $(element).velocity(params.properties, {
                duration: duration,
                begin: begin,
                delay: delay,
                easing: easing,
                complete: function(elements){
                    try {
                        complete();
                    } catch (e){
                        console.log(e);
                    }
                    return resolve(elements);
                }
            });
        });
    };

    //scroll page to top of viewport
    this.scrollToTop = function(){
        return new Promise(function(resolve,reject) {
            $('html').velocity('stop', true).velocity('scroll', {
                duration: 750,
                offset: 0,
                mobileHA: false,
                begin: function () {
                    that.scrollingToTop = true;
                },
                complete: function (elements) {
                    that.scrollingToTop = false;
                    resolve(elements);
                }
            });
        });
    };

    //element fade out helper
    this.fadeOut = function(element, params){
        if (!params){
            params = {};
        }
        var duration =  params.hasOwnProperty('duration') ? params.duration : 250,
            begin =  params.hasOwnProperty('begin') ? params.begin : function () {};
        return that.animateElement(element, {
                properties: {'opacity': 0},
                duration: duration,
                begin: begin
            })
            .then(function(){
                element.css({display: 'none'});
            });
    };

    //element fade in helper
    this.fadeIn = function(element, params){
        if (!params){
            params = {};
        }
        var duration = params.hasOwnProperty('duration') ? params.duration : 250,
            begin =  params.hasOwnProperty('begin') ? params.begin : function () {},
            display =  params.hasOwnProperty('display') ? params.display :'block',
            opacity = params.hasOwnProperty('opacity') ? params.opacity: 1;
        return that.animateElement(element, {
            properties: {'opacity': opacity},
            duration: duration,
            begin: function () {
                element.css({display: display});
                try {
                    begin();
                } catch (e){
                    console.log(e);
                }
            }
        });
    };

}).apply(app.animations);