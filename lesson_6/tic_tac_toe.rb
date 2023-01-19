# Could use a hash, but there are 3 conditionals each square must go through
# Why don't we use a hash to represent the picks? No, there are too many conditionals for a hash
# We could do 
# Let's use X for player, and O for computer

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

# Board starts out with no values inside, we set it to nil
# Each array inside board array is a row
board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
show_board(board)

choice = player_turn(board)

### next steps, do a computer turn
# do win condition
# do a tie condition