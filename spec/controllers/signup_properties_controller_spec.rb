require 'rails_helper'

RSpec.describe Signup::PropertiesController, type: :controller do
  fixtures :properties

  describe "GET #new" do
    it "returns http success" do
      get :new, params: { customer_id: Customer.find(3) }
      expect(response).to have_http_status(200)
    end

    it "render the new template" do
      get :new, params: { customer_id: Customer.find(3) }
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
        },
        :customer_id => 3 }
      end

      it 'a property is successfully created' do
        expect(Property.count).to eq(3)
      end

      it 'redirect to that created game page' do
        expect(response).to redirect_to(new_signup_customer_property_path({ customer_id: Customer.last.id}))
      end
    end
  end
end