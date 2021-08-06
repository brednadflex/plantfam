class ChatRoomsController < ApplicationController

  def show
    @chatroom = ChatRoom.find(params[:id])
    @message = Message.new
    # Update number of notifications to be displayed in the navbar

    @notifications.each do |notification|
      notification.delete if notification.params[:message].chat_room == @chatroom
    end

    @notifications = Notification.where(recipient: current_user)
  end

  def index
    # if statement to determine whether or not something was searched
    if params[:query].present?
      # return chatrooms that I am a part of
      my_chatrooms = ChatRoom.where(requester: current_user).or(ChatRoom.where(receiver: current_user))
      # results of pg search through 3 different models (Profile, ChatRoom, Message)
      results = PgSearch.multisearch("%#{params[:query]}%")
      # defining an empty hash into which matching chatrooms shall be inserted
      @chatrooms = []

      # iterate over results and chatroom to find the chatroom(s) that match the results
      results.each do |result|
        my_chatrooms.each do |chatroom|
          if result.searchable_type == "Profile"
            if result.content.first(3) == chatroom.requester.first_name.first(3) || result.content.first(3) == chatroom.receiver.first_name.first(3)
            @chatrooms << chatroom
            end
          elsif result.searchable_type == "Message"
            chatroom.messages.each do |message|
              if message.content.include?("#{result.content}")
                @chatrooms << chatroom
              end
            end
          end
        end
      end
      @chatrooms
    else
      @chatrooms = ChatRoom.where(requester: current_user).or(ChatRoom.where(receiver: current_user))
    end

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
