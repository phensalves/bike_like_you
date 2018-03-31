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

require 'rails_helper'

RSpec.describe Trip, type: :model do
  #FIELDS  
  it { should have_db_column(:origin_station).of_type(:string)}
  it { should have_db_column(:final_station).of_type(:string)}
  it { should have_db_column(:start_date).of_type(:datetime)}
  it { should have_db_column(:end_date).of_type(:datetime)}
  it { should have_db_column(:distance).of_type(:float)}
  it { should have_db_column(:state).of_type(:string)}

  #ASSOCIATIONS
  it { should belong_to(:user) }
  it { should belong_to(:bike) }
end
