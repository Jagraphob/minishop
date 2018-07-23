class Admin::PricesController < ApplicationController
  layout "admin"

  def index
    @prices = Price.all
  end

  def create
    @price = Price.new(price_params)
    if @price.save
      flash[:success] = 'Price update successful'
    else
      flash[:danger] = @price.errors.full_messages.join(', ')
    end
    redirect_to admin_prices_path
  end

  private

  def price_params
    params.require(:price).permit(:price, :unit)
  end
end