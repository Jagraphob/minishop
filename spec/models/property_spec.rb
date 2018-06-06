require 'rails_helper'

RSpec.describe Property, type: :model do
  fixtures :properties

  describe 'validations' do
    it 'validates the presence of number' do
      expect(Property.new).to validate_presence_of(:number)
    end
    it 'validates the presence of street_name' do
      expect(Property.new).to validate_presence_of(:street_name)
    end
    it 'validates the presence of suburb' do
      expect(Property.new).to validate_presence_of(:suburb)
    end
    it 'validates the presence of city' do
      expect(Property.new).to validate_presence_of(:city)
    end
    it 'validates the presence of region' do
      expect(Property.new).to validate_presence_of(:region)
    end
  end
end
