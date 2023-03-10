class MedicationAdministration < ApplicationRecord
  belongs_to :medication
  belongs_to :user, optional: true

  validates :date, presence: true

  def update
    @administrations = MedicationAdministration.find(params[:id])
    @administrations.update(is_given: params[:is_given])
    redirect_to pet_path(@pet)
    #get params sent by booking index and update status of booking accordingly
  end


end
