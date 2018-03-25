require 'test_helper'

class Api::V1::SlotsControllerTest < ActionDispatch::IntegrationTest
  test "should get remove_bike" do
    get api_v1_slots_remove_bike_url
    assert_response :success
  end

end
