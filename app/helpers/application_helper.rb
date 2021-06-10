module ApplicationHelper
  def chatroom_finder(user1, user2)
    requester1 = User.find(user1.id)
    receiver1 = User.find(user2.id)
    chatroom1 = ChatRoom.where(requester: requester1, receiver: receiver1).take

    requester2 = User.find(user2.id)
    receiver2 = User.find(user1.id)
    chatroom2 = ChatRoom.where(requester: requester2, receiver: receiver2).take

    if chatroom1.nil? && chatroom2.nil?
      chatroom = ChatRoom.create(requester: requester1, receiver: requester2)
      flash.delete(:notice)
    elsif chatroom1.nil?
      chatroom = chatroom2
    elsif chatroom2.nil?
      chatroom = chatroom1
    end

    flash.delete(:notice)
    return chatroom
  end
end
