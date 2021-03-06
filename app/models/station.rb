# == Schema Information
#
# Table name: stations
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Station < ApplicationRecord
  has_many :slots, dependent: :delete_all

  def available_slots
    slots.where(available: true).count
  end

  def unavailable_slots
    slots.where(available:false).count
  end
end
