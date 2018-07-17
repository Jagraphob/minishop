require 'rails_helper'

RSpec.describe MetersHelper, type: :helper do
  fixtures :meters

  let(:meter_1) { meters(:m1) }
  let(:meter_2) { meters(:m2) }
  let(:meter_3) { meters(:m3) }

  describe '#meter_display' do
    context '1234 with 2 decimal position' do
      it 'return 1234.00' do
        expect(meter_display(meter_1)).to eq('1234.00')
      end
    end

    context '100.123 with 3 decimal position' do
      it 'return number with 3 decimals' do
        expect(meter_display(meter_2)).to eq('100.123')
      end
    end

    context '1500.12 with 4 decimal position' do
      it 'return number with 4 decimals' do
        expect(meter_display(meter_3)).to eq('1500.1200')
      end
    end
  end
end