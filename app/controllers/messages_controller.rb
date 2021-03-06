class MessagesController < ApplicationController
  def create
    @chatroom = ChatRoom.find(params[:chat_room_id])
    @message = Message.new(message_params)
    @message.chat_room = @chatroom
    @message.user = current_user

    if @message.save
      # Send message Notification
      CommentNotification.with({ message: @message }).deliver(@chatroom.penpal_of(current_user))
      # Broadcast Message
      ChatRoomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to chat_room_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render 'chat_rooms/show'
    end

  end

  def message_params
    params.require(:message).permit(:content)
  end
end

# Legacy comments:  ... ???
 # t.bigint "user_id", null: false
 #    t.bigint "chat_room_id", null: false
