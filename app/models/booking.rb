class Booking < ApplicationRecord
  belongs_to :board
  belongs_to :user

  # has_one :user, through: :board # booking.board_owner gives you booking.board.user
  # test

  def board_owner
    board.user
  end
end
