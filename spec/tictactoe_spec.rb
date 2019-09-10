require "./board"
require "./player"
require "./game"

describe Game do
  game = Game.new
  game.player1 = Player.new("Player 1", "X")
  game.player2 = Player.new("Player 2", "O")

  describe "#game.player1.player_won?" do
    it "returns true if player 1 has played the winning combination" do
      game.player1.inputs = [1, 2, 3]
      expect(game.player1.player_won?).to eql(true)
    end
  end

  describe "#game.player2.player_won?" do
    it "returns false if player 2 has not played the winning combinations" do
      game.player2.inputs = [3, 2, 6]
      expect(game.player2.player_won?).to eql(false)
    end
  end

  describe "#check_win" do
    it "returns true if any of the players has won the game" do
      expect(game.check_win).to eql(true)
    end
  end

  describe "#game_draw" do
    it "returns true if all cells have been played and neither of the players has won" do
      game.cells_played = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      game.player1.inputs = [3, 2, 6]
      game.player2.inputs = [4, 8, 9]
      expect(game.game_draw).to eql(true)
    end
  end

  describe "#game_over" do
    it "returns true if game result is either draw or won" do
      expect(game.game_draw).to eql(true)
    end
  end

  describe "#game_over" do
    it "returns false if game is not complete" do
      game.cells_played = [1, 2, 3, 4, 5, 6, 7, 8]
      expect(game.game_draw).to eql(false)
    end
  end
end
