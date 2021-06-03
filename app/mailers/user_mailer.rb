class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.booking_confirmation_tenant.subject
  #
  def booking_confirmation_tenant(booking)
    @booking = booking
    mail(to: @booking.user.email, subject: 'Booking confirmation')
  end

end
