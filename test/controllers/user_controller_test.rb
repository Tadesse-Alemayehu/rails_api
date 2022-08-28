require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_index_url
    assert_response :success
  end

  test "should get show" do
    get user_show_url
    assert_response :success
  end

  test "should get add" do
    get user_add_url
    assert_response :success
  end

  test "should get remove" do
    get user_remove_url
    assert_response :success
  end
end
