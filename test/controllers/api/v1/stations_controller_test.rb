require 'test_helper'

class Api::V1::StationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_stations_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_stations_show_url
    assert_response :success
  end

  test "should get available_slots" do
    get api_v1_stations_available_slots_url
    assert_response :success
  end

  test "should get not_avaiable_slots" do
    get api_v1_stations_not_avaiable_slots_url
    assert_response :success
  end

end
