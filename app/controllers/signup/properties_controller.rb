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
      OwnershipService.create_ownership(@customer, @property, :pending)
      PropertyService.create_default_meter(@property)
      redirect_to new_signup_customer_property_path(@customer)
    else
      flash[:danger] = @property.errors.full_messages.join(', ')
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
