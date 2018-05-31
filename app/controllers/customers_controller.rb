class CustomersController < ApplicationController
  def show

  end
  
  def new
  end

  def create
  end

  private

  def customer_param
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
