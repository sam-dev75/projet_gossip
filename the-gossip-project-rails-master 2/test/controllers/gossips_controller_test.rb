require 'test_helper'

class GossipsControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get gossips_page_url
    assert_response :success
  end

end
