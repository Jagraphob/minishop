module ApplicationHelper
  def active_class(controller, action, other_class)
    params[:controller] == controller && params[:action] == action ? 'active' : other_class
  end
end
