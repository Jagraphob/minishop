class CreateMeterReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :meter_readings do |t|
      t.references :meter, foreign_key: :true
      t.decimal :reading, :precision => 16, :scale => 4
      t.timestamps
    end
  end
end
