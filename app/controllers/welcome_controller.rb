class WelcomeController < ApplicationController 
  def index
    @welcome_dropdowns = [ {text: 'Support Groups', tags: 'wellbeing+recovery'}, {text: 'Keeping Safe', tags: 'safety'} ]
  end

  def about
  end
end

