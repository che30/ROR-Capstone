class ApplicationController < ActionController::Base
  helper_method :current_user, :log_in

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by(id:
      session[:user_id])
  end

  def authorize
    redirect_to login_path, alert: 'Not Authorised ' if current_user.nil?
  end
end
