module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def redirect_after_sign_in(user)
    if user.admin?
      redirect_to admin_root_path
    else
      redirect_to user.customer_profile
    end
  end
end
