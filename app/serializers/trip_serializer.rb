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

class TripSerializer < ActiveModel::Serializer
  attributes  :id,
              :origin_station,
              :final_station,
              :start_date,
              :end_date,
              :distance

  belongs_to :bike
end
