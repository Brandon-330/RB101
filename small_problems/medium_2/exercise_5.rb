def triangle(x, y, z)
  sorted_arr = [x, y, z].sort

  if x <= 0 || y <= 0 || z <= 0
    return :invalid
  elsif sorted_arr[2] >= (sorted_arr[0] + sorted_arr[1])
    return :invalid
  end  

  if x != y && y != z
    :scalene
  elsif x == y && y == z
    :equilateral
  elsif x == y || x == z || y == z
    :isosceles
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid