require_relative '../config/environment'
class Board
  attr_reader :board

  def initialize(size)
    @size = size.to_i
    @numbers = @size ** 2
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
        board[i] << num.to_s
      else
        board[i] << num.to_s
      end
    end
    board
  end

  def display_board
    @board.each do |row|
      row.each.with_index(1) do |num, index|
        if index == @size
          puts num.to_i != 0 ? "#{sprintf('%02d',num)}|" : "#{num}|"
        else
          print num.to_i != 0 ? "#{sprintf('%02d', num)}|" : "#{num}|"
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
    array = (0...@board.size).map do |num|
      @board[num].uniq.size == 1
    end
    array.include?(true)
  end

  def get_vertical_array
    array = (0...@board.size).map do |num|
        @board.map do |row|
          row[num]
      end
    end
  end

  def get_diagonol_array
    array1 = (0...@board.size).map do |num|
      @board[num][num]
    end
    i = @board.size
    array2 = (0...@board.size).map do |num|
      i -= 1
      @board[i][num]
    end
    [array1, array2]
  end

  def vertical_game_over?
    array = (0...@board.size).map do |num|
      get_vertical_array[num].uniq.size == 1
    end
    array.include?(true)
  end

  def diagonol_game_over?
    array = (0..1).map do |num|
      get_diagonol_array[num].uniq.size == 1
    end
    array.include?(true)
  end

  def game_over?
    horizontal_game_over? || vertical_game_over? || diagonol_game_over?
  end

  def tie_game?
    !game_over? && valid_moves.empty?
  end
end
