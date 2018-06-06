require 'rails_helper'

RSpec.describe Ownership, type: :model do
  fixtures :ownerships

  describe 'validations' do
    it 'validates the presence of status' do
      expect(Ownership.new).to validate_presence_of(:status)
    end
  end
end