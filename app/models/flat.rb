class Flat < ApplicationRecord
  acts_as_taggable_on :locations
  belongs_to :user
end
