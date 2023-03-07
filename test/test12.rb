=begin 5:02
### Problem
Input: Array
Output: New Array with 1st element to the last

## Rules
# Explicit:
- Cannot mutate original array
- First element to the end of a new array

# Implicit:
- All objects inside array are same type
- If there is only 1 element, return it

### Data structure
# Iterate through the whole array with index
# Create a temporary variable
5:09
=end

def rotate_array(arr)
  temp = arr[0]
  new_arr = []
  arr.each do |el|
    new_arr << el
  end
  new_arr << temp
  new_arr.shift
  new_arr
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true