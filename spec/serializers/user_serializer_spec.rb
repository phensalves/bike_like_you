require 'rails_helper'

RSpec.describe UserSerializer do
  
  before :each do
    @user             = FactoryBot.build(:user)
    @seriliazer       = UserSerializer.new(@user)
    @serialization    = ActiveModelSerializers::Adapter.create(@seriliazer)
  end

  subject { JSON.parse(@serialization.to_json) }

  it 'should have a name that matches' do
    expect(subject['name']).to eql(@user.name)
  end

  it 'should have a email that matches' do
    expect(subject['email']).to eql(@user.email)
  end
end