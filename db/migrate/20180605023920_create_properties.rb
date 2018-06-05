class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
        t.string :number, null: false
        t.string :street_name, null: false
        t.string :suburb, null: false
        t.string :city, null: false
        t.string :region, null: false
        t.string :postcode
        t.string :icp_number
    end
  end
end
