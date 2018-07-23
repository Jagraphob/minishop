class CreatePrice < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.decimal :price, :precision => 4, :scale => 2, null: false
      t.string :unit, null: false
      t.timestamps
    end
  end
end
