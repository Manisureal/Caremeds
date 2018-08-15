class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    # @arr_with_hash = []
    # arr = []
    # contact_email_hash = {}
    # arr.each_with_index {|value, index| contact_email_hash[index] = value}
    @api_client = OnePageCRM.new(ENV['ONEPAGE_USER_EMAIL'], ENV['ONEPAGE_USER_PASS'])
    # @api_client = OnePageCRM.new('andy@caremeds.co.uk', 'C4r3m3d5')
    @contact = Contact.new(contact_params)
    if @contact.valid?
      # arr << @contact.email
      # arr.each_with_index {|value, index| contact_email_hash[index.to_s] = value}
      # @arr_with_hash << contact_email_hash
      # @api_client.post('contacts.json', {'last_name': @contact.name, 'emails': @arr_with_hash, 'background': @contact.body} )
      @api_client.post('contacts.json', {'last_name': @contact.name, 'emails': [{ 'type' => 'work', 'value' => @contact.email}], 'background': @contact.body} )
      redirect_to request.referrer, notice: "Thank you, We will be in touch shortly!"
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end
end

#------ old create method -------#
# @contact = Contact.new(contact_params)
    # # break
    # if @contact.valid?

    #   MessageMailer.contact_me(@contact).deliver_now
    #   # render :new, notice: "Message received, Thanks!"
    #   redirect_to request.referrer, notice: "Thank you, We will be in touch shortly!"
    # else
    #   render :new
    # end
    # @api_client = OnePageCRM.new('andy@caremeds.co.uk','C4r3m3d5')
