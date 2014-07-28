# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.tag-btn').click( (eventObject) ->
    if ($(this).attr('data-target'))
      window.location.href = $(this).attr('data-target')
    true
  )
  
# Hide the help message at the beginning
$ ->
  $('#help_message').hide()
  $('.comments-section').hide()
  null

$ ->
  $("#emailaddress").focus( (eventObject) ->
    $(".comments-section").show()
    null
  )

$ -> 
  $(document).on("click", ->
    if $("input").is(":focus") || $("textarea").is(":focus")
      $(".comments-section").show()
    else
      $(".comments-section").hide()
    null
  )
  null

$ ->
  $(".call-to-action #trigger button").click( (e) ->
    window.do_mc_call("call-to-action", "Subscribing ...", "Thanks for your support!")
    $(".call-to-action #trigger").css("float", "left")
    null
  )
    


