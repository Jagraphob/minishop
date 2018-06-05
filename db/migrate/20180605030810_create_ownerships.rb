class CreateOwnerships < ActiveRecord::Migration[5.2]
  def change
    create_table :ownerships do |t|
      t.integer :customer_profile_id
      t.integer :property_id
      t.integer :status, default: 0
    end

    add_index :ownerships, [:customer_profile_id, :property_id]
  end
end
