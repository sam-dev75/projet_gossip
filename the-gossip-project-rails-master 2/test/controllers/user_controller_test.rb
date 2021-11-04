require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get user_page_url
    assert_response :success
  end

end
