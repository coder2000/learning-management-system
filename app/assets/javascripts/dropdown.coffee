$(document).on('turbolinks:load', ->
  $("#user_gender").dropdown()
  $('#main_setting').dropdown()

  ###################
  ### post ##########
  ###################
  $(".hidden-field").hide()
  video_select = $("#post_video").html()
  $('#repositories').dropdown()
  $('#post_video').dropdown()
  $('#repositories').change ->
    repository = $("#repositories :selected").text()
    options = $(video_select).filter("optgroup[label='#{repository}']").html()
    if options
      $("#post_video").html(options)
      $(".hidden-field").show(300)
    else
      $(".hidden-field").hide(300)
  $("#post_attachments").dropdown()
  $(".post-actions").dropdown()
  $("#group-settings").dropdown()
)
