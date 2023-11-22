class PagesController < ApplicationController
  def profile
    @user = current_user
    @boards = @user.boards
    @board = Board.new
  end

  def boards
    @user = current_user
    @boards = current_user.boards
  end

  def bookings
    @bookings = Booking.all
  end
end
