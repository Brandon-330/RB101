=begin
59
### Problem
# Input: Array (of numbers)
# Output: Transofrmed array of numbers

## Questions
# Always integers?
# Any nil arrays?

## Rules
# Explicit:
- When counting numbers do NOT include:
  - itself
  - multiple same values

### Data Structure
# Call #uniq on array to get all unique numbers
# #map original array
  - unique array #count(passed in argument)

=end

def smaller_numbers_than_current(arr)
  unique_arr = arr.uniq

  arr.map do |num|
    unique_arr.count { |compare| num > compare }
  end
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]