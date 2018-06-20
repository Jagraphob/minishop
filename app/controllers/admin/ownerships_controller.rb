class Admin::OwnershipsController < ApplicationController
  def index
    @pending_ownerships = Ownerships.where(:status => :pending)
  end
end