$(document).on('turbolinks:load', ->
  $("#sub_menu").visibility(
    type: 'fixed',
    offset: 15
  )

  if $("#endless-container").length > 0
    $(".pagination").hide(0)
    $("#endless-container").visibility(
      once: false
      observeChanges: true
      transition: "fade in"
      onBottomVisible: ->
        url = $(".pagination span.next a").attr('href')
        if url
          $('.pagination').html('')
          $.getScript(url)
    )
)

