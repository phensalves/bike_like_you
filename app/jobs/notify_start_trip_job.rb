class NotifyStartTripJob < ApplicationJob
  queue_as :trip

  def perform(*args)
    # Do something later
  end
end
