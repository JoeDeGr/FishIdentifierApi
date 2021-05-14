require "test_helper"

class GenusControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get genus_show_url
    assert_response :success
  end
end
