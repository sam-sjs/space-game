require 'test_helper'

class SystemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get systems_new_url
    assert_response :success
  end

  test "should get create" do
    get systems_create_url
    assert_response :success
  end

  test "should get index" do
    get systems_index_url
    assert_response :success
  end

  test "should get show" do
    get systems_show_url
    assert_response :success
  end

  test "should get edit" do
    get systems_edit_url
    assert_response :success
  end

  test "should get update" do
    get systems_update_url
    assert_response :success
  end

  test "should get destroy" do
    get systems_destroy_url
    assert_response :success
  end

end
