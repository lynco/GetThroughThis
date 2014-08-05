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

$ ->
  $(window).resize ->
    h = $(window).height()
    offsetTop = 105; # Calculate the top offset
        
    $('#map_canvas').css('height', (h - offsetTop))
  .resize()
        
$ ->
  $("#search_address").geocomplete();

$ ->
  $(document).ready ->
    MapsLib.initialize();

    $(':checkbox').click ->
      MapsLib.doSearch()
      null

    $(':radio').click ->
      MapsLib.doSearch()
      null

    $('#search_radius').change ->
      MapsLib.doSearch()
      null

    $('#map_search_button').click ->
      MapsLib.doSearch()
      null

    $('#find_me').click ->
      MapsLib.findMe();
      false

    $('#reset').click ->
      $.address.parameter('address','')
      MapsLib.initialize()
      false

    $(":text").keydown (e) ->
      key = if e.keyCode then e.keyCode else e.which
      if key == 13
        $('#search').click();
        return false
      null

