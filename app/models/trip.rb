class Trip < ApplicationRecord
  include AASM
  belongs_to :bike
  belongs_to :user

  aasm :column => :state do
    state :initialized, default: true
    state :completed

    event :complete do
      transitions from: :initialized, to: :completed
    end
  end
end
