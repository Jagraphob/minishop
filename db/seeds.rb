User.create(:email => 'toh@fluxfederation.com', :role => 1, :status => 1, :customer_id => nil)

customer1 = Customer.create(:first_name => 'Bow', :last_name => 'Jan', :phone_number => '0212953395', :card_number => '1111222255558888')
User.create(:email => 'bow@email.com', :role => 0, :status => 1, :customer => customer1)
