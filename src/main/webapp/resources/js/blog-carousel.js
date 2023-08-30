$(document).on('ready', function() {

    $("#post-gallery").owlCarousel({

        navigation: true, // Show next and prev buttons
        slideSpeed: 3000,
        paginationSpeed: 400,
        singleItem: true,
        pagination: false,
        autoPlay: true,
        navigationText: ["<i class='fa fa-arrow-circle-o-left'></i>", "<i class='fa fa-arrow-circle-o-right'></i>"],
        addClassActive: true
        

        // "singleItem:true" is a shortcut for:
        // items : 1, 
        // itemsDesktop : false,
        // itemsDesktopSmall : false,
        // itemsTablet: false,
        // itemsMobile : false

    });

});





