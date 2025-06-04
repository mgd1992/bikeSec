require "application_system_test_case"

class BikeServicesTest < ApplicationSystemTestCase
  setup do
    @bike_service = bike_services(:one)
  end

  test "visiting the index" do
    visit bike_services_url
    assert_selector "h1", text: "Bike services"
  end

  test "should create bike service" do
    visit bike_services_url
    click_on "New bike service"

    fill_in "Cost", with: @bike_service.cost
    fill_in "Date", with: @bike_service.date
    fill_in "Descripcion", with: @bike_service.descripcion
    fill_in "User", with: @bike_service.user_id
    click_on "Create Bike service"

    assert_text "Bike service was successfully created"
    click_on "Back"
  end

  test "should update Bike service" do
    visit bike_service_url(@bike_service)
    click_on "Edit this bike service", match: :first

    fill_in "Cost", with: @bike_service.cost
    fill_in "Date", with: @bike_service.date
    fill_in "Descripcion", with: @bike_service.descripcion
    fill_in "User", with: @bike_service.user_id
    click_on "Update Bike service"

    assert_text "Bike service was successfully updated"
    click_on "Back"
  end

  test "should destroy Bike service" do
    visit bike_service_url(@bike_service)
    click_on "Destroy this bike service", match: :first

    assert_text "Bike service was successfully destroyed"
  end
end
