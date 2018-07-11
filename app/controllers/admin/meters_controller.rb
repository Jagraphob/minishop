class Admin::MetersController < ApplicationController
  def update
    @property = Property.find(params[:property_id])
    @meter = Meter.find(params[:id])
    if params[:commit] == '+'
      @meter.decimal_position = @meter.decimal_position + 1
      @meter.save
    elsif params[:commit] == '-'
      @meter.decimal_position = @meter.decimal_position - 1  
      @meter.save
    else
      @meter.update(meter_params)
    end

    flash[:danger] = @meter.errors.full_messages if @meter.errors.present?
    redirect_to admin_property_path(@property)
  end

  private 

  def meter_params
    params.require(:meter).permit(:reading, :decimal_position)
  end
end