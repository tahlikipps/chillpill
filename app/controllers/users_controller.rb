class UsersController < ApplicationController
  def show
    if params[:id].present?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    @user_pets = @user.pets
    @administrations = @user.medication_administrations

    authorize @user

    @markers = [{ lat: @user.latitude, lng: @user.longitude }]
    # info_window_html: render_to_string(partial: "info_window", locals: { user: user })
  end
end
