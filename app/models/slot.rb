class Slot < ApplicationRecord
  belongs_to :station
  belongs_to :bike
end
