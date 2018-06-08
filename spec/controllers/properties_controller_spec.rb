require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  fixtures :properties

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
    context 'the property exists' do
      it 'return http success' do
        get :show, params: { id: Property.first.id}
        expect(response).to have_http_status(200)
      end
    end

    context "the property doesn't exist" do
      it "return http response status 404" do
        get :show, params: { id: Property.last.id + 1 }
        expect(response.status).to eq(404)
      end
    end
  end

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
    context 'create a property' do
      before do
        post :create, :params => { :property => {
          :number => '3',
          :street_name => 'Thames Street',
          :suburb => 'Island Bay',
          :city => 'Wellington',
          :region => 'Wellington',
          :postcode => '6023',
          :icp_number => '857159263'
        } }
      end

      it 'a property is successfully created' do
        expect(Property.count).to eq(3)
      end

      it 'redirect to that created game page' do
        expect(response).to redirect_to(property_path({ id: Property.last.id }))
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'destroy a property' do
      before do
        delete :destroy, params: { id: 2 }
      end

      it 'a property is successfully destroyed' do
        expect(Property.count).to eq(1)
      end

      it 'redirect to properties page' do
        expect(response).to redirect_to(properties_path)
      end
    end
  end
end