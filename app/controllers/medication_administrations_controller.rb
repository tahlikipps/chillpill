class MedicationAdministrationsController < ApplicationController
  def update
    @medication_administration = MedicationAdministration.find(params[:id])
    @pet = @medication_administration.medication.pet

    if @medication_administration.update(is_given: params[:is_given], user_id: current_user.id, date: Date.today)
      redirect_to pet_path(@pet, success: true)
    else
      render 'pets/show', status: :unprocessable_entity
    end

    authorize @medication_administration
  end
end
