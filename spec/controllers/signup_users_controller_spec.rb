require 'rails_helper'

RSpec.describe Signup::UsersController, type: :controller do
  fixtures :customers, :users

  let(:customer_3) { customers(:c3) }

  describe 'GET #new' do
    it 'returns http success' do
      get :new, params: { customer_id: customer_3.to_param }
      expect(response).to have_http_status(200)
    end

    it 'render the new template' do
      get :new, params: { customer_id: customer_3.to_param }
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    context 'create a user' do
      before do
        post :create, :params => { :customer_id => 3, :user => { :email => "john.doe@email.com" } }
      end

      it 'a user is successfully created' do
        expect(User.count).to eq(5)
      end

      it "redirect to confirmation & next steps page for that customer & user" do
        expect(response).to redirect_to(new_signup_customer_property_path({ customer_id: Customer.last.to_param }))
      end
    end
  end
end