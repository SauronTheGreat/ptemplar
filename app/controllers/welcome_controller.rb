class WelcomeController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:index]


  def index
  end

  def homepage
    if current_user
    @presentations=Presentation.find_all_by_user_id(current_user.id)

    @pslides= Pslide.where('user_id=? and in_bank= ? ',current_user.id,true)

    end
    @pslide=Pslide.new
    @presentation = Presentation.new
  end

end
