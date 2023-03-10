module PillboxHelper

  #def weekday_status(weekday)
    #days = {0 => "Sunday",
      #1 => "Monday",
      #2 => "Tuesday",
      #4 => "Thursday",
      #3 => "Wednesday",
      #5 => "Friday",
      #6 => "Saturday"}
    #day = @administrations.where('created_at > ?', 7.days.ago) && @administration.date.strftime("%A") == weekday
    #if @administrations.all.is_given == true
      #return true
    #else
      #return false
    #end
  #end
#end
