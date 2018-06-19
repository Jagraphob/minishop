class PropertiesController < ApplicationController
  def index
  end

  def new
    @customer = Customer.find(params[:customer_id])
  end
  
  def create
  end
end
