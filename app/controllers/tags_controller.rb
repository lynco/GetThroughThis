class TagsController < ApplicationController
  include FiltersHelper

  def show
    # Support multiple tag names separated by + signs, as an OR operation

    tag_list = params[:id].split "+"

    no_tag=true
    tgs = []

    str_t = ''
    tag_list.each do |t|
      str_t += "#{t}, "
      tg = Tag.find_by_name t
      if tg then
        tgs << tg 
        no_tag=false
      end
    end
    session[:search_query_display] = str_t.gsub(/, $/, '')

    # At least one tag must be valid
    raise ActionController::RoutingError, "Tag in search query unknown" if no_tag

    session[:search_query] = params[:id]
    @form_route = session[:search_route] = "/tags/#{params[:id]}"
    
    @records = []
    tgs.each do |tg|
      @records |= tg.web_services
    end

    if (filters=params[:query_service_mode_filter]) then      
      filters = [filters] if filters and filters.class != Array # Make it an array if there was only one filter
      @filters=filters
      @records = run_filters @records, filters
    end

    render "search/index"
  end

end
