require "application_system_test_case"

class ScreeningsTest < ApplicationSystemTestCase
  setup do
    @screening = screenings(:one)
  end

  test "visiting the index" do
    visit screenings_url
    assert_selector "h1", text: "Screenings"
  end

  test "should create screening" do
    visit screenings_url
    click_on "New screening"

    fill_in "Description", with: @screening.description
    fill_in "End time", with: @screening.end_time
    fill_in "Start time", with: @screening.start_time
    fill_in "Title", with: @screening.title
    click_on "Create Screening"

    assert_text "Screening was successfully created"
    click_on "Back"
  end

  test "should update Screening" do
    visit screening_url(@screening)
    click_on "Edit this screening", match: :first

    fill_in "Description", with: @screening.description
    fill_in "End time", with: @screening.end_time
    fill_in "Start time", with: @screening.start_time
    fill_in "Title", with: @screening.title
    click_on "Update Screening"

    assert_text "Screening was successfully updated"
    click_on "Back"
  end

  test "should destroy Screening" do
    visit screening_url(@screening)
    click_on "Destroy this screening", match: :first

    assert_text "Screening was successfully destroyed"
  end
end
