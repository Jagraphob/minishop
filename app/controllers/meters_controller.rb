class MetersController < ApplicationController
  def update
    @customer = Customer.find(params[:customer_id]) or render_404
    @property = @customer.properties.find(params[:property_id]) or render_404
    @meter = @property.meter
    @meter.update(meter_params)

    flash[:danger] = @meter.errors.full_messages if @meter.errors.present?
    redirect_to customer_property_path(:customer_id => @customer.id, :id => @property.id)      
  end

  private

  def meter_params
    params.require(:meter).permit(:reading)
  end

end