$(document).ready((e) ->
  document.addEventListener('turbolinks:load', ->
    $("#user_gender").dropdown()
    $('#main_setting').dropdown()
   )
)
