class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact_me.subject
  #
  def contact_me(contact)
    # @greeting = "Hi"
    @body = contact.body

    mail to: "mansoor@caremeds.co.uk", from: contact.email
  end
end
