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
      return true if counter == choice && !el

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


def computer_turn(current_board)
  # Check for a computer win condition first
  offensive?(current_board, 0)
end


# Marks are how many spots computer has on board in a line, or diagonal
def offensive?(current_board, number_of_marks)
  rows_hashes_list = return_rows_hash(current_board)
  columns_hashes_list = return_columns_hash(current_board)
  diagonals_hashes_list = return_diagonals_hash(current_board)

  p diagonals_hashes_list


  3.times do |iteration|
    case iteration
    when 0 then hash_list = diagonals_hashes_list
    when 1 then hash_list = columns_hashes_list
    when 2 then hash_list = rows_hashes_list
    end
    
    # Check diagonals first, since it is considered more powerful on board
    hash_list.each do |hash|
      marks = hash.values.count { |el| el == 'O' }
      free_space = hash.values.count { |el| el == nil }

      if (marks == number_of_marks) && (marks + free_space == 3)
        computer_choice = hash.select { |_, v| v == nil }
        
        if computer_choice.size > 1
          # Prioritize the middle of the board
          return 5 if computer_choice.keys.any? { |k| k == 5 }
          # If not, just pick a random square
          return computer_choice.keys[0]
        else
          return computer_choice.key
        end
      end
    end
  end
end


def return_rows_hash(current_board)
  rows_hashes_list = []

  counter = 1
  current_board.each_with_index do |row|
    temp_hash = Hash.new
    row.each do |el|
      temp_hash[counter] =  el
      counter += 1
    end
    rows_hashes_list << temp_hash
  end
  
  rows_hashes_list
end


def return_columns_hash(current_board)
  columns_hashes_list = []

  counter = 1
  3.times do |ind|
    temp_hash = Hash.new
    current_board.each do |row|
      temp_hash[counter] = row[ind]
      counter += 3
    end
    columns_hashes_list << temp_hash
    counter -= 8
  end

  columns_hashes_list
end


def return_diagonals_hash(current_board)
  temp_hash_1 = Hash.new
  temp_hash_2 = Hash.new
  diagonals_hashes_list = []

  counter = 1
  current_board.each do |row|
    row.each do |el|
      if (counter == 1 || counter == 9)
        temp_hash_1 [counter] = el
      
      elsif (counter == 3 || counter == 7)
        temp_hash_2 [counter] = el
        
      elsif counter == 5
        temp_hash_1 [counter] = el
        temp_hash_2 [counter] = el
      end
      
      counter += 1
    end
  end

  diagonals_hashes_list << temp_hash_1 << temp_hash_2
  diagonals_hashes_list
end

# Board starts out with no values inside, we set it to nil
# Each array inside board array is a row
board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

loop do
  show_board(board)

  player_choice = player_turn(board)
  board = mark_board(board, player_choice, 'X')

  computer_choice = computer_turn(board)
  board = mark_board(board, computer_choice, 'O')
  #break if tie?(board)
end
### next steps, do a computer turn
# do win condition
# do a tie condition