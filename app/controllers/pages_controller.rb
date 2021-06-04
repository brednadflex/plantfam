class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @profiles = Profile.where("avg_rating > 4.0 and sitter = true").where.not(user: current_user)
  end

  def search
    @profiles = Profile.where(sitter: true, advisor: true)
  end
end
