require 'test_helper'

class AugDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aug_dates_index_url
    assert_response :success
  end

end
