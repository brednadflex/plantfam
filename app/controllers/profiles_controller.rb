class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def edit
    @profile = Profile.find(params[:id])
  end
end
