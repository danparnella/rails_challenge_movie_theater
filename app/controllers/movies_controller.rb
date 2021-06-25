class MoviesController < ApplicationController
  def index
    @movies = Movie.all.with_a_valid_showtime
  end
end
