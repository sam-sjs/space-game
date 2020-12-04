require 'test_helper'

class SystemControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get system_new_url
    assert_response :success
  end

  test "should get create" do
    get system_create_url
    assert_response :success
  end

  test "should get index" do
    get system_index_url
    assert_response :success
  end

  test "should get show" do
    get system_show_url
    assert_response :success
  end

  test "should get edit" do
    get system_edit_url
    assert_response :success
  end

  test "should get update" do
    get system_update_url
    assert_response :success
  end

  test "should get destroy" do
    get system_destroy_url
    assert_response :success
  end

end
