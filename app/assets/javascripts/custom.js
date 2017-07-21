$(document).on("click", ".load", function() {
  $(this).addClass("loading disabled");
});
$('.message .close')
  .on('click', function() {

  })
;
$(document).on("click", ".message .close", function() {
    $(this)
      .closest('.message')
      .transition('fade down')
    ;
});
/* Cookie Nag
$(document).ready(function() {
  $('.cookie.nag')
    .nag({
      key      : 'accepts-cookies',
      value    : true
    })
  ;
})

//HTML
.ui.inline.cookie.nag
  %span.title
    We use cookies to ensure you get the best experience on our website
  %i.close.icon
*/
