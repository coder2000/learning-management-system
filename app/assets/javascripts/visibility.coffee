$(document).on('turbolinks:load', ->
  $("#sub_menu").visibility(
    type: 'fixed',
    offset: 15
  )

  if $("#endless-container").length > 0
    $(".pagination").hide(0)
    $("#endless-container").visibility(
      once: false
      continuous: true
      transition: "fade in"
      onPassing: (e)->
        url = $(".pagination span.next a").attr('href')
        if url and ( e.percentagePassed >= .50)
          $('.pagination').html('')
          $.getScript(url)
    )
)
