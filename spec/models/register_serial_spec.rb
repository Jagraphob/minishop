require 'rails_helper'

RSpec.describe RegisterSerial, type: :model do
  fixtures :register_serials

  describe 'validations' do
    it 'validates the presence of meter_number' do
      expect(RegisterSerial.new).to validate_presence_of(:meter_number)
    end
    it 'validates the presence of register_number' do
      expect(RegisterSerial.new).to validate_presence_of(:register_number)
    end
    it 'validates the presence of register_decimals' do
      expect(RegisterSerial.new).to validate_presence_of(:register_decimals)
    end
  end
end