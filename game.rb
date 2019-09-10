require_relative "board.rb"
require_relative "player.rb"

class Game
  attr_accessor :board, :player1, :player2, :players, :cells_played

  def initialize
    @board = Board.new
    @players = []
    @cells_played = []
  end

  def set_game
    puts "Welcome to the Game of Tic-Tac-Toe!"
    puts "Player 1, please choose your token, X or O?"
    player1_token = validate_token
    if player1_token == "X"
      player2_token = "O"
    else
      player2_token = "X"
    end
    @player1 = Player.new("Player 1", player1_token)
    @player2 = Player.new("Player 2", player2_token)
    @players << @player1
    @players << @player2
    @player1.active = true
  end

  def validate_token
    input = gets.chomp.upcase
    while input != "X" && input != "O"
      puts "Please input X or O"
      input = gets.chomp.upcase
    end
    input
  end

  def validate_cell
    input = gets.chomp.to_i
    while (1..9).include?(input) && cells_played.include?(input)
      puts "Please input correct cell location"
      input = gets.chomp.to_i
    end
    cells_played << input
    input
  end

  def switch_players
    i = 0
    while i < players.length
      if players[i].active
        players[i].active = false
      else
        players[i].active = true
      end
      i += 1
    end
  end

  def active_player
    if player1.active
      player1
    else
      player2
    end
  end

  def check_win
    @game_status = 0
    if player1.player_won? || player2.player_won?
      true
    else
      false
    end
  end

  def game_draw
    if cells_played.length == 9 && (!player1.player_won? && !player2.player_won?)
      true
    else
      false
    end
  end

  def game_result
    if self.check_win
      puts "-------------------"
      puts "Congratulations! #{active_player.name} wins!"
    elsif game_draw
      puts "-------------------"
      puts "Game drawn!"
    end
  end

  def game_over
    if check_win || game_draw
      true
    else
      false
    end
  end

  def play_game
    board.display_board
    while !game_over
      puts "-------------------"
      puts "#{active_player.name} select cell location:"
      active_player_input = validate_cell
      self.active_player.play(active_player_input)
      board.update_board(active_player_input, self.active_player.symbol)
      game_result
      self.switch_players
      puts "-------------------"
      board.display_board
    end
  end
end

# game = Game.new
# game.set_game
# game.play_game
