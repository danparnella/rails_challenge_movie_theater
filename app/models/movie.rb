class Movie < ApplicationRecord
  has_many :showtimes, dependent: :destroy

  validates :name, presence: true

  scope :with_a_valid_showtime, -> { joins(:showtimes).merge(Showtime.not_past).uniq }

end
