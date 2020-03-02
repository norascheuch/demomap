require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get splash" do
    get pages_splash_url
    assert_response :success
  end

  test "should get dashboard" do
    get pages_dashboard_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end

  test "should get organizers" do
    get pages_organizers_url
    assert_response :success
  end

  test "should get tips" do
    get pages_tips_url
    assert_response :success
  end

  test "should get impressum" do
    get pages_impressum_url
    assert_response :success
  end

end
