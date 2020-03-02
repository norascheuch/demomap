require 'test_helper'

class DemosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get demos_index_url
    assert_response :success
  end

  test "should get show" do
    get demos_show_url
    assert_response :success
  end

  test "should get new" do
    get demos_new_url
    assert_response :success
  end

  test "should get edit" do
    get demos_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get demos_destroy_url
    assert_response :success
  end

end
