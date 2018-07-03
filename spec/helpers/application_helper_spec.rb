require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#active_class' do
    context 'given the controller and action parameters correctly matched the current route' do
      before do
        allow(controller).to receive(:params).and_return({ :controller => 'customer', :action => 'new' })
      end
      it 'return "active"' do
        expect(active_class('customer', 'new', nil)).to eq('active')
      end
    end

    context 'given the controller and action parameters is not matched and the other class name is "disabled"' do
      before do
        allow(controller).to receive(:params).and_return({ :controller => 'customer', :action => 'new' })
      end
      it 'return "disabled"' do
        expect(active_class('properties', 'new', 'disabled')).to eq('disabled')
      end
    end
  end
end