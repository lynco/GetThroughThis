class SearchController < ApplicationController
  def index
    session[:search_query] = "'#{params[:q]}'"

    @results = WebService.search(params[:q]).records
  end
end
