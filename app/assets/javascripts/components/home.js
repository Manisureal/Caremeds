// Sliding Content on Home Page Banner //

function fadeContent() {
  $(".fadeInLeft .content:hidden:first").fadeIn(500).delay(2000).fadeOut(500, function() {
    $(this).appendTo($(this).parent());
    fadeContent();
    });
  }

fadeContent();
