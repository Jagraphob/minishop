require 'rails_helper'
require './app/services/meter_service.rb'

RSpec.describe MeterService do
  fixtures :meters

  let(:meter_1) { meters(:m1) }
  let(:admin_update) { MeterService.admin_update(params)}
  let(:customer_update) { MeterService.customer_update(params)}

  describe '#admin_update' do
    context 'incrementing with commit as "+"' do
      let(:params) { ActionController::Parameters.new(:commit => '+', :id => meter_1.to_param) }

      it 'increases meter_1 decimal_position by 1' do
        expect(admin_update.decimal_position).to eq(3)
      end
    end

    context 'decrementing with commit as "-"' do
      let(:params) { ActionController::Parameters.new(:commit => "-", :id => meter_1.to_param) }

      it 'decrease meter_1 decimal position by 1' do
        expect(admin_update.decimal_position).to eq(1)
      end
    end
  end
end
