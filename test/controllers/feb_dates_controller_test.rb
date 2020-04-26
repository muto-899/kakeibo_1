require 'test_helper'

class FebDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feb_dates_index_url
    assert_response :success
  end

end
