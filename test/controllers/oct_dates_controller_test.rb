require 'test_helper'

class OctDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get oct_dates_index_url
    assert_response :success
  end

end
