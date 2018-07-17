require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  fixtures :customers

  before do
    allow(controller).to receive(:logged_in?).and_return true
  end

  describe "GET #show" do
    context 'the customer exist' do
      it 'returns http success' do
        get :show, :params => { :id => Customer.first.to_param}
        expect(response).to have_http_status(200)
      end
    end

    context 'the customer not exist' do
      it 'return http 404' do
        get :show, :params => { :id => (Customer.last.id + 1).to_s }
        expect(response).to have_http_status(404)
      end
    end
  end
end
