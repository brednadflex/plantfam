class Booking < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :provider, class_name: "User"

  enum confirmed: {
    pending: 0,
    confirmed: 1,
    rejected: 2
  }
end
