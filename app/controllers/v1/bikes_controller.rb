class V1::BikesController < ApplicationController
  before_action :set_bike, only: %i[show update destroy]
  skip_before_action :authorize_request, only: %i[index show]
  before_action :check_admin, only: %i[create update destroy]

  # GET /bikes
  def index
    @bikes = Bike.all
    json_response(@bikes)
  end

  # POST /bikes
  def create
    @bike = Bike.create!(bike_params)
    json_response(@bike, :created)
  end

  # GET /bikes/:id
  def show
    json_response(@bike)
  end

  # PUT /bikes/:id
  def update
    @bike.update(bike_params)
    head :no_content
  end

  # DELETE /bikes/:id
  def destroy
    @bike.destroy
    head :no_content
  end

  private

  def bike_params
    params.permit(
      :model,
      :color,
      :price,
      :weight,
      :engine_capacity,
      :user_id
    )
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def check_admin
    render json: { error: 'You have no right!' } unless current_user.admin == true
  end
end
