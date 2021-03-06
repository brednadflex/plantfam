class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(client: current_user)
  end

  def my_bookings
    @bookings = Booking.where(client: current_user).or(Booking.where(provider: current_user))
    all_bookings = @bookings

    outgoing_bookings = Booking.where(client: current_user)
    incoming_bookings = Booking.where(provider: current_user)

    @current_bookings = all_bookings.select{ |booking| (booking.start_date <= Date.today) && (booking.end_date >= Date.today) }
    current_bookings = @current_bookings

    @current_incoming = current_bookings.select { |booking| booking.provider == current_user }
    @current_outgoing = current_bookings.select { |booking| booking.client == current_user }

    @current_count = @current_incoming.count + @current_outgoing.count

    @upcoming_confirmed = all_bookings.select{ |booking| (booking.start_date > Date.today) && booking.accepted? }
    @upcoming_pending = all_bookings.select{ |booking| (booking.start_date > Date.today) && !booking.accepted? }
    upcoming_confirmed = @upcoming_confirmed
    upcoming_pending = @upcoming_pending

    @upcoming_incoming = upcoming_confirmed.select{ |booking| booking.provider == current_user }
    @upcoming_outgoing = upcoming_confirmed.select{ |booking| booking.client == current_user }

    @upcoming_count = @upcoming_incoming.count + @upcoming_outgoing.count

    @pending_incoming = upcoming_pending.select{ |booking| booking.provider == current_user }
    @pending_outgoing = upcoming_pending.select{ |booking| booking.client == current_user }

    @pending_count = @pending_incoming.count + @pending_outgoing.count

    @completed_bookings = all_bookings.select { |booking| booking.completed? }
    completed_bookings = @completed_bookings

    @completed_incoming = completed_bookings.select{ |booking| booking.provider == current_user }
    @completed_outgoing = completed_bookings.select{ |booking| booking.client == current_user }

    @completed_count = @completed_incoming.count + @completed_outgoing.count

  end

  def new
    @profile = Profile.find(params[:profile_id])
    @booking = Booking.new
    @name = @profile.first_name + " " + @profile.last_name
  end

  def create

    @profile = Profile.find(params[:profile_id])

    # other_person = current_user == @chatroom.receiver ? @chatroom.requester : @chatroom.receiver


    receiver = User.find(@profile.user.id)
    chatroom = ChatRoom.where(requester: current_user, receiver: receiver).first
    if chatroom
      @chatroom = chatroom
    else
      @chatroom = ChatRoom.create!(requester: current_user, receiver: receiver)
    end

    if params[:booking][:comment]
      message = Message.create(user: current_user, chat_room: @chatroom, content: params[:booking][:comment])
    end

    @booking = Booking.new(booking_params)
    @booking.client = current_user
    @booking.provider = @profile.user
    @booking.comment = params[:booking][:comment]
    if @booking.save
      NewBookingMailer.send_booking_email(receiver, current_user, @booking).deliver
      redirect_to my_bookings_path, notice: "#{@booking.provider.first_name} has been notified!"
    else
      render :new
    end
  end

  def accept_booking
    @booking = Booking.find(params[:id])
    @booking.confirmed = "accepted"
    if @booking.save
      redirect_to my_bookings_path, notice: "Congratulations, your booking is complete!"
      # UserNotifierMailer.send_signup_email(@profile.user).deliver
    end
  end

  def reject_booking
    @booking = Booking.find(params[:id])
    @booking.confirmed = "rejected"
    if @booking.save
      redirect_to my_bookings_path, notice: "Sorry, your booking was rejected!"
    end
  end

  def cancel_booking
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private



  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :service_type)
  end
end
