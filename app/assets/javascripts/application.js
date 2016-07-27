// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require turbolinks
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.remotipart
//= require semantic-ui
//= require checkbox
//= require form
//= require modal
//= require dropdown
//= require visibility
//= require dimmer
//= require message
//= require video
//= require videojs

$(document).ready(function(e){
  document.addEventListener('turbolinks:load', function(){
    $('.ui.flash').hide().delay(800).fadeIn(800).delay(5000).fadeOut(300);
    if($('#video_video').length > 0){
      var input = document.getElementById( 'video_video' );
      var label = document.getElementById( 'video_button' );
      if(input !== null){
        input.addEventListener( 'change', function( e ){
          var fileName = '';
          if( this.files && this.files.length > 1 ){
            fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
          }
          else{
            fileName = e.target.value.split( '\\' ).pop();
          }

          if( fileName ){
            $("#video_button span").html(fileName);
          }
          else{
            $("#video_button").html(labelVal);
          }
        });
        input.addEventListener( 'focus', function(){ input.classList.add( 'has-focus' ); });
        input.addEventListener( 'blur', function(){ input.classList.remove( 'has-focus' ); });
      }
    }
    if($('#document_files').length > 0){
      var input = document.getElementById( 'document_files' );
      var label = document.getElementById( 'file_button' );
      if(input !== null){
        input.addEventListener( 'change', function( e ){
          var fileName = '';
          if( this.files && this.files.length > 1 ){
            fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
          }
          else{
            fileName = e.target.value.split( '\\' ).pop();
          }

          if( fileName ){
            $("#file_button span").html(fileName);
          } 
          else{
            $("#file_button").html(labelVal);
          }
        });
        input.addEventListener( 'focus', function(){ input.classList.add( 'has-focus' ); });
        input.addEventListener( 'blur', function(){ input.classList.remove( 'has-focus' ); });
      }
    }
  });

});
