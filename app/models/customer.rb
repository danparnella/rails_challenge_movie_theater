class Customer < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
