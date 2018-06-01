require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

  describe "GET #show" do
    pending "not yet implemented"
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

  describe "POST #create" do 
    pending "not yet implemented"
  end
end
