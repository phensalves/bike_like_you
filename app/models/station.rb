class Station < ApplicationRecord
  has_many :slots, dependent: :delete_all

  def available_slots
    slots.where(available: true).count
  end

  def unavailable_slots
    slots.where(available:false).count
  end
end
