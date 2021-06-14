class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @booking_by_state = current_user.bookings.group_by(&:reservation_state)
  end

  def dashboard
    @user_infos = current_user.user_contact
    @flats = current_user.flats
    @bookings = current_user.bookings
  end
end
