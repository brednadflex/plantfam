class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  belongs_to :profile

  validates :content, presence: true
  validates :rating, presence: true
end
