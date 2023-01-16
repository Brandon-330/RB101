def upside_triangle(n, space=1)
  return if n <= 0
  
  puts " " * space + "*" * n
  upside_triangle(n - 2, space + 1)
end

def downside_triangle(n, space=1)
  return puts " " if n <= 0

  downside_triangle(n - 2, space + 1)
  puts " " * space + "*" * n
end

def diamond(n)
  downside_triangle(n - 2)
  puts "*" * n
  upside_triangle(n - 2)
end


diamond(3)
diamond(9)