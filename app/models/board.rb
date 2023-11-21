class Board < ApplicationRecord
  has_one :booking
  belongs_to :user
  validates :name, :price, :description, presence: true
end
