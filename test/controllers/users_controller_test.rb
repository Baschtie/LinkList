require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get users_list_url
    assert_response :success
  end

  test "should get view" do
    get users_view_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

end
