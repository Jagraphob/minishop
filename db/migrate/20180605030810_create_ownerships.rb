class CreateOwnerships < ActiveRecord::Migration[5.2]
  def change
    create_table :ownerships do |t|
      t.belongs_to :customer_profile, index: true
      t.belongs_to :property, index: true
      t.integer :status, default: 0
      t.timestamps
    end
  end
end

