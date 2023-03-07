=begin 5:13
### Problem
# Input: 2 arguments (integer, integer)
# Output: Rotated Integer

## Rules:
# Explicit:
- Rotate the rightmost digit left 

# Implicit:


### Data Structure:
# Transform integer to string
- This time, we can mutate the original integer (perfect!)

=end

def rotate_rightmost_digits(number, rotate)
  number = number.to_s.split('')
  rotate.times do |ind|
    if (ind + 2) >= number.size
      number[0], number[-1] = number[-1], number[0]
    else
      number[-(ind + 2)], number[-(ind + 1)] = number[-(ind + 1)], number[-(ind + 2)]
    end
  end
  p number.join('').to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917