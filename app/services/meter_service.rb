module MeterService
  class << self
    def admin_update(params)
      meter = Meter.find(params[:id])
      if params[:commit] == '+'
        meter.decimal_position = meter.decimal_position + 1
        meter.save
      elsif params[:commit] == '-'
        meter.decimal_position = meter.decimal_position - 1
        meter.save
      else
        meter.update(meter_params(params))
      end
      meter
    end

    def customer_update(params)
      meter = Meter.find(params[:id])
      meter.update(meter_params(params))
      meter
    end

    private

    def meter_params(params)
      params.require(:meter).permit(:reading, :decimal_position)
    end
  end
end
