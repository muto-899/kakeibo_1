require 'test_helper'

class JunDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jun_dates_index_url
    assert_response :success
  end

end
