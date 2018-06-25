require 'rails_helper'

RSpec.describe Admin::OwnershipsController, type: :controller do
  fixtures :ownerships

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'GET #show' do
    context 'the ownership exists' do
      it 'return http success' do
        get :show, params: { id: Ownership.find(3) }
        expect(response).to have_http_status(200)
      end
    end

    context "the ownership doesn't exist" do
      it "return http response status 404" do
        get :show, params: { id: Ownership.last.id + 1 }
        expect(response.status).to eq(404)
      end
    end

  end
end