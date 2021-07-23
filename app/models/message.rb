class Message < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:content]

  belongs_to :user
  belongs_to :chat_room
end
