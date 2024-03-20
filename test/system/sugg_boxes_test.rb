require "application_system_test_case"

class SuggBoxesTest < ApplicationSystemTestCase
  setup do
    @sugg_box = sugg_boxes(:one)
  end

  test "visiting the index" do
    visit sugg_boxes_url
    assert_selector "h1", text: "Sugg boxes"
  end

  test "should create sugg box" do
    visit sugg_boxes_url
    click_on "New sugg box"

    click_on "Create Sugg box"

    assert_text "Sugg box was successfully created"
    click_on "Back"
  end

  test "should update Sugg box" do
    visit sugg_box_url(@sugg_box)
    click_on "Edit this sugg box", match: :first

    click_on "Update Sugg box"

    assert_text "Sugg box was successfully updated"
    click_on "Back"
  end

  test "should destroy Sugg box" do
    visit sugg_box_url(@sugg_box)
    click_on "Destroy this sugg box", match: :first

    assert_text "Sugg box was successfully destroyed"
  end
end
