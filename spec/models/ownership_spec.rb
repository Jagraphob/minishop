require 'rails_helper'

RSpec.describe Ownership, type: :model do
  fixtures :ownerships

  describe 'validations' do
    it 'validates the presence of status' do
      expect(Ownership.new).to validate_presence_of(:status)
    end
    it 'validates the uniqueness of customer_profile_id and property_id' do
      expect(Ownership.new).to validate_uniqueness_of(:customer_id).scoped_to(:property_id)
    end
  end
end