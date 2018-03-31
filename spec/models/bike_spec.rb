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

require 'rails_helper'

RSpec.describe Bike, type: :model do
  #FIELDS
  it { should have_db_column(:brand).of_type(:string) }
  it { should have_db_column(:model).of_type(:string) }
  it { should have_db_column(:broked).of_type(:boolean) }

  #ASSOCIATION
  it { should belong_to(:station) }
end
