require "test_helper"

class SuggBoxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sugg_box = sugg_boxes(:one)
  end

  test "should get index" do
    get sugg_boxes_url
    assert_response :success
  end

  test "should get new" do
    get new_sugg_box_url
    assert_response :success
  end

  test "should create sugg_box" do
    assert_difference("SuggBox.count") do
      post sugg_boxes_url, params: { sugg_box: {  } }
    end

    assert_redirected_to sugg_box_url(SuggBox.last)
  end

  test "should show sugg_box" do
    get sugg_box_url(@sugg_box)
    assert_response :success
  end

  test "should get edit" do
    get edit_sugg_box_url(@sugg_box)
    assert_response :success
  end

  test "should update sugg_box" do
    patch sugg_box_url(@sugg_box), params: { sugg_box: {  } }
    assert_redirected_to sugg_box_url(@sugg_box)
  end

  test "should destroy sugg_box" do
    assert_difference("SuggBox.count", -1) do
      delete sugg_box_url(@sugg_box)
    end

    assert_redirected_to sugg_boxes_url
  end
end
