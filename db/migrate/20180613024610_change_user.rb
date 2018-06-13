class ChangeUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.remove :first_name, :last_name
      t.belongs_to :customer, index: true
    end
  end
end
