class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    #--- Send through SMTP ---#
    # @contact = Contact.new(contact_params)
    # if @contact.valid?
    #   MessageMailer.contact_me(@contact).deliver_now
    #   redirect_to request.referrer, notice: "Thank you, We will be in touch shortly!"
    # else
    #   render :new
    # end

    #--- Send through API ---#
    # @arr_with_hash = []
    # arr = []
    # contact_email_hash = {}
    # arr.each_with_index {|value, index| contact_email_hash[index] = value}
    @api_client = OnePageCRM.new(ENV['ONEPAGE_USER_EMAIL'], ENV['ONEPAGE_USER_PASS'])
    @contact = Contact.new(contact_params)
    if @contact.valid? && verify_recaptcha(model: @contact)
      # arr << @contact.email
      # arr.each_with_index {|value, index| contact_email_hash[index.to_s] = value}
      # @arr_with_hash << contact_email_hash
      # @api_client.post('contacts.json', {'last_name': @contact.name, 'emails': @arr_with_hash, 'background': @contact.body} )
      @new_contact = @api_client.post('contacts.json', {'first_name': @contact.first_name,
                                                        'last_name': @contact.last_name,
                                                        'company_name': @contact.organization,
                                                        'emails': [{ 'type' => 'work', 'value' => @contact.email}],
                                                        'phones': [{ 'type' => 'other', 'value' => @contact.phone}],
                                                        'background': @contact.body} )
      @contact_id = @new_contact["data"]["contact"]["id"]
      @new_action = @api_client.post('actions.json',
                      "assignee_id": "","contact_id": @contact_id,"date": "","done": false,"id": "","modified_at": "","status": "date","text": "New Lead created through the CAREMEDS Website!" )
      redirect_to request.referrer, notice: "Thank you, We will be in touch shortly!"
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone, :email, :body, :organization)
  end
end

