require 'test_helper'

class AprDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get apr_dates_index_url
    assert_response :success
  end

end
