User.create(:email => 'toh@fluxfederation.com', :role => 1, :status => 1, :customer_id => nil)

customer1 = Customer.create(:first_name => 'Bow', :last_name => 'Jan', :phone_number => '0212953395', :card_number => '1111222255558888')
User.create(:email => 'bow@email.com', :role => 0, :status => 1, :customer => customer1)
property1 = Property.create(:number => '66', :street_name => 'Owen Street', :suburb => 'Belmont', :city => 'Lower Hutt', :region => 'Wellington', :postcode => '5010', :icp_number => 'ICP124578963')
Ownership.create(:customer_id => customer1.id, :property_id => property1.id, :status => 1)

Price.create(:price => 30.50, :unit => 'c/kwh')