class UsersController < ApplicationController
  def show
    @user = current_user
    @user_pets = current_user.pets
    @administrations = current_user.medication_administrations

    authorize @user

    @markers = [{ lat: @user.latitude, lng: @user.longitude }]
    # info_window_html: render_to_string(partial: "info_window", locals: { user: user })
  end
end
