require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get user_trips" do
    get users_user_trips_url
    assert_response :success
  end

end
