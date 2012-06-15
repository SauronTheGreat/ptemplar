require 'test_helper'

class PbehaviorsControllerTest < ActionController::TestCase
  setup do
    @pbehavior = pbehaviors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pbehaviors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pbehavior" do
    assert_difference('Pbehavior.count') do
      post :create, pbehavior: { delay: @pbehavior.delay, pcontent_id: @pbehavior.pcontent_id, pevent_id: @pbehavior.pevent_id, pfragment_id: @pbehavior.pfragment_id, prev_pcontent_id: @pbehavior.prev_pcontent_id }
    end

    assert_redirected_to pbehavior_path(assigns(:pbehavior))
  end

  test "should show pbehavior" do
    get :show, id: @pbehavior
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pbehavior
    assert_response :success
  end

  test "should update pbehavior" do
    put :update, id: @pbehavior, pbehavior: { delay: @pbehavior.delay, pcontent_id: @pbehavior.pcontent_id, pevent_id: @pbehavior.pevent_id, pfragment_id: @pbehavior.pfragment_id, prev_pcontent_id: @pbehavior.prev_pcontent_id }
    assert_redirected_to pbehavior_path(assigns(:pbehavior))
  end

  test "should destroy pbehavior" do
    assert_difference('Pbehavior.count', -1) do
      delete :destroy, id: @pbehavior
    end

    assert_redirected_to pbehaviors_path
  end
end
