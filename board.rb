class Board
  attr_accessor :cells

  def initialize
    @cells = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]
    @border = "---+---+---"
  end

  def display_board
    new_array = []
    cells.each_with_index do |num, i|
      if i == 3 || i == 6
        new_array = []
        new_array << num
        puts @border
        if new_array.length == 3
          puts new_array.join("|")
        end
      else
        new_array << num
        if new_array.length == 3
          puts new_array.join("|")
        end
      end
    end
  end

  def update_board(input, symbol)
    cells[input - 1] = " #{symbol} "
  end
end
