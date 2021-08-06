class ChatRoom < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:requester, :receiver]

  belongs_to :booking, optional: true
  belongs_to :requester, class_name: "User"
  belongs_to :receiver, class_name: "User"

  has_many :messages, dependent: :destroy

  def notifications?
    !receiver.notifications.select { |notification| messages.include?(notification.message) }.empty?
  end

  def number_of_notifications
    receiver.notifications.count do |notification|
      messages.include?(notification.message)
    end
  end

  def penpal_of(user)
    user == requester ? receiver : requester
  end
end
