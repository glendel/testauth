require 'test_helper'

class UserFormsControllerTest < ActionController::TestCase
  setup do
    @user_form = user_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_form" do
    assert_difference('UserForm.count') do
      post :create, user_form: { birthday: @user_form.birthday, city: @user_form.city, country: @user_form.country, fname: @user_form.fname, gender: @user_form.gender, lname: @user_form.lname, state: @user_form.state }
    end

    assert_redirected_to user_form_path(assigns(:user_form))
  end

  test "should show user_form" do
    get :show, id: @user_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_form
    assert_response :success
  end

  test "should update user_form" do
    put :update, id: @user_form, user_form: { birthday: @user_form.birthday, city: @user_form.city, country: @user_form.country, fname: @user_form.fname, gender: @user_form.gender, lname: @user_form.lname, state: @user_form.state }
    assert_redirected_to user_form_path(assigns(:user_form))
  end

  test "should destroy user_form" do
    assert_difference('UserForm.count', -1) do
      delete :destroy, id: @user_form
    end

    assert_redirected_to user_forms_path
  end
end
