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
    item = "#member-#{ $(@).data('user') }"
    title = "#{ $(@).data('header') }"
    content = "#{ $(@).data('content') }"
    confirm_modal(url, item, title, content)
  )
  $('.remove-post').on('click', (e)->
    url = $(@).data('remove-post-url')
    item = "#item-#{ $(@).data('post-id') }"
    title = $(@).data('header')
    content = $(@).data('content')
    confirm_modal(url, item, title, content)
  )

  confirm_modal = (url, item, title, message)->
    $(".confirm-modal .header").html(title)
    $(".confirm-modal .content p").html(message)
    $(".confirm-modal").modal(
      closable: false,
      onApprove: (e)->
        $.ajax(
          url: url,
          method: 'delete'
          dataType: 'json'
          success: (e)->
            $("<div class='ui flash' id='notice'>#{ e.message }</div>")
              .insertBefore('#main-container')
              .hide()
              .delay(800)
              .fadeIn(800)
              .delay(5000)
              .fadeOut(800)
            $(item).remove()
          error:  (e)->
            if e.message == undefined
              e.message = "Something went wrong"
            $("<div class='ui flash' id='notice'>#{ e.message }</div>")
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
