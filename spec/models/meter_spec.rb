require 'rails_helper'

RSpec.describe Meter, type: :model do
  fixtures :meters

  let(:meter_1) { meters(:m1) }

  describe 'validations' do
    it 'validates the presence of reading' do
      expect(Meter.new).to validate_presence_of(:reading)
    end
    it 'validates the presence of decimal_position' do
      expect(Meter.new).to validate_presence_of(:decimal_position)
    end
    it 'validates the format of reading' do
      expect(Meter.new).to_not allow_values("abc","%").for(:reading)
    end
    it 'validates reading to be greater than or equal to zero' do
      expect(Meter.new).to allow_values(0, 1, 200.568, 45359345).for(:reading)
      expect(Meter.new).to_not allow_values(-4, -9384.365).for(:reading)
    end
    it 'validates the format of decimal_position' do
      expect(Meter.new).to_not allow_values("abc", "$").for(:decimal_position)
    end
    it 'validates decimal_position to be between 0 to 4' do
      expect(Meter.new).to allow_values(0, 1, 2, 3, 4).for(:decimal_position)
      expect(Meter.new).to_not allow_values(5, 100, -1, -98.325).for(:decimal_position)
    end
    it 'validates decimal_position to be integer only' do
      expect(Meter.new).to_not allow_values(1.4, 2.56, 4.01).for(:decimal_position)
    end
    it 'validates reading cannot be decreased' do
      meter_1.update(:reading => 1233)
      expect(meter_1).to_not be_valid
      expect(meter_1.errors.messages[:reading].join('')).to eq('value cannot be decreased')
    end
  end
end


