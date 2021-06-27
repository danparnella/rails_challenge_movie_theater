module AdminHelper
  def formatted_date_time(date_time)
    date_time.strftime("%-m/%-d/%Y - %l:%M %p")
  end
end
