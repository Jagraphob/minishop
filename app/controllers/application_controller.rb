class ApplicationController < ActionController::Base
  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  
  def not_found
    render plain: 'Not found', :status => 404
  end
end
