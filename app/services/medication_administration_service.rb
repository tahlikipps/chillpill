class MedicationAdministrationService
  def initialize(medications)
    @medications = medications
  end

  def call
    @medications.each do |medication|
      if Date.today.between?(medication.start_date, medication.end_date)
        case medication.time_period
          when "Weekly"
            next if MedicationAdministration.all.any?{ |a| a.medication_id == medication.id && a.date > 6.days.ago  }
          when "Monthly"
            next if MedicationAdministration.all.any?{ |a| a.medication_id == medication.id && a.date > 30.days.ago  }
          when "Daily"
            next if MedicationAdministration.all.any?{ |a| a.medication_id == medication.id && a.date == Date.today }
        end

        medication.frequency.times do
          MedicationAdministration.create!(date: Date.today, medication_id: medication.id)
        end
      end
    end
  end
end
