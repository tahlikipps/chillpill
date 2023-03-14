class PetCarersController < ApplicationController

  def new
    @pet = Pet.find(params[:pet_id])
    @pet_carer = PetCarer.new
    authorize @pet_carer
  end

  def index
    @pet = Pet.find(params[:pet_id])
    @pet_carer = policy_scope(PetCarer).where(pet: @pet)
    authorize @pet_carer
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @user = User.find_by(email: params[:pet_carer][:user][:email])
    @pet_carer = PetCarer.new( status: 1, is_owner: false)
    @pet_carer.pet = @pet
    @pet_carer.user = @user

    if @pet_carer.save
      redirect_to pet_path(@pet)
    else
      render 'new', status: :unprocessable_entity
    end

    authorize @pet_carer
  end

  def destroy
    @pet_carer = PetCarer.find(params[:id])
    @pet_carer.destroy
    redirect_to pet_pet_carers_path(@pet_carer.pet), status: :see_other
    authorize @pet_carer
  end

  private

  def pet_carer_params
    params.require(:pet).permit(:status)
  end
end
