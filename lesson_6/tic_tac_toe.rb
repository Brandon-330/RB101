# Part 1: Initial thoughts:
# Could use a hash, but there are 3 conditionals each square must go through
# Why don't we use a hash to represent the picks? Possible, but there are too many conditionals for a hash
# Let's use a nested array and use X for player, and O for computer

# Part 2: Computer's turn
# There needs to be a couple of cases to consider
#   case 1: first move made by player, computer should generate a random move, preferably a corner
#   case 2: if player makes two moves, about to win the game, computer must intercept it
#   case 3: if player makes two random moves, computer must play to win
#           by checking for its own 2 marks first, otherwise 1 mark

def prompt(s)
  puts "=> #{s}"
end

def show_board(current_board)
  current_board.each_with_index do |row_arr, ind|
    # Just to make it look pretty
    row_arr = row_arr.map do |el| 
      if el
        el
      else
        ' '
      end
    end
    puts "#{row_arr.join(' | ')}"
    puts "-" * 10 unless ind == 2
  end
end

def valid_choice?(choice, current_board)
  counter = 0
  current_board.each do |row_arr|
    row_arr.each do |el|
      counter += 1
      if counter == choice && !el
        return true
      end
    end
  end
  false
end

def mark_board(current_board, choice, symbol)
  row_number = (choice.to_f / 3).ceil - 1
  element_place = (choice % 3) - 1
  element_place += 3 if element_place < 0
  
  current_board[row_number][element_place] = symbol
  current_board
end

def player_turn(current_board)
  # Populate array with numbers as possible choices
  counter = 0
  available_choices = current_board.map do |row_arr|
    temp = row_arr.map do |el|
      counter += 1
      if el
        el
      else
        counter
      end
    end
  end

  show_board(available_choices)

  # Prompt for a valid choice
  choice = nil
  loop do
    prompt("Pick a valid number from the board for your choice")
    choice = gets.chomp.to_i
    # Below will not work since you cannot pick any already marked choices
    break if valid_choice?(choice, current_board)
  end
  choice.to_i
end

# marks are how many spots computer has on board
def offensive?(current_board, number_of_marks)
  # Let's check each row first (possible horizontal win)
  counter = 0
  current_board.each_with_index do |row_arr, ind|
    marks_count = row_arr.count { |el| el == 'O' }# LEFT OFF HEREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
    return true if row.size == number_of_marks
  end
end

def computer_turn(current_board)
  # Check for a computer win condition first
  offensive?(current_board, 2)
end
# Board starts out with no values inside, we set it to nil
# Each array inside board array is a row
board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

show_board(board)

choice = player_turn(board)
board = mark_board(board, choice, 'X')
### next steps, do a computer turn
# do win condition
# do a tie condition