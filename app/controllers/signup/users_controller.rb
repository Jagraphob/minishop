class Signup::UsersController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @user = @customer.build_user
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @user = @customer.create_user(user_params)
    @user.role = :user
    @user.status = :active

    if @user.save
      redirect_to new_signup_customer_property_path(:customer_id => @customer.id)
    else
      flash.now[:danger] = @user.errors.full_messages.join(", ")
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
