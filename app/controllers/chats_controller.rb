class ChatsController < ApplicationController
  def index
    @chats = policy_scope(Chat)
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
    @other_user = @chat.owner == current_user ? @chat.vet : @chat.owner
    authorize @chat
  end
end
