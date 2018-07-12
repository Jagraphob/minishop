require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create(:email => email, :role => role, :status => status)}

  let(:email) { 'john.doe@email.com' }
  let(:role) { :user }
  let(:status) { :active}

  describe 'validations' do
    it 'validates the presence of email' do
      expect(User.new).to validate_presence_of(:email)
    end
    it 'validates the presence of role' do
      expect(User.new).to validate_presence_of(:role)
    end
    it 'validates the presence of status' do
      expect(User.new).to validate_presence_of(:status)
    end
    it 'validates the uniquessness of email' do
      expect(User.new).to validate_uniqueness_of(:email)
    end

    context 'creating new user with valid parameters' do
      it 'is valid' do
        expect(user).to be_valid
      end
    end

    context 'creating new user with invalid email' do
      let(:email) { 'abc.com' }
      it 'is invalid' do
        expect(user).to_not be_valid
      end
    end
  end
end
