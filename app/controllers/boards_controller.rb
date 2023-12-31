class BoardsController < ApplicationController
  before_action :set_board, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :check_owner, only: %i[edit update destroy]

  # GET /boards or /boards.json
  def index
    @boards = Board.all
    @board = Board.new

    @markers = @boards.geocoded.map do |paddle|
      {
        lat: paddle.latitude,
        lng: paddle.longitude,
        info_window_html: render_to_string(partial: 'info_window', locals: { paddl: paddle }),
        marker_html: render_to_string(partial: 'marker', locals: { paddle: })
      }
    end
  end

  # GET /boards/1 or /boards/1.json
  def show
    @booking = Booking.new(board: @board)
  end

  def check_owner
    set_board
    puts "Board user ID: #{@board.user.id}" if @board.user.present?
    puts "Current user ID: #{current_user.id}" if current_user.present?

    return if @board.user == current_user

    redirect_to boards_path, notice: 'You are not authorized to perform this action'
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit; end

  # POST /boards or /boards.json
  def create
    puts 'inside create method'
    @board = Board.new(board_params)
    @board.user = current_user

    puts @board.inspect

    respond_to do |format|
      if @board.save
        format.html { redirect_to board_url(@board), notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        puts 'inside else block'
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1 or /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to board_url(@board), notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1 or /boards/1.json
  def destroy
    @board.destroy!

    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def board_params
    params.require(:board).permit(:name, :availability, :price, :description, :address, photos: [])
  end
end
