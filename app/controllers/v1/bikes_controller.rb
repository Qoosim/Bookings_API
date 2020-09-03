class V1::BikesController < ApplicationController
  before_action :set_bike, only: [:show, :update, :destroy]

  # GET /bikes
  def index
    @bikes = Bike.all
    # @bikes = current_user.bikes
    json_response(@bikes)
  end

  # POST /bikes
  def create
    # create bikes belonging to current user
    @bike = Bike.create(bike_params)
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
      # whitelist params
      params.permit(
        :model, 
        :color,
        :price,
        :weight,
        :engine_capacity
      )
    end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
