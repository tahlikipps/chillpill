class MedicationsController < ApplicationController
  before_action :set_medication, only: %i[edit update destroy]

  def index
    @pet = Pet.find(params[:pet_id])
    @medications = policy_scope(Medication).where(pet: @pet)
    @administrations = MedicationAdministration.where(date: Date.today, medication_id: @pet.medications.ids)
    @given_administrations = policy_scope(MedicationAdministration)
                             .where(medication_id: @pet.medications.ids, is_given: true)
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @medication = Medication.new
    authorize @medication
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @medication = Medication.new(medication_params)
    @medication.pet = @pet

    if @medication.save
      redirect_to pet_medications_path(@medication.pet)
    else
      render 'new', status: :unprocessable_entity
    end

    authorize @medication
  end

  def edit
    authorize @medication
  end

  def update
    if @medication.update(medication_params)
      redirect_to pet_medications_path(@medication.pet)
    else
      render :edit, status: :unprocessable_entity
    end

    authorize @medication
  end

  def destroy
    @medication.destroy
    redirect_to pet_medications_path(@medication.pet), status: :see_other
    authorize @medication
  end

  private

  def medication_params
    params.require(:medication).permit(:name, :medication_type, :dosage,
                                       :frequency, :time_period, :start_date, :end_date)
  end

  def set_medication
    @medication = Medication.find(params[:id])
  end
end
