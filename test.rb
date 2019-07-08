#Initially display board with numbers marked in each cell
#Prompts for player1 to choose X or O
#Create new Player instance with var player1 and assign the symbol of choice.
#Player class to have an array where each input should be recorded.
#Prompts for player1 to choose location in board
#Marks board with player1 input and display new board
#Prompts for player2 input
#Marks board with both players input and displays new board
#loop until a winning combination and announces player

array = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]
border = "---+---+---"
new_array = []
array.each_with_index do |num, i|
  if i == 3 || i == 6
    new_array = []
    new_array << num
    puts border
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
