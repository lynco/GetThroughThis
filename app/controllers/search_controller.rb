class SearchController < ApplicationController
  include FiltersHelper

  def index
    session[:search_route] = "/search?q=#{params[:q]}"
    session[:search_query] = params[:q]
    session[:search_query_display] = session[:search_query]
    @form_route = '/search'

    resp = WebService.search query: {match: {_all: params[:q] } },
    highlight: { fields: {title: {}, description: {} } }
    
    @records = resp.records.to_a
    results = resp.results  
    
    # Use filters, set up highlights
    @records.each_with_index do |rec, index|
      rec.highlight=results[index].highlight.description[0]
    end

    if (filters=params[:query_service_mode_filter]) then      
      filters = [filters] if filters and filters.class != Array # Make it an array if there was only one filter
      @filters=filters
      @records = run_filters @records, filters
    end
  end
end
