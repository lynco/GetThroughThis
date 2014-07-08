# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$('.btn').click( (eventObject) -> 
  if ($(this).attr('data-target'))
    window.location.href = $(this).attr('data-target')
    true
  
	)

# Hide the help message at the beginning
$ ->
	$('#help_message').hide()
