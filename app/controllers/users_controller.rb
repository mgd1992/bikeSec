class UsersController < ApplicationController
  
  before_action :set_user, only: %i[ show edit update destroy services_pdf ]

  def index
    @users = User.includes(:bike_services)
  end

  def show
    @user_services = @user.bike_services.order(date: :desc)
    @total_price_services = @user_services.sum(:cost)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "Usuario creado" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "Usuario actualizado" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def services_pdf

    @bike_services = @user.bike_services.order(date: :desc)

    respond_to do |format|
      format.pdf do
        pdf = ServicePdf.new(@user, @bike_services)
        send_data pdf.render,
          filename: "servicios_#{@user.nombre}_#{Date.today}.pdf",
          type: "application/pdf",
          disposition: "inline"
      end
    end

  end
  def destroy
    if @user.destroy
      redirect_to users_path, status: :see_other, notice: "Usuario eliminado"
    else
      redirect_to users_path, alert: "No se pudo eliminar el usuario."
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:nombre, :apellido, :telefono, :email)
    end
end
