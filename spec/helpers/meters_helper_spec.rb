require 'rails_helper'

RSpec.describe MetersHelper, type: :helper do
  fixtures :meters

  describe '#meter_display' do
    context '1234 with 2 decimal position' do
      it 'return 1234.00' do
        expect(meter_display(Meter.find(1))).to eq('1234.00')
      end
    end

    context '100.123 with 3 decimal position' do
      it 'return number with 3 decimals' do
        expect(meter_display(Meter.find(2))).to eq('100.123')
      end
    end

    context '1500.12 with 4 decimal position' do
      it 'return number with 4 decimals' do
        expect(meter_display(Meter.find(3))).to eq('1500.1200')
      end
    end
  end
end