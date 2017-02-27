class ContactsController < ApplicationController
  def index
    @contacts = current_user.contacts
  end
  def new
    @users = User.all
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(contact_params)
    @contact[:user_id] = current_user.id
    if @contact.save
      redirect_to user_contacts_path(current_user)
    else
      render :new
    end
  end

  def show
    @contact = Contact.find(params[:id])
    @message = Message.new
  end
private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number)
  end
end
