require_relative '../config/environment'
class Game

  def initialize
    @board = Board.new
  end

  def run
    @player = Player.new("x", "Adam")
    @computerplayer = Player.new("o", "Computer")



    initial_message
    answer = first_or_second?
    instructions
    until game_over? || tie_game?
      @board.display_board
      @turn == 0 ? get_user_move : computer_move
    end
    game_over_message
    play_again?
  end

  def initial_message
    puts "Welcome to Tic-Tac-Toe!"
  end

  def first_or_second?
    puts "Would you like to move first (F) or second (S)?"
    answer = gets.chomp.downcase
    while answer != "f" && answer != "s"
      puts "Invalid. Try again"
      answer = gets.chomp.downcase
    end
    answer == "f" ? @turn = 0 : @turn = 1
  end

  def instructions
    puts "Please select the number of the spot you'd like to select"
  end

  def invalid_move_message
    puts "Invalid move. Please choose a remaining number"
  end

  def game_over_message
    @board.display_board
    puts game_over? ? "#{last_mover.name} won" : "Tie game!"
    puts "Game Over! Would you like to play again? (Y/N)"
  end

  def play_again?
    answer = gets.chomp.downcase
    if answer == "y"
      Game.new.run
    else
      abort
    end
  end

  def get_user_move
    @user_move = gets.chomp
    if @board.valid_move?(@user_move)
      @board.update_board(@user_move, @player)
    else
      invalid_move_message
      get_user_move
    end
    @turn = 1
  end

  def computer_move
    move = @computerplayer.make_random_move(@board)
    @turn = 0
    puts "The computer chose space number #{move}"
  end

  def game_over?
    @board.game_over?
  end

  def tie_game?
    @board.tie_game?
  end

  def last_mover
    @turn == 1 ? @player : @computerplayer
  end



end

game = Game.new
game.run
