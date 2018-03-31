# == Schema Information
#
# Table name: stations
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StationSerializer < ActiveModel::Serializer
  attributes  :station_name, 
              :available_slots, 
              :unavailable_slots

  def station_name
    object[:name]
  end
end
