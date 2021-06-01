class Booking < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :provider, class_name: "User"


end
