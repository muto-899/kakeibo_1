require 'test_helper'

class DecDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dec_dates_index_url
    assert_response :success
  end

end
