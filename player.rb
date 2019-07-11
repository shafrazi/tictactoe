class Player
  @@win_combo = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  attr_accessor :name, :symbol, :inputs, :active
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @active = false
    @inputs = []
  end

  def play(input)
    inputs.push(input)
  end

  def player_won?
    won = false
    combinations = inputs.combination(3).to_a
    combinations.each do |arr|
      @@win_combo.each do |i|
        if i.sort == arr.sort
          won = true
        end
      end
    end
    won
  end
end
