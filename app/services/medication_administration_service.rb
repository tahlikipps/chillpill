class MedicationAdministrationService
  def initialize(medication)
    @medication = medication
  end

  def call
    date = @medication.start_date
    until @medication.end_date < date

      if @medication.time_period == "Daily"
        if @medication.frequency == 1
          MedicationAdministration.create(date: date.to_datetime.change({ hour: 15, min: 0, sec: 0 }), medication: @medication)
        elsif @medication.frequency == 2
          MedicationAdministration.create(date: date.to_datetime.change({ hour: 13, min: 0, sec: 0 }), medication: @medication)
          MedicationAdministration.create(date: date.to_datetime.change({ hour: 17, min: 0, sec: 0 }), medication: @medication)
        elsif @medication.frequency == 3
          MedicationAdministration.create(date: date.to_datetime.change({ hour: 12, min: 0, sec: 0 }), medication: @medication)
          MedicationAdministration.create(date: date.to_datetime.change({ hour: 15, min: 0, sec: 0 }), medication: @medication)
          MedicationAdministration.create(date: date.to_datetime.change({ hour: 18, min: 0, sec: 0 }), medication: @medication)
        end
      end

      if @medication.time_period == "Weekly"
        if (date - @medication.start_date).to_i % 7 == 0
          @medication.frequency.times do |i|
            t = 7 / @medication.frequency
            if i == 0
              MedicationAdministration.create(date: date.to_datetime.change({ hour: 15, min: 0, sec: 0 }), medication: @medication)
            else
              MedicationAdministration.create(date: MedicationAdministration.last.date + t.days, medication: @medication) unless MedicationAdministration.last.date + t > @medication.end_date
            end
          end
        end
      end

      if @medication.time_period == "Monthly"
        if (date - @medication.start_date).to_i % 30 == 0
          @medication.frequency.times do |i|
            t = 30 / @medication.frequency
            if i == 0
              MedicationAdministration.create(date: date.to_datetime.change({ hour: 15, min: 0, sec: 0 }), medication: @medication)
            else
              MedicationAdministration.create(date: MedicationAdministration.last.date + t.days, medication: @medication) unless MedicationAdministration.last.date + t > @medication.end_date
            end
          end
        end
      end

      date += 1
    end
  end
end
