module MoviesHelper
  def cost_dollars(showtime)
    '%.2f' % (showtime.cost.to_f / 100)
  end
end
