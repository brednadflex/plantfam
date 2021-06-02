class ProfilesController < ApplicationController
   before_action :set_profile, only: [:show, :edit, :update]
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


