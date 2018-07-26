class Admin::MeterReadingsController < ApplicationController
  def create
    @property = Property.find(params[:property_id])
    @meter = @property.meter
    @meter_reading = @meter.meter_readings.create(meter_reading_params)

    if @meter_reading.errors.present?
      flash[:danger] = @meter_reading.errors.full_messages.join(", ")
    else
      flash[:success] = 'Meter Reading update successful'
    end

    redirect_to admin_property_path(@property)
  end

  private

  def meter_reading_params
    params.require(:meter_reading).permit(:reading)
  end
end