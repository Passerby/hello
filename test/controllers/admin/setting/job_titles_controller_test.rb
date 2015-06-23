require 'test_helper'

class Admin::Setting::JobTitlesControllerTest < ActionController::TestCase
  setup do
    @admin_setting_job_title = admin_setting_job_titles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_setting_job_titles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_setting_job_title" do
    assert_difference('Admin::Setting::JobTitle.count') do
      post :create, admin_setting_job_title: { name: @admin_setting_job_title.name }
    end

    assert_redirected_to admin_setting_job_title_path(assigns(:admin_setting_job_title))
  end

  test "should show admin_setting_job_title" do
    get :show, id: @admin_setting_job_title
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_setting_job_title
    assert_response :success
  end

  test "should update admin_setting_job_title" do
    patch :update, id: @admin_setting_job_title, admin_setting_job_title: { name: @admin_setting_job_title.name }
    assert_redirected_to admin_setting_job_title_path(assigns(:admin_setting_job_title))
  end

  test "should destroy admin_setting_job_title" do
    assert_difference('Admin::Setting::JobTitle.count', -1) do
      delete :destroy, id: @admin_setting_job_title
    end

    assert_redirected_to admin_setting_job_titles_path
  end
end
