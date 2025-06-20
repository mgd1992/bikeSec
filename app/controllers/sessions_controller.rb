class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(email: login_params[:email])

    if admin&.authenticate(login_params[:password])
    session[:admin_id] = admin.id
    redirect_to users_path
    else
      flash.now[:alert] = "Email o contraseña incorrectos"
      render :new, status: :unprocessable_entity
    end
    puts params.inspect

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
