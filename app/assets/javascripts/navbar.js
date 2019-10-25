// Navbar Animation
var initialSrc = "http://bit.ly/2MKVeWC";
var scrollSrc = "http://bit.ly/2WeLWVW";

$(window).scroll(function() {
    if ($(document).scrollTop() > 50) {
        $('nav').addClass('scrolled-nav');
        $(".logo").attr("src", scrollSrc);
        $(".logo").attr("width", "120px");
        $(".nav-link").css('color', 'black');
    }
    else {
        $('nav').removeClass('scrolled-nav');
        $(".logo").attr("src", initialSrc);
        $(".logo").attr("width", "150px");
        $(".nav-link").css('color', 'white');
    }

    // Hover
    $(".nav-link").mouseenter(function() {
        $(this).css({"color":"#ffdd00", "border-bottom":"1px solid #ffdd00"});
    }).mouseleave(function() {
        $(this).css("border-bottom","none");
        if ($(document).scrollTop() > 50) {
            $(this).css("color","black");
        }
        else {
            $(this).css("color","white");   
        }
    });
})