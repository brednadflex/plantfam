class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # :confirmable

  has_one :profile, dependent: :destroy
  has_many :reviews
  has_many :bookings
  has_many :chat_rooms
  has_many :posts, dependent: :destroy

  has_many :bookings_as_client, class_name: "Booking", foreign_key: :client_id
  has_many :bookings_as_provider, class_name: "Booking", foreign_key: :provider_id

  # after the user is created, it automatically creates the profile with that inputed info

  after_create :init_profile
  def init_profile
    create_profile!
  end

  def first_name
    profile.first_name
  end

end
