class CreateCustomerProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_profiles do |t|
      t.references :user, foreign_key: true
      t.string :phone_number, null: false
      t.string :card_number, null: false
    end
  end
end
