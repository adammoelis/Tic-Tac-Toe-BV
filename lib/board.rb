require 'pry'
class Board

  def initialize
    @board = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9']
    ]
  end

  def display_board
    @board
  end

  def draw_board
    @board.each do |row|
      puts "#{row[0]}|#{row[1]}|#{row[2]}"
    end
  end

  def update_board(spot)
    @board = @board.map do |row|
      row.map do |num|
        num == spot ? "x" : num
      end
    end
  end


end

board = Board.new
board.draw_board
binding.pry
