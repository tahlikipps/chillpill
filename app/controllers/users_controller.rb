class UsersController < ApplicationController

  def show
    @user = current_user
    ##@my_pets = Pet.all.where(user_id: current_id.id)

    authorize @user
  end

end
