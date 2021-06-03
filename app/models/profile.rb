class Profile < ApplicationRecord
  belongs_to :user
  has_many :availabilities

  OPTIONS = ["sitting", "advise"]
end
