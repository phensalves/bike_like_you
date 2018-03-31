require 'rails_helper'

RSpec.describe Api::V1::StationsController, type: :controller do

  let(:email) {User.last.email}
  let(:token) {User.last.authentication_token}

  let!(:auth_headers) {
    { 'X-User-Email' => email, 'X-User-Token' => token }
  }

  
  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
    request.headers.merge! auth_headers
  end

  describe 'GET /api/v1/stations' do
    
    it 'expect response to be sucess ' do
      get :index
      expect(response).to be_success
    end

    it 'expect return json list of stations' do
      FactoryBot.create_list(:station, 10)
      get :index
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(10)
    end

    it 'expect return data in each field' do
      FactoryBot.create_list(:station, 10)
      get :index
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.map{|station| station['station_name'] == nil}).not_to be_nil
      expect(parsed_response.map{|station| station['available_slots'] == nil}).not_to be_nil
      expect(parsed_response.map{|station| station['unavailable_slots'] == nil}).not_to be_nil
    end

    it 'expect return fail if not authenticated' do
      auth_headers  = { 'X-User-Email' => nil, 'X-User-Token' => nil }
      request.env["HTTP_ACCEPT"] = 'application/json'
      request.headers.merge! auth_headers
      get :index
      expect(response).to_not be_success
      expect(response.status).to eq(401)
    end
  
  end

end
