require 'rails_helper'

RSpec.describe Admin::MetersController, type: :controller do
  describe 'PATCH #update' do
    context 'update meter reading to 1235.015 kWh' do
      before do
        patch :update, :params => { :id => 1, :property_id => 1, :meter => {:reading => 1235.015} }
      end

      it 'the meter reading is updated to 1235.015' do        
        expect(Meter.find(1).reading).to eq(1235.015)
      end
    end

    context 'given the decimal_position is 2 and attempt to increase the decimal' do
      before do
        patch :update, :params => { :id => 1, :property_id => 1, :commit => '+'}
      end

      it 'the meter decimal_position is increased by 1' do
        expect(Meter.find(1).decimal_position).to eq(3)
      end
    end

    context 'given the decimal_position is 2 and attemp to decrease the decimal' do
      before do
        patch :update, :params => { :id => 1, :property_id => 1, :commit => '-'}
      end

      it 'the meter decimal_position is decreased by 1' do
        expect(Meter.find(1).decimal_position).to eq(1)
      end
    end
  end
end