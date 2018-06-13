class ApplicationController < ActionController::Base
  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  
  def render_404
    render plain: 'Not found', :status => 404
  end
end
