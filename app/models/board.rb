class Board < ApplicationRecord
  validates :name, :price, :description, presence: true

  belongs_to :user
  has_one :booking
end
