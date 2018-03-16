// Click on underlined text to take the user to the relative section on the page //

$(".clickToScroll").click(function() {
  $('html, body').animate({
    scrollTop: $(".pad-bot").offset().top
  }, 1500);
});
