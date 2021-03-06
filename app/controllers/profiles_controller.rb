class ProfilesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:show]
  before_action :set_profile, only: [:show, :edit, :update]

  def index
    # Saving the search in a cookie variable to retrieve it in the booking
    session[:search] = {address: params[:address], from: params[:search][:from], to: params[:search][:to]}
    @profiles = Profile.where(sitter: true).or(Profile.where(advisor: true)).where.not(user: current_user)
    # if params[:from].present? && params[:to].present?
    #   @ids = Availability.where("start_date <= ?", params[:from]).where("end_date >= ?", params[:to]).map do |availability|
    #     availability.profile_id
    #   end
    #   @profiles = Profile.find(@ids.uniq)
    # end
  end

  def show
    @reviews = @profile.reviews
    receiver = User.find(@profile.user.id)
    chatroom = ChatRoom.where(requester: current_user, receiver: receiver).first
    if chatroom
      @chatroom = chatroom
    else
      @chatroom = ChatRoom.create!(requester: current_user, receiver: receiver)
    end
  end

  def edit
  end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update!(profile_params)
      @profile.add_profile_img!(profile_params_img[:profile_img])
      @profile.add_banner_img!(profile_params_img[:banner_img])
      @profile.reload
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def my_profile
    @profile = current_user.profile
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(
      :first_name, :last_name, :description, :experience, :avg_rating,
      :address, :latitude, :longitude, :max_radius, :sitter, :advisor,
      :public, :sitter_price, :advisor_price
    )
  end

  def profile_params_img
    params.require(:profile).permit(:profile_img, :banner_img)
  end
end
