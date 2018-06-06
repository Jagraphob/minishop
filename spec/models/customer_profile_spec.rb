require 'rails_helper'

RSpec.describe CustomerProfile, type: :model do
  fixtures :customer_profiles

  describe 'validations' do
    it 'validates the presence of phone_number' do
      expect(CustomerProfile.new).to validate_presence_of(:phone_number)
    end
    it 'validates the presence of card_number' do
      expect(CustomerProfile.new).to validate_presence_of(:card_number)
    end
  end
end