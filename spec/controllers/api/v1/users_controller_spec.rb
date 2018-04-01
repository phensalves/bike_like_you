require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  let!(:email) {User.first.email}
  let!(:token) {User.first.authentication_token}

  let!(:auth_headers) {
    { 'X-User-Email' => email, 'X-User-Token' => token }
  }

  let(:trips) {
    user = User.first
    user_trips = []
    user.trips.each do |trip|
      hash  = {
        id:             trip.id,
        origin_station: trip.origin_station,
        final_station:  trip.final_station,
        start_date:     trip.start_date,
        end_date:       trip.end_date,
        distance:       trip.distance,
        bike: {
          id:    trip.bike.id,
          brand: trip.bike.brand,
          model: trip.bike.model 
        }
      }
      user_trips << hash
    end
    user_trips.to_json
  }

  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
    request.headers.merge! auth_headers
  end

  describe 'GET /api/v1/users/my_trips' do

    it 'expect request my_trips endpoint sending headers' do
      get :my_trips, format: :json
      expect(response.status).to eq(200)
    end

    it 'expect list trips' do
      get :my_trips
      expect(response.body).to eq(trips)
    end

    it 'expect object not be nil' do
      get :my_trips, format: :json
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to_not be_nil
    end

    it 'expect return unauthorized if nil head' do
      auth_headers  = { 'X-User-Email' => nil, 'X-User-Token' => nil }
      request.env["HTTP_ACCEPT"] = 'application/json'
      request.headers.merge! auth_headers
      get :my_trips, format: :json
      expect(response.status).to eq(401)
    end
    
  end
end