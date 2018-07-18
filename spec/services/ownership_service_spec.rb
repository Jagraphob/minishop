require 'rails_helper'
require './app/services/ownership_service.rb'

RSpec.describe OwnershipService do
  fixtures :customers, :properties, :ownerships

  let(:customer) { customers(:c1) }
  let(:property) { properties(:p4) }
  let(:status) { :pending }
  

  describe '#create_ownership' do
    let(:create_ownership) { OwnershipService.create_ownership(customer, property, status)}
    
    it 'creates an ownership' do
      expect{create_ownership}.to change{Ownership.count}.by(1)
    end    
  end
end