class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      render 'new'
    else
      flash.now[:danger] = 'Login Failed'
      render 'new'
    end
  end
end