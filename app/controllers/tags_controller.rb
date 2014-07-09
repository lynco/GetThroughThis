class TagsController < ApplicationController
  def show
    raise ActionController::RoutingError unless (t=Tag.find_by_name(params[:id]))
    session[:search_query] = params[:id]
    session[:search_route] = "/tags/#{params[:id]}"

    @records = t.web_services

    # Hack: if this is nil, there are no search results expected.
    @results = nil

    render "search/index"
  end

end
