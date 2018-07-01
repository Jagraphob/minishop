require 'rails_helper'

RSpec.describe Admin::OwnershipsController, type: :controller do
  fixtures :ownerships
  
  describe 'PATCH #update' do
    context 'patch an ownership from inactive to active' do
      
      before do
        request.env['HTTP_REFERER'] = 'http://test.com'
        patch :update, :params => { 
          :id => 3,
          :ownership => {
            :status => :active
          }
        }
      end

      it 'the ownership is updated to active' do
        expect(Ownership.find(3).status).to eq("active")
      end
    end
  end
end