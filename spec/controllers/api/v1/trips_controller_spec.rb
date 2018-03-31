require 'rails_helper'

RSpec.describe Api::V1::TripsController, type: :controller do
  let(:email) {User.last.email}
  let(:token) {User.last.authentication_token}

  let!(:auth_headers) {
    { 'X-User-Email' => email, 'X-User-Token' => token }
  }

  let!(:trip){ FactoryBot.create(:trip) }
  let!(:station_id){ Station.where(name: trip.origin_station).first }
  let!(:bike){ FactoryBot.create(:bike) }
  let!(:station){ FactoryBot.create(:station) }

  before(:each) do
    request.env["HTTP_ACCEPT"] = 'application/json'
    request.headers.merge! auth_headers
  end
  
  describe 'POST /api/v1/trips/start_trip' do
    
    it 'expect request start_trip endpoint sending header eq 200' do
      post :start_trip, params: { bike_id: Bike.first.id }
      expect(response.status).to eq(201)
    end

    it 'expect return unauthorized if nil header' do
      auth_headers  = { 'X-User-Email' => nil, 'X-User-Token' => nil }
      request.env["HTTP_ACCEPT"] = 'application/json'
      request.headers.merge! auth_headers
      post :start_trip, params: { bike_id: Bike.first.id }
      expect(response.status).to eq(401)
    end

    it 'expect 422 code if bike is broked' do
      post :start_trip, params: { bike_id: Bike.where("broked IS TRUE").first.id }
      expect(response.status).to eq(422)
    end

    it 'expect right message if bike is broked' do
      post :start_trip, params: { bike_id: Bike.where("broked IS TRUE").first.id }
      expect(JSON.parse(response.body)['message']).to eq('Can not start trip. Choose another bike.')
    end

  end

  describe 'POST /api/v1/trips/finish_trip' do

    it 'expect 200 when finish trip is ok' do
      Trip.create(user_id: User.last.id, bike_id: bike.id, origin_station: station.name, start_date: "2018-03-30 16:00:00")
      post :finish_trip, params: { bike_id: bike.id, station_id: station_id}
      expect(response.status).to eq(200)
    end
    
    it 'expect 422 when finish_trip without trip id' do
      post :finish_trip, params: { bike_id: Bike.order("RANDOM()").first.id }
      expect(response.status).to eq(422)
    end

    it 'expect right message if fail finish_trip' do
      post :finish_trip, params: { bike_id: Bike.order("RANDOM()").first.id }
      expect(JSON.parse(response.body)['message']).to eq('Something is wrong!')
    end

    it 'expect fail if end station is start station' do
      post :finish_trip, params: { bike_id: Bike.first.id, station_id: station_id }
      expect(response.status).to eq(422)
    end

    it 'expect right message if try finish trip in same start station' do
      Trip.create(user_id: User.last.id, bike_id: bike.id, origin_station: Station.first.name, start_date: "2018-03-30 16:00:00")
      post :finish_trip, params: { bike_id: bike.id, station_id: Station.first.id }
      expect(JSON.parse(response.body)['message']).to eq('You cannot finish your trip in this station. Please, choose another station.')
    end

    it 'expect return unauthorized if nil header' do
      auth_headers  = { 'X-User-Email' => nil, 'X-User-Token' => nil }
      request.env["HTTP_ACCEPT"] = 'application/json'
      request.headers.merge! auth_headers
      Trip.create(user_id: User.last.id, bike_id: bike.id, origin_station: station.name, start_date: "2018-03-30 16:00:00")
      post :finish_trip, params: { bike_id: bike.id, station_id: station_id}
      expect(response.status).to eq(401)
    end

  end

end
