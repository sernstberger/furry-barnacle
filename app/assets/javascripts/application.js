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
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require turbolinks
//= require tether
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
    forcePlaceholderSize: true
  });


  $( '.stop-list' ).sortable({
    placeholder: 'ui-state-highlight',
    connectWith: ".stop-list",
    revert: true,
    dropOnEmpty: true,
    scroll: true,
    // items: "div:not(.emptyMessage)",
    update: function() {
      console.log( $(this).data('update-url') );
      console.log( $(this).sortable('serialize') );
      $.post($(this).data('update-url'), $(this).sortable('serialize'));

    },
    receive: function(event, ui) {
           //hide empty message on receiver
           $('.emptyMessage', this).removeClass('shown');

           //show empty message on sender if applicable
           if($('div:not(.emptyMessage)', ui.sender).length == 0){
               $('.emptyMessage', ui.sender).addClass('shown');
           } else {
               $('.emptyMessage', ui.sender).removeClass('shown');
           }
       }
  });



  $('#new_photo').fileupload({
    dataType: "script",
    add: function(e, data) {
      var file, types;
      types = /(\.|\/)(gif|jpe?g|png)$/i;
      file = data.files[0];
      if (types.test(file.type) || types.test(file.name)) {
        data.context = $(tmpl("template-upload", file));
        $('#new_photo').append(data.context);
        return data.submit();
      } else {
        return alert(file.name + " is not a gif, jpeg, or png image file");
      }
    },
    progress: function(e, data) {
      var progress;
      if (data.context) {
        progress = parseInt(data.loaded / data.total * 100, 10);
        return data.context.find('.progress-bar').css('width', progress + '%');
      }
    }
  });






});




$(document).on('change', '#destination_name', function() {
  if ( $('#destination_slug').val() == '' ) {
    slug = $('#destination_name').val().toLowerCase().replace(/[^\w ]+/g,'').replace(/ +/g,'-');
    // console.log('slug: ' + slug);
    $('#destination_slug').val(slug)
  }
});

$(document).on('click', '#destinationStickyNav a', function(event){
    event.preventDefault();

    $('html, body').animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top - 150
    }, 500);
});

// Take the tab index off of the trix editor buttons
// document.addEventListener("trix-initialize", function(event) {
//   for (var element of event.target.toolbarElement.querySelectorAll("button")) {
//     element.tabIndex = -1
//   }
// });
