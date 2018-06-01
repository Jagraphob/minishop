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
end
