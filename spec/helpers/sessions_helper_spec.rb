require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  fixtures :users, :customers

  describe '#log_in' do
    it 'login user to the session' do
      log_in(User.last)
      expect(session[:user_id]).to eq(2)
    end
  end

  describe '#redirect_path_after_sign_in' do
    context 'login with admin user' do
      it 'return admin root path' do
        path = redirect_path_after_sign_in(User.first)
        expect(path).to eq(admin_root_path)
      end
    end

    context 'login with normal user' do
      it 'return customer page of that user' do
        path = redirect_path_after_sign_in(User.last)
        expect(path).to eq(User.last.customer)
      end
    end
  end

  describe '#current_user' do
    before do
      log_in(User.last)
    end
    it 'return the currently logged in user' do
      expect(current_user).to eq(User.last)
    end
  end

  describe '#logged_in?' do
    context 'no user is logged in' do
      it 'returns false' do
        expect(logged_in?).to eq(false)
      end
    end

    context 'a user is logged in' do
      before do
        log_in(User.last)
      end

      it 'returns true' do
        expect(logged_in?).to eq(true)
      end
    end
  end

  describe '#log_out' do
    before do
      log_in(User.last)
    end

    it 'clear out the session' do
      log_out
      expect(session[:user_id]).to eq(nil)
    end
  end
end
