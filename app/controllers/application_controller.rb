class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  def authentication_required #if user is already logged in, redirects to user page
    if logged_in?

      redirect_to user_path(current_user)
    end
  end

  def logged_in? #returns true if user is logged in
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
