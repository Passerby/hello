require 'test_helper'

class CaseCompaniesControllerTest < ActionController::TestCase
  setup do
    @case_company = case_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:case_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create case_company" do
    assert_difference('CaseCompany.count') do
      post :create, case_company: { active: @case_company.active, effect: @case_company.effect, img: @case_company.img, lang: @case_company.lang, name: @case_company.name, requirement: @case_company.requirement, usage: @case_company.usage }
    end

    assert_redirected_to case_company_path(assigns(:case_company))
  end

  test "should show case_company" do
    get :show, id: @case_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @case_company
    assert_response :success
  end

  test "should update case_company" do
    patch :update, id: @case_company, case_company: { active: @case_company.active, effect: @case_company.effect, img: @case_company.img, lang: @case_company.lang, name: @case_company.name, requirement: @case_company.requirement, usage: @case_company.usage }
    assert_redirected_to case_company_path(assigns(:case_company))
  end

  test "should destroy case_company" do
    assert_difference('CaseCompany.count', -1) do
      delete :destroy, id: @case_company
    end

    assert_redirected_to case_companies_path
  end
end
