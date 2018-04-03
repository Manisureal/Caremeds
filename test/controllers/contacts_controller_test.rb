require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "GET new" do
    get new_contact_url

    assert_response :success

    assert_select 'form' do
      assert_select 'input[type=text]'
      assert_select 'input[type=email]'
      assert_select 'textarea'
      assert_select 'input[type=submit]'
    end
  end

  test "POST create" do
    post create_contact_url, params: {
      contact: {
        name: 'Mansoor',
        email: 'mansoor@caremeds.co.uk',
        body: 'Hello There!'
      }
    }

    assert_redirected_to new_contact_url

    follow_redirect!

    assert_match /Message received, thanks!/, response.body
  end

  test "invalid POST create" do
    post create_contact_url, params: {
      contact: {
        name: '',
        email: '',
        body: ''
      }
    }

    assert_match /Name .* blank/, response.body
    assert_match /Email .* blank/, response.body
    assert_match /Body .* blank/, response.body
  end
end
