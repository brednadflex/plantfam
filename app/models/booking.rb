class Booking < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :provider, class_name: "User"
  has_many :reviews, dependent: :destroy
  enum confirmed: [:pending, :accepted, :rejected]

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :service_type, presence: true

  def can_review?
    @completed = end_date < Date.today ? true : false
  end
end
