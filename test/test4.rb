=begin
### Problem
input: three integer arguments
Output: symbol

## Rules
# Explicit:
Return :invalid for invalid triangles
- sum of arguments must = 180
- all arguments must be > 0

To be a right triangle

### Data structure
array to represent all angles

# valid_triangle? method
iterate through array using #inject to sum all arguments together
If any of the elements is < 0, return invalid triangle

# main method
Right triangle is if one element on array is = 90
Acute is if all angles < 90
Obtuse if one angle > 90

We could check for right angle first, and then determine if it is an obtuse angle
If not obtuse, it will have to be acute or invalid
Invalid will be checked first using the side method.
=end

def valid_triangle?(angles)
  return false if angles.sum != 180 || angles.count(0) == 0
end

def triangle(ang1, ang2, ang3)
  angles = [ang1, ang2, ang3]
  return :invalid unless valid_triangle?(angles)

  return :right if angles.include?(90)
  number_obtuse_angles = angles.select { |ang| ang > 90}
  number_obtuse_angles.size > 0 ? :obtuse : :acute
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid