require 'test_helper'

class FaildataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @faildatum = faildata(:one)
  end

  test "should get index" do
    get faildata_url
    assert_response :success
  end

  test "should get new" do
    get new_faildatum_url
    assert_response :success
  end

  test "should create faildatum" do
    assert_difference('Faildatum.count') do
      post faildata_url, params: { faildatum: { postcode: @faildatum.postcode, row_id: @faildatum.row_id } }
    end

    assert_redirected_to faildatum_url(Faildatum.last)
  end

  test "should show faildatum" do
    get faildatum_url(@faildatum)
    assert_response :success
  end

  test "should get edit" do
    get edit_faildatum_url(@faildatum)
    assert_response :success
  end

  test "should update faildatum" do
    patch faildatum_url(@faildatum), params: { faildatum: { postcode: @faildatum.postcode, row_id: @faildatum.row_id } }
    assert_redirected_to faildatum_url(@faildatum)
  end

  test "should destroy faildatum" do
    assert_difference('Faildatum.count', -1) do
      delete faildatum_url(@faildatum)
    end

    assert_redirected_to faildata_url
  end
end
