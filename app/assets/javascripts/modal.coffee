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
   )
)
