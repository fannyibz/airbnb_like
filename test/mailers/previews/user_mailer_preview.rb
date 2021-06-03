# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/booking_confirmation_tenant
  def booking_confirmation_tenant
    UserMailer.booking_confirmation_tenant
  end

end
