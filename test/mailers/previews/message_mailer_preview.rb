# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/contact_me
  def contact_me
    contact = Contact.new({
      name: "Mart",
      email: "mart@example.org",
      body: "This is just a test email from Mart"
      })
    MessageMailer.contact_me(contact)
  end

end
