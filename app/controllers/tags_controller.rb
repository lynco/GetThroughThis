class TagsController < ApplicationController
  def show
    # Support multiple tag names separated by + signs, as an OR operation

    tag_list = params[:id].split "+"

    no_tag=true
    tgs = []

    tag_list.each do |t|
      tg = Tag.find_by_name t
      if tg then
        tgs << tg 
        no_tag=false
      end
    end

    # At least one tag must be valid
    raise ActionController::RoutingError, "Tag in search query unknown" if no_tag

    session[:search_query] = params[:id]
    session[:search_route] = "/tags/#{params[:id]}"

    @records = []
    tgs.each do |tg|
      puts ">>> listing ws for #{tg}"
      @records |= tg.web_services
    end

    # Hack: if this is nil, there are no search results expected.
    @results = nil

    render "search/index"
  end

end
