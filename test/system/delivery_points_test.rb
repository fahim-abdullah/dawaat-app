require "application_system_test_case"

class DeliveryPointsTest < ApplicationSystemTestCase
  setup do
    @delivery_point = delivery_points(:one)
  end

  test "visiting the index" do
    visit delivery_points_url
    assert_selector "h1", text: "Delivery Points"
  end

  test "creating a Delivery point" do
    visit delivery_points_url
    click_on "New Delivery Point"

    fill_in "Name", with: @delivery_point.name
    click_on "Create Delivery point"

    assert_text "Delivery point was successfully created"
    click_on "Back"
  end

  test "updating a Delivery point" do
    visit delivery_points_url
    click_on "Edit", match: :first

    fill_in "Name", with: @delivery_point.name
    click_on "Update Delivery point"

    assert_text "Delivery point was successfully updated"
    click_on "Back"
  end

  test "destroying a Delivery point" do
    visit delivery_points_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Delivery point was successfully destroyed"
  end
end
