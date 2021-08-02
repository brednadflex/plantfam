class NewBookingMailer < ApplicationMailer
  default :from => 'plantfamapp@gmail.com'

  def send_booking_email(user, booker, booking)
    @booking = booking
    @user = user
    @booker = booker
    mail( :to => user.email,
    :subject => 'You have a booking on plantfam.net' )
  end
end
