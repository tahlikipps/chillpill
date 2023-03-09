class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def index
    @users = User.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @users.geocoded.map do |user|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end
end
