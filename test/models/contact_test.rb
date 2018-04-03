require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test 'responds to name, email and body' do
    contact = Contact.new

    assert contact.respond_to?(:name), 'does not respond to :name'
    assert contact.respond_to?(:email), 'does not respond to :email'
    assert contact.respond_to?(:body), 'does not respond to :body'
  end

  test 'should be valid when all attributes are set' do
    attrs = {
      name: 'Mansoor',
      email: 'mansoor@caremeds.co.uk',
      body: 'Hello there!'
    }

    contact = Contact.new attrs
    assert contact.valid? 'should be valid'
  end

  test 'name, email and body are required by law' do
    contact = Contact.new

    refute contact.valid?, 'Blank Message should be invalid'

    assert_match /blank/, contact.errors[:name].to_s
    assert_match /blank/, contact.errors[:email].to_s
    assert_match /blank/, contact.errors[:body].to_s
  end
end
