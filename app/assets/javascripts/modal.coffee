$(document).ready((e) ->
  document.addEventListener('turbolinks:load', ->
    $("#sign-up-button").on('click', (e)->
      $('#sign-up-modal').modal('show')
    )
    $("#create-group").on('click', (e)->
      $('#create-group-modal').modal('show')
    )
    $("#create-video-repository").on('click', (e)->
      $('#create-video-repository-modal').modal('show')
    )
    $(".video-modal").on 'click', (e)->
      video_src = $(@).data('src')
      video_poster = $(@).data('poster')
      video_title = $(@).data('title')
      jwplayer.key="EA7fi2Owdh/JdYcP7dKRVHiqjiI+RVkI0lZz6w=="
      player = jwplayer(document.getElementById('video-in-modal')).setup({
        "file": video_src,
        "image": video_poster,
        "title": video_title,
        "height": 480,
        "width": "100%",
        "primary": "flash",
        "flashplayer": "/assets/jwplayer/jwplayer.flash.swf",
        "preload": "none",
        "usekeys": true
      })
      $('#video-modal').modal('show')
      $('#video-modal').modal('refresh')
   )
)
