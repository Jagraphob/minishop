class InsertMeterReadingsFromMeters < ActiveRecord::Migration[5.2]
  def up
    Meter.all.each do |meter|
      MeterReading.create(meter_id: meter.id, reading: meter.reading)
    end
  end

  def down
    MeterReading.delete_all
  end
end
