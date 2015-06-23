require 'test_helper'

class Admin::Setting::EducationsControllerTest < ActionController::TestCase
  setup do
    @admin_setting_education = admin_setting_educations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_setting_educations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_setting_education" do
    assert_difference('Admin::Setting::Education.count') do
      post :create, admin_setting_education: { name: @admin_setting_education.name }
    end

    assert_redirected_to admin_setting_education_path(assigns(:admin_setting_education))
  end

  test "should show admin_setting_education" do
    get :show, id: @admin_setting_education
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_setting_education
    assert_response :success
  end

  test "should update admin_setting_education" do
    patch :update, id: @admin_setting_education, admin_setting_education: { name: @admin_setting_education.name }
    assert_redirected_to admin_setting_education_path(assigns(:admin_setting_education))
  end

  test "should destroy admin_setting_education" do
    assert_difference('Admin::Setting::Education.count', -1) do
      delete :destroy, id: @admin_setting_education
    end

    assert_redirected_to admin_setting_educations_path
  end
end
