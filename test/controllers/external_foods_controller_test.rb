require 'test_helper'

class ExternalFoodsControllerTest < ActionController::TestCase
  setup do
    @external_food = external_foods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:external_foods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create external_food" do
    assert_difference('ExternalFood.count') do
      post :create, external_food: { date: @external_food.date, quantity: @external_food.quantity }
    end

    assert_redirected_to external_food_path(assigns(:external_food))
  end

  test "should show external_food" do
    get :show, id: @external_food
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @external_food
    assert_response :success
  end

  test "should update external_food" do
    patch :update, id: @external_food, external_food: { date: @external_food.date, quantity: @external_food.quantity }
    assert_redirected_to external_food_path(assigns(:external_food))
  end

  test "should destroy external_food" do
    assert_difference('ExternalFood.count', -1) do
      delete :destroy, id: @external_food
    end

    assert_redirected_to external_foods_path
  end
end
