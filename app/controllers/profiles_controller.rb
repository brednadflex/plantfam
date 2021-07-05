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
    params_edit = profile_params
    params_edit[:profile_img] = cloudinary_upload(params_edit[:profile_img], "profile")
    params_edit[:banner_img] = cloudinary_upload(params_edit[:banner_img], "banner")
    if @profile.update(params_edit)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def my_profile
    @profile = current_user.profile
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :description, :profile_img, :banner_img, :experience, :avg_rating, :address, :latitude, :longitude, :max_radius, :sitter, :advisor, :public, :sitter_price, :advisor_price)
  end

  def cloudinary_upload(file, category = "profile")
    file = 'https://source.unsplash.com/random/900×250/?plants' if category == "banner" && file.nil?
    return "" unless file
    response = Cloudinary::Uploader.upload(
      file,
      folder: "PlantFam/",
      public_id: "#{current_user.email.gsub(/[@.]/, '__')}-#{category}",
      overwrite: true
    )
    return response["public_id"]
  end
end
