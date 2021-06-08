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
    @name = @profile.first_name + " " + @profile.last_name
    @query = params["search"]
    @from = @query.split(',')[2].split('=>')[1].gsub(/\"/, '')
    @to = @query.split(',')[3].split('=>')[1].gsub(/\"/, '').gsub(/}/, '')
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @booking = Booking.new(booking_params)
    @booking.client = current_user
    @booking.provider = @profile.user
    @booking.comment = params[:booking][:comment]
    if @booking.save
      redirect_to profile_bookings_path, notice: "Congratulations, your booking is complete!"
    else
      render :new
    end
  end

  def accept_booking
    @booking = Booking.find(params[:id])
    @booking.confirmed = "confirmed"
    if @booking.save
      redirect_to booking_requests_path, notice: "Congratulations, your booking is complete!"
    end
  end

  def reject_booking
    @booking = Booking.find(params[:id])
    @booking.confirmed = "rejected"
    if @booking.save
      redirect_to booking_requests_path, notice: "Sorry, your booking was rejected!"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :service_type)
  end
end
