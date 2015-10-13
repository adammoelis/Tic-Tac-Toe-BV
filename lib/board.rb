require_relative '../config/environment'
class Board
  attr_reader :board

  def initialize
    @board = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9']
    ]
  end

  def display_board
    @board.each do |row|
      puts "#{row[0]}|#{row[1]}|#{row[2]}"
    end
    valid_moves
  end

  def update_board(spot)
    @board = @board.map do |row|
      row.map {|num| num == spot ? "x" : num}
    end
  end

  def valid_moves
    @valid_moves = @board.flatten.select {|num| num != "x" && num != "o"}
  end

  def valid_move?(num)
    @valid_moves.include?(num)
  end

  def horizontal_game_over?
    @board[0].uniq.size == 1 || @board[1].uniq.size == 1 || @board[2].uniq.size == 1
  end

  def vertical_game_over?
    i = 0
    result = false
    while i <= 2
      if @board[0][i] == @board[1][i] && @board[1][i] == @board[2][i]
        result = true
        break
      end
      i += 1
    end
    result
  end

  def diagonol_game_over?
    (@board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]) || (@board[0][2] == @board[1][1] && @board[1][1] == @board[2][0])
  end

  def game_over?
    if horizontal_game_over? || vertical_game_over? || diagonol_game_over?
      true
    else
    end
  end
end
