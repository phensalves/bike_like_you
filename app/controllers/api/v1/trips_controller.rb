module Api
  module V1
    class TripsController < Api::V1::ApiController
      def start_trip
        bike = Bike.find(params[:bike_id])
        bike.broked? ? render_json_response(false, 'Can not start trip. Choose another bike.', 422) : init_trip(current_user.id, bike.id)
      end

      def finish_trip
        trip          = Trip.where(user_id: current_user.id, bike_id: params[:bike_id], state: 'initialized').first
        final_station = Station.find(params[:station_id]).name if params[:station_id].present?
        trip.present? ? update_trip_data(trip, final_station) : render_json_response(false, 'Something is wrong!', 422)
      end

      private

      def init_trip(user_id, bike_id)
        bike = Bike.find(bike_id)
        Trip.create(user_id: current_user.id, bike_id: bike_id, origin_station: bike.station.name, start_date: Time.now)
        render_json_response(true, "Trip started!", 201)
      end

      def complete_trip trip
        trip.complete! unless trip.completed?
      end

      def render_json_response(sucess, message, status)
        render json: {sucess: sucess, message: message}, status: status
      end

      def update_trip_data(trip, final_station)
        trip.final_station = final_station
        trip.end_date      = Time.now
        trip.distance      = calculate_distance
        unless the_same_station?(trip.origin_station, trip.final_station)
          trip_object      = prepare_trip_object(trip)
          NotifyStartTripJob.perform_later trip_object
          complete_trip(trip)
          trip.save!
          render_json_response(true, 'Trip finished!', 200)
        else
          render_json_response(false, 'You cannot finish your trip in this station. Please, choose another station.', 422)
        end
      end

      def the_same_station?(start_station, end_station)
        start_station == end_station
      end

      def calculate_distance
        Faker::Number.decimal(2)
      end

      def prepare_trip_object(trip)
        trip_object = { user_id: trip.user_id,
                        bike_id: trip.bike_id,
                        started_at: trip.start_date.strftime('%F %H:%M:%S'),
                        finished_at: trip.end_date.strftime('%F %H:%M:%S'),
                        traveled_distance: trip.distance,
                        origin: {
                          station_id: Station.where(name: trip.origin_station).first.id
                        },
                        destination: {
                          station_id: Station.where(name: trip.final_station).first.id
                        }
                      }
        trip_object.to_json
      end
    end
  end
end