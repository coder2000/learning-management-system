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
//= require popper
//= require bootstrap
//= require video
//= require video_player

$(document).on('turbolinks:load', function () {
    $('.dropdown-button').dropdown({hover: false});

    if ($("#new_post").length > 0) {
        $("#new_post").form()
    }
    $('.ui.flash').hide().delay(800).fadeIn(800).delay(5000).fadeOut(300).delay(100);
    if ($('#record_record_file').length > 0) {
        var input = document.getElementById('record_record_file');
        var label = document.getElementById('video_button');
        if (input !== null) {
            input.addEventListener('change', function (e) {
                var fileName = '';
                if (this.files && this.files.length > 1) {
                    fileName = ( this.getAttribute('data-multiple-caption') || '' ).replace('{count}', this.files.length);
                }
                else {
                    fileName = e.target.value.split('\\').pop().substring(0, 20) + "...";
                }

                if (fileName) {
                    $("#video_button").find("span").html(fileName);
                }
                else {
                    $("#video_button").html(label);
                }
                s
            });
            input.addEventListener('focus', function () {
                input.classList.add('has-focus');
            });
            input.addEventListener('blur', function () {
                input.classList.remove('has-focus');
            });
        }
    }
    if ($('#document_files').length > 0) {
        var input = document.getElementById('document_files');
        var label = document.getElementById('file_button');
        if (input !== null) {
            input.addEventListener('change', function (e) {
                var fileName = '';
                if (this.files && this.files.length > 1) {
                    fileName = ( this.getAttribute('data-multiple-caption') || '' ).replace('{count}', this.files.length);
                }
                else {
                    fileName = e.target.value.split('\\').pop();
                }

                if (fileName) {
                    $("#file_button").find("span").html(fileName);
                }
                else {
                    $("#file_button").html(label);
                }
            });
            input.addEventListener('focus', function () {
                input.classList.add('has-focus');
            });
            input.addEventListener('blur', function () {
                input.classList.remove('has-focus');
            });
        }
    }
});

