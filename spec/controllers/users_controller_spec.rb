require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  fixtures :customers, :users

  describe 'GET #show' do
    context 'the user exists' do
      it 'return http success' do
        get :show, params: { customer_id: Customer.first.id, id: User.first.id }
        expect(response).to have_http_status(200)
      end
    end

    context "the user doesn't exist" do
      it "return http response status 404" do
        get :show, params: { customer_id: Customer.first.id, id: User.first.id + 1 }
        expect(response.status).to eq(404)
      end
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new, params: { customer_id: Customer.find(3) }
      expect(response).to have_http_status(200)
    end

    it 'render the new template' do
      get :new, params: { customer_id: Customer.find(3) }
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    context 'create a user' do
      before do
        post :create, :params => { :customer_id => 3, :user => { :email => "john.doe@email.com" } }
      end

      it 'a user is successfully created' do
        expect(User.count).to eq(3)
      end

      it "redirect to confirmation & next steps page for that customer & user" do
        expect(response).to redirect_to(customer_user_path({ customer_id: Customer.last.id ,id: User.last.id}))
      end
    end
  end
end