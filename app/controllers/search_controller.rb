class SearchController < ApplicationController
  def results
    @results = (Tag.search params[:q]).results
  end

end
