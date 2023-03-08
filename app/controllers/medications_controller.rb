class MedicationsController < ApplicationController
  # before_action :set_medication, only: %i[edit update destroy]

  def new
    @pet = Pet.find(params[:pet_id])
    @medication = Medication.new
    authorize @medication
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @medication = Medication.new(medication_params)
    @medication.pet = @pet
    authorize @medication

    if @medication.save
      redirect_to pet_path(@pet)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  # def edit; end

  # def update
  #   @medication.update(medication_params)
  #   redirect_to pet_path(@pet)
  # end

  # def destroy
  #   @medication.destroy
  #   redirect_to pet_path(@pet), status: :see_other
  # end

  private

  def medication_params
    params.require(:medication).permit(:name, :medication_type, :dosage,
                                       :frequency, :time_period, :start_date, :end_date)
  end
end
