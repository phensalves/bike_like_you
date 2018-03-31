class NotifyStartTripJob < ApplicationJob
  queue_as :trip

  def perform(trip_object)
    api_service = ConsumeApiService.new(trip_object)
    api_service.send_start_trip_message
  end
end
