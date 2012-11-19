class ApplicationController < ActionController::Base
  protect_from_forgery

  def formatted_date(string)
    Date.parse(string.gsub(/(.+)-(\d{4})/, '\2-\1'))
  end

  helper_method :formatted_date

  def date_in_english(task)
  	case Date.parse(task.date.to_s)
  	when Date.today
  		task.date = "Today"
  	when Date.today + 1
  		task.date = "Tomorrow"
  	when Date.today + 2
  		task.date = "Two Days"
  	when Date.today + 3
  		task.date = "Three Days"
  	else task.date
  	end
  end

  helper_method :date_in_english
end



  # def date_in_english(task)
  #   if task.date = "2012-11-18"
  #     task.date = "Today"
  #   end
  # end