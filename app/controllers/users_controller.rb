class UsersController < ApplicationController

  def show
    @user = current_user
    @user_pets = current_user.pets

    authorize @user
  end

end
