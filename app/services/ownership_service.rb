module OwnershipService
  class << self
    def create_ownership(customer, property)
      ownership = Ownership.create(:customer_id => customer.id, :property_id => property.id, :status => :pending)
    end
  end
end