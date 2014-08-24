class WelcomeController < ApplicationController 
  def index
    @welcome_dropdowns = SearchDropdown.all.map do |sugg_query|
      {text: sugg_query.shown_query, machine_query: sugg_query.ran_query}
    end
  end

  def about
  end
end

