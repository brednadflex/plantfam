class ProfilesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:show]
  before_action :set_profile, only: [:show, :edit, :update]

  def index
    # Saving the search in a cookie variable to retrieve it in the booking
    session[:search] = {address: params[:address], from: params[:search][:from], to: params[:search][:to]}
    @profiles = Profile.all
    if params[:from].present? && params[:to].present?
      @ids = Availability.where("start_date <= ?", params[:from]).where("end_date >= ?", params[:to]).map do |availability|
        availability.profile_id
      end
      @profiles = Profile.find(@ids.uniq)
    end
  end

  def show
    @reviews = @profile.reviews
  end

  def edit
  end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update(profile_params)
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
    params.require(:profile).permit(:first_name, :last_name, :description, :profile_img, :banner_img, :experience, :avg_rating, :address, :latitude, :longitude, :max_radius, :sitter, :advisor, :public, :sitter_price, :advisor_price)
  end
end
