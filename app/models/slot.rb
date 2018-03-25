class Slot < ApplicationRecord
  belongs_to :station

  scope :availables, -> { where(available: true).count }
  scope :unavailables, -> { where(available: false).count }
end
