class MessagesController < ApplicationController
  def new
    @user = current_user
    @message = Message.new
  end

  def index
    @user = current_user
  end

  def show
    @user = current_user
    @message = Message.find(params[:id])
  end

  def create
    @user = current_user
    @message = Message.new(message_params)
    @message[:user_id] = @user.id
    if @message.save
      redirect_to user_message_path(@user, @message)
    else
      render :new
    end
  end

private
  def message_params
    params.require(:message).permit(:to, :from, :body)
  end

end
