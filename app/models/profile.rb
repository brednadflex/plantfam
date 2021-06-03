class Profile < ApplicationRecord
  belongs_to :user
  has_many :availabilities
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  OPTIONS = ["sitting", "advise"]
end
