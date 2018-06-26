class Admin::OwnershipsController < ApplicationController
  layout "admin"
  
  def index
    @pending_ownerships = Ownership.where(:status => :pending)
  end

  def show
    @ownership = Ownership.find(params[:id])
  end

  def update
    byebug

  end

  def ownership_params
    
  end
end