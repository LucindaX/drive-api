class CheckpointsController < ApplicationController
  before_action :set_trip
  before_action :set_checkpoint, only: [:show, :update, :destroy]

  # GET /trips/:trip_id/checkpoints
  def index
    json_response(@trip.checkpoints)
  end
  
  # GET /trips/:trip_id/checkpoints/:id
  def show
    json_response(@checkpoint)
  end

  # POST /trips/:trip_id/checkpoints
  def create
    @trip.checkpoints.create!(checkpoint_params)
    json_response(@trip, :created)
  end

  # PUT /trips/:trip_id/checkpoints/:id
  def update
    @checkpoint.update(checkpoint_params)
    head :no_content
  end

  # DELETE /trips/:trip_id/checkpoints/:id
  def destroy
    @checkpoint.destroy
    head :no_content
  end

  private

  def checkpoint_params
    params.permit(latlng: [])
  end

  def set_trip
    @trip ||= Trip.find(params[:trip_id])
  end

  def set_checkpoint
    @checkpoint ||= @trip.checkpoints.find_by!(id: params[:id]) if @trip
  end


end
