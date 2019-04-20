require 'test_helper'

class ItemListControllerTest < ActionDispatch::IntegrationTest
  test "should get items" do
    get item_list_items_url
    assert_response :success
  end

end
