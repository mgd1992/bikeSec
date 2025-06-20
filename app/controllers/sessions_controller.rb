class SessionsController < ApplicationController
  def new
  end

  def create

    if params[:email].blank? || params[:password].blank?
      flash.now[:alert] = "Por favor revisa todos los campos"
      redirect_to login_path
      return
    end

    admin = Admin.find_by(email: params[:email])
    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to users_path, notice: "Sesión iniciada"
    else
      flash.now[:alert] = "Email o contraseña incorrectos"
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to login_path, notice: "Sesión cerrada"
  end
end
