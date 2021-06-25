module MoviesHelper
  def formatted_date(date)
    date.to_s(:long_ordinal)
  end

  def cost_dollars(showtime)
    '%.2f' % (showtime.cost.to_f / 100)
  end

  def formatted_time(showtime)
    showtime.date_time.strftime("%l:%M %p")
  end
end
