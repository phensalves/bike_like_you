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

require 'rails_helper'

RSpec.describe Slot, type: :model do
  #FIELDS
  it { should have_db_column(:available).of_type(:boolean) }

  #ASSOCIATION
  it { should belong_to(:station) }
end
