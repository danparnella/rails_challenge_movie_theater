class Showtime < ApplicationRecord
  belongs_to :movie

  has_many :orders, dependent: :destroy

  validates :date_time, presence: true
  validates :tickets_available, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  # stored as cents
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  scope :by_date_time, -> (direction = :ASC) { order(date_time: direction) }
  scope :dates_only, -> () { by_date_time.pluck(:date_time).map(&:to_date).uniq }
  scope :for_date, -> (date) { by_date_time.where(date_time: date.all_day) }
end
