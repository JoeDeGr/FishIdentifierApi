require "test_helper"

class SpeciesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get species_show_url
    assert_response :success
  end
end
