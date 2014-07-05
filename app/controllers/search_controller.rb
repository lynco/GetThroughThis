class SearchController < ApplicationController
  def results
    @results = WebService.search(params[:q]).records
  end
end
