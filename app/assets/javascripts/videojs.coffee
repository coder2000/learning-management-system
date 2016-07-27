change = ->
  for player in document.getElementsByClassName 'video-js'
    video = videojs("#videojs")
before_change = ->
  for player in document.getElementsByClassName 'video-js'
    video = videojs("#videojs")
    video.dispose()

document.addEventListener('turbolinks:before-visit', before_change)
document.addEventListener("turbolinks:load", change)
