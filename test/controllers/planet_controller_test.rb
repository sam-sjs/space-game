require 'test_helper'

class PlanetControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get planet_new_url
    assert_response :success
  end

  test "should get create" do
    get planet_create_url
    assert_response :success
  end

  test "should get index" do
    get planet_index_url
    assert_response :success
  end

  test "should get show" do
    get planet_show_url
    assert_response :success
  end

  test "should get edit" do
    get planet_edit_url
    assert_response :success
  end

  test "should get update" do
    get planet_update_url
    assert_response :success
  end

  test "should get destroy" do
    get planet_destroy_url
    assert_response :success
  end

end
