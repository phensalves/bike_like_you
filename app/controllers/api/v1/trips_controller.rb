module Api::V1
  class TripsController < ApplicationController
    # before_filter :find_model
    # respond_to: :json

    def index
      @trips = Trip.paginate(:page => params[:page] || 1, :per_page => 10).order(created_at: :desc)
      render json: @trips
    end

    def start_trip user, bike
      @started_trip = bike.broked? ? load_broked_bike_message : Trip.create(user_id: user.id, bike_id: bike.id, origin_station: bike.station.id, start_date: DateTime.now)
      render json: @started_trip
    end

    def finish_trip user, bike, station
      trip = Trip.where(user_id: user.id, bike_id: bike.id, state: 'initialized')
      (station != trip.start_station) ? trip.complete! : load_finish_trip_message
    end
    

    private
    # def find_trip
    #   @trip = Trip.find(params[:id]) if params[:id]
    # end

    def load_finish_trip_message
      render json: {code: 422, message: "Unfortunately you cannot finish your trip in this station. Please, choose another station and then deliver this bike. "}
    end

    def load_broked_bike_message
      render json: {code: 422, message: "Can't start tripe. This bike is broked, please, choose another bike."}
    end
  end
end  