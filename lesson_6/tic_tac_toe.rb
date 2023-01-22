# Part 1: Initial thoughts:
# Could use a hash, but there are 3 conditionals each square must go through
# Why don't we use a hash to represent the picks? Possible, but there are too 
# many conditionals for a hash, so let's use a nested array and 
# use X for player, and O for computer

# Part 2: Computer's turn
# There needs to be a couple of cases to consider
#   case 1: first move made by player, computer should generate a 
#           random move, preferably a corner
#   case 2: if player makes two moves, about to win the game, computer 
#           must intercept it
#   case 3: if player makes two random moves, computer must play to win
#           by checking for its own 2 marks first, otherwise 1 mark

# ^^^ Ended up using a hash anyway, just in a different way
# The computer is still probable to lose when working with smart diagonals moves

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
    puts "-" * 2 + "+" + "-" * 3 + "+" + "-" * 2 unless ind == 2
  end
  puts ""
  puts "=" * 10
  puts ""
end


def available_choices(current_board)
  # Populate array with numbers as possible choices
  counter = 0
  available_choices = current_board.map do |row_arr|
    row_arr.map do |el|
      counter += 1
      if el
        nil
      else
        counter
      end
    end
  end

  available_choices
end


def mark_board(current_board, choice, symbol)
  row_number = (choice.to_f / 3).ceil - 1
  element_place = (choice % 3) - 1
  element_place += 3 if element_place < 0
  
  current_board[row_number][element_place] = symbol
  current_board
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


def turn(current_board, is_player_turn)
  if is_player_turn
    [player_turn(current_board), 'X']
  else
    [computer_turn(current_board), 'O']
  end
end


def player_turn(current_board)
  # Prompt for a valid choice
  choice = nil
  loop do
    prompt("Pick a valid number from the numbered board above")
    choice = gets.chomp.to_i
    break if valid_choice?(choice, current_board)
  end

  choice.to_i
end


def computer_turn(current_board)
  # Counter will represent the number of marks ready to win the game
  # We will check the most marks first, since they are closest to winning or losing the game
  counter = 2
  loop do
    is_attack, choice = offensive?(current_board, counter)
    return choice if is_attack == true

    # If we do not win right away, let's not let the player win the game with 2 marks with 1 left
    if counter == 2 && is_attack == false
      is_defend, choice = defensive?(current_board)
      return choice if is_defend == true
    end

    # Otherwise, keep constantly attacking as computer
    counter -= 1
    break if counter < 0
  end

  # If the game looks like a draw, generate random choices
  random_choice(current_board)
end

# Marks are how many spots computer has on board in a line, or diagonal
def offensive?(current_board, number_of_marks)
  rows_hashes_list = return_rows_hash(current_board)
  columns_hashes_list = return_columns_hash(current_board)
  diagonals_hashes_list = return_diagonals_hash(current_board)


  3.times do |iteration|
    case iteration
    when 0 then hash_list = diagonals_hashes_list
    when 1 then hash_list = columns_hashes_list
    when 2 then hash_list = rows_hashes_list
    end
    
    # Check diagonals first, since it is considered more powerful on board
    hash_list.each do |hash|
      marks = hash.values.count { |el| el == 'O' }
      free_space = hash.values.count(&:!)

      if (marks == number_of_marks) && (marks + free_space == 3)
        computer_choice = hash.select { |_, v| !v }
        
        if computer_choice.size > 1
          # Prioritize the middle of the board
          return [true, 5] if computer_choice.keys.any? { |k| k == 5 }
          # If not, just pick a random square
          return [true, computer_choice.keys.sample]
        else
          return [true, computer_choice.keys[0]]
        end     
      end
    end
  end

  false
end


def defensive?(current_board)
  rows_hashes_list = return_rows_hash(current_board)
  columns_hashes_list = return_columns_hash(current_board)
  diagonals_hashes_list = return_diagonals_hash(current_board)


  3.times do |iteration|
    case iteration
    when 0 then hash_list = diagonals_hashes_list
    when 1 then hash_list = columns_hashes_list
    when 2 then hash_list = rows_hashes_list
    end
    
    hash_list.each do |hash|
      marks = hash.values.count { |el| el == 'X' }
      free_space = hash.values.count(&:!)

      if (marks == 2) && (marks + free_space == 3)
        computer_choice = hash.select { |_, v| !v }
        return [true, computer_choice.keys.sample]
      end
    end
  end

  false
end


def random_choice(current_board)
# If nothing returns, select a random free space
  rows_hashes_list = return_rows_hash(current_board)
  random_arr = []
  rows_hashes_list.each do |hash|
    hash.each do |k, v|
      random_arr << k if !v
    end
  end

  random_arr.sample
end


def return_rows_hash(current_board)
  rows_hashes_list = []

  counter = 1
  current_board.each do |row|
    temp_hash = Hash.new
    row.each do |el|
      temp_hash[counter] = el
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
      if counter == 1 || counter == 9
        temp_hash_1 [counter] = el
      
      elsif counter == 3 || counter == 7
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


def win?(current_board)
  rows_hashes_list = return_rows_hash(current_board)
  columns_hashes_list = return_columns_hash(current_board)
  diagonals_hashes_list = return_diagonals_hash(current_board)

  3.times do |iteration|
    case iteration
    when 0 then hash_list = diagonals_hashes_list
    when 1 then hash_list = columns_hashes_list
    when 2 then hash_list = rows_hashes_list
    end

    hash_list.each do |hash|
      if hash.values.all? { |v| v == 'X' }
        return [true, "Congratulations, the player wins!"]
      elsif hash.values.all? { |v| v == 'O' }
        return [true, "The computer wins!"]
      end
    end
  end

  [false]
end


def tie?(current_board)
  current_board.each do |row|
    is_tie = row.all? { |el| el }
    return [false] if is_tie == false
  end
  
  [true, "It is a draw!"]
end


loop do
  puts("Welcome to tic tac toe!")
  sleep(1)

  prompt("Would you like to go first?")
  is_player_turn = true if gets.chomp.downcase.start_with?('y')
  # Board starts out with no values inside, we set it to nil
  # Each array inside board array is a row
  board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

  loop do
    show_board(available_choices(board)) if is_player_turn
    show_board(board) if is_player_turn

    choice, symbol = turn(board, is_player_turn)
    board = mark_board(board, choice, symbol)
    break if tie?(board)[0] || win?(board)[0]
    is_player_turn = !is_player_turn
  end

  puts tie?(board)[1] if tie?(board)[0] == true
  puts win?(board)[1] if win?(board)[0] == true

  prompt("Would you like to play again?")
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

puts "Thank you for playing!"
