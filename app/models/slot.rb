# == Schema Information
#
# Table name: slots
#
#  id         :integer          not null, primary key
#  station_id :integer
#  available  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bike_id    :integer
#

class Slot < ApplicationRecord
  belongs_to :station

  scope :availables, -> { where(available: true).count }
  scope :unavailables, -> { where(available: false).count }
end
