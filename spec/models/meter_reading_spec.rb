require 'rails_helper'

RSpec.describe MeterReading, type: :model do
  fixtures :meters, :meter_readings

  describe 'validations' do
    it 'validates the presence of reading' do
      expect(MeterReading.new).to validate_presence_of(:reading)
    end
    it 'validates the format of reading' do
      expect(MeterReading.new).to_not allow_values("abc", "%").for(:reading)
    end
    it 'validates the reading to be greater than or equal to zero' do
      expect(MeterReading.new).to allow_values(0, 1, 200.568, 45359345).for(:reading)
      expect(MeterReading.new).to_not allow_values(-4, -9384.365).for(:reading)
    end
    it 'validates reading cannot be decreased' do
      expect(MeterReading.create(:meter_id => 1, :reading => 1.11)).to_not be_valid
      expect(MeterReading.create(:meter_id => 1, :reading => 15.22)).to be_valid
    end
  end
end