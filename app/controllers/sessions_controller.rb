class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: login_params[:email])

    if user&.authenticate(login_params[:password])
      session[:user_id] = user.id

      if user.admin?
        redirect_to admin_dashboard_path
      else
        redirect_to cliente_dashboard_path
      end
    else
      flash.now[:alert] = "Email o contraseña incorrectos"
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    session[:admin_id] = nil
    redirect_to login_path, notice: "Sesión cerrada"
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
