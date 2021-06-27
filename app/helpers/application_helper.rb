module ApplicationHelper
  def formatted_time(showtime)
    showtime.date_time.strftime("%l:%M %p")
  end

  def formatted_date(date)
    date.to_s(:long_ordinal)
  end

  def cost_dollars(cost)
    '%.2f' % (cost.to_f / 100)
  end
end
