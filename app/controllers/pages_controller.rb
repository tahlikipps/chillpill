class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @vets = User.where(is_vet: true)
    # The `geocoded` scope filters only flats with coordinates
    @markers = @vets.geocoded.map do |vet|
      {
        lat: vet.latitude,
        lng: vet.longitude
      }
    end
  end
end
