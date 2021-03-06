require 'test_helper'

class MachinePartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get machine_parts_index_url
    assert_response :success
  end

  test "should get show" do
    get machine_parts_show_url
    assert_response :success
  end

  test "should get new" do
    get machine_parts_new_url
    assert_response :success
  end

  test "should get edit" do
    get machine_parts_edit_url
    assert_response :success
  end

end
