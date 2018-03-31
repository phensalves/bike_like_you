# == Schema Information
#
# Table name: stations
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Station, type: :model do
  #FIELDS
  it { should have_db_column(:name).of_type(:string) }

end
