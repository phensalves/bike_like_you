# == Schema Information
#
# Table name: bikes
#
#  id         :integer          not null, primary key
#  brand      :string
#  model      :string
#  station_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  broked     :boolean
#

class BikeSerializer < ActiveModel::Serializer
  attributes  :id, 
              :brand, 
              :model
end
