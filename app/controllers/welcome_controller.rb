class WelcomeController < ApplicationController 

  def index
    @top_tags = Tag.limit(3)
  end

end

