require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get homehelp" do
    get :homehelp
    assert_response :success
  end

end
