class ChangeRegisterNumberDataType < ActiveRecord::Migration[5.2]
  def change
    change_table :register_serials do |t|
      t.change :meter_number, :string
      t.change :register_number, :string
      t.change :register_decimals, :string
    end
  end
end
