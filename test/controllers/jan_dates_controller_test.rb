require 'test_helper'

class JanDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jan_dates_index_url
    assert_response :success
  end

end
