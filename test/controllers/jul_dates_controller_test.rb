require 'test_helper'

class JulDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jul_dates_index_url
    assert_response :success
  end

end
