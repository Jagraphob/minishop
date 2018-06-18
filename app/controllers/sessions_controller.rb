class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user
      log_in(@user)
      redirect_to redirect_path_after_sign_in(@user)
    else
      flash.now[:danger] = 'Login Failed'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
end