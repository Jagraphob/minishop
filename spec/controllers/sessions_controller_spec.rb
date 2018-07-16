require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(200)
    end

    it "render the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe 'POST #create' do
    context 'customer signin' do
      it 'redirects to admin page' do
        post :create, :params => { :session => { :email => User.first.email }}  
        expect(response).to redirect_to admin_root_path
      end
    end

    context 'admin signin' do
      it 'redirects to customer page' do
        post :create, :params => { :session => { :email => User.last.email }}  
        expect(response).to redirect_to customer_path(User.last.customer_id)
      end
      
    end

    context 'user not exist' do
      it 'redirects to user page' do
        post :create, :params => { :session => { :email => 'abc@email.com' }}
        expect(response).to render_template 'new'
      end
    end
  end
end
