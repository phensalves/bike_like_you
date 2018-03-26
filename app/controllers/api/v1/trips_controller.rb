class  Api::V1::TripsController < Api::V1::ApiController
  def start_trip
    bike = Bike.find(params[:bike_id])
    bike.broked? ? load_broked_bike_message : Trip.create(user_id: current_user.id, bike_id: bike.id, origin_station: bike.station.name, start_date: DateTime.now)
    render json: {success: true, message: "Trip started!"}, status: 200
  end

  def finish_trip
    trip = Trip.where(user_id: current_user.id, bike_id: params[:bike_id], state: 'initialized').first
    final_station = Station.find(params[:station_id]).name
    trip.present? ? update_trip_data(trip, final_station) : load_fail_finish_trip_message
  end

  private
  def complete_trip trip
    trip.complete! unless trip.completed?
    trip.completed? ? load_sucess_finish_trip_message : load_fail_finish_trip_message
  end

  def load_sucess_finish_trip_message
    render json: {sucess: true, message: "Trip finished!"}, status: 200
  end

  def load_fail_finish_trip_message
    render json: {sucess: false, message: "Somenthing is wrong!"}, status: 422
  end

  def load_fail_same_station_finish_trip_message
    render json: {sucess: false, message: "Unfortunately you cannot finish your trip in this station. Please, choose another station and then deliver this bike. "}, status: 422
  end

  def load_broked_bike_message
    render json: {sucess: false, message: "Can't start tripe. This bike is broked, please, choose another bike."}, status: 422
  end

  def update_trip_data trip, final_station
    trip.final_station = final_station
    trip.distance      = calculate_distance(trip.origin_station, station_id)
    unless is_the_same_station?(trip.origin_station, trip.final_station)
      complete_trip(trip)
      trip.save!
    else
      load_fail_finish_trip_message
    end
  end

  def is_the_same_station? start_station, end_station
    start_station == end_station
  end

  def calculate_distance origin_station, end_station
    nil
  end
end