# == Schema Information
#
# Table name: trips
#
#  id             :integer          not null, primary key
#  origin_station :string
#  final_station  :string
#  start_date     :datetime
#  end_date       :datetime
#  distance       :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  bike_id        :integer
#  user_id        :integer
#  state          :string
#

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
