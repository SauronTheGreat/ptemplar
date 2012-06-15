require 'test_helper'

class PfragmentsControllerTest < ActionController::TestCase
  setup do
    @pfragment = pfragments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pfragments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pfragment" do
    assert_difference('Pfragment.count') do
      post :create, pfragment: { ,markup: @pfragment.,markup, name: @pfragment.name }
    end

    assert_redirected_to pfragment_path(assigns(:pfragment))
  end

  test "should show pfragment" do
    get :show, id: @pfragment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pfragment
    assert_response :success
  end

  test "should update pfragment" do
    put :update, id: @pfragment, pfragment: { ,markup: @pfragment.,markup, name: @pfragment.name }
    assert_redirected_to pfragment_path(assigns(:pfragment))
  end

  test "should destroy pfragment" do
    assert_difference('Pfragment.count', -1) do
      delete :destroy, id: @pfragment
    end

    assert_redirected_to pfragments_path
  end
end
