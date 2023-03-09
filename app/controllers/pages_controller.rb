class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @vets = User.where(is_vet: true)
    # The `geocoded` scope filters only flats with coordinates
    @markers = @vets.geocoded.map do |vet|
      {
        lat: vet.latitude,
        lng: vet.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { user: vet }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
end
