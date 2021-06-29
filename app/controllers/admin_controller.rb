class AdminController < ApplicationController
  DAYS_OF_THE_WEEK = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].freeze

  def summary
    if Order.all.any?
      @popular_movies = ordered_showtimes.map(&:movie).uniq[0..2]
      @popular_times = ordered_times.uniq[0..2]
      @total_revenue = Order.all.map(&:total_cost).sum
      @daily_total_revenues = DAYS_OF_THE_WEEK.map(&method(:day_with_revenue))
    else
      @no_orders = true
    end
  end

  def orders
    @orders = Order.all
  end

  private
    def ordered_showtimes
      Order.by_showtime.map(&:showtime)
    end

    def ordered_times
      ordered_showtimes.map do |showtime|
        helpers.formatted_time(showtime)
      end
    end

    def day_with_revenue(day)
      { day: day, revenue: orders_on_day(day).compact.map(&:total_cost).sum }
    end

    def orders_on_day(day)
      Order.all.map do |order|
        order if order.showtime.date_time.strftime("%A") == day
      end
    end
end
