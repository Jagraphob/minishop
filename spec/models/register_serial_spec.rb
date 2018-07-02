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
    it 'validates the length of meter_number' do
      expect(RegisterSerial.new).to validate_length_of(:meter_number).is_equal_to(3)
    end
    it 'validates the length of register_number' do
      expect(RegisterSerial.new).to validate_length_of(:register_number).is_equal_to(2)
    end
    it 'validates the length of register_decimals' do
      expect(RegisterSerial.new).to validate_length_of(:register_decimals).is_equal_to(1)
    end
    it 'validates the format of meter_number to be numeric' do
      expect(RegisterSerial.new).to_not allow_values("5ac", "%%%", "9-9").for(:meter_number).with_message("must be numeric")
    end
    it 'validates the fomat of register_number to be numeric' do
      expect(RegisterSerial.new).to_not allow_values("$$", "7p", "9-").for(:register_number).with_message("must be numeric")
    end
    it 'validates the fomat of register_decimals to be numeric' do
      expect(RegisterSerial.new).to_not allow_values("$", "k", ")").for(:register_decimals).with_message("must be numeric")
    end
    it 'validates the uniqueness of combination of meter_number, register_number, register_decimals' do
      expect(RegisterSerial.new).to validate_uniqueness_of(:register_decimals).scoped_to(:meter_number, :register_number).case_insensitive
    end
  end
end