require 'test_helper'

class Admin::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_user_new_url
    assert_response :success
  end

end
