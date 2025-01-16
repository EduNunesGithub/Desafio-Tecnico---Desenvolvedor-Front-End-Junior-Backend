class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[show update destroy]

  # GET /vehicles
  def index
    query = Vehicle.ransack(params[:q])
    @vehicles = query.result.page(params[:page]).per(params[:per_page] || 10)

    render json: {
      vehicles: @vehicles,
      meta: api_metadata(@vehicles)
    }, status: :ok
  end

  # GET /vehicles/:id
  def show
    render json: @vehicle, status: :ok
  end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      render json: @vehicle, status: :created
    else
      render json: { errors: @vehicle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /vehicles/:id
  def update
    if @vehicle.update(vehicle_params)
      render json: @vehicle, status: :ok
    else
      render json: { errors: @vehicle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /vehicles/:id
  def destroy
    @vehicle.destroy
    head :no_content
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find_by(id: params[:id])
    return if @vehicle.present?

    render json: { error: 'Vehicle not found' }, status: :not_found
  end

  def vehicle_params
    params.require(:vehicle).permit(
      :name, :price, :subheading, :video, :legal_text,
      description: {}, features: {}, image: {}
    )
  end
end
