require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get assign_to" do
    get :assign_to
    assert_response :success
  end

end
