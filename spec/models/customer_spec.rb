require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :customers

  describe 'validations' do
    it 'validates the presence of first_name' do
      expect(Customer.new).to validate_presence_of(:first_name)
    end
    it 'validates the presence of last_name' do
      expect(Customer.new).to validate_presence_of(:last_name)
    end
    it 'validates the presence of phone_number' do
      expect(Customer.new).to validate_presence_of(:phone_number)
    end
    it 'validates the presence of card_number' do
      expect(Customer.new).to validate_presence_of(:card_number)
    end
  end
end