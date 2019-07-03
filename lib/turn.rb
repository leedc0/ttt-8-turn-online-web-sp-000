
def display_board(board = [" "," "," "," "," "," "," "," "," "])
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#Method accepts input for board space the user wants to fill and then returns corresponding index in the array
def input_to_index(input)
  input = input.to_i - 1
end

#Method to add a valid move to the board
def move(board, input, value = "X")
  board[input] = value
end

#Method to evaluate if place on the board has been taken
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O"
    return true
  end
end

#Method to evaluate if the player's move is valid
def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    return true
  else
    false
  end
end

#Method for player to execute a turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    puts "invalid input"
    turn(board)
  end
end
