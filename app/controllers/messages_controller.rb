class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = Message.new(message_params)
    @message.chat = @chat
    @message.user = current_user

    if @message.save
      ChatChannel.broadcast_to(
        @chat,
        message: render_to_string(partial: "chats/message", locals: { message: @message, chat: @chat }),
        sender_id: @message.user.id
      )
      head :ok
    else
      render "chats/show", status: :unprocessable_entity
    end

    # ChatroomChannel.broadcast_to(
    #   @chatroom,
    #   message: render_to_string(partial: "message", locals: { message: @message }),
    #   sender_id: @message.user.id
    # )

    authorize @message
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
