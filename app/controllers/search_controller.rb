class SearchController < ApplicationController
  def index
    session[:search_route] = "/search?q=#{params[:q]}"
    session[:search_query] = params[:q]

    resp = WebService.search query: {match: {_all: params[:q] } },
    highlight: { fields: {title: {}, description: {} } }
    
    @records = resp.records
    @results = resp.results
  end
end
