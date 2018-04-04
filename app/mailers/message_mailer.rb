class MessageMailer < ApplicationMailer

#This should have been called UserMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact_me.subject
  #
  def contact_me(contact)
    # @greeting = "Hi"
    @body = contact.body
    @name = contact.name
    @email = contact.email

    mail to: "mansoor@caremeds.co.uk", from: "#{@email}", subject: "Message from #{@name}"
  end
end
