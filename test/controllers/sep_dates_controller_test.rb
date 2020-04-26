require 'test_helper'

class SepDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sep_dates_index_url
    assert_response :success
  end

end
