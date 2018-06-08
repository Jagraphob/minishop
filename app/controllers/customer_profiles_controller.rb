class CustomerProfilesController < ApplicationController
  def show
  end
  
  def new
    @customer_profile = CustomerProfile.new
    @customer_profile.user_id = params[:user_id]
  end

  def create
    @customer_profile = CustomerProfile.new(customer_profile_params)

    if @customer_profile.save
      redirect_to new_property_path(:customer_profile_id => @customer_profile.id)
    else
      flash.now[:danger] = @customer_profile.errors.full_messages.join(", ")
      render :action => 'new'
    end
  end

  private

  def customer_profile_params
    params.require(:customer_profile).permit(:phone_number, :card_number, :user_id)
  end
end
