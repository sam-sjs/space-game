require 'test_helper'

class GameControllerTest < ActionDispatch::IntegrationTest
  test "should get app" do
    get game_app_url
    assert_response :success
  end

end
