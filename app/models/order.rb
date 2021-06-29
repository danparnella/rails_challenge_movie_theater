class Order < ApplicationRecord
  belongs_to :showtime
  belongs_to :customer

  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :cc_number, presence: true, credit_card_number: true
  validates :cc_expiration, presence: true
  validates :cc_security_code, presence: true, length: 3..4

  scope :by_showtime, -> (direction = :ASC) { joins(:showtime).merge(Showtime.by_date_time(direction)) }

  def total_cost
    quantity * showtime.cost
  end
end
