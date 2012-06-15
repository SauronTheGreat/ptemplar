require 'test_helper'

class PwidgetsControllerTest < ActionController::TestCase
  setup do
    @pwidget = pwidgets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pwidgets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pwidget" do
    assert_difference('Pwidget.count') do
      post :create, pwidget: { builder: @pwidget.builder, name: @pwidget.name }
    end

    assert_redirected_to pwidget_path(assigns(:pwidget))
  end

  test "should show pwidget" do
    get :show, id: @pwidget
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pwidget
    assert_response :success
  end

  test "should update pwidget" do
    put :update, id: @pwidget, pwidget: { builder: @pwidget.builder, name: @pwidget.name }
    assert_redirected_to pwidget_path(assigns(:pwidget))
  end

  test "should destroy pwidget" do
    assert_difference('Pwidget.count', -1) do
      delete :destroy, id: @pwidget
    end

    assert_redirected_to pwidgets_path
  end
end
