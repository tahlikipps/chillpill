class PetCarersController < ApplicationController

  def new
    @pet = Pet.find(params[:pet_id])
    @pet_carer = PetCarer.new
    authorize @pet_carer
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @user = User.find_by(email: params[:pet_carer][:user][:email])
    @pet_carer = PetCarer.new( status: 1, is_owner: false )
    @pet_carer.pet = @pet
    @pet_carer.user = @user

    if @pet_carer.save
      redirect_to pet_path(@pet)
    else
      ©
      render 'new', status: :unprocessable_entity
    end

    authorize @pet_carer
  end

  private

  def pet_carer_params
    params.require(:pet).permit(:status)
  end
end
