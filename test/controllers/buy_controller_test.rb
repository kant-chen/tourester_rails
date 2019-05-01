require 'test_helper'

class BuyControllerTest < ActionDispatch::IntegrationTest
  test "should get submit" do
    get buy_submit_url
    assert_response :success
  end

  test "should get index" do
    get buy_index_url
    assert_response :success
  end

end
