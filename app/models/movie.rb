class Movie < ApplicationRecord
  has_many :showtimes, dependent: :destroy

  validates :name, presence: true
end
