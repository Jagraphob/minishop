class InsertMeterData < ActiveRecord::Migration[5.2]
  def up
    Property.all.each do |p|
      Meter.create(property_id: p.id, reading: 0, decimal_position: 4)
    end
  end

  def down
    Meter.delete_all
  end
end
