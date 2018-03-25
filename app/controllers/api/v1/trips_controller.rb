module Api::V1
  class TripsController < ApplicationController
    # before_filter :find_model
    # respond_to: :json

    def index
      @trips = Trip.paginate(:page => params[:page] || 1, :per_page => 10).order(created_at: :desc)
      render json: @trips
    end

    def start_trip user, bike
      if bike.broked?
        render json: {error: 500, message: "Can't start tripe. This bike is broked, please, choose another bike."}
      else
        @started_trip = Trip.create(user_id: user.id, bike_id: bike.id, origin_station: bike.station.id, start_date: DateTime.now)
      end
      render json: @started_trip
    end

    def finish_trip user, bike, station
      # trip = Trip.where(user_id: user.id, bike_id: bike.id, start_station:)
      # if station != 
    end
    

    private
    # def find_trip
    #   @trip = Trip.find(params[:id]) if params[:id]
    # end
  end
end  