# == Schema Information
#
# Table name: bookings
#
#  id                :bigint           not null, primary key
#  end_date          :date
#  guest_count       :integer
#  reservation_state :string
#  start_date        :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  flat_id           :bigint           not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_bookings_on_flat_id  (flat_id)
#  index_bookings_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (user_id => users.id)
#
class Booking < ApplicationRecord

  # Relations
  belongs_to :flat
  belongs_to :user
  
  include Bookable

  # Callbacks
  after_create :waiting_confirmation_mails

  def human_reservation_state
    I18n.t("models.booking.reservation_state.#{reservation_state}")
  end

  private

  # When a booking is created we send mail to tenant and landlord so they confirm or not the booking
  def waiting_confirmation_mails
    UserMailer.waiting_confirmation_tenant(self).deliver_now
    UserMailer.waiting_confirmation_landlord(self).deliver_now
  end

end
