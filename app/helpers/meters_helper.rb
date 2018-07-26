module MetersHelper
  def meter_display(meter)
    "#{number_with_precision(meter.meter_readings.last.reading, :precision => meter.decimal_position)} kwh"
  end
end