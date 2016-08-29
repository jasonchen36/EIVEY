/*

 this follows the namespacing pattern listed here https://addyosmani.com/blog/essential-js-namespacing/

 */


//chose a better global variable name to reduce chances of conflict
var app = {

    //lib
    ajax: {},
    animations: {},
    // cookies: {},
    // handlebars: {},
    helpers: {},
    // state: {},

    //modules
    // carousel: {},

    //templates
    header: {},

    //functions
    init: function(){

        //helpers
        // if (!cookies.areCookiesEnabled()) {
        //     alert('Cookies are not supported by your browser. Please disable "Private Mode" or upgrade to a modern browser in order to use this website.');
        // }
        // app.handlebars.applyHelpers();


        //modules
        // if (carousel.hasCarousels()){
        //     carousel.init();
        // }

        //templates
        app.header.init();
    }
};

//wait for the dom to load
$(function(){
    app.init();
});