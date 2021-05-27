class Flat < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
end
