require 'rails_helper'

RSpec.describe Signup::CustomersController, type: :controller do
  fixtures :customers

  describe 'GET #show' do
    context 'the customer exists' do
      it 'return http success' do
        get :show, params: { :id => Customer.first.to_param}
        expect(response).to have_http_status(200)
      end
    end

    context "the user doesn't exist" do
      it "return http response status 404" do
        get :show, params: { :id => (Customer.last.id + 1).to_s }
        expect(response.status).to eq(404)
      end
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(200)
    end

    it 'render the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    context 'create a customer' do
      before do
        post :create, :params => { :customer => { 
          :first_name => "John",
          :last_name => "Doe",
          :phone_number => "0214566543",
          :card_number => "0990888744550008"
        } }
      end

      it 'a user is successfully created' do
        expect(Customer.count).to eq(4)
      end

      it "redirect to that created game page" do
        expect(response).to redirect_to(new_signup_customer_user_path({ customer_id: Customer.last.to_param}))
      end
    end
  end
end