require 'rails_helper'

RSpec.describe PropertiesHelper, type: :helper do
  fixtures :customers, :properties

  let(:customer_3) { customers(:c3) }
  let(:property_4) { properties(:p4) }

  describe '#full_address' do
    it 'return full address concat in one line' do
      expect(full_address(Property.first)).to eq('66 Owen Street, Belmont, Lower Hutt, 5010')
    end
  end

  describe '#filter_by_ownership_status' do
    context 'customer 3 by active status'

    it 'return only the propety:id:3' do
      expect(filter_by_ownership_status(customer_3.properties, 'active').first).to eq(property_4)
    end
  end
end