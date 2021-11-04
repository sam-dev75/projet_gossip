require 'test_helper'

class GossipControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get gossip_page_url
    assert_response :success
  end

end
