require 'test_helper'

class DeliveryPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery_point = delivery_points(:one)
  end

  test "should get index" do
    get delivery_points_url
    assert_response :success
  end

  test "should get new" do
    get new_delivery_point_url
    assert_response :success
  end

  test "should create delivery_point" do
    assert_difference('DeliveryPoint.count') do
      post delivery_points_url, params: { delivery_point: { name: @delivery_point.name } }
    end

    assert_redirected_to delivery_point_url(DeliveryPoint.last)
  end

  test "should show delivery_point" do
    get delivery_point_url(@delivery_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_delivery_point_url(@delivery_point)
    assert_response :success
  end

  test "should update delivery_point" do
    patch delivery_point_url(@delivery_point), params: { delivery_point: { name: @delivery_point.name } }
    assert_redirected_to delivery_point_url(@delivery_point)
  end

  test "should destroy delivery_point" do
    assert_difference('DeliveryPoint.count', -1) do
      delete delivery_point_url(@delivery_point)
    end

    assert_redirected_to delivery_points_url
  end
end
