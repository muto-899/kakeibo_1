require 'test_helper'

class MarDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mar_dates_index_url
    assert_response :success
  end

end
