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

  def index
    @pet = Pet.find(params[:pet_id])
    @medication_administrations = policy_scope(MedicationAdministration)
    @medication_administrations = MedicationAdministration.joins(:medication)
                                                          .where(date: Date.today.., medications: { pet_id: params[:pet_id] })
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name"   # Excluding ".pdf" extension.
        # Tempfile.create do |t|
        #   t.binmode
        #   t.write(pdf)
        #   t.rewind
        #   t.close
        #   send_data File.open(t.path, 'rb').read, type: 'application/pdf', filename: 'abc.pdf'
      end
    end
  end

end
