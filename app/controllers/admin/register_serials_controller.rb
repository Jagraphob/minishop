class Admin::RegisterSerialsController < ApplicationController
  layout "admin"
  
  def create
    @property = Property.find(params[:property_id])
    @register_serial = @property.register_serials.create(register_serial_params)

    flash[:danger] = @register_serial.errors.full_messages if @register_serial.errors.present?
    redirect_to admin_property_path(@property)
  end

  def destroy
    @property = Property.find(params[:property_id])
    @register_serial = @property.register_serials.find(params[:id])
    @register_serial.destroy
    redirect_to admin_property_path(@property)
  end

  private

  def register_serial_params
    params.require(:register_serial).permit(:meter_number, :register_number, :register_decimals)
  end
end