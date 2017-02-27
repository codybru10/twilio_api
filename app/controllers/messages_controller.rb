class MessagesController < ApplicationController
  def new
    @user = current_user
    @message = Message.new
  end

  def index
    @contact = Contact.find(params[:contact_id])
    @user = current_user
  end

  def show
    @user = current_user
    @message = Message.find(params[:id])
  end

  def create
    @user = current_user
    @contact = Contact.find(params[:contact_id])
    @message = @contact.messages.new(message_params)
    @message[:user_id] = @user.id
    if @message.save
      redirect_to user_contact_path(@user, @contact)
    else
      render :new
    end
  end

private
  def message_params
    params.require(:message).permit(:to, :from, :body)
  end

end
