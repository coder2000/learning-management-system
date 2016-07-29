$(document).ready((e)->
  document.addEventListener('turbolinks:load', ->
    if $(".item.bordered .image").length > 0
      $(".item.bordered .image").dimmer(
        on: 'hover'
      )
  )
)
