class Signup::PropertiesController < ApplicationController
  layout 'signup'

  def new
    @customer = Customer.find(params[:customer_id])
    @property = @customer.properties.build
  end
  
  def create
    @property = Property.where(property_params).first_or_initialize
    @customer = Customer.find(params[:customer_id])

    if @property.save
      @ownership = Ownership.new(:customer_id => @customer.id, :property_id => @property.id, :status => :pending)
      @ownership.save
      @meter = Meter.new(:property_id => @property.id, :reading => 0, :decimal_position => 4)
      @meter.save
      redirect_to new_signup_customer_property_path(:customer_id => @customer.id)
    else
      flash.now[:danger] = @property.errors.full_messages.join(', ')
      render 'new'
    end
  end

  private

  def property_params
    params.require(:property).permit(
      :number,
      :street_name,
      :suburb,
      :city,
      :region,
      :postcode,
      :icp_number
    )
  end
end
