class BikeServicesController < ApplicationController
  before_action :set_bike_service, only: %i[ show edit update destroy ]


  def index
    @user = User.find(params[:user_id])
    @bike_services = @user.bike_services
  end


  def show
  end


  def new
    @user = User.find(params[:user_id])
    @bike_service = @user.bike_services.build
  end


  def edit
  end


  def create
    @user = User.find(params[:user_id])
    @bike_service = @user.bike_services.build(bike_service_params)
    if @bike_service.save
      redirect_to user_bike_services_path(@user), notice: 'Servicio de bicicleta creado exitosamente.'
    else
      render :new
    end
  end


  def update
    respond_to do |format|
      if @bike_service.update(bike_service_params)
        format.html { redirect_to @bike_service, notice: "Servicio de bicicleta actualizado exitosamente." }
        format.json { render :show, status: :ok, location: @bike_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bike_service.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @bike_service.destroy!

    respond_to do |format|
      format.html { redirect_to user_bike_services_path, status: :see_other, notice: "Bike service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_bike_service
      @bike_service = BikeService.find(params[:id])
    end


    def bike_service_params
      params.require(:bike_service).permit(:user_id, :descripcion, :date, :cost)
    end
end
