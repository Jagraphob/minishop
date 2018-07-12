class CreateMeters < ActiveRecord::Migration[5.2]
  def change
    create_table :meters do |t|
      t.references :property, foreign_key: true
      t.decimal :reading, :precision => 16, :scale => 4
      t.integer :decimal_position
      t.timestamps
    end
  end
end
