class BookingsController < ApplicationController
    # acts_as_token_authentication_handler_for User, except: [:index, :show]
    before_action :find_booking, only: [:show, :edit, :update, :destroy]


    def show
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
    end
  
    def update
      @booking.update(booking_params)
      redirect_to booking_path(@booking)
    end
  
    def destroy
      @booking.destroy
      redirect_to dashboard_path
    end
  
    private
  
    def find_booking
      @booking = Booking.find(params[:id])
      authorize @booking
    end
  
    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :guest_count, :price_per_night, :photo, :tag_list)
    end
end
