require 'test_helper'

class ResumeControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

end
