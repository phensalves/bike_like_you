require 'rails_helper'

RSpec.describe StationSerializer do
  
  before :each do
    @stations      = FactoryBot.create_list(:station, 10)
    @seriliazer    = StationSerializer.new(@stations)
    @serialization = ActiveModelSerializers::Adapter.create(@seriliazer)
  end

  subject { JSON.parse(@serialization.serializer.object.first.to_json) }

  it 'should have a name that matches' do
    expect(subject['name']).to eql(@stations.first.name)
  end

end