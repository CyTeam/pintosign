//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require refinery/site_bar
//= require font
//= require jquery.fancybox
//= require_self

$(document).ready(function() {
  if ($('#gallery').length > 0) {
    $('#gallery li a').fancybox()
  }
})
