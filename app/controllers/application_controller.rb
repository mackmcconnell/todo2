class ApplicationController < ActionController::Base
  protect_from_forgery

  def formatted_date(string)
    Date.parse(string.gsub(/(.+)-(\d{4})/, '\2-\1'))
  end

  helper_method :formatted_date

  def date_in_english(task)
    case task.date - Date.today
    when 0
      "Today"
    when 1
      "Tomorrow"
    when 2
      "Two Days"
    when 3
      "Three Days"
    else
      task.date.strftime("%B %d")
    end
  end

  helper_method :date_in_english
end



  # def date_in_english(task)
  #   if task.date = "2012-11-18"
  #     task.date = "Today"
  #   end
  # end