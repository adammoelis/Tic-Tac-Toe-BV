require_relative '../config/environment'
class Board
  attr_reader :board

  def initialize(size)
    @size = size
    @numbers = size ** 2
    @board = create_board
  end

  def populate_empty_board_with_arrays
    board = []
    @size.times do |i|
      board << []
    end
    board
  end

  def create_board
    board = populate_empty_board_with_arrays
    i = 0
    (1..@numbers).each do |num|
      if num.to_i % @size == 1 && num >= @size
        i += 1
        board[i] << num
      else
        board[i] << num
      end
    end
    board
  end

  def display_board
    @board.each do |row|
      row.each do |num|
        if num.to_i % @size == 0
          puts "#{sprintf('%02d',num)}|"
        else
          print "#{sprintf('%02d', num)}|"
        end
      end
    end
    valid_moves
  end

  def update_board(spot, player)
    @board = @board.map do |row|
      row.map {|num| num == spot ? player.symbol : num}
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
    horizontal_game_over? || vertical_game_over? || diagonol_game_over?
  end

  def tie_game?
    !game_over? && valid_moves.empty?
  end
end

binding.pry
