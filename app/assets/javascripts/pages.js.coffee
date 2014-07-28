# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".developer-submit #trigger button").click( (e) ->
    window.do_mc_call("developer-submit", "Updating ...", "We'll get back to you soon!")
    null
  )



