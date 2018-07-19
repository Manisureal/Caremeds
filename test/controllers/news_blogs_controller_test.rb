require 'test_helper'

class NewsBlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get news_blogs_index_url
    assert_response :success
  end

  test "should get new" do
    get news_blogs_new_url
    assert_response :success
  end

  test "should get create" do
    get news_blogs_create_url
    assert_response :success
  end

  test "should get show" do
    get news_blogs_show_url
    assert_response :success
  end

  test "should get edit" do
    get news_blogs_edit_url
    assert_response :success
  end

  test "should get update" do
    get news_blogs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get news_blogs_destroy_url
    assert_response :success
  end

end
