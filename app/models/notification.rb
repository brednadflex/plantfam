class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  def chat_room
    return params[:message][:chat_room]
  end

  def message
    return params[:message]
  end
end
