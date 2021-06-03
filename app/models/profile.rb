class Profile < ApplicationRecord
  belongs_to :user
  has_many :availabilities
  has_many :reviews

  OPTIONS = ["sitting", "advise"]
end
