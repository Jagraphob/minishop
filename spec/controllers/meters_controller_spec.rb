require 'rails_helper'

RSpec.describe MetersController, type: :controller do
  fixtures :meters

  let(:meter_1) { meters(:m1) }

  before do
    allow(controller).to receive(:logged_in?).and_return true
  end

  describe 'PATCH #update' do
    context 'update meter reading to 1235.015 kWh' do
      it 'the meter reading is updated to 1235.015' do      
        patch :update, :params => { :id => 1, :customer_id => 1, :property_id => 1, :meter => {:reading => 1235.015} }  
        expect(meter_1.reading).to eq(1235.015)
      end
    end

    context "update a meter that doesn't exist" do
      it 'the meter reading is updated to 1235.015' do      
        patch :update, :params => { :id => 9, :customer_id => 1, :property_id => 5, :meter => {:reading => 1235.015} }  
        expect(response).to have_http_status(404)
      end
    end
  end
end