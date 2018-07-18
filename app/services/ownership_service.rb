module OwnershipService
  class << self
    def create_ownership(customer, property, status)
      ownership = Ownership.create(:customer_id => customer.id, :property_id => property.id, :status => status)
    end
  end
end