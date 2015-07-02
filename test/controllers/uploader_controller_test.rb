require 'test_helper'

class UploaderControllerTest < ActionController::TestCase
  test "should get img" do
    get :img
    assert_response :success
  end

end
