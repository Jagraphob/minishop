class Admin::OwnershipsController < ApplicationController
  layout "admin"

  def update
    session[:return_to] ||= request.referer
    
    @ownership = Ownership.find(params[:id])
    if @ownership.update(ownership_params)
      redirect_to session.delete(:return_to)
    else
      flash[:error] = @ownership.errors.full_messages if @ownership.errors
      redirect_to session.delete(:return_to)
    end
  end

  private

  def ownership_params
    params.require(:ownership).permit(:status)
  end
end