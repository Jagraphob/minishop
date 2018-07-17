class Admin::MetersController < ApplicationController
  def update
    @property = Property.find(params[:property_id])
    @meter = MeterService.admin_update(params)

    if @meter.errors.present?
      flash[:danger] = @meter.errors.full_messages.join(", ")
    else
      flash[:success] = 'Meter update successful'
    end
    
    redirect_to admin_property_path(@property)
  end
end