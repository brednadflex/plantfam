class AvailabilitiesController < ApplicationController
  def index
  end

  def new
    @profile = Profile.find(params[:profile_id])
    @availability = Availability.new
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @availability = Availability.new(availability_params)
    @availability.profile = current_user.profile
    
    if @availability.save
      redirect_to profile_availabilities_path
    else
      render :new
    end
  end

  private

  def availability_params
    params.require(:availability).permit(:start_date, :end_date)
  end
end
