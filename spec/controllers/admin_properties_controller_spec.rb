require 'rails_helper'

RSpec.describe Admin::PropertiesController, type: :controller do
  fixtures :properties

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

  describe 'PATCH #update' do
    context 'update property icp number' do      
      before do
        patch :update, :params => {
          :id => 3,
          :property => {
            :icp_number => 'ICP333333'
          }
        }
      end

      it 'the icp_number gets updated' do
        expect(Property.find(3).icp_number).to eq('ICP333333')
      end
    end
  end
end