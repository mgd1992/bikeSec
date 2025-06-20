class ApplicationController < ActionController::Base
  helper_method :current_admin

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  def require_admin
    redirect_to login_path, alert: "Debés iniciar sesión" unless current_admin
  end
end
