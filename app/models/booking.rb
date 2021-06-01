class Booking < ApplicationRecord
  belongs_to :client
  belongs_to :provider

  has_many :reviews
end
