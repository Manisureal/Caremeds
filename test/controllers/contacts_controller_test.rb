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
    # We are asserting that a successful post to the create_messages_url route should increase the size of the ActionMailer::Base.deliveries array by 1, indicating that an email was sent as a result of the action performed.
    assert_difference 'ActionMailer::Base.deliveries.size', 1 do
      # Create a new email with the following params
      post create_contact_url, params: {
        contact: {
          name: 'Mansoor',
          email: 'mansoor@caremeds.co.uk',
          body: 'just a test there hey'
        }
      }
    end
    # On successful submit render a new contact us form
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
