class MoveCustomerProfilesToCustomers < ActiveRecord::Migration[5.2]
  def change
    CustomerProfile.find_each do |customer|
      Customer.find_or_create_by(
        :first_name => customer.user.first_name,
        :last_name => customer.user.last_name,
        :phone_number => customer.phone_number,
        :card_number => customer.card_number
      )
    end
  end
end
