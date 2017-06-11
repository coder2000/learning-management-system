change = ->
  if $('video').length > 0
    $('video').each( ->
      player = videojs(@)
    )
before_change = ->
  if $('video').length > 0
    $('video').each( ->
      player = videojs(@)
      player.dispose
    )
$(document).on("turbolinks:before-visit", before_change)
$(document).on("turbolinks:load", change)

