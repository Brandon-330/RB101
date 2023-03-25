=begin
03
### Problem
# Input: Array (of integers)
# Output: Array (of 2 integers)

## Rules
# Explicit: 
- Return any 2 numbers closest together in value

# Implicit:
- No negative numbers
- Returned array has to match the index (We can do this with #select)

### Data Structure
# Iterate through whole array with index
# # Iterate through whole array with index again for comparables
# Plug all possible combinations to a new array

# #each with index new array
  - #inject(&:+) each sub_arr / 2 - sub_arr[0]
=end

def closest_numbers(arr)
  new_arr = []
  arr.each_with_index do |num, ind1|
    arr.each_with_index do |comp, ind2|
      if ind1 < ind2
        new_arr << [num, comp] 
      elsif ind2 > ind1
        new_arr << [comp, num]
      end
    end
  end

  closest_difference = (new_arr[0][0] - new_arr[0][1]).abs
  sub_arr_ind = 0
  new_arr.each_with_index do |sub_arr, ind|
    if (sub_arr[0] - sub_arr[1]).abs < closest_difference
      closest_difference = (sub_arr[0] - sub_arr[1]).abs
      sub_arr_ind = ind
    end
  end

  new_arr[sub_arr_ind]
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]