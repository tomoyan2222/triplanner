require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get works_home_url
    assert_response :success
  end

end
