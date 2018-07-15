module MetersHelper
  def meter_display(meter)
    number_with_precision(meter.reading, :precision => meter.decimal_position)
  end
end