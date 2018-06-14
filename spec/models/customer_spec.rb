require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject(:customer) { Customer.create(
    :first_name => first_name, 
    :last_name => last_name,
    :phone_number => phone_number,
    :card_number => card_number
  ) }

  let(:first_name) { 'John' }
  let(:last_name) { 'Doe' }
  let(:phone_number) { '0213458669' }
  let(:card_number) { '7859685798550444' }

  describe 'validations' do
    it 'validates the presence of first_name' do
      expect(Customer.new).to validate_presence_of(:first_name)
    end
    it 'validates the presence of last_name' do
      expect(Customer.new).to validate_presence_of(:last_name)
    end
    it 'validates the presence of phone_number' do
      expect(Customer.new).to validate_presence_of(:phone_number)
    end
    it 'validates the presence of card_number' do
      expect(Customer.new).to validate_presence_of(:card_number)
    end
    it 'validates the length of phone_number is between 8 to 10' do
      expect(Customer.new).to validate_length_of(:phone_number).is_at_least(8).is_at_most(10)
    end
    it 'validates the length of card_number which is 16' do
      expect(Customer.new).to validate_length_of(:card_number).is_equal_to(16)
    end

    context 'creating new customer with valid parameters' do
      it 'is valid' do
        expect(customer).to be_valid
      end
    end

    context 'creating new customer with phone number containing alphabets' do
      let(:phone_number) { '021abc4587'}
      it 'is invalid' do
        expect(customer).to_not be_valid
      end
    end

    context 'creating new customer with card number containing alphabets' do
      let(:card_number) { 'abcd125836987456'}
      it 'is invalid' do
        expect(customer).to_not be_valid
      end
    end
  end
end