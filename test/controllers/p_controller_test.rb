require 'test_helper'

class PControllerTest < ActionController::TestCase
  test "should get service" do
    get :service
    assert_response :success
  end

  test "should get case" do
    get :case
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
