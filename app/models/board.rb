class Board < ApplicationRecord
  validates :name, :price, :description, presence: true
  monetize :price_cents, numericality: {
    greater_than_or_equal_to: 1
  }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_one :booking

  has_many_attached :photos
end
