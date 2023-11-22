class Board < ApplicationRecord
  validates :name, :price, :description, presence: true
  monetize :price_cents, numericality: {
    greater_than_or_equal_to: 1,
  }

  belongs_to :user
  has_one :booking
end
