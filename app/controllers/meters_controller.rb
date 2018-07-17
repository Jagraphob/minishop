class MetersController < ApplicationController
  def update
    @customer = Customer.find(params[:customer_id]) or render_404
    @property = @customer.properties.find(params[:property_id]) or render_404
    @meter = MeterService.customer_update(params)

    if @meter.errors.present?
      flash[:danger] = @meter.errors.full_messages.join(", ")
    else
      flash[:success] = 'Meter reading update successful'
    end

    redirect_to customer_property_path(@customer, @property)
  end
end