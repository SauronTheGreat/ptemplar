require 'test_helper'

class PeventsControllerTest < ActionController::TestCase
  setup do
    @pevent = pevents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pevents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pevent" do
    assert_difference('Pevent.count') do
      post :create, pevent: { name: @pevent.name }
    end

    assert_redirected_to pevent_path(assigns(:pevent))
  end

  test "should show pevent" do
    get :show, id: @pevent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pevent
    assert_response :success
  end

  test "should update pevent" do
    put :update, id: @pevent, pevent: { name: @pevent.name }
    assert_redirected_to pevent_path(assigns(:pevent))
  end

  test "should destroy pevent" do
    assert_difference('Pevent.count', -1) do
      delete :destroy, id: @pevent
    end

    assert_redirected_to pevents_path
  end
end
