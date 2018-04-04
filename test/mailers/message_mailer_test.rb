require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  # test "contact_me" do
  #   mail = MessageMailer.contact_me
  #   assert_equal "Contact me", mail.subject
  #   assert_equal ["to@example.org"], mail.to
  #   assert_equal ["from@example.com"], mail.from
  #   assert_match "Hi", mail.body.encoded
  # end

  test "contact_me" do
    contact = Contact.new({ name: 'Manny',
                          email: 'mannie@caremeds.co.uk',
                          body: 'Hello there just testing this mailer...'
                          })


    email = MessageMailer.contact_me(contact)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal 'Message from www.murdo.ch', email.subject
    assert_equal ['mansoor@caremeds.co.uk'], email.to
    assert_equal ['mannie@caremeds.co.uk'], email.from
    assert_match /Hello there just testing this mailer.../, email.body.encoded
  end
end
