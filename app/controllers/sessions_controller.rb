class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(email: params[:email])

    if params[:email].blank? || params[:password].blank?
      flash[:alert] = "Por favor revisa todos los campos"
      redirect_to login_path
      return
    end

    if admin&.authenticate(params[:password])
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
end
