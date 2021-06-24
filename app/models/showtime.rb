class Showtime < ApplicationRecord
  belongs_to :movie

  has_many :orders, dependent: :destroy

  validates :date_time, presence: true
  validates :tickets_available, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
