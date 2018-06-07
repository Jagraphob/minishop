class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.role = 0
    @user.status = 0

    if @user.save
      redirect_to new_customer_profile_path(:user_id => @user.id)
    else
      flash.now[:danger] = @user.errors.full_messages.join(", ")
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end