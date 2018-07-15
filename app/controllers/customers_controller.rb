class CustomersController < ApplicationController
  layout 'customer'
  before_action :logged_in_user, only: [:show]

  def show
    @customer = Customer.find(params[:id]) or render_404
  end
  
  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone_number, :card_number)
  end
end
