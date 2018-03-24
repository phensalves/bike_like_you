class Api::V1::StationsController < ApplicationController
  def index
    @stations = Station.paginate(:page => params[:page] || 1, :per_page => 10).order(created_at: :desc)
    render json: @stations
  end

  def show
  end

  def available_slots
  end

  def not_avaiable_slots
  end
end
