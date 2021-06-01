class ChatRoom < ApplicationRecord
  belongs_to :booking
  belongs_to :requester
  belongs_to :receiver

  has_many :messages
end
