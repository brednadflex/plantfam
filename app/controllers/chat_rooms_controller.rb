class ChatRoomsController < ApplicationController
  def show
    @chatroom = ChatRoom.find(params[:id])
    @message = Message.new
    chatroom = @chatroom
  end

  def index
    @chatrooms = ChatRoom.where(requester: current_user).or(ChatRoom.where(receiver: current_user))
  end
end
