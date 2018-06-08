require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  fixtures :users

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
    context 'the user exists' do
      it 'return http success' do
        get :show, params: { id: User.first.id}
        expect(response).to have_http_status(200)
      end
    end

    context "the user doesn't exist" do
      it "return http response status 404" do
        get :show, params: { id: User.last.id + 1 }
        expect(response.status).to eq(404)
      end
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(200)
    end

    it 'render the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    context 'create a user' do
      before do
        post :create, :params => { :user => { 
          :first_name => "John",
          :last_name => "Doe",
          :email => "john.doe@email.com",
          :role => 0,
          :status => 0
        } }
      end

      it 'a user is successfully created' do
        expect(User.count).to eq(3)
      end

      it "redirect to that created game page" do
        expect(response).to redirect_to(user_path({ id: User.last.id}))
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'destroy a game' do
      before do
        delete :destroy, params: { id: 2 }
      end

      it 'a user is successfully destroyed' do
        expect(User.count).to eq(1)
      end

      it 'redirect to users page' do
        expect(response).to redirect_to(users_path)
      end
    end
  end
end