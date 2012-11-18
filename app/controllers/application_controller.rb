class ApplicationController < ActionController::Base
  protect_from_forgery

  def formatted_date(string)
    Date.parse(string.gsub(/(.+)-(\d{4})/, '\2-\1'))
  end

  helper_method :formatted_date
end
