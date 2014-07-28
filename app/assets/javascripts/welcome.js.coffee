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
    if $("input").is(":focus")
      $(".comments-section").show()
    else
      $(".comments-section").hide()
    null
  )
  null

$ ->
  $("#trigger button").click( ->
    post_data = {}
    $.map($(".call-to-action input"), (i) ->
      post_data[$(i).attr("id")] = $(i).val()
    )

    # Disable it
    $("#trigger button").attr("disabled", "disabled");
    $("#trigger button").html("Subscribing ...");

    
    jQuery.post('/list_entries', post_data).done((data) ->
      $("#trigger button").html("Thanks for your support!");
      $(".call-to-action #trigger").css("float", "left");
      $(".call-to-action input").hide();
    )
    null
  )
  null

