require 'test_helper'

class Admin::Setting::CitiesControllerTest < ActionController::TestCase
  setup do
    @admin_setting_city = admin_setting_cities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_setting_cities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_setting_city" do
    assert_difference('Admin::Setting::City.count') do
      post :create, admin_setting_city: { name: @admin_setting_city.name, pinyin: @admin_setting_city.pinyin }
    end

    assert_redirected_to admin_setting_city_path(assigns(:admin_setting_city))
  end

  test "should show admin_setting_city" do
    get :show, id: @admin_setting_city
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_setting_city
    assert_response :success
  end

  test "should update admin_setting_city" do
    patch :update, id: @admin_setting_city, admin_setting_city: { name: @admin_setting_city.name, pinyin: @admin_setting_city.pinyin }
    assert_redirected_to admin_setting_city_path(assigns(:admin_setting_city))
  end

  test "should destroy admin_setting_city" do
    assert_difference('Admin::Setting::City.count', -1) do
      delete :destroy, id: @admin_setting_city
    end

    assert_redirected_to admin_setting_cities_path
  end
end
