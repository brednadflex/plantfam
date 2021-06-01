class ProfilesController < ApplicationController
  def edit
    @profile = Profile.find(params[:id])
  end
end
