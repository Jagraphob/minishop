class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in(user)
      redirect_after_sign_in(user)
    else
      flash.now[:danger] = 'Login Failed'
      render 'new'
    end
  end
end