require 'rails_helper'

RSpec.describe CustomerProfilesController, type: :controller do
  fixtures :customer_profiles

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    context 'the customer profile exists' do
      it 'return http success' do
        get :show, params: { id: CustomerProfile.first.id}
        expect(response).to have_http_status(200)
      end
    end

    context "the customer profile doesn't exist" do
      it "return http response status 404" do
        get :show, params: { id: CustomerProfile.last.id + 1 }
        expect(response.status).to eq(404)
      end
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe 'POST #create' do
    context 'create a customer profile' do
      before do
        post :create, :params => { :customer_profile => { 
          :user_id => 1,
          :phone_number => '0210577330',
          :card_number => '0440255277780004'
        } }
      end

      it 'a customer profile is successfully created' do
        expect(CustomerProfile.count).to eq(3)
      end

      it "redirect to that created game page" do
        expect(response).to redirect_to(user_path({ id: User.last.id}))
      end
    end
  end
end
