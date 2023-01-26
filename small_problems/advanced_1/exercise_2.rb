def star(n)
  top_part_recurse(n/2 - 1, 0)
  puts '*' * n
  bottom_part_recurse(0, n/2 - 1)
end

def top_part_recurse(inside_space, outside_space)
  return if inside_space < 0
  puts ' ' * outside_space + '*' + ' ' * inside_space + '*' + ' ' * inside_space + '*'
  return top_part_recurse(inside_space - 1, outside_space + 1)
end

def bottom_part_recurse(inside_space, outside_space)
  return if outside_space < 0
  puts ' ' * outside_space + '*' + ' ' * inside_space + '*' + ' ' * inside_space + '*'
  return bottom_part_recurse(inside_space + 1, outside_space - 1)
end

star(7)
star(9)