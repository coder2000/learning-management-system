$(document).on('turbolinks:load', ->
  $('#video-warning .close').on('click', (e)->
    $('#video-warning').fadeOut(500)
  )
  $('#file-warning .close').on('click', (e)->
    $('#file-warning').fadeOut(500)
  )
)
