class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def profile
    @user = current_user
    @boards = @user.boards
    @board = Board.new
  end
end
