=begin
07
### Problem
# Input: Array of integers
# Output: sum of the minimum 5 consecutive numbers in array

## Rules
- Return nil if arr.size < 5
- Return the minimum sum of 5 consecutive numbers

### Data Structure
# #slice to determine consecutive numbers
# #inject(&:+)

# lowest_sum = 0
# ind = 0
# while ind < arr.size - 5
  - sum = arr[ind, 5].sum
  - lowest_sum = sum if sum > lowest_sum
  - ind += 1
end

lowest_num
=end

def minimum_sum(arr)
  return nil if arr.size < 5

  lowest_sum = arr[0, 5].sum # First 5 considered lowest sum
  ind = 1 # Start from index of 1 because we already took the first 5 into consideration
  while ind < arr.size - 5
    sum = arr[ind, 5].inject(&:+)
    lowest_sum = sum if sum < lowest_sum
    ind += 1
  end

  lowest_sum
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10