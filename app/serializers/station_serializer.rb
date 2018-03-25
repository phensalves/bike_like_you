class StationSerializer < ActiveModel::Serializer
  attributes :available_slots, :unavailable_slots

  # has_many :slots

  def station_name
    object[:name]
  end
end
