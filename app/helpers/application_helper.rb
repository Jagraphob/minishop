module ApplicationHelper
  def active_class_by_controller_action(controller:, action: nil, active_class: 'active', other_class: '')
    action ||= params[:action]
    params[:controller] == controller && params[:action] == action ? active_class : other_class      
  end

  def active_class_by_status(status:, active_status:, active_class:, other_class: '')
    status == active_status ? active_class : other_class
  end
end
