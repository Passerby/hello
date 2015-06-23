require 'test_helper'

class Admin::Setting::ExperiencesControllerTest < ActionController::TestCase
  setup do
    @admin_setting_experience = admin_setting_experiences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_setting_experiences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_setting_experience" do
    assert_difference('Admin::Setting::Experience.count') do
      post :create, admin_setting_experience: { name: @admin_setting_experience.name }
    end

    assert_redirected_to admin_setting_experience_path(assigns(:admin_setting_experience))
  end

  test "should show admin_setting_experience" do
    get :show, id: @admin_setting_experience
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_setting_experience
    assert_response :success
  end

  test "should update admin_setting_experience" do
    patch :update, id: @admin_setting_experience, admin_setting_experience: { name: @admin_setting_experience.name }
    assert_redirected_to admin_setting_experience_path(assigns(:admin_setting_experience))
  end

  test "should destroy admin_setting_experience" do
    assert_difference('Admin::Setting::Experience.count', -1) do
      delete :destroy, id: @admin_setting_experience
    end

    assert_redirected_to admin_setting_experiences_path
  end
end
