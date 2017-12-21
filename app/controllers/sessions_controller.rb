class SessionsController < ApplicationController
  #before_action :authentication_required

  def new #renders sign in page
    if flash[:alert]
      flash[:alert].clear
    end
  end

  def create #logs a user in by setting session id
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Sorry! Could not find that user."
      render 'new'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
