class TagsController < ApplicationController
  def show
    raise ActionController::RoutingError unless (t=Tag.find_by_name(params[:id]))
    session[:search_query] = params[:id]
    session[:search_route] = "/tags/#{params[:id]}"

    @results = t.web_services
    render "search/index"
  end

end
