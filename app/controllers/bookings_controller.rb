class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(client: current_user)

  end

  def booking_requests
    @bookings = Booking.where(provider: current_user)
  end

  def new
    @profile = Profile.find(params[:profile_id])
    @booking = Booking.new
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @booking = Booking.new(booking_params)
    @booking.client = current_user
    @booking.provider = @profile.user
    if @booking.save
      redirect_to profile_bookings_path, notice: "Congratulations, your booking is complete!"
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :service_type)
  end
end
