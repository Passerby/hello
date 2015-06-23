require 'test_helper'

class Admin::Setting::ProvincesControllerTest < ActionController::TestCase
  setup do
    @admin_setting_province = admin_setting_provinces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_setting_provinces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_setting_province" do
    assert_difference('Admin::Setting::Province.count') do
      post :create, admin_setting_province: { name: @admin_setting_province.name, pinyin: @admin_setting_province.pinyin }
    end

    assert_redirected_to admin_setting_province_path(assigns(:admin_setting_province))
  end

  test "should show admin_setting_province" do
    get :show, id: @admin_setting_province
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_setting_province
    assert_response :success
  end

  test "should update admin_setting_province" do
    patch :update, id: @admin_setting_province, admin_setting_province: { name: @admin_setting_province.name, pinyin: @admin_setting_province.pinyin }
    assert_redirected_to admin_setting_province_path(assigns(:admin_setting_province))
  end

  test "should destroy admin_setting_province" do
    assert_difference('Admin::Setting::Province.count', -1) do
      delete :destroy, id: @admin_setting_province
    end

    assert_redirected_to admin_setting_provinces_path
  end
end
