require 'test_helper'

class PostcodedataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @postcodedatum = postcodedata(:one)
  end

  test "should get index" do
    get postcodedata_url
    assert_response :success
  end

  test "should get new" do
    get new_postcodedatum_url
    assert_response :success
  end

  test "should create postcodedatum" do
    assert_difference('Postcodedatum.count') do
      post postcodedata_url, params: { postcodedatum: { postcode: @postcodedatum.postcode, row_id: @postcodedatum.row_id } }
    end

    assert_redirected_to postcodedatum_url(Postcodedatum.last)
  end

  test "should show postcodedatum" do
    get postcodedatum_url(@postcodedatum)
    assert_response :success
  end

  test "should get edit" do
    get edit_postcodedatum_url(@postcodedatum)
    assert_response :success
  end

  test "should update postcodedatum" do
    patch postcodedatum_url(@postcodedatum), params: { postcodedatum: { postcode: @postcodedatum.postcode, row_id: @postcodedatum.row_id } }
    assert_redirected_to postcodedatum_url(@postcodedatum)
  end

  test "should destroy postcodedatum" do
    assert_difference('Postcodedatum.count', -1) do
      delete postcodedatum_url(@postcodedatum)
    end

    assert_redirected_to postcodedata_url
  end
end
