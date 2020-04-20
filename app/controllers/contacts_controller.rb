class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to new_contact_path, notice: 'Thanks! We got your message!'
    else
      flash[:error] = "Sorry! We couldn't send your message at this time.
                      #{@contact.errors.full_messages.join(',')}"
      redirect_to new_contact_path
    end
  end
end
  