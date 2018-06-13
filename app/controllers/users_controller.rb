class UsersController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @user = @customer.build_user
  end
  
  def show
    @customer = Customer.find(params[:customer_id])
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @user = @customer.create_user(user_params)
    @user.role = :user
    @user.status = :active

    if @user.save
      redirect_to customer_user_path(:customer_id => @customer.id, :id => @user.id)
    else
      flash.now[:danger] = @user.errors.full_messages.join(", ")
       
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
