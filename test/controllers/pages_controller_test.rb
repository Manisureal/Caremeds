require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  def title
    @new_title = "CareMeds"
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get home" do
    get pages_home_url
    assert_response :success
    assert_select "title", @new_title
  end

  test "should get pharmacy" do
    get pages_pharmacy_url
    assert_response :success
    assert_select "title"
  end

  test "should get careproviders" do
    get pages_careproviders_url
    assert_response :success
    assert_select "title", @new_title
  end

  test "should get emar" do
    get pages_emar_url
    assert_response :success
    assert_select "title", @new_title
  end

  test "should get faqs" do
    get pages_faqs_url
    assert_response :success
    assert_select "title", @new_title
  end

  test "should get news" do
    get pages_news_url
    assert_response :success
    assert_select "title", @new_title
  end

  test "should get contactus" do
    get pages_contactus_url
    assert_response :success
    assert_select "title", @new_title
  end

  test "should get updates" do
    get pages_updates_url
    assert_response :success
    assert_select "title", @new_title
  end

end
