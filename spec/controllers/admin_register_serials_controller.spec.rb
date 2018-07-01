require 'rails_helper'

RSpec.describe Admin::RegisterSerialsController, type: :controller do
  fixtures :register_serials
  
  describe 'POST #create' do
    context 'create a register serial' do
      before do
        post :create, :params => { register_serial: { 
          :meter_number => '789',
          :register_number => '12',
          :register_decimals => '0'
        }}
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'destroy a register serial' do
      before do
        delete :destroy, :params => { :id => 2, :property_id => 2  }
      end

      it 'a register serial is successfully deleted' do
        expect(RegisterSerial.count).to eq(1)
      end

      it 'redirects to the parent property page' do
        expect(response).to redirect_to(admin_property_path(:id => 2))
      end
    end    
  end
end