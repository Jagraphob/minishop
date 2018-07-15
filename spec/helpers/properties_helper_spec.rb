require 'rails_helper'

RSpec.describe PropertiesHelper, type: :helper do
  fixtures :properties

  describe '#full_address' do
    it 'return full address concat in one line' do
      expect(full_address(Property.first)).to eq('66 Owen Street, Belmont, Lower Hutt, 5010')
    end
  end

  describe '#filter_by_ownership_status' do
    context 'customer 3 by active status'

    it 'return only the propety:id:3' do
      expect(filter_by_ownership_status(Customer.find(3).properties, 'active').first).to eq(Property.find(4))
    end
  end
end