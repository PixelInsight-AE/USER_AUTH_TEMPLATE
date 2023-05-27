require "test_helper"

class TarotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tarot = tarots(:one)
  end

  test "should get index" do
    get tarots_url, as: :json
    assert_response :success
  end

  test "should create tarot" do
    assert_difference("Tarot.count") do
      post tarots_url, params: { tarot: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show tarot" do
    get tarot_url(@tarot), as: :json
    assert_response :success
  end

  test "should update tarot" do
    patch tarot_url(@tarot), params: { tarot: {  } }, as: :json
    assert_response :success
  end

  test "should destroy tarot" do
    assert_difference("Tarot.count", -1) do
      delete tarot_url(@tarot), as: :json
    end

    assert_response :no_content
  end
end
