require 'test_helper'

class HailwtfornotsControllerTest < ActionController::TestCase
  setup do
    @hailwtfornot = hailwtfornots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hailwtfornots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hailwtfornot" do
    assert_difference('Hailwtfornot.count') do
      post :create, hailwtfornot: @hailwtfornot.attributes
    end

    assert_redirected_to hailwtfornot_path(assigns(:hailwtfornot))
  end

  test "should show hailwtfornot" do
    get :show, id: @hailwtfornot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hailwtfornot
    assert_response :success
  end

  test "should update hailwtfornot" do
    put :update, id: @hailwtfornot, hailwtfornot: @hailwtfornot.attributes
    assert_redirected_to hailwtfornot_path(assigns(:hailwtfornot))
  end

  test "should destroy hailwtfornot" do
    assert_difference('Hailwtfornot.count', -1) do
      delete :destroy, id: @hailwtfornot
    end

    assert_redirected_to hailwtfornots_path
  end
end
