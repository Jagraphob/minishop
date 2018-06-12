class CreateRegisterSerial < ActiveRecord::Migration[5.2]
  def change
    create_table :register_serials do |t|
      t.references :property, foreign_key: true
      t.integer :meter_number
      t.integer :register_number
      t.integer :register_decimals
      t.timestamps
    end
  end
end
