class WelcomeController < ApplicationController


  def home #if a user is logged in, take her to their homepage

    if logged_in?

      redirect_to user_path(current_user)
    end

  end

end
