class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_tagger
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_contact, dependent: :destroy
  has_many :flats, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
