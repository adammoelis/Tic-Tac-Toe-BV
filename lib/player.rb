require_relative '../config/environment'
class Player

  attr_reader :symbol, :name

  def initialize(symbol, name)
    @name = name
    @symbol = symbol
  end

  def make_random_move(board)
    move = board.valid_moves.sample
    board.update_board(move, self)
    move
  end

end
