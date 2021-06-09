class Booking < ApplicationRecord
  #
  # Relations
  #
  belongs_to :flat
  belongs_to :user
  
  include Bookable
  #
  # Callbacks
  #
  after_create :waiting_confirmation_mails

  private

  # When a booking is created we send mail to tenant and landlord so they confirm or not the booking
  def waiting_confirmation_mails
    UserMailer.waiting_confirmation_tenant(self).deliver_now
    UserMailer.waiting_confirmation_landlord(self).deliver_now
  end
end
