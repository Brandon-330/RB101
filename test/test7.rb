=begin 9:36
### Problem
# input: integer
# output: integer

## Rules
# Explicit:
- Add all numbers until n, and then square it
- Subtract by (sum(n**2))

### Data structure
# Create an array with all the numbers in it
- #inject(0) on it
- Once finished, raise it to the second power
- Do #inject(0) on it again, element the second power
- Subtract both results
=end

def sum_square_difference(n)
  arr = (1..n).to_a
  sum_square = arr.inject(0) { |total, num| total + num }**2
  square_sum = arr.inject(0) { |total, num| total + num**2 }

  sum_square - square_sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150