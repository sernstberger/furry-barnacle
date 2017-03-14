// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
//= require trix


$(document).on('turbolinks:load', function() {
  $('#carouselExampleSlidesOnly .carousel-indicators li:first').addClass('active');
  $('#carouselExampleSlidesOnly .carousel-inner .carousel-item:first').addClass('active');



  $('input.datepicker').datepicker({
    onSelect: function () {
      // console.log(this.id);
      inputId = this.id
      $('input[type="hidden"]#' + inputId).val(this.value);
    },
    dateFormat: 'yy-mm-dd'
  });


  // sortable planner list
  $( '#sortable' ).sortable({
    placeholder: '.ui-state-highlight',
        forcePlaceholderSize: true // <--- add this

  });


  $( '.blarg' ).sortable({
    placeholder: 'ui-state-highlight',
    connectWith: ".blarg",
    revert: true,
    dropOnEmpty: true
  });


});
