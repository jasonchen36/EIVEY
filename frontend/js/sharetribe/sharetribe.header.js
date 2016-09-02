(function(){

    var $ = jQuery,
        animations = app.animations,
        userMenuOpenListenerClass = '.l--user-menu-open',
        userMenuCloseListenerClass = '.l--user-menu-close',
        userMenuToggle = $('#header-user-toggle-menu'),
        userMenuAnchor = $('#header-user-desktop-anchor'),
        mobileUserMenu = $('#mobile-user-menu-fullscreen-container');

    function openUserMenu(){
        animations.fadeIn(mobileUserMenu);
    }

    function closeUserMenu(){
        animations.fadeOut(mobileUserMenu);
    }

    this.init = function(){
        //set user menu dropdown to same width as anchor
        userMenuToggle.width(userMenuAnchor.outerWidth());

        //clone user menu
        var that,
            childLink,
            childText,
            linkHtml = '';
        if (userMenuToggle.children().length > 0){
            userMenuToggle.children().each(function(){
                that = $(this);
                childLink = that.attr('href');
                childText = that.text();
                linkHtml += '<li><a href="'+childLink+'">'+childText+'</a>';
            });
        } else {
            linkHtml +=
                '<li>' +
                '<a href="/shop/en/signup">Sign-Up</a>' +
                '</li>' +
                '<li>' +
                '<a href="/shop/en/login">Log-In</a>' +
                '</li>';
        }
        mobileUserMenu.append('<ul class="standard-menu">'+linkHtml+'</ul>');

        //listeners
        $(document).on('click touchend', userMenuOpenListenerClass, function (event) {
            event.preventDefault();
            openUserMenu();
        });

        $(document).on('click touchend', userMenuCloseListenerClass, function (event) {
            event.preventDefault();
            closeUserMenu();
        });
    };

}).apply(app.sharetribe.header);