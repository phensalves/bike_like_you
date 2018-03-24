module Api::V1
  class TripsController < ApplicationController
    # before_filter :find_model
    # respond_to: :json

    def index
      @trips = Trip.paginate(:page => params[:page] || 1, :per_page => 10).order(created_at: :desc)
      render json: @trips
    end
    

    private
    # def find_trip
    #   @trip = Trip.find(params[:id]) if params[:id]
    # end
  end
end  