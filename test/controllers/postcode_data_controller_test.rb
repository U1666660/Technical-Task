require 'test_helper'

class PostcodeDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @postcode_datum = postcode_data(:one)
  end

  test "should get index" do
    get postcode_data_url
    assert_response :success
  end

  test "should get new" do
    get new_postcode_datum_url
    assert_response :success
  end

  test "should create postcode_datum" do
    assert_difference('PostcodeDatum.count') do
      post postcode_data_url, params: { postcode_datum: { postcode: @postcode_datum.postcode, row_id: @postcode_datum.row_id } }
    end

    assert_redirected_to postcode_datum_url(PostcodeDatum.last)
  end

  test "should show postcode_datum" do
    get postcode_datum_url(@postcode_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_postcode_datum_url(@postcode_datum)
    assert_response :success
  end

  test "should update postcode_datum" do
    patch postcode_datum_url(@postcode_datum), params: { postcode_datum: { postcode: @postcode_datum.postcode, row_id: @postcode_datum.row_id } }
    assert_redirected_to postcode_datum_url(@postcode_datum)
  end

  test "should destroy postcode_datum" do
    assert_difference('PostcodeDatum.count', -1) do
      delete postcode_datum_url(@postcode_datum)
    end

    assert_redirected_to postcode_data_url
  end
end
