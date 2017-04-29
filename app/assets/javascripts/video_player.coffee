change = ->
  if $('.video').length > 0
    jwplayer.key="EA7fi2Owdh/JdYcP7dKRVHiqjiI+RVkI0lZz6w=="
    video_tag = $('.video')

    video_tag.each( ->
      player = jwplayer(@).setup({
        "file": $(@).data('src'),
        "image": $(@).data('poster'),
        "title": $(@).data('title')
        "height": 480,
        "width": "100%",
        "primary": "flash",
        "flashplayer": "/assets/jwplayer/jwplayer.flash.swf",
        "preload": "none",
        "usekeys": true
      })
      seeked=''
      player.on('seek', ->
        seeked = true
      )
      player.on('complete', ->
        if seeked
          console.log "completed with seeking"
        else
          console.log "completed without seeking"
      )
  )

$(document).on("turbolinks:load", change)

