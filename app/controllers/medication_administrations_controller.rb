class MedicationAdministrationsController < ApplicationController
  def update
    @medication_administration = MedicationAdministration.find(params[:id])
    @medication_administration.update(is_given: params[:is_given], date: Date.today)

    # if
       # redirect_to pet_path(@medication.pet)
    # else
    #   render :edit, status: :unprocessable_entity
    # end

    authorize @medication_administration
  end
end
