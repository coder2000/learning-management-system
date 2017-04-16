$(document).on( 'turbolinks:load', (e) ->
  if $(".item.bordered .image").length > 0
    $(".item.bordered .image").dimmer(
      on: 'hover'
    )
)
