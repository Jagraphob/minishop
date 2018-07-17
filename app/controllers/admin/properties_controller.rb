class Admin::PropertiesController < ApplicationController
  layout "admin"
  
  def index
    if params.has_key? :status
      @properties = PropertyService.get_properties_by_ownership_status(params[:status])
    else
      @properties = Property.all
    end
    @status = params[:status]
  end

  def show
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      flash[:success] = 'Property detail update successful'
      redirect_to admin_property_path(@property)
    else
      flash[:error] = @property.errors.full_messages.join(", ")
      render 'show'
    end
  end

  private

  def property_params
    params.require(:property).permit(:number, :street_name, :suburb, :city, :region, :postcode, :icp_number)
  end
end