$(document).on('turbolinks:load', ->
  $("#sign-up-button").on('click', (e)->
    $('#sign-up-modal').modal('show')
  )
  $("#create-group").on('click', (e)->
    $('#create-group-modal').modal('show')
  )
  $("#create-repository").on('click', (e)->
    $('#create-repository-modal').modal('show')
  )
  $("#edit-group").on('click', (e)->
    $('#edit-group-modal').modal('show')
  )
  $('.remove-user-button').on('click', (e)->
    url = $(@).data('remove-user-url')
    $(".remove-user-modal").modal(
      closable: false,
      onApprove: (e)->
        $.ajax(
          url: url,
          method: 'delete'
          dataType: 'json',
          success: (e)->
            $('<div class="ui flash" id="notice">Student has been successefully removed from the group</div>')
              .insertBefore('#main-container')
              .hide()
              .delay(800)
              .fadeIn(800)
              .delay(5000)
              .fadeOut(800)
          error: (e)->
            $('<div class="ui flash" id="notice">Something went wrong</div>')
              .insertBefore('#main-container')
              .hide()
              .delay(800)
              .fadeIn(800)
              .delay(5000)
              .fadeOut(800)
        )
      onDeny: (e)->
        $(@).modal('hide')
    ).modal('show')
  )
)
