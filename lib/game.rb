require_relative '../config/environment'
class Game

  def initialize
    @board = Board.new
  end

  def run
    initial_message
    instructions
    @board.display_board
    get_user_move
    until game_over?
      @board.display_board
      get_user_move
    end
    game_over_message
  end

  def initial_message
    puts "Welcome to Tic-Tac-Toe!"
  end

  def instructions
    puts "Please select the number of the spot you'd like to select"
  end

  def invalid_move_message
    puts "Invalid move. Please choose a remaining number"
  end

  def game_over_message
    puts "Game Over!"
  end

  def get_user_move
    @user_move = gets.chomp
    if @board.valid_move?(@user_move)
      @board.update_board(@user_move)
    else
      invalid_move_message
      get_user_move
    end
  end

  def game_over?
    @board.game_over?
  end



end

game = Game.new
game.run
