=begin
46 53
### Problem
# Input: Array (of integers)
# Output: Integer, or NilClass

## Rules
# Explicit: 
- If arr.size < 5, return nil
- Return the minimum sum of 5 consecutive numbers

# Implicit
- Only integers are input

### Data Structure
# Break down into sub arrays with 5 total elements
# #slice works well with this by [ind, 5]
# return early if arr#Size < 5
# While loop to create the sub_arrays
  - Evaluate each sub_arr with lowest_sum
=end

def minimum_sum(arr)
  return nil if arr.size < 5

  lowest_sum = arr[0, 5].inject(&:+)
  ind = 1
  while ind + 5 <= arr.size
    comparables = arr[ind, 5].inject(&:+)
    lowest_sum = comparables if comparables < lowest_sum
    ind += 1
  end

  lowest_sum
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10