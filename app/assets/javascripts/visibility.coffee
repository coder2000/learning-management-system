$(document).ready((e) ->
  document.addEventListener('turbolinks:load', ->
    $("#sub_menu").visibility(
      type: 'fixed',
      offset: 15
    )
  )
)
