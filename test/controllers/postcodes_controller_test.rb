require 'test_helper'

class PostcodesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postcode_index_url
    assert_response :success
  end

end
