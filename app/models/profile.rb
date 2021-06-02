class Profile < ApplicationRecord
  belongs_to :user

  OPTIONS = ["sitting", "advise"]
end
