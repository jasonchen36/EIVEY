(function(){

    var $ = jQuery,
        animations = app.animations,
        header = app.header,
        userMenuOpenListenerClass = '.l--user-menu-open',
        userMenuCloseListenerClass = '.l--user-menu-close',
        userMenuToggle = $('#header-user-toggle-menu'),
        mobileUserMenu = $('#mobile-user-menu-fullscreen-container'),
        sellButton = $('#new-listing-link'),
        menuCategories = $('#menu-categories');

    function openUserMenu(){
        animations.fadeIn(mobileUserMenu);
    }

    function closeUserMenu(){
        animations.fadeOut(mobileUserMenu);
    }

    function createMobileUserMenu(){
        //clone user menu
        var that,
            childLink,
            childText,
            sellLink = sellButton.attr('href'),
            sellText = sellButton.text().toLowerCase(),
            linkHtml = '<li><a href="'+sellLink+'">'+sellText+'</a>',
            baseUrl = header.getSharetribeBaseUrl();
        if (userMenuToggle.children().length > 0){
            userMenuToggle.children().each(function(){
                that = $(this);
                childLink = that.children().first().attr('href');
                childText = that.text().toLowerCase();
                linkHtml += '<li><a href="'+childLink+'">'+childText+'</a>';
            });
        } else {
            linkHtml +=
                '<li>' +
                '<a href="'+baseUrl+'/en/signup">Sign-Up</a>' +
                '</li>' +
                '<li>' +
                '<a href="'+baseUrl+'/en/login">Log-In</a>' +
                '</li>';
        }
        mobileUserMenu.append('<ul class="standard-menu">'+linkHtml+'</ul>');
    }

    function createMobileMainMenu(){
        if (menuCategories.children().length > 0){
            $('#mobile-menu-main').html(menuCategories.children().clone());
        } else {
            $('#mobile-menu-clothing').hide();
        }
    }

    this.init = function(){
        createMobileUserMenu();
        createMobileMainMenu();

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