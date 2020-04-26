require 'test_helper'

class MayDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get may_dates_index_url
    assert_response :success
  end

end
