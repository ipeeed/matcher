require 'test_helper'

class TransporterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get transporter_index_url
    assert_response :success
  end

  test "should get show" do
    get transporter_show_url
    assert_response :success
  end

  test "should get new" do
    get transporter_new_url
    assert_response :success
  end

  test "should get create" do
    get transporter_create_url
    assert_response :success
  end

  test "should get edit" do
    get transporter_edit_url
    assert_response :success
  end

  test "should get update" do
    get transporter_update_url
    assert_response :success
  end

  test "should get destroy" do
    get transporter_destroy_url
    assert_response :success
  end

end
