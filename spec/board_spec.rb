require_relative '../config/environment'
require_relative 'spec_helper.rb'

describe "Board testing" do
  it "has 9 spots on a 3 x 3 board" do
    board3 = Board.new(3)
    expect(board3.board.flatten.size).to eq(9)
  end

  it "has 16 spots on a 4 x 4 board" do
    board4 = Board.new(4)
    expect(board4.board.flatten.size).to eq(16)
  end

  it "has 25 spots on a 5 x 5 board" do
    board5 = Board.new(5)
    expect(board5.board.flatten.size).to eq(25)
  end

  it "Board updates properly" do
    board = Board.new(3)
    adam = Player.new("x", "Adam")
    board.update_board("1", adam)
    expect(board.board[0][0]).to eq("x")
  end

  it "Board updates properly" do
    board = Board.new(4)
    adam = Player.new("x", "Adam")
    board.update_board("4", adam)
    expect(board.board[0][3]).to eq("x")
  end

  it "Board updates properly with 'o'" do
    board = Board.new(4)
    adam = Player.new("o", "Adam")
    board.update_board("5", adam)
    expect(board.board[1][0]).to eq("o")
  end

  it "Knows game is over with a horizontal win" do
    board = Board.new(3)
    adam = Player.new("x", "Adam")
    board.update_board("1", adam)
    board.update_board("2", adam)
    board.update_board("3", adam)
    expect(board.horizontal_game_over?).to eq(true)
  end

  it "Knows game is over with a vertical win" do
    board = Board.new(4)
    adam = Player.new("x", "Adam")
    board.update_board("1", adam)
    board.update_board("5", adam)
    board.update_board("9", adam)
    board.update_board("13", adam)
    expect(board.vertical_game_over?).to eq(true)
  end

  it "Knows game is over with a diagonol win" do
    board = Board.new(4)
    adam = Player.new("x", "Adam")
    board.update_board("1", adam)
    board.update_board("6", adam)
    board.update_board("11", adam)
    board.update_board("16", adam)
    expect(board.diagonol_game_over?).to eq(true)
  end
end
