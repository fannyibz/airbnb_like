class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_tagger

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_contact, dependent: :destroy
  has_many :flats
end
