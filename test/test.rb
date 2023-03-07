=begin
## Problem
Input: 3 arguments, integers OR floats
Output: symbol

## Rules
# Explicit:
equilateral if all 3 arguments equal to each other
isosceles if 2 arguments are equal, but not the third
scalene if all 3 sides are different length

to be valid, all sides must be > 0 AND sum of two shortest sides > longest side

# Implicit:
nil

## Data structure
determine if it is a valid triangle in a different method
 - sum of smaller lengths > longest length
 - all passed in arguments > 0
 - if not valid triangle, return from method early
if it is a valid triangle, if statement which determines each number condition
  - num1 == num2 AND num2 == num3 AND num3 == num1 => equilateral
  - num1 != num2 AND num2 != num3 AND num3 != num1 => scalene
  - else, isosceles
=end

def valid_triangle?(side1, side2, side3)
  sides = [side1, side2, side3]
  sum = sides.inject(0) do |sum, side|
    return false if side <= 0
    sum + side
  end
  max_side = sides.max
  (sum - max_side) > max_side
end

def triangle(side1, side2, side3)
  return :invalid unless valid_triangle?(side1, side2, side3)

  if side1 == side2 && side2 == side3 && side3 == side1
    :equilateral
  elsif side1 != side2 && side2 != side3 && side3 != side1
    :scalene
  else
    :isosceles
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid