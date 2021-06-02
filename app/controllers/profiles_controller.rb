class ProfilesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:show]
  before_action :set_profile, only: [:show, :edit, :update]
  
  before_action :set_profile, only: [:show, :edit, :update]

  def index
    @profiles = Profile.all
    # if params[:from] != "" && params[:to] != ""
    @ids = []
    Availability.where("start_date >= ?", params[:from]).where("end_date <= ?", params[:to]).map do |availability|
      @ids << availability.profile_id
      raise
    end
    # @profiles = []
    # @profiles = Availability.where("start_date >= ?", "2021-07-06").where("end_date <= ?", "2021-07-09").map do |availability|
    #   Profile.find(availability.profile_id)
    # end
    # end
    # @profiles = @profiles.where(experience: params[:experience]) if params[:experience].present?
  end

  def show
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

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :description, :profile_img, :banner_img, :experience, :avg_rating, :address, :location_lat, :location_lng, :max_radius, :sitter, :advisor, :public)
  end
end
