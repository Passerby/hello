require 'test_helper'

class Admin::Setting::IndustriesControllerTest < ActionController::TestCase
  setup do
    @admin_setting_industry = admin_setting_industries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_setting_industries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_setting_industry" do
    assert_difference('Admin::Setting::Industry.count') do
      post :create, admin_setting_industry: { name: @admin_setting_industry.name }
    end

    assert_redirected_to admin_setting_industry_path(assigns(:admin_setting_industry))
  end

  test "should show admin_setting_industry" do
    get :show, id: @admin_setting_industry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_setting_industry
    assert_response :success
  end

  test "should update admin_setting_industry" do
    patch :update, id: @admin_setting_industry, admin_setting_industry: { name: @admin_setting_industry.name }
    assert_redirected_to admin_setting_industry_path(assigns(:admin_setting_industry))
  end

  test "should destroy admin_setting_industry" do
    assert_difference('Admin::Setting::Industry.count', -1) do
      delete :destroy, id: @admin_setting_industry
    end

    assert_redirected_to admin_setting_industries_path
  end
end
