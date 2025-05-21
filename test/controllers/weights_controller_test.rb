require "test_helper"

class WeightsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get weights_create_url
    assert_response :success
  end
end
