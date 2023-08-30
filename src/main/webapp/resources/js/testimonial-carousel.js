$(document).on('ready', function() {

    $(".testimonial").owlCarousel({

        navigation: true, // Show next and prev buttons
        slideSpeed: 3000,
        paginationSpeed: 400,
        singleItem: true,
        pagination: false,
        autoPlay: true,
        navigationText: ["<i class='fa fa-arrow-circle-left'></i>", "<i class='fa fa-arrow-circle-right'></i>"],
        addClassActive: true
        

        // "singleItem:true" is a shortcut for:
        // items : 1, 
        // itemsDesktop : false,
        // itemsDesktopSmall : false,
        // itemsTablet: false,
        // itemsMobile : false

    });

});





