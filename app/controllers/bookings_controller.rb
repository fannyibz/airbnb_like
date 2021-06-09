class BookingsController < ApplicationController
  # acts_as_token_authentication_handler_for User, except: [:index, :show]
  before_action :find_booking, only: [:show, :cancel, :edit, :update, :destroy]


  def show
    authorize @booking
    @night_number = @booking.end_date - @booking.start_date
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    flat = Flat.find(params[:flat_id])
    @booking.flat = flat
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to flat_path(@booking)
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path
  end

  # TODO:
  ## - créer une route dédiée à la confirmation
  ## - créer une méthode assignée à la route
  ## - faire raise quand jappuie sur le bouton de la vue
  ##    1. identifier booking
  ##    2. passer le booking en confirme

  def cancel
    authorize @booking
    raise
    @booking.unconfirme!
    # raise
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guest_count, :price_per_night, :photo, :tag_list)
  end
end
