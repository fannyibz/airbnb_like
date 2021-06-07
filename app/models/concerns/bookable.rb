module Bookable
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm :reserving, column: "reservation_state" do
      state :waiting_confirmation, initial: true, before_enter: :mail_confirmation
      state :confirmed, :canceled

      event :landlord_confirme do
        transitions from: :waiting_confirmation, to: :confirmed 
      end

      event :unconfirme do
        transitions from: :waiting_confirmation, to: :canceled
      end

      event :cancel, after: :mail_cancellation, before_exit: :mail_cancellation do
        transitions from: :confirmed, to: :canceled
      end
    end


    def mail_confirmation
      UserMailer.booking_confirmation_tenant(self).deliver_now
      UserMailer.booking_confirmation_landlord(self).deliver_now
    end

    def mail_cancellation
      UserMailer.cancellation_tenant(self).deliver_now
      UserMailer.cancellation_landlord(self).deliver_now
    end

  end


end