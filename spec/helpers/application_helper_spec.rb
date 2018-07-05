require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#active_class_by_controller_action' do
    before do
      allow(controller).to receive(:params).and_return({ :controller => 'customers', :action => 'new' })
    end

    context 'given the controller and action parameters correctly matched the both of their respective params' do
      it 'return the active_class' do
        expect(active_class_by_controller_action(controller: 'customers', action: 'new', active_class: 'active', other_class: 'disabled')).to eq('active')
      end
    end

    context 'given the controller does not match with the controller param' do
      it 'return the other_class' do
        expect(active_class_by_controller_action(controller: 'properties', action: 'new', active_class: 'active', other_class: 'disabled')).to eq('disabled')
      end
    end

    context 'given the controller match the params and action is not provided' do
      it 'return the active_class' do
        expect(active_class_by_controller_action(controller: 'customers', active_class: 'active', other_class: 'disabled')).to eq('active')
      end
    end

    context 'given the controller does not match the params and action is not provided' do
      it 'return the other_class' do
        expect(active_class_by_controller_action(controller: 'properties', active_class: 'active', other_class: 'disabled')).to eq('disabled')
      end
    end

    context 'given the controller and action match the params and active_class is not given' do
      it 'return the default value of active_class' do
        expect(active_class_by_controller_action(controller: 'customers', action: 'new', other_class: 'disabled')).to eq('active')
      end
    end

    context 'given the controller and action does not match the params and other_class is not given' do
      it 'return the default value of the other_class' do
        expect(active_class_by_controller_action(controller: 'properties', action: 'index', active_class: 'active')).to eq('')
      end
    end
  end

  describe '#active_class_by_status' do
    context 'given the status match the active_status' do
      it 'return the active_class' do
        expect(active_class_by_status(status: 'on', active_status: 'on', active_class: 'active', other_class: 'disabled')).to eq('active')
      end
    end

    context 'given the status does not match the active_status' do
      it 'return the other_class' do
        expect(active_class_by_status(status: 'on', active_status: 'off', active_class: 'active', other_class: 'disabled')).to eq('disabled')
      end
    end

    context 'given the status does not match but the active_status and other_class is not provided' do
      it 'return the default value of other_class' do
        expect(active_class_by_status(status: 'on', active_status: 'off', active_class: 'active')).to eq('')
      end
    end
  end
end