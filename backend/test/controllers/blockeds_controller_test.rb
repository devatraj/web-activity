require "test_helper"

class BlockedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blocked = blockeds(:one)
  end

  test "should get index" do
    get blockeds_url, as: :json
    assert_response :success
  end

  test "should create blocked" do
    assert_difference("Blocked.count") do
      post blockeds_url, params: { blocked: { completed: @blocked.completed, name: @blocked.name } }, as: :json
    end

    assert_response :created
  end

  test "should show blocked" do
    get blocked_url(@blocked), as: :json
    assert_response :success
  end

  test "should update blocked" do
    patch blocked_url(@blocked), params: { blocked: { completed: @blocked.completed, name: @blocked.name } }, as: :json
    assert_response :success
  end

  test "should destroy blocked" do
    assert_difference("Blocked.count", -1) do
      delete blocked_url(@blocked), as: :json
    end

    assert_response :no_content
  end
end
