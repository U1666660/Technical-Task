require 'test_helper'

class PostcodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @postcode = postcodes(:one)
  end

  test "should get index" do
    get postcodes_url
    assert_response :success
  end

  test "should get new" do
    get new_postcode_url
    assert_response :success
  end

  test "should create postcode" do
    assert_difference('Postcode.count') do
      post postcodes_url, params: { postcode: { postcode: @postcode.postcode } }
    end

    assert_redirected_to postcode_url(Postcode.last)
  end

  test "should show postcode" do
    get postcode_url(@postcode)
    assert_response :success
  end

  test "should get edit" do
    get edit_postcode_url(@postcode)
    assert_response :success
  end

  test "should update postcode" do
    patch postcode_url(@postcode), params: { postcode: { postcode: @postcode.postcode } }
    assert_redirected_to postcode_url(@postcode)
  end

  test "should destroy postcode" do
    assert_difference('Postcode.count', -1) do
      delete postcode_url(@postcode)
    end

    assert_redirected_to postcodes_url
  end
end
