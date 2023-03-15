class ChatsController < ApplicationController
  def index
    @chats = policy_scope(Chat)
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
    authorize @chat
  end
end
