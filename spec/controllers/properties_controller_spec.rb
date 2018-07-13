require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  fixtures :properties

  describe 'GET #show' do
    context "the customers doesn't property exist" do
      it 'return http success' do
        get :show, :params => { :customer_id => Customer.first.id, :id => Customer.first.properties.first.id}
        expect(response).to have_http_status(200)
      end

      it "redirect to customer's property" do
        get :show, :params => { :customer_id => Customer.first.id, :id => Customer.first.properties.first.id}
        expect(response).to render_template 'show'
      end
    end

    context "the customers doesn't property not exist" do
      it "redirect to customer's property" do
        get :show, :params => { :customer_id => Customer.first.id, :id => Customer.first.properties.last.id + 1}
        expect(response).to have_http_status(404)
      end
    end
  end

end