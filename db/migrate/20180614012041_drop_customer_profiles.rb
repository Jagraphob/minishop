class DropCustomerProfiles < ActiveRecord::Migration[5.2]
  def change
    drop_table :customer_profiles
  end
end
