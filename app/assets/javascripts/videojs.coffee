before_change = ->
  for player in document.getElementsByClassName 'video-js'
    video = videojs(@.id)
    video.dispose()

$(document).on('page:change', ->
               if $('.video-js').length > 0
                 video = videojs(@.id)
              )
$(document).on('page:before-unload', before_change)
