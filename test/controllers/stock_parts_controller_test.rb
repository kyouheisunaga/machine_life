require 'test_helper'

class StockPartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stock_parts_index_url
    assert_response :success
  end

  test "should get show" do
    get stock_parts_show_url
    assert_response :success
  end

  test "should get new" do
    get stock_parts_new_url
    assert_response :success
  end

  test "should get edit" do
    get stock_parts_edit_url
    assert_response :success
  end

end
