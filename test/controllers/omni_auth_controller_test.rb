require 'test_helper'

class OmniAuthControllerTest < ActionDispatch::IntegrationTest
  test "should get facebook" do
    get omni_auth_facebook_url
    assert_response :success
  end

end
