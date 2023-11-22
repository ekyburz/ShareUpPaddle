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

  def destroy
    @boards = current_user.boards
    @board.destroy
    respond_to do |format|
      format.html { redirect_to myboards_path, notice: 'Board was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
