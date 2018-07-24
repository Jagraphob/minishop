require 'rails_helper'

RSpec.describe Admin::CustomersController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'GET #show' do
    context 'the customer exists' do
      it 'return http success' do
        get :show, params: { id: Property.first.to_param }
        expect(response).to have_http_status(200)
      end
    end

    context "the customer doesn't exist" do
      it "return http response status 404" do
        get :show, params: { id: (Property.last.id + 1).to_s }
        expect(response.status).to eq(404)
      end
    end
  end
end