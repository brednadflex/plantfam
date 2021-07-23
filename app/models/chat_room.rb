class ChatRoom < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:requester, :receiver]

  belongs_to :booking, optional: true
  belongs_to :requester, class_name: "User"
  belongs_to :receiver, class_name: "User"


  has_many :messages, dependent: :destroy
end
