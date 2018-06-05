require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  describe 'validations' do
    it 'validates the presence of firstname' do
      expect(User.new).to validate_presence_of(:first_name)
    end
    it 'validates the presence of lastname' do
      expect(User.new).to validate_presence_of(:last_name)
    end
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
  end
end
