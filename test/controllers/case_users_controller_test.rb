require 'test_helper'

class CaseUsersControllerTest < ActionController::TestCase
  setup do
    @case_user = case_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:case_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create case_user" do
    assert_difference('CaseUser.count') do
      post :create, case_user: { active: @case_user.active, company: @case_user.company, content: @case_user.content, img: @case_user.img, lang: @case_user.lang, name: @case_user.name, title: @case_user.title }
    end

    assert_redirected_to case_user_path(assigns(:case_user))
  end

  test "should show case_user" do
    get :show, id: @case_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @case_user
    assert_response :success
  end

  test "should update case_user" do
    patch :update, id: @case_user, case_user: { active: @case_user.active, company: @case_user.company, content: @case_user.content, img: @case_user.img, lang: @case_user.lang, name: @case_user.name, title: @case_user.title }
    assert_redirected_to case_user_path(assigns(:case_user))
  end

  test "should destroy case_user" do
    assert_difference('CaseUser.count', -1) do
      delete :destroy, id: @case_user
    end

    assert_redirected_to case_users_path
  end
end
