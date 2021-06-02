class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @profiles = Profile.where("avg_rating > 4.0 and sitter = true")
  end

end
