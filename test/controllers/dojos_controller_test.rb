require 'test_helper'

class DojosControllerTest < ActionController::TestCase
  setup do
    @dojo = dojos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dojos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dojo" do
    assert_difference('Dojo.count') do
      post :create, dojo: { name: @dojo.name }
    end

    assert_redirected_to dojo_path(assigns(:dojo))
  end

  test "should show dojo" do
    get :show, id: @dojo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dojo
    assert_response :success
  end

  test "should update dojo" do
    patch :update, id: @dojo, dojo: { name: @dojo.name }
    assert_redirected_to dojo_path(assigns(:dojo))
  end

  test "should destroy dojo" do
    assert_difference('Dojo.count', -1) do
      delete :destroy, id: @dojo
    end

    assert_redirected_to dojos_path
  end
end
