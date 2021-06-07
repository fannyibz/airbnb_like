class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  include Bookable

end
