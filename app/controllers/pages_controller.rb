class PagesController < ApplicationController
  def profile
    @user = current_user
    @boards = @user.boards
    @board = Board.new
  end

  def myboards
    @user = current_user
    @boards = current_user.boards
  end
end
