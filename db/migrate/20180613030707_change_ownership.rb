class ChangeOwnership < ActiveRecord::Migration[5.2]
  def change
    change_table :ownerships do |t|
      t.remove_belongs_to(:customer_profile)
      t.belongs_to :customer, index: true
    end
  end
end
