window.do_mc_call = (form_class, update_mesg, final_mesg) ->
  post_data = {}
  $.map($("." + form_class + " input"), (i) ->
    post_data[$(i).attr("id")] = $(i).val()
    null
  )
  $.map($("." + form_class + " textarea"), (i) ->
    post_data[$(i).attr("id")] = $(i).val()
    null
  )

  # Disable it
  $("." + form_class + " #trigger button").attr("disabled", "disabled");
  $("." + form_class + " #trigger button").html(update_mesg);

  jQuery.post('/list_entries', post_data).done((data) ->
    $("#trigger button").html(final_mesg);
    $("." + form_class + " input").hide();
    $("." + form_class + " textarea").hide();
  )
  null
