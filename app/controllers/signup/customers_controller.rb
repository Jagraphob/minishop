class Signup::CustomersController < ApplicationController
  layout "signup"

  def show
    @customer = Customer.find(params[:id]) or render_404
  end
  
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to new_signup_customer_user_path(@customer)
    else
      flash.now[:danger] = @customer.errors.full_messages.join(", ")
      render 'new'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone_number, :card_number)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end
end
