require 'rails_helper'

RSpec.describe Price, type: :model do
  fixtures :prices

  describe 'validations' do
    it 'validates the presence of price' do
      expect(Price.new).to validate_presence_of(:price)
    end
    it 'validates the presence of unit' do
      expect(Price.new).to validate_presence_of(:unit)
    end
    it 'validates price to be greater than or equal to zero' do
      expect(Price.new).to allow_values(4.11, 6.54, 100).for(:price)
      expect(Price.new).to_not allow_values(-0.1,-300).for(:price)
    end
    it 'validates the format of price' do
      expect(Price.new).to_not allow_values('abc', '$').for(:price)
    end
  end
end
