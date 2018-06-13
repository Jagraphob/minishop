# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(:first_name => 'Toh', :last_name => 'Jan', :email => 'toh@fluxfederation.com', :role => 1, :status => 1)

user1 = User.create(:first_name => 'Bow', :last_name => 'Jan', :email => 'bow@email.com', :role => 0, :status => 1)
CustomerProfile.create(:user => user1, :phone_number => '0212953395', :card_number => '0440155188980004')