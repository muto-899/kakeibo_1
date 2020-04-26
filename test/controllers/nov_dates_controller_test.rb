require 'test_helper'

class NovDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nov_dates_index_url
    assert_response :success
  end

end
