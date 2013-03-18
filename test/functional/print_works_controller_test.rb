require 'test_helper'

class PrintWorksControllerTest < ActionController::TestCase
  setup do
    @print_work = FactoryGirl.build(:print_work)
    @user = FactoryGirl.build(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_works)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_work" do
    assert_difference('PrintWork.count') do
      post :create, print_work: { description: @print_work.description, file: @print_work.file, state: @print_work.state }
    end

    assert_redirected_to print_work_path(assigns(:print_work))
  end

  test "should show print_work" do
    get :show, id: @print_work
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @print_work
    assert_response :success
  end

  test "should update print_work" do
    put :update, id: @print_work, print_work: { description: @print_work.description, file: @print_work.file, state: @print_work.state }
    assert_redirected_to print_work_path(assigns(:print_work))
  end

  test "should destroy print_work" do
    assert_difference('PrintWork.count', -1) do
      delete :destroy, id: @print_work
    end

    assert_redirected_to print_works_path
  end
end
