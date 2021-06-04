class Booking < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :provider, class_name: "User"

  validates :start_date, presence: true
  validates :end_date, presence: true
end
