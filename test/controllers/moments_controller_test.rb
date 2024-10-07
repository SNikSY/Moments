require "test_helper"

class MomentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get moments_index_url
    assert_response :success
  end
end
