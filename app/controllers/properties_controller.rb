class PropertiesController < ApplicationController
  layout 'customer'

  def show
    @customer = Customer.find(params[:customer_id]) or render_404
    @property = @customer.properties.find(params[:id]) or render_404
  end
end