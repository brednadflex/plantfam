# To deliver this notification:
#
# CommentNotification.with(message: @message).deliver_later(current_user)
# CommentNotification.with(message: @message).deliver(current_user)
# CommentNotification.with(message: @message).deliver(User.all)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :action_cable
  # deliver_by :action_cable, format: :to_action_cable
  deliver_by :database, format: :to_database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Example for format for database
  def to_database
    {
      type: self.class.name,
      params: params
    }
  end

  # Format for Action Cable
  # def to_action_cable
  #   # Hash
  # end

  # Add required params
  #
  param :message

  # Define helper methods to make rendering easier.

  def message
    # en.notifications.comment_notifications.message
    t(".message")
  end

  def url
    root_path
    # chat_room = params[:message]
    # post_path(params[:message])
  end
end
