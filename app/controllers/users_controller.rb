class UsersController < ApplicationController
  def index
    if params[:query].present?
      @profiles = Profile.where("first_name ILIKE ?", "%#{params[:query]}%")
    else
      @profiles = Profile.all
    end
  end
end
