require 'rails_helper'

RSpec.describe Customer, type: :model do
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
    it 'validates the length of phone_number is between 8 to 10' do
      expect(Customer.new).to validate_length_of(:phone_number).is_at_least(8).is_at_most(10)
    end
    it 'validates the length of card_number which is 16' do
      expect(Customer.new).to validate_length_of(:card_number).is_equal_to(16)
    end
    it 'validates the format of phone_number to be numeric' do
      expect(Customer.new).to_not allow_values("021848u849", "021548$968").for(:phone_number).with_message('must be numeric')
    end
    it 'validates the format of card_number to be numeric' do
      expect(Customer.new).to_not allow_values('abcd125836987456', "&588966814475558").for(:card_number).with_message('must be numeric')
    end

  end
end