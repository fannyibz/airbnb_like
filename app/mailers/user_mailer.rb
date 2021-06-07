class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.booking_confirmation_tenant.subject
  #
  def waiting_confirmation_tenant(booking)
    @booking = booking
    mail(to: @booking.user.email, subject: 'Reservation taken into account')
  end

  def waiting_confirmation_landlord(booking)
    @booking = booking
    mail(to: @booking.flat.user.email, subject: 'Reservation to confirmed')
  end

  def booking_confirmation_tenant(booking)
    @booking = booking
    mail(to: @booking.user.email, subject: 'Booking confirmation')
  end

  def booking_confirmation_landlord(booking)
    @booking = booking
    mail(to: @booking.flat.user.email, subject: 'Rental notification')
  end

  def cancellation_tenant(booking)
    @booking = booking
    mail(to: @booking.user.email, subject: 'Booking cancellation')
  end

  def cancellation_landlord(booking)
    @booking = booking
    mail(to: @booking.flat.user.email, subject: 'Rental cancellation')
  end

end
