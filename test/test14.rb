=begin 5:55
### Problem
# Input: Array of Integers
# Output: Array of integers, where each integer is the number of unique numbers less than current

## Rules:
# Explicit:
- Count how many numbers are smaller than the current number
- When counting numbers, only count unique values

# Implicit:
- Array will always contain Integer elements

### Data Structure
# #map outside to transform each number
- While inside code block, #count on the same array, but calling #uniq on it
- - Example: arr.uniq.count
=end

def smaller
