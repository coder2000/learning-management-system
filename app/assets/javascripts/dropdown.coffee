$(document).ready((e) ->
  document.addEventListener('turbolinks:load', ->
    $("#user_gender").dropdown()
    $('#main_setting').dropdown()

    ###################
    ### post ##########
    ###################
    $("#video-field").hide()
    video_select = $("#post_video").html()
    $('#repositories').dropdown()
    $('#post_video').dropdown()
    $('#repositories').change ->
      repository = $("#repositories :selected").text()
      options = $(video_select).filter("optgroup[label='#{repository}']").html()
      if options
        $("#post_video").html(options)
        $("#video-field").show(300)
      else
        $("#video-field").hide(300)
    $("#post_attachments").dropdown()
    $(".post-actions").dropdown()
  )
)
