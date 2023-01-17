def triangle(deg1, deg2, deg3)
  angles = [deg1, deg2, deg3].sort.reverse

  if angles.sum != 180 || angles.include?(0)
    return :invalid
  end

  if angles[0] > 90
    :obtuse
  elsif angles.include?(90)
    :right
  else
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid