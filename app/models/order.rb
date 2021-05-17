class Order < ApplicationRecord
  belongs_to :showtime
  belongs_to :customer
end
