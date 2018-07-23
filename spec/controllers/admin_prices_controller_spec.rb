require 'rails_helper'

RSpec.describe Admin::PricesController, :type => :controller do
  fixtures :prices

  describe 'GET #index' do
    let(:get_index) { get :index }
    
    it 'returns http success' do
      expect(get_index).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(get_index).to render_template("index")
    end
  end

  describe 'POST #create' do
    let(:post_create) { post :create, :params => { :price => { :price => 29.33, :unit => 'c/kwh' } }}

    it 'creates a customer' do
      expect{post_create}.to change{Price.count}.by(1)
    end

    it 'redirect to the admin price page ' do      
      expect(post_create).to redirect_to(admin_prices_path)
    end
  end
end