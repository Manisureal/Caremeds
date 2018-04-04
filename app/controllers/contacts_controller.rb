class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create

    @contact = Contact.new(contact_params)
    # break
    if @contact.valid?

      MessageMailer.contact_me(@contact).deliver_now
      redirect_to new_contact_url, notice: "Message received, Thanks!"
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end
end

