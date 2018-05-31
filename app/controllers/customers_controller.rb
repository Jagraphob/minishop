class CustomersController < ApplicationController
  def show

  end
  
  def new
  end

  def create
  end

  private

  def customer_param
    params.require(:)
  end
end
