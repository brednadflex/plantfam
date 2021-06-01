class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_many :reviews
  has_many :bookings
  has_many :chat_rooms

  has_many :bookings_as_client, class_name: "Booking", foreign_key: :client_id
  has_many :bookings_as_provider, class_name: "Booking", foreign_key: :provider_id

  # after the user is created, it automatically creates the profile with that inputted info
  after_create :create_profile!
  def init_profile
    create_profile!
  end
  
end
