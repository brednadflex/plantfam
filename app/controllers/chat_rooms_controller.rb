class ChatRoomsController < ApplicationController
  def show
    @chatroom = ChatRoom.find(params[:id])
    @message = Message.new
    chatroom = @chatroom
  end

  def index
    @chatrooms = ChatRoom.where(requester: current_user).or(ChatRoom.where(receiver: current_user))
  end

  def create
    receiver = User.find(params[:user_id])
    @existing_room = ChatRoom.where(requester: current_user, receiver: receiver).first
    if @existing_room
      redirect_to chat_room_path(@existing_room)
    else
      @chatroom = ChatRoom.new
      @chatroom.requester = current_user
      @chatroom.receiver = User.find(params[:user_id])
      @chatroom.save
      redirect_to chat_room_path(@chatroom)
    end
  end
end
