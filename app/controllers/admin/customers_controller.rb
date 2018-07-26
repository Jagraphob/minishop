class Admin::CustomersController < ApplicationController
  layout 'admin'

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end
end
