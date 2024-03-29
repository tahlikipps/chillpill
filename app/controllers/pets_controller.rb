class PetsController < ApplicationController
  def show
    @medications = Medication.all.where(user_id: current_user.id)
    @pet_carers = PetCarer.all.where(user_id: current_user.id)
    @owner = PetCarer.all.where(user_id: current_user.id, is_owner: true)
    @pet = Pet.find(params[:id])
    @pet_age = Date.today.year - @pet.birth_date.year
    authorize @pet
    @administrations = MedicationAdministration.joins(:medication).where(date: DateTime.now.all_day, medication: { pet_id: @pet.id })
    @given_administrations = policy_scope(MedicationAdministration).where(is_given: true)
    @chat = Chat.find_by(pet: @pet)
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    authorize @pet
    @pet.save
    @pet_carer = PetCarer.create(pet: @pet, user: current_user, is_owner: true, status: 1)

    @owner = PetCarer.all.where(user_id: current_user.id, is_owner: true)

    @chat = Chat.create(pet: @pet)
    redirect_to profile_path
  end

  def edit
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit, status: :unprocessable_entity
    end
    authorize @pet
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy

    redirect_to pets_path, status: :see_other
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :address, :birth_date, :species, :photo)
  end
end
