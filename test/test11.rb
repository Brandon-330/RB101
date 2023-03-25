=begin
34 - 45
### Problem
# Input: Array (of integers)
# Output: Array (of integers)

## Rules
# Explicit:
- Transform each element of the array by the number of integers less than it
- If a given number occurs multiple times in an arry, it should only be counted once

# Implicit:
- Only Integers
- Never a empty array

### Data Structure
# #map array to transform each digit do |num|
  - original arr #uniq #count { |comparables| num > comparables}

=end

def smaller_numbers_than_current(arr)
  arr.map do |num|
    arr.uniq.count { |comparables| num > comparables }
  end
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]