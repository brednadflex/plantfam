class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    # need to get the booking_id
    @booking = Booking.find(params[:booking_id])
    # review_params gives us the profile_id
    @review = Review.new(review_params)
    # review user is the person making review ie current_user
    @review.user = current_user
    # connect review of booking to the booking_id
    @review.booking = @booking
    if @review.save
      # redirect to profile to see current_user's review on the receiver's profile
      redirect_to profile_path(@review.profile)
    else
      render :new
    end
  end

private

def review_params
  params.require(:review).permit(:content, :rating, :recommended, :profile_id)
end

end
