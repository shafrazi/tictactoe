require_relative "board.rb"
require_relative "player.rb"

class Game
  attr_reader :board, :player1, :player2
  def initialize
    @board = Board.new
  end

  def set_game
    puts "Welcome to the Game of Tic-Tac-Toe!"
    puts "Player 1, please choose your token, X or O?"
    player1_token = gets.chomp
    if player1_token == "X"
      player2_token = "O"
    else
      player2_token = "X"
    end
    @player1 = Player.new("Player 1", player1_token)
    @player2 = Player.new("Player 2", player2_token)
  end

  def play_game
    board.display_board
    while !player1.player_won? && !player2.player_won?
      puts "Player 1 select cell location:"
      player1_input = gets.chomp.to_i
      player1.play(player1_input)
      board.update_board(player1_input, player1.symbol)
      board.display_board

      puts "Player 2 select cell location:"
      player2_input = gets.chomp.to_i
      player1.play(player1_input)
      board.update_board(player2_input, player2.symbol)
      board.display_board
    end
  end
end

game = Game.new
game.set_game
game.play_game
