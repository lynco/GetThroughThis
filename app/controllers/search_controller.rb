class SearchController < ApplicationController
  def index
    session[:search_route] = "/search?q=#{params[:q]}"
    session[:search_query] = params[:q]

    resp = WebService.search query: {match: {_all: params[:q] } },
    highlight: { fields: {title: {}, description: {} } }
    
    @records = resp.records.to_a
    results = resp.results  
    
    # Use filters, set up highlights
    delete_list=[]
    @filters = params[:query_service_mode_filter]
    @filters = [@filters] if @filters and @filters.class != Array # Make it an array if there was only one filter

    @records.each_with_index do |rec, index|
      rec.highlight=results[index].highlight.description[0]
      if (@filters) then
        in_filter=false

        # OR filter - in_filter if any of the use modes are in the filter list
        rec.service_use_modes.each do |use_mode|
          if @filters.include? use_mode.name
            in_filter=true
          end
        end

        if !in_filter
          delete_list << rec
        end
      end
    end

    @records = @records - delete_list
  end
end
