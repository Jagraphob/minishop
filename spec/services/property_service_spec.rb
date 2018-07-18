require 'rails_helper'
require './app/services/property_service.rb'

RSpec.describe OwnershipService do
  fixtures :customers, :properties

  let(:property) { properties(:p4)}

  describe '#create_default_meter' do
    let(:create_default_meter) { PropertyService.create_default_meter(property)}

    it 'creates a meter with 0 reading' do
      expect{create_default_meter}.to change{ Meter.count }.by(1)
    end
  end

  describe '#get_properties_by_ownership_status' do
    let(:get_properties_by_ownership_status) { PropertyService.get_properties_by_ownership_status(status)}
    let(:status) { 'active' }

    context 'get active properties' do
      it 'returns 3 properties' do
        expect(get_properties_by_ownership_status.count).to eq(3)
      end      
    end

    context 'get pending properties' do
      let(:status) { 'pending' }

      it 'returns 1 property' do
        expect(get_properties_by_ownership_status.count).to eq(1)
      end
    end

    context 'get archived status properties' do
      let(:status) { 'archived' }

      it 'retuns nil' do
        expect(get_properties_by_ownership_status.count).to eq(0)
      end
    end
  end
end